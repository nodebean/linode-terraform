# Linode Variables
variable "token" {
  description = "The Linode Access Token"
}

# Object Storage variables
variable "bucket_region" {
  description = "The Linode Object Storage Bucket's Region"
}

variable "bucket_label" {
  description = "The label of the Linode Object Storage Bucket."
}

# LKE Variables
variable "lke_label" {
  description = "This Kubernetes cluster's unique label."
}

variable "lke_k8s_version" {
  description = "The desired Kubernetes version for this Kubernetes cluster in the format of major.minor (e.g. 1.21), and the latest supported patch version will be deployed."
}

variable "lke_region" {
  description = "This Kubernetes cluster's location"
}

variable "lke_pools" {
  description = "The Node Pool specifications for the Kubernetes cluster. At least one Node Pool is required"
  type = list(object({
    type  = string
    count = number
  }))
}