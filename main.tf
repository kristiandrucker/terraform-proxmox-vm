resource "proxmox_virtual_environment_vm" "this" {
  name            = var.name
  node_name       = var.node_name
  stop_on_destroy = true

  operating_system {
    type = "l26"
  }

  agent {
    enabled = true
  }

  cpu {
    type  = "host"
    flags = ["+aes"]
    numa  = true
    cores = var.cores
    units = var.cpu_units
  }

  memory {
    dedicated = var.memory
  }

  bios    = "ovmf"
  machine = "q35"
  tpm_state {
    datastore_id = var.datastore_id
  }
  efi_disk {
    datastore_id = var.datastore_id
  }

  disk {
    datastore_id = var.datastore_id
    file_id      = var.disk_file_id
    interface    = "virtio0"
    size         = var.disk_size
    cache        = "writethrough"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  serial_device {}

  lifecycle {
    ignore_changes = [
      "disk[0].file_id"
    ]
  }
}
