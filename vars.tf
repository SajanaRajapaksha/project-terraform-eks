variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "clusterName" {
  description = "name of the eks cluster"
  type        = string
  default     = "project-eks"
}