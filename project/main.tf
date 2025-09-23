# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "google_project_service" "apis" {
  for_each = var.google_apis

  service                    = each.value
  disable_on_destroy         = false
  disable_dependent_services = false
}

resource "tls_private_key" "stack" {
  algorithm = "ED25519"
}

resource "google_compute_project_metadata" "ssh_keys" {
  metadata = {
    ssh-keys = "stack:${tls_private_key.stack.public_key_openssh}"
  }
}
