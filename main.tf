terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.0"
    }
  }
}

provider "linode" {
  token = var.token
}

# Linode Object Storage Bucket"
module "object_storage" {
  source = "./modules/object_storage"
  region = var.bucket_region
  label  = var.bucket_label
}

# Linode LKE Cluster
module "lke" {
 source      = "./modules/lke"
 label       = var.lke_label
 k8s_version = var.lke_k8s_version
 region      = var.lke_region
 pools       = var.lke_pools
}
