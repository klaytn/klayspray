# kaiaspray
Deploy a Kaia network!

## Table of Contents

- [kaiaspray](#kaiaspray)
  - [Table of Contents](#table-of-contents)
  - [Supported Cloud Providers](#supported-cloud-providers)
  - [Requirements](#requirements)
  - [Get Started : Deploy Private Layer1 Network](#get-started--deploy-private-layer1-network)
    - [QuickStart](#quickstart)
        - [AWS - Click to check the complete guide](#aws---click-to-check-the-complete-guide)
        - [GCP - Click to check the complete guide](#gcp---click-to-check-the-complete-guide)
        - [Azure - Click to check the complete guide](#azure---click-to-check-the-complete-guide)

## Supported Cloud Providers
* AWS
* GCP
* Azure

## Requirements
* terraform
* ansible
* gtar
* [aws (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [gcloud (GCP CLI)](https://cloud.google.com/sdk/docs/install)
* [az (Azure CLI)](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

## Get Started : Deploy Private Layer1 Network

### QuickStart
You can easily deploy a private layer1 network with the following command lines. Please see the below to see the deatil.

##### AWS - [Click to check the complete guide](terraform/aws/private-layer1/README.md)
```bash
$ git clone https://github.com/kaiachain/kaiaspray.git
$ cd kaiaspray
$ export TF_OPTIONS="-chdir=terraform/aws/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS apply -auto-approve
$ ansible-playbook -i inventory/private-layer1/inventory.ini private-layer1.yaml
```

##### GCP - [Click to check the complete guide](terraform/gcp/private-layer1/README.md)
```bash
$ git clone https://github.com/kaiachain/kaiaspray.git
$ cd kaiaspray
$ export TF_OPTIONS="-chdir=terraform/gcp/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS apply -auto-approve
$ ansible-playbook -i inventory/private-layer1/inventory.ini private-layer1.yaml
```

##### Azure - [Click to check the complete guide](terraform/azure/private-layer1/README.md)
```bash
$ git clone https://github.com/kaiachain/kaiaspray.git
$ cd kaiaspray
$ export TF_OPTIONS="-chdir=terraform/azure/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS apply -auto-approve
$ ansible-playbook -i inventory/private-layer1/inventory.ini private-layer1.yaml