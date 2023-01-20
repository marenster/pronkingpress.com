
output "bare_bucket_name" {
    description = "Name of the S3 bucket created for the bare domain"
    value = module.static_site.bare_bucket_name
}

output "aws_bucket_endpoint" {
  value = module.static_site.aws_bucket_endpoint
}

output "www_aws_bucket_endpoint" {
  value = module.static_site.www_aws_bucket_endpoint
}
