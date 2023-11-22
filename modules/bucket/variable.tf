variable "name" {
  type        = string
  description = "(Required) The name of the bucket."
}

variable "force_destroy" {
  type        = bool
  description = "(Optional) Force destroy content when deleting the bucket. (Default: false)"
  default     = false
}

variable "location" {
  type        = string
  description = <<-EOF
    (Optional) The location of the bucket. (Default: US)
    Valid values are [ASIA, EU, US]. Changing this forces a new bucket to be created.
    EOF
  default     = "US"

  validation {
    condition     = contains(["US", "EU", "ASIA"], var.location)
    error_message = "Location must be one of [US, EU, ASIA]"
  }
}

variable "labels" {
  type        = map(string)
  description = "(Optional) A mapping of key-value labels to assign to the bucket. (Default: {})"
  default     = {}
}