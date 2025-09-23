output "project" {
  description = "Project id"
  value       = google_compute_network.vpc.project
}

output "network" {
  description = "The created network"
  value       = google_compute_network.vpc
}

output "network_name" {
  description = "Name of VPC"
  value       = google_compute_network.vpc.name
}
