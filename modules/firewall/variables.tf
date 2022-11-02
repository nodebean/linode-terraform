variable "firewall_label" {
  description = "This Firewall's unique label."
  type        = string
}

variable "firewall_disabled" {
  description = "If true, the Firewall's rules are not enforced (defaults to false)."
  type        = bool
  default     = false
}

variable "inbound_rules" {
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

variable "default_inbound_policy" {
  description = "The default behavior for inbound traffic. This setting can be overridden by updating the inbound.action property of the Firewall Rule. (ACCEPT, DROP)"
  type        = string
  default     = "DROP"
}

variable "outbound_rules" {
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

variable "default_outbound_policy" {
  description = "The default behavior for outbound traffic. This setting can be overridden by updating the outbound.action property for an individual Firewall Rule. (ACCEPT, DROP)"
  type        = string
  default     = "ACCEPT"
}

variable "target_linodes" {
  description = "A list of IDs of Linodes this Firewall should govern it's network traffic for."
  type        = list(string)
}