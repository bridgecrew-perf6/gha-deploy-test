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

variable "image_tag" {
  type = string
  default = "latest"
}

resource "helm_release" "example" {
  name       = "nginx"
  chart      = "../charts/nginx"
  set {
    name = "image.tag"
    value = var.image_tag
  }
}
