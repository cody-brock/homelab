output "k3s_1_ipv4_address" {
  description = "The public IPv4 IP address of the k3s node"
  value       = hcloud_server.k3s_1.ipv4_address
}

output "k3s_1_ipv6_address" {
  description = "The public IPv6 address of the k3s node"
  value       = hcloud_server.k3s_1.ipv6_address
}
