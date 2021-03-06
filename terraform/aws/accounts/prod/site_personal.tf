module "site_personal" {
  source = "../../../../terraform-modules/static-site//"

  name_prefix = "site-personal"

  domain_name = "lingrino.com"
  zone_name   = "lingrino.com"

  sans_domain_names_to_zone_names = {
    "*.lingrino.com"  = "lingrino.com"
    "lingrino.dev"    = "lingrino.dev"
    "*.lingrino.dev"  = "lingrino.dev"
    "srlingren.com"   = "srlingren.com"
    "*.srlingren.com" = "srlingren.com"
  }

  healthcheck_sns_arn = data.terraform_remote_state.account_audit.outputs.sns_alarm_high_priority_arn
  bucket_logs_domain  = data.terraform_remote_state.account_audit.outputs.bucket_logs_cloudfront_domain

  tags = var.tags

  providers = {
    aws.cert = aws.cert
    aws.dns  = aws.dns
  }
}

output "site_personal_bucket_name" {
  value = module.site_personal.bucket_name
}

output "site_personal_distribution_id" {
  value = module.site_personal.distribution_id
}

output "site_personal_deployer_access_key_id" {
  value = module.site_personal.deployer_access_key_id
}

output "site_personal_deployer_secret_access_key" {
  value = module.site_personal.deployer_secret_access_key
}
