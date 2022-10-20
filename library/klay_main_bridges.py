#!/usr/bin/python

from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

DOCUMENTATION = r'''
---
module: klay_main_bridges
short_description: This module generates main-bridges.json file
version_added: "1.0.0"
'''

import json
import os.path
from urllib.parse import urlparse, parse_qsl, urlencode, urlunparse

from ansible.module_utils.basic import AnsibleModule


class ModuleRunner(object):

    def __init__(self, module):
        self.module = module
        self.result = dict(
            changed=False,
            nodes={},
        )

        self.homi_output_dir = module.params['homi_output_dir']
        self.node_type = module.params['node_type']
        self.node_num = module.params['node_num']

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
        path = '{}/{}/keys/validator{}'.format(self.homi_output_dir, node_type, node_num)
        data = json.loads(self.read_file(path))

        return data


    def run(self):
        result = self.result

        node_name = '{}{}'.format(self.node_type, self.node_num)
        validator = self.read_validator(self.node_type, self.node_num)

        result['nodes'][node_name] = {
            'node_type': self.node_type,
            'node_num': self.node_num,
            'knis': [validator['BridgeInfo']],
        }

        return result


def main():
    module = AnsibleModule(
        argument_spec=dict(
            homi_output_dir=dict(type='str', required=True),
            node_type=dict(type='str', required=True),
            node_num=dict(type='int', required=True),
        ),
        supports_check_mode=False
    )

    runner = ModuleRunner(module)
    result = runner.run()

    module.exit_json(**result)


if __name__ == '__main__':
    main()

