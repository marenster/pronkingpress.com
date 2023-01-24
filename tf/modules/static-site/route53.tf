
# var.bare_domain_name

resource "aws_route53_zone" "bare_zone" {
  name = "${var.bare_domain_name}"
  force_destroy       = false
  comment             = "Managed by Terraform"
}

resource "aws_route53_record" "bare_a" {
  zone_id = aws_route53_zone.bare_zone.zone_id
  name    = var.bare_domain_name
  type    = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.website.website_domain
    zone_id                = aws_s3_bucket.bare_bucket.hosted_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_a" {
  zone_id = aws_route53_zone.bare_zone.zone_id
  name    = "www.${var.bare_domain_name}"
  type    = "A"
  alias {
    name                   = aws_s3_bucket_website_configuration.website.website_domain
    zone_id                = aws_s3_bucket.bare_bucket.hosted_zone_id
    evaluate_target_health = true
  }
}
