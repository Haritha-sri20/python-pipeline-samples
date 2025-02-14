provider "google" {
  project = "harness-project-450807"
  zone = "europe-west1-b"
}

resource "google_container_cluster" "gke_cluster" {
  name     = "my-gke-cluster"
  #location = "europe-west1"

  remove_default_node_pool = true
  initial_node_count       = 1
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool"
  cluster    = google_container_cluster.gke_cluster.name
  node_count = 1

  node_config {
    service_account = "gke-service-account@harness-project-450807.iam.gserviceaccount.com"
    machine_type    = "e2-medium"
    disk_size_gb    = 10
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  lifecycle {
    # Remove prevent_destroy if present
    prevent_destroy = false
  }  
}