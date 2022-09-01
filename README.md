# klayspray
Deploy a Klaytn network!

# Supported Cloud Providers
* AWS

# Requirements
* terraform
* ansible
* gtar
* aws

# Get Started

## Deploy Private Layer1 Network

### 1. Deploy AWS resources
> :warning: Before running the following commands, please get AWS credentials.

```bash
$ git clone https://github.com/klaytn/klayspray.git
$ cd klayspray/terraform/aws/private-layer1
$ terraform init
$ terraform apply -auto-approve
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

### 2. Copy required files
> :warning: Suppose that you are located at klayspray/terraform/aws/private-layer1
You can check two files
1. PEM file to use via SSH
2. inventory.ini file storing Klaytn node connection information

#### Check whether files exist or not
```bash
$ ls *.ini
inventory.ini

$ ls *.pem
tidy-parrot-ysck.pem # auto-generated name
```

#### Copy files to the destination
```bash
$ cp *.ini ../../../inventory/inventory.ini
$ cp *.pem .././../tidy-parrot-ysck.pem
```

### 3. Execute Ansible playbook
```bash
$ ansible-playbook -i inventory/private-layer1.ini cluster.yaml
```
