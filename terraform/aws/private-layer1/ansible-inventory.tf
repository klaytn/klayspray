locals {
  ansible_inventory = templatefile(
    "${path.module}/templates/inventory.tftpl",
    {
      ansible_ssh_private_key_file = try(module.keypair.ssh_private_key_path, "<change-me>")
      cn                           = try(module.cn, {})
      pn                           = try(module.pn, {})
      en                           = try(module.en, {})
      monitor                      = try(module.monitor, {})
    }
  )
}
resource "local_file" "this" {
  content  = local.ansible_inventory
  filename = format("%s/../../../%s_inventory.ini", path.module, basename(abspath(path.module)))
}
