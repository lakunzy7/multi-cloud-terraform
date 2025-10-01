provider "aws" {
  region = "eu-central-1"
}

resource "random_id" "eu_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "eu_central_bucket" {
  bucket = "company-dev-assets-euc1-${random_id.eu_suffix.hex}"

  tags = {
    project = "multicloud-foundation"
    owner   = "lakunzy"
    env     = "dev"
    region  = "eu-central-1"
  }
}

resource "aws_s3_bucket_versioning" "eu_central_versioning" {
  bucket = aws_s3_bucket.eu_central_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
