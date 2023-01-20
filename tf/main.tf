
# maybe not bother with locals? Or vars with tfvars file?
locals {
  bare_domain_name = "pronkingpress.com"
  region           = "us-west-2"

}

provider "aws" {
  region = local.region
}

module "static_site" {
  source           = "./modules/static-site"
  bare_domain_name = local.bare_domain_name
}
