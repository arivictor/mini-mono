resource "google_storage_bucket" "primary" {
  name          = var.name
  location      = var.location
  force_destroy = var.force_destroy
  labels        = var.labels
}