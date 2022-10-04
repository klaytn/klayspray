# klayspray
Deploy a Klaytn network!

## Table of Contents

- [Supported Cloud Providers](#supported-cloud-providers)
- [Requirements](#requirements)
- [Get Started : Deploy Private Layer1 Network](#get-started--deploy-private-layer1-network)

## Supported Cloud Providers
* AWS
* GCP

## Requirements
* terraform
* ansible
* gtar
* aws
* gcp

## Get Started : Deploy Private Layer1 Network

### QuickStart
You can easily deploy a private layer1 network with the following command lines. Please see the below to see the deatil.

##### AWS - [Click to check the complete guide] (terraform/aws/private-layer1/README.md)
```bash
$ git clone https://github.com/klaytn/klayspray.git
$ cd klayspray
$ export TF_OPTIONS="-chdir=terraform/aws/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS apply -auto-approve
$ ansible-playbook -i private-layer1_inventory.ini private-layer1.yaml
```

##### GCP - [Click to check the complete guide] (terraform/gcp/private-layer1/README.md)
```bash
$ git clone https://github.com/klaytn/klayspray.git
$ cd klayspray
$ export TF_OPTIONS="-chdir=terraform/gcp/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS apply -auto-approve
$ ansible-playbook -i private-layer1_inventory.ini private-layer1.yaml
```
