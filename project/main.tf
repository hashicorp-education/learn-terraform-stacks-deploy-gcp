resource "google_project_service" "apis" {
  for_each = var.google_apis

  service                    = each.value
  disable_on_destroy         = false
  disable_dependent_services = false
}
