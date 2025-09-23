variable "project" {
  description = "Name of the project."
  type        = string
}

variable "environment" {
  description = "Name of the environment."
  type        = string
}

variable "region" {
  description = "Region."
  type        = string
}

variable "network_name" {
  description = "Name of the network."
  type        = string
  default     = "stacks-example"
}

variable "network_cidr" {
  description = "CIDR block for the network."
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "Private subnets for the network."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
