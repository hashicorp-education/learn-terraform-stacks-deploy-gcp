# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "project" {
  source = "./project"

  providers = {
    google = provider.google.global
    tls    = provider.tls.this
  }
}

component "network" {
  source   = "./network"
  for_each = var.regions

  inputs = {
    project      = var.project_id
    environment  = var.environment
    region       = each.value
    network_name = "stacks-${var.environment}-${each.value}"
  }

  providers = {
    google = provider.google.this[each.value]
  }
}

component "instance" {
  source   = "./instance"
  for_each = var.regions

  inputs = {
    network = {
      network_id         = component.network[each.value].network_id
      private_subnet_ids = component.network[each.value].private_subnet_ids
    }

    service_account_email = var.service_account_email
    region                = each.value
  }

  providers = {
    google = provider.google.this[each.value]
    random = provider.random.this
  }
}
