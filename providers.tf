provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "~> 0.12.4"
  required_providers {
    aws = "~> 2"
    tls = "~> 3"
  }
  backend "s3" {
  }
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.eks_cluster.outputs.endpoint                     ## aws_eks_cluster.main.endpoint
  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks_cluster.outputs.ca_cert_base64) ## aws_eks_cluster.main.certificate_authority[0].data
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.9"
}
