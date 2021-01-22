variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "k8s_namespace" {
  default = "tips-and-tricks"
}

variable "role_name" {
  default = "s3-get-object-iam-role001"
}

variable "policy_name" {
  default = "s3-get-object-iam-policy001"
}
