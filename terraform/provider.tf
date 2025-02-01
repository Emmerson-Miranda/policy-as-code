# https://registry.terraform.io/providers/tehcyx/kind/latest/docs/resources/cluster

terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "0.7.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "3.0.0-pre1"
    }
  }
}

# Configure the Kind Provider
provider "kind" {}

# https://developer.hashicorp.com/terraform/tutorials/kubernetes/helm-provider
provider "helm" {
  kubernetes = {
     config_path = "~/.kube/config"
  }
}

