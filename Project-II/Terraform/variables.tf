variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "cluster_name" {
  type    = string
  default = "my-gke-cluster"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "node_pools" {
  type = map(object({
    machine_type = string
    capacity_type = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))

  default = {
    general = {
      machine_type = "e2-medium"
      capacity_type = "ON_DEMAND"
      scaling_config = {
        desired_size = 2
        max_size     = 4
        min_size     = 1
      }
    }
  }
}
