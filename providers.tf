provider "kubernetes" {
  host                   = module.eks.cluster_endpoint //in module eks has var cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {} //fetch availability zones and list in above region

locals {
  cluster_name = var.clusterName
}