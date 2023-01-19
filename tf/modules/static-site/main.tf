resource "aws_s3_bucket" "bare_bucket" {
    bucket = var.bare_domain_name
    # force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bare_bucket.id

  index_document {
    suffix = "index.html"
  }

  # error_document {
  #   key = "error.html"
  # }
}

resource "aws_s3_bucket_acl" "public-readable" {
  bucket = aws_s3_bucket.bare_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.bare_bucket.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${aws_s3_bucket.bare_bucket.id}/*"
            ]
        }
    ]
}
EOF
}
