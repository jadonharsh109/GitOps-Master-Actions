# Specify required providers and their versions for the Terraform configuration
terraform {
  required_providers {
    # Helm provider for managing Helm charts
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }

    # Kubectl provider for interacting with Kubernetes clusters
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }

  # Specify the required Terraform version
  required_version = "~> 1.0"
}

# Define the AWS provider configuration for the us-east-1 region
provider "aws" {
  region = "us-east-1"
}
