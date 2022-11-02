# Linode Terraform 
This is a demo of how to use terraform to create an LKE cluster, an Object Storage bucket, and a Linode Firewall for the LKE nodes.
# Files
## File Tree
```
├── .terraform.lock.hcl
├── backend.tf
├── example.tfvars
├── main.tf
├── modules
│   ├── firewall
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── lke
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── object_storage
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── variables.tf
```
## Noteworthy Files
| .terraform.lock.hcl | This file representes a hash of included modules.  Include this in your VC |
| backend.tf | Info on your state storage backend.  Create an awscli profile called s3-linode with your bucket access keys |
| example.tfvars | An example tfvars file.  Change the values to fit your implementation |
| main.tf | The root module that brings in all of the resources |
| variables.tf | Variables passed in from the tfvars file |
| modules/ | The modules for each of the Linode resources.  |
# Notes
-You don't have to use a tfvars file if you are comfortable with your values being exposed.  As always, never commit secrets to version control.