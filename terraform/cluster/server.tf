resource "hcloud_server" "k3s_1" {
  name        = "k3s-1"
  image       = "debian-13"
  server_type = "cx23"
  location    = "fsn1"
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  firewall_ids = [hcloud_firewall.k3s.id]
  ssh_keys     = [hcloud_ssh_key.homelab.id]
  labels       = { role = "k3s", env = "homelab" }
}
