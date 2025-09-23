# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "Region for instances."
  type        = string
}

variable "network" {
  description = "Network configuration."
  type = object({
    network_id         = string
    private_subnet_ids = list(string)
  })
}

variable "service_account_email" {
  description = "Email address of service account."
  type        = string
}

variable "machine_type" {
  description = "Machine type for instances."
  type        = string
  default     = "e2-micro"
}

variable "instances_per_subnet" {
  description = "Number of instances per private subnet."
  type        = number
  default     = 1
}
