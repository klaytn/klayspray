# Deploy Private Layer1 Network on GCP

### 1. Deploy GCP resources
> :warning: Before running the following commands, please get GCP credentials using command below.
```bash
export GOOGLE_APPLICATION_CREDENTIALS="<path-to-credential-json>"
```

Execute command belows to deploy resources via Terraform.
```bash
$ git clone https://github.com/klaytn/klayspray.git
$ cd klayspray
$ export TF_OPTIONS="-chdir=terraform/gcp/private-layer1"
$ terraform $TF_OPTIONS init
$ terraform $TF_OPTIONS apply -auto-approve
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


### 3. Execute Ansible playbook
```bash
$ ansible-playbook -i inventory/private-layer1/inventory.ini private-layer1.yaml
```

### 4. Check working using Grafana
Open http://<monitor-public-ip>:3000 in the webbrowser. The default credential is admin:admin.

![Image](docs/img/grafana.png?raw=true)
