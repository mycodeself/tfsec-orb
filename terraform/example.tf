terraform {
  required_version = ">= 0.13"
}

variable "logging_bucket" {
  type = string
}

provider "aws" {
  region = "eu-west-1"
}


resource "aws_s3_bucket" "this" {
  bucket = "tfsec-example-bucket"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  logging {
    target_bucket = var.logging_bucket
    target_prefix = "log/"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls   = false
  block_public_policy = false
  restrict_public_buckets = true
}