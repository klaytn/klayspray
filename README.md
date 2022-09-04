# klayspray
Deploy a Klaytn network!

## Table of Contents

- [Supported Cloud Providers](#supported-cloud-providers)
- [Requirements](#requirements)
- [Get Started : Deploy Private Layer1 Network](#get-started--deploy-private-layer1-network)

## Supported Cloud Providers
* AWS

## Requirements
* terraform
* ansible
* gtar
* aws

## Get Started : Deploy Private Layer1 Network

### QuickStart
You can easily deploy a private layer1 network with the following command lines. Please see the below to see the deatil.
```bash
$ git clone https://github.com/klaytn/klayspray.git
$ cd klayspray
$ export TF_OPTIONS="-chdir=terraform/aws/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS apply -auto-approve
$ ansible-playbook -i private-layer1_inventory.ini private-layer1.yaml
```

### 1. Deploy AWS resources
> :warning: Before running the following commands, please get AWS credentials.

```bash
$ git clone https://github.com/klaytn/klayspray.git
$ cd klayspray
$ export TF_OPTIONS="-chdir=terraform/aws/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS apply -auto-approve
```

terraform output will be shown like the below.
```hcl
cn = [
  {
    "instance_id" = "<instance-id>"
    "private_ip" = "<private-ip>"
    "public_ip" = "<public-ip>"
  },
  ...
]
en = [
  {
    "instance_id" = "<instance-id>"
    "private_ip" = "<private-ip>"
    "public_ip" = "<public-ip>"
  },
]
pn = [
  {
    "instance_id" = "<instance-id>"
    "private_ip" = "<private-ip>"
    "public_ip" = "<public-ip>"
  },
  ...
]
private_subnet_ids = [
  "<subnet-id-1>",
  "<subnet-id-2>",
]
public_subnet_ids = [
  "<subnet-id-1>",
  "<subnet-id-2>",
]
```

### 2. Check the generated files
You can check two files in the root path of klayspray.
1. private-ssh-key.pem: a file to use via SSH
2. private-layer1_inventory.ini: a file storing Klaytn node connection information


### 3. Execute Ansible playbook
```bash
$ ansible-playbook -i private-layer1_inventory.ini private-layer1.yaml
```
