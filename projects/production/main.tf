terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.7.0"
    }
  }
}

provider "google" {
  region = "australia-southeast1"
  zone   = "australia-southeast1-a"
}

resource "random_id" "suffix" {
  byte_length = 4
}

module "bucket" {
  source = "../../modules/bucket"

  name          = "arilaverty-${random_id.suffix.hex}"
  location      = "EU"
  force_destroy = true
  labels = {
    env = "production"
  }
}

output "name" {
  value = module.bucket.name
}