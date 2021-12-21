resource "proxmox_vm_qemu" "proxmox_vm" {
  count       = var.vm_count
  name        = "${var.instance_name}-${count.index + 1}"
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
    storage  = "UnraidVMs"
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

  ipconfig0 = "ip=${var.ipbase}${count.index + 1}/16,gw=172.16.0.1"
}
