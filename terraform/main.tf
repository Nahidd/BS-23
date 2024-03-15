provider "aws" {
  region = "us-west-2"
}

module "kubernetes_cluster" {
  source = "./modules/kubernetes_cluster"

  cluster_name = "my-cluster"
}