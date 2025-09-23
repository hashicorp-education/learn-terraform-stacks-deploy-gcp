resource "google_compute_network" "vpc" {
  project                         = var.project
  name                            = var.network_name
  auto_create_subnetworks         = true
}
