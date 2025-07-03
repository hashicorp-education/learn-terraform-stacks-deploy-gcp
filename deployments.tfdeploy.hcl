# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "gcp" {
  audience = ["hcp.workload.identity"]
}

deployment "development" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "//iam.googleapis.com/projects/957283558110/locations/global/workloadIdentityPools/terraform-stacks-plainly-enabl/providers/terraform-stacks-plainly-enabl"
    service_account_email = "terraform-stacks-plainly-enabl@hc-c491b44b2da74d20a447ade0ccd.iam.gserviceaccount.com"
    project_id            = "hc-c491b44b2da74d20a447ade0ccd"

    regions = ["us-central1"]

  }
}

deployment "production" {
  inputs = {
    identity_token = identity_token.gcp.jwt

    audience              = "//iam.googleapis.com/projects/957283558110/locations/global/workloadIdentityPools/terraform-stacks-plainly-enabl/providers/terraform-stacks-plainly-enabl"
    service_account_email = "terraform-stacks-plainly-enabl@hc-c491b44b2da74d20a447ade0ccd.iam.gserviceaccount.com"
    project_id            = "hc-c491b44b2da74d20a447ade0ccd"


    regions = ["us-central1", "us-west1"]

  }
}
