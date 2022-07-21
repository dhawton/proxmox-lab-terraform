resource "proxmox_vm_qemu" "proxmox_vm" {
  count       = 1
  name        = "${var.instance_name}"
  target_node = var.target_node
  clone       = var.template_name

  agent    = 1
  os_type  = "cloud-init"
  cores    = var.vm_cores
  sockets  = 1
  cpu      = "host"
  memory   = var.vm_memory
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot     = 0
    size     = "${var.vm_disk_size}G"
    type     = "scsi"
    storage  = "DS1"
    iothread = 1
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network
    ]
  }

  ipconfig0 = "ip=${var.ipbase}/12,gw=172.16.0.1"
}
