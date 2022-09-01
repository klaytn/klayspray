#!/bin/bash -ex

ANSIBLE_LIBRARY=./library ansible -vvv -m klay_topology -a 'num_cn=1 num_pn=1 num_en=1' localhost

TOPOLOGY='{"cn-1":["cn-1"],"en-1":["pn-1","pn-1"],"pn-1":["cn-1","pn-1"]}'
ANSIBLE_LIBRARY=./library ansible -vvv -m klay_static_nodes -a "homi_output_dir=cache/homi-output topology=$TOPOLOGY" localhost

