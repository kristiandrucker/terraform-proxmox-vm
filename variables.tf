variable "name" {
  type = string
}

variable "node_name" {
  type = string
}

variable "cores" {
  type = number
}

variable "cpu_units" {
  type = number
  default = 1024
}

variable "memory" {
  type = number
}

variable "datastore_id" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "disk_file_id" {
  type = string
  default = ""
}
