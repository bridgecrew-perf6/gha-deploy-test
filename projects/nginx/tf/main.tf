terraform {
  backend "gcs" {
    bucket = "opst-82-tf-state"
    prefix = "nginx"
  }
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "/home/sven/.kube/config"
  }
}

resource "helm_release" "example" {
  name       = "nginx"
  chart      = "../charts/nginx"
}
