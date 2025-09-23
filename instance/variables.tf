# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "machine_type" {
  description = "Machine type for instances."
  type = string
  default = "e2-micro"
}

variable "region" {
  description = "Region for instances."
  type = string
}

variable "service_account_email" {
  description = "Email address of service account."
  type = string
}

variable "network_id" {
  description = "ID of the network."
  type = string
}
