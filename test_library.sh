#!/bin/bash -ex

ANSIBLE_LIBRARY=./library ansible -vvv -m klay_topology -a 'num_cn=1 num_pn=1 num_en=1' localhost

TOPOLOGY='{"cn-1":["cn-1"],"en-1":["pn-1","pn-1"],"pn-1":["cn-1","pn-1"]}'
ANSIBLE_LIBRARY=./library ansible -vvv -m klay_static_nodes -a "homi_output_dir=cache/homi-output topology=$TOPOLOGY" localhost

ANSIBLE_LIBRARY=./library ansible -vvv -m klay_validator -a 'homi_output_dir=cache/homi-output node_type=pn node_index=0 public_ip=1.1.1.1 private_ip=10.0.0.0' localhost

ANSIBLE_LIBRARY=./library ansible -vvv -m klay_main_bridges -a 'homi_output_dir=cache/homi-output node_type=en node_num=1' localhost
