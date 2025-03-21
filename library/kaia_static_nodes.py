#!/usr/bin/python

from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

DOCUMENTATION = r'''
---
module: kaia_static_nodes
short_description: This module generates static-nodes knis following to network topology
version_added: "1.0.0"
'''

import json
import os.path
from urllib.parse import urlparse, parse_qsl, urlencode, urlunparse

from ansible.module_utils.basic import AnsibleModule


def node_name(node_type, node_index):
    return '{}-{}'.format(node_type, (node_index + 1))


def split_node_name(node_name):
    node_type, node_num = node_name.split('-')
    return node_type, int(node_num)


class ModuleRunner(object):

    def __init__(self, module):
        self.module = module
        self.result = dict(
            changed=False,
            static_nodes={},
        )

        self.homi_output_dir = module.params['homi_output_dir']
        self.is_service_chain = module.params['is_service_chain']
        self.topology = module.params['topology']

        self.validate_params()


    def validate_params(self):
        result = self.result

        if not os.path.isdir(self.homi_output_dir):
            self.module.fail_json(msg='{} is missing'.format(self.homi_output_dir), **result)


    def read_file(self, path):
        with open(path, 'r') as f:
            content = f.read()

        return content


    def read_validator(self, node_type, node_num):
        if self.is_service_chain:
            node_type = 's{}'.format(node_type)

        path = '{}/{}/keys/validator{}'.format(self.homi_output_dir, node_type, node_num)
        data = json.loads(self.read_file(path))

        return data


    def run(self):
        result = self.result

        for k1, v1 in self.topology.items():
            node_type1, node_num1 = split_node_name(k1)

            if self.is_service_chain:
                node_type1 = 's{}'.format(node_type1)

            result['static_nodes'][k1] = {
                'node_type': node_type1,
                'node_num': node_num1,
                'knis': []
            }
            for v2 in v1:
                node_type2, node_num2 = split_node_name(v2)
                validator = self.read_validator(node_type2, node_num2)
                result['static_nodes'][k1]['knis'].append(validator['NodeInfo'])

        return result


def main():
    module = AnsibleModule(
        argument_spec=dict(
            homi_output_dir=dict(type='str', required=True),
            is_service_chain=dict(type='bool', default=False),
            topology=dict(type='dict', required=True),
        ),
        supports_check_mode=False
    )

    runner = ModuleRunner(module)
    result = runner.run()

    module.exit_json(**result)


if __name__ == '__main__':
    main()

