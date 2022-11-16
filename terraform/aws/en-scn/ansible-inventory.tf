locals {
  ansible_inventory = templatefile(
    "${path.module}/templates/inventory.tftpl",
    {
      ansible_ssh_private_key_file = try(module.keypair.ssh_private_key_path, "<change-me>")
      en                           = try(module.en, [])
      scn                          = try(module.scn, [])
    }
  )
}
resource "local_file" "this" {
  content  = local.ansible_inventory
  filename = format("%s/../../../inventory/%s/inventory.ini", path.module, basename(abspath(path.module)))
}
