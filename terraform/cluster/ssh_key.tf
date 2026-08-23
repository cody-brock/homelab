resource "hcloud_ssh_key" "homelab" {
  name       = "homelab-ssh-key"
  public_key = file("~/.ssh/id_ed25519_homelab.pub")
}
