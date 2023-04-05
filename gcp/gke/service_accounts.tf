resource "google_service_account" "default" {
  account_id   = var.account_id
  display_name = "Service Account for managing k8s"
  project      = var.project
  depends_on = [ google_project_service.iam_api ]
}

