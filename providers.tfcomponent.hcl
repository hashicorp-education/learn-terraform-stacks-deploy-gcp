# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

required_providers {
  google = {
    source  = "hashicorp/google"
    version = "~> 7.3.0"
  }
}

provider "google" "this" {
  for_each = var.regions

  config {
    project = var.project_id
    region  = each.value

    external_credentials {
      audience              = var.audience
      service_account_email = var.service_account_email
      identity_token        = var.identity_token
    }
  }
}
