locals {
  # Flatten the list of lists into a single list
  flattened_cidr_blocks = flatten(proxmox_virtual_environment_vm.this.ipv4_addresses)

  # Filter the CIDRs in the 10.1.0.0/24 range
  filtered_cidr_blocks = [for cidr in local.flattened_cidr_blocks : cidr if can(regex("^10\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$", cidr))]

  # Select the first match
  selected_cidr = length(local.filtered_cidr_blocks) > 0 ? local.filtered_cidr_blocks[0] : null
}
