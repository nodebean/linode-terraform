terraform {
  backend "s3" {
    bucket                      = "beanteam"
    key                         = "terraform/beanteam.tfstate"
    region                      = "us-east-1"                   # e.g. us-east-1
    endpoint                    = "us-east-1.linodeobjects.com" # e.g. us-east-1.linodeobjects.com
    skip_credentials_validation = true                          # just do it
    profile                     = "s3-linode"
  }
}