resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1

  
  node_config {
    disk_size_gb = 30
    disk_type    = "pd-standard"
  }

  deletion_protection = false
}
