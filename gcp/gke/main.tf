resource "google_container_cluster" "primary" {
  name     = "jay-democluster"
  location = var.location
  project  = var.project 

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  depends_on = [ google_project_service.k8s_api ]
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "python-node-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.nodepool_node_count
  project    = var.project
  
  node_config {
    preemptible  = true
    machine_type = var.gkenode_machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  depends_on = [ google_project_service.k8s_api ]
}


