# # Linode Variables
variable "token" {
  description = "The Linode Access Token"
  type        = string
}

# Object Storage variables
variable "tfv_bucket_region" {
  description = "The Linode Object Storage Bucket's Region"
  type        = string
}

variable "tfv_bucket_label" {
  description = "The label of the Linode Object Storage Bucket."
  type        = string
}

# LKE Variables
variable "tfv_lke_label" {
  description = "This Kubernetes cluster's unique label."
  type        = string
}

variable "tfv_lke_k8s_version" {
  description = "The desired Kubernetes version for this Kubernetes cluster in the format of major.minor (e.g. 1.21), and the latest supported patch version will be deployed."
  type        = string
}

variable "tfv_lke_region" {
  description = "This Kubernetes cluster's location"
  type        = string
}

variable "tfv_lke_pools" {
  description = "The Node Pool specifications for the Kubernetes cluster. At least one Node Pool is required"
  type = list(object({
    type  = string
    count = number
  }))
}

# Firewall Variables
variable "tfv_fw_label" {
  description = "This Firewall's unique label."
  type        = string
}

variable "tfv_fw_disabled" {
  description = "If true, the Firewall's rules are not enforced (defaults to false)."
  type        = bool
  default     = false
}

variable "tfv_fw_inbound_rules" {
  description = "A firewall rule that specifies what inbound network traffic is allowed."
  type = map(object({
    inbound_rule_label = string
    inbound_action     = string
    inbound_protocol   = string
    inbound_ports      = string
    ipv4_inbound_list  = list(string)
    ipv6_inbound_list  = list(string)
  }))
}

variable "tfv_fw_in_policy" {
  description = "The default behavior for inbound traffic. This setting can be overridden by updating the inbound.action property of the Firewall Rule. (ACCEPT, DROP)"
  type        = string
  default     = "DROP"
}

variable "tfv_fw_outbound_rules" {
  description = "A firewall rule that specifies what outbound network traffic is allowed."
  type = map(object({
    outbound_rule_label = string
    outbound_action     = string
    outbound_protocol   = string
    outbound_ports      = string
    ipv4_outbound_list  = list(string)
    ipv6_outbound_list  = list(string)
  }))
}

variable "tfv_fw_out_policy" {
  description = "The default behavior for outbound traffic. This setting can be overridden by updating the outbound.action property for an individual Firewall Rule. (ACCEPT, DROP)"
  type        = string
  default     = "ACCEPT"
}