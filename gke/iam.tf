resource "google_project_iam_member" "k8s_svc_ar_perm" {
  project = var.project
  role    = "roles/artifactregistry.reader"
  member  = "serviceAccount:${google_service_account.default.email}"
}
