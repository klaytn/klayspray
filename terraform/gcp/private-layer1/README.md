# Deploy Private Layer1 Network on GCP

### 0. Prepare GCP Credentials
> :warning: Before running the following commands, please get GCP credentials using command below.
Option1.
```bash
gcloud auth application-default login
```
Option2.
```bash
export GOOGLE_APPLICATION_CREDENTIALS="<path-to-credential-json>"
```

### 1. Deploy GCP resources
Execute command belows to deploy resources via Terraform.
```bash
$ git clone https://github.com/klaytn/klayspray.git
$ cd klayspray
$ export TF_OPTIONS="-chdir=terraform/gcp/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS plan
$ terraform $TF_OPTIONS apply -auto-approve
$ terraform $TF_OPTIONS destroy -auto-approve
```

terraform output will be shown like the below.
```hcl
layer1 = {
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
  monitor = {
    "instance_id" = "<instance-id>"
    "private_ip" = "<private-ip>"
    "public_ip" = "<public-ip>"
  }
  layer1_sg_id  = "<security-group-id>"
  monitor_sg_id = "<security-group-id>"
}
```

### 2. Check the generated files
You can check two files in the root path of klayspray.
1. gcp-private-ssh-key.pem: a file to use via SSH
2. inventory/private-layer1/inventory.ini: a file storing Klaytn node connection information

## SSH Key Management

### Options for SSH Key Management

1. **Generate a new SSH key pair**:
   - Set `create_gcp_key_pair = true` in your terraform.tfvars file
   - The private key will be automatically generated and saved to the path specified in the module
   - The public key will be automatically extracted and added to instance metadata

2. **Use an existing SSH key pair**:
   - Set `create_gcp_key_pair = false` in your terraform.tfvars file
   - Provide the path to your existing private key in `ssh_existing_private_key_path`
   - Provide the path to your existing public key in `ssh_existing_public_key_path`

### How to Extract Public Key from Private Key

If you have an existing private key and need to extract the public key, you can use the following command:

```bash
# For OpenSSH format private keys
ssh-keygen -y -f /path/to/private_key > /path/to/public_key.pub

# For PEM format private keys
ssh-keygen -y -f /path/to/private-key.pem > /path/to/public-key.pem
```

### Example terraform.tfvars

```hcl
# Option 1: Generate a new key pair
create_gcp_key_pair = true

# Option 2: Use existing key pair
create_gcp_key_pair = false
ssh_existing_private_key_path = "/path/to/private-key.pem"
ssh_existing_public_key_path = "/path/to/public-key.pub"
```

### 3. Execute Ansible playbook
```bash
$ ansible-playbook -i inventory/private-layer1/inventory.ini private-layer1.yaml
```

### 4. Check working using Grafana
Open http://<monitor-public-ip>:3000 in the webbrowser. The default credential is admin:admin.

![Image](docs/img/grafana.png?raw=true)
