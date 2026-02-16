terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  
  backend "gcs" {
    bucket  = "demo-terraform-gcp-state-bucket"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = "project-ef9bb6c2-2107-44b8-8d9"
  region  = "us-central1"
}

resource "google_storage_bucket" "terraform_state" {
  name     = "project-ef9bb6c2-tf-state-2026"
  location = "US"

  storage_class = "STANDARD"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  

  lifecycle {
    prevent_destroy = false
  }
}
