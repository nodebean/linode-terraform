terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.0"
    }
  }
}

resource "linode_firewall" "linode_firewall" {
  label           = var.firewall_label
  disabled        = var.firewall_disabled
  inbound_policy  = var.default_inbound_policy
  outbound_policy = var.default_outbound_policy
  linodes         = var.target_linodes

  dynamic "inbound" {
    for_each = var.inbound_rules
    content {
      label    = inbound.value.inbound_rule_label
      action   = inbound.value.inbound_action
      protocol = inbound.value.inbound_protocol
      ports    = inbound.value.inbound_ports
      ipv4     = inbound.value.ipv4_inbound_list
      ipv6     = inbound.value.ipv6_inbound_list
    }
  }

  dynamic "outbound" {
    for_each = var.outbound_rules
    content {
      label    = outbound.value.outbound_rule_label
      action   = outbound.value.outbound_action
      protocol = outbound.value.outbound_protocol
      ports    = outbound.value.outbound_ports
      ipv4     = outbound.value.ipv4_outbound_list
      ipv6     = outbound.value.ipv6_outbound_list
    }
  }
}