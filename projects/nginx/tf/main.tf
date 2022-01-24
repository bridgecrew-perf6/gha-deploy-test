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

resource "helm_release" "example" {
  name       = "nginx"
  chart      = "../charts/nginx"
}
