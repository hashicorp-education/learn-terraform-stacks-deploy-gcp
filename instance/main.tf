# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

data "google_compute_image" "noble_lts" {
  family  = "ubuntu-2404-lts-amd64"
  project = "ubuntu-os-cloud"
}

resource "random_pet" "instance_name" {
  length    = 3
  separator = "-"
}

resource "google_compute_instance" "default" {
  name         = random_pet.instance_name.id
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = data.google_compute_image.noble_lts.self_link
    }
  }

  network_interface {
    network = var.network_id
    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
