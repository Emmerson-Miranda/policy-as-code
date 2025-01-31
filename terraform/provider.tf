# https://registry.terraform.io/providers/tehcyx/kind/latest/docs/resources/cluster

terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.7.0"
    }
  }
}

# Configure the Kind Provider
provider "kind" {}
