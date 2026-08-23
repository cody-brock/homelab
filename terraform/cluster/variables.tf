variable "ssh_allowed_cidrs" {
  description = "List of allowed CIDRs for SSH access to server"
  type        = list(string)
}
