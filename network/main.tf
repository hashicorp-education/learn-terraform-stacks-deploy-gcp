resource "google_compute_network" "stacks" {
  project                         = var.project
  name                            = var.network_name
  auto_create_subnetworks         = false
}

resource "google_compute_subnetwork" "stacks" {
  for_each = toset(var.private_subnets)

  name          = "subnet-${var.environment}-${var.region}-${each.key}"
  region        = var.region
  network       = google_compute_network.stacks.id
  ip_cidr_range = each.value
}
