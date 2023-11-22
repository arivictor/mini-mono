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

# Unit Tests

run "unit_test_valid_name" {
  command = plan

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

run "unit_test_invalid_location" {
  command = plan

  # Top level configuration overrides
  variables {
    name          = var.name
    location      = "XYZ"
    force_destroy = var.force_destroy
    labels        = var.labels
  }

  expect_failures = [
    var.location
  ]
}