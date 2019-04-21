data "google_client_config" "default" {}

provider "google" {
  credentials = "${file("D:/GitHubProjects/jay-terraform/gcp/gcpkeys.json")}"
}

resource "google_storage_bucket" "default" {
  count         = "${var.lifecycleenabled == "false" ? 1 : 0}"
  name          = "${var.name}"
  #location      = "${length(var.region) > 0 ? var.region : data.google_client_config.default.region}"
  project       = "${var.project}"
  storage_class = "${var.storage_class}"
  force_destroy = "${var.force_destroy}"

  #labels = "${module.label.gcp_labels}"
  versioning {
    enabled = "${var.versioning_enabled}"
  }

}

resource "google_storage_bucket" "defaultwithlifecycle" {
  count         = "${var.lifecycleenabled == "true" ? 1 : 0}"
  name          = "${var.name}"
  #location      = "${length(var.region) > 0 ? var.region : data.google_client_config.default.region}"
  project       = "${var.project}"
  storage_class = "${var.storage_class}"
  force_destroy = "${var.force_destroy}"
  #labels = "${module.label.gcp_labels}"
  
  lifecycle_rule {
    action {
      type = "${var.action_type}"
    }
    condition {
      age = "${var.age}"
    }
  }

  versioning {
    enabled = "${var.versioning_enabled}"
  }
}

resource "google_storage_bucket_acl" "default" {
  #count       = "${var.enabled == "true" ? length(google_storage_bucket.default.*.name) : 0}"
  default_acl = "${var.default_acl}"
  bucket      = "${coalesce(
                 element(concat(google_storage_bucket.default.*.name, list("")),0),
                 element(concat(google_storage_bucket.defaultwithlifecycle.*.name, list("")),0)
                 )}"
  role_entity = [
    "${compact(var.role_entity)}",
  ]
}