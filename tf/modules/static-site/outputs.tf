
output "bare_bucket_name" {
  description = "Name of the S3 bucket created for the bare domain"
  value       = aws_s3_bucket.bare_bucket.bucket
}

output "aws_bucket_endpoint" {
  description = "Endpoint of the S3 bucket website - AWS domain name"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "www_aws_bucket_endpoint" {
  description = "Endpoint of the S3 www bucket website - AWS domain name"
  value       = aws_s3_bucket_website_configuration.www_redirect.website_endpoint
}
