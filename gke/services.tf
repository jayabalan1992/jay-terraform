resource "google_project_service" "k8s_api" {
  project = var.project
  service = "container.googleapis.com"
}

resource "google_project_service" "iam_api" {
  project = var.project
  service = "iam.googleapis.com"
}
