
# Global Values
token = "some-token"

# Object Storage Values
tfv_bucket_region = "us-east-1"
tfv_bucket_label  = "some-label"

# LKE Values
tfv_lke_label       = "some-label"
tfv_lke_k8s_version = "1.23"
tfv_lke_region      = "us-central"
tfv_lke_pools = [
  {
    type : "g6-standard-1"
    count : 3
  }
]

# Firewall Values
tfv_fw_label      = "some-label"
tfv_fw_disabled   = false
tfv_fw_in_policy  = "DROP"
tfv_fw_out_policy = "ACCEPT"
tfv_fw_inbound_rules = {
  in-443 = {
    inbound_rule_label = "in-443"
    inbound_action     = "ACCEPT"
    inbound_protocol   = "TCP"
    inbound_ports      = 443
    ipv4_inbound_list  = ["0.0.0.0/0"]
    ipv6_inbound_list  = ["::/0"]
  }
  in-80 = {
    inbound_rule_label = "in-80"
    inbound_action     = "ACCEPT"
    inbound_protocol   = "TCP"
    inbound_ports      = 80
    ipv4_inbound_list  = ["0.0.0.0/0"]
    ipv6_inbound_list  = ["::/0"]
  }
}
tfv_fw_outbound_rules = {}