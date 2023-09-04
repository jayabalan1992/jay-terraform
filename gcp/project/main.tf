resource "random_id" "project_suffix" {
  byte_length = 1
}

resource "google_project" "my_project" {
  name       = "test-project"
  project_id = "test-project-${random_id.project_suffix.hex}"
}

resource "google_project_service" "project_services" {
  project = google_project.my_project.project_id
  service = "storage.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}


output "project_id" {
  value = google_project.my_project.project_id
}
