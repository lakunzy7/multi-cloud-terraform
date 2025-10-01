provider "aws" {
  region = "us-east-1"
}

resource "random_id" "us_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "us_east_bucket" {
  bucket = "company-dev-assets-use1-${random_id.us_suffix.hex}"

  tags = {
    project = "multicloud-foundation"
    owner   = "lakunzy"
    env     = "dev"
    region  = "us-east-1"
  }
}

resource "aws_s3_bucket_versioning" "us_east_versioning" {
  bucket = aws_s3_bucket.us_east_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
