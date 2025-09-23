# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "private_key" {
  description = "Private key material in PEM format."
  value       = tls_private_key.stack.private_key_pem
  sensitive   = true
}
