terraform {
  backend "gcs" {
    bucket = "opst-82-tf-state"
    prefix = "hello-world/prod"
  }
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
  }
}

variable "image_tag" {
  type    = string
  default = "latest"
}

resource "helm_release" "hello-world-prod" {
  name             = "hello-world"
  chart            = "../../charts/hello-world"
  namespace        = "hello-prod"
  create_namespace = true
  set {
    name  = "image.tag"
    value = var.image_tag
  }
}
