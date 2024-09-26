
//contains dependencies needed
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }

    tls = {
      source = "hashicorp/tls"
      #   version = "~> 4.1" 
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.22"
    }
  }

  backend "s3" {
    bucket = "project-terraform-eks-bucket"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }

  required_version = "~> 1.6"
}
