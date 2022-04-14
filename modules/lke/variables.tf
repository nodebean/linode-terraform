variable "label" {
  description = "This Kubernetes cluster's unique label."
}

variable "k8s_version" {
  description = "The desired Kubernetes version for this Kubernetes cluster in the format of major.minor (e.g. 1.21), and the latest supported patch version will be deployed."
}

variable "region" {
  description = "This Kubernetes cluster's location"
}

variable "pools" {
  description = "The Node Pool specifications for the Kubernetes cluster. At least one Node Pool is required"
  type = list(object({
    type  = string
    count = number
  }))
}