# Top level configuration

variables {
  name          = "test-bucket-wuyertcv"
  location      = "US"
  force_destroy = true
  labels = {
    env = "local"
  }
}

provider "google" {
  project = "arilaverty-org"
}

run "integration_test" {
  command = apply

  variables {
    name          = var.name
    location      = var.location
    force_destroy = var.force_destroy
    labels        = var.labels
  }

  assert {
    condition     = google_storage_bucket.primary.name == var.name
    error_message = "Bucket name is not correct"
  }

}