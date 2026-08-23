resource "hcloud_firewall" "k3s" {
  name = "k3s-node"

  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = var.ssh_allowed_cidrs
  }

  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = var.ssh_allowed_cidrs
  }

}
