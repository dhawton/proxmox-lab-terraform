variable "instance_name" {
  type        = string
  description = "Unique name for the instance"
  default     = "k3s-lab"
}

variable "vm_count" {
  type        = number
  description = "Number of instances to create"
  default     = 1
}

variable "target_node" {
  type        = string
  description = "Node to target"
  default     = "pve1"
}

variable "ipbase" {
  type        = string
  description = "Base IP address"
  default     = "172.20.0."
}

variable "template_name" {
  type        = string
  description = "Template name"
  default     = "ubuntu-template"
}

variable "vm_cores" {
  type        = number
  description = "Number of cores"
  default     = 2
}

variable "vm_memory" {
  type        = number
  description = "Memory in MB"
  default     = 4096
}

variable "vm_disk_size" {
  type        = number
  description = "Disk size in GB"
  default     = 50
}
