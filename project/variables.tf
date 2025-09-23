# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "google_apis" {
  type = set(string)
  default = [
    "compute.googleapis.com",
    "iap.googleapis.com",
  ]
}
