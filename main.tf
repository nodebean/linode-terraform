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
  region = var.tfv_bucket_region
  label  = var.tfv_bucket_label
}

# Linode LKE Cluster
module "lke" {
  source      = "./modules/lke"
  label       = var.tfv_lke_label
  k8s_version = var.tfv_lke_k8s_version
  region      = var.tfv_lke_region
  pools       = var.tfv_lke_pools
}

# Linode Firewall
module "linode_firewall" {
  source                  = "./modules/firewall"
  firewall_label          = var.tfv_fw_label
  firewall_disabled       = var.tfv_fw_disabled
  default_inbound_policy  = var.tfv_fw_in_policy
  default_outbound_policy = var.tfv_fw_out_policy
  target_linodes          = module.lke.node_ids
  inbound_rules           = var.tfv_fw_inbound_rules
  outbound_rules          = var.tfv_fw_outbound_rules
}