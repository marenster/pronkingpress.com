#!/bin/bash
#
# simple site deployment script
#   - assume awscli is installed and configured to upload to S3
#
set -x
bundle exec jekyll build
aws s3 sync  _site s3://pronkingpress.com  --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
