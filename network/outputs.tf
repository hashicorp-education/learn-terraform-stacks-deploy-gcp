output "network_id" {
  description = "The network ID."
  value       = google_compute_network.stacks.id
}

output "network_name" {
  description = "Network name"
  value       = google_compute_network.stacks.name
}
