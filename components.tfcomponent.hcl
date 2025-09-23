# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "project" {
  source   = "./project"

  providers = {
    google = provider.google.global
    tls    = provider.tls.this
  }
}

component "network" {
  source = "./network"
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
  source = "./instance"
  for_each = var.regions

  inputs = {
    network_id = component.network[each.value].network_id
    service_account_email = var.service_account_email
    region = each.value
  }

  providers = {
    google = provider.google.this[each.value]
    random = provider.random.this
  }
}

#component "instance" {
#  source   = "./instance"
#  for_each = var.regions

#  inputs = {
#    network = {
#      vpc_id             = component.vpc[each.value].vpc_id
#      private_subnet_ids = component.vpc[each.value].private_subnet_ids
#      security_group_ids = [component.vpc[each.value].security_group_id_ssh]
#    }

#    key_name = component.key_pair[each.value].key_name
#  }

#  providers = {
#    aws = provider.aws.this[each.value]
#  }
#}

#component "key_pair" {
#  source   = "./key_pair"
#  for_each = var.regions

#  providers = {
#    aws = provider.aws.this[each.value]
#    tls = provider.tls.this
#  }
#}
