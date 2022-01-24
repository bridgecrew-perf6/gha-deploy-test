terraform {
  backend "gcs" {
    bucket = "opst-82-tf-state"
    prefix = "alpine"
  }
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
  }
}

resource "helm_release" "example" {
  name       = "alpine"
  chart      = "../charts/alpine"
}
