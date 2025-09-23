resource "google_compute_network" "stacks" {
  project                 = var.project
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "stacks" {
  count = length(var.private_subnets)

  name          = "subnet-${var.environment}-${var.region}-${count.index}"
  region        = var.region
  network       = google_compute_network.stacks.id
  ip_cidr_range = var.private_subnets[count.index]
}
