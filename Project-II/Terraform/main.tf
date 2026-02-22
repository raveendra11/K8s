terraform {
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
  project = var.project_id
  region  = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  region               = var.region
  cluster_name         = var.cluster_name
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}

module "gke" {
  source = "./modules/gke"

  cluster_name = var.cluster_name
  region       = var.region
  network      = module.vpc.vpc_name
  subnetwork   = module.vpc.private_subnet_names[0]
  node_pools   = var.node_pools
}
