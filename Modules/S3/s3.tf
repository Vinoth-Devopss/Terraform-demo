#-------------------------------------------------------#
# astrocure prod s3 buckets for assets.
# S3 bucket astrocure prod-assets.
#-------------------------------------------------------#

resource "aws_s3_bucket" "prod-assets" {
  bucket = "prod-assets.astrocure.co.in"
  tags = {
    Name = "prod-assets"
  }
}

resource "aws_s3_bucket_versioning" "prod-assets" {
  bucket = aws_s3_bucket.prod-assets.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 bucket ACL access..

resource "aws_s3_bucket_ownership_controls" "prod-assets" {
  bucket = aws_s3_bucket.prod-assets.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "prod-assets" {
  bucket = aws_s3_bucket.prod-assets.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "prod-assets" {
  depends_on = [
    aws_s3_bucket_ownership_controls.prod-assets,
    aws_s3_bucket_public_access_block.prod-assets,
  ]

  bucket = aws_s3_bucket.prod-assets.id
  acl    = "private"
}

#-------------------------------------------------------#
# astrocure prod s3 buckets for GitHub backup.
# S3 bucket for astrocure GitHub backup.
#-------------------------------------------------------#

resource "aws_s3_bucket" "astrocure-github" {
  bucket = "astrocure-github-code-backups"
  tags = {
    Name = "astrocure-github-code-backups"
  }
}

resource "aws_s3_bucket_versioning" "astrocure-github" {
  bucket = aws_s3_bucket.astrocure-github.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 bucket ACL access..

resource "aws_s3_bucket_ownership_controls" "astrocure-github" {
  bucket = aws_s3_bucket.astrocure-github.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "astrocure-github" {
  bucket = aws_s3_bucket.astrocure-github.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "astrocure-github" {
  depends_on = [
    aws_s3_bucket_ownership_controls.astrocure-github,
    aws_s3_bucket_public_access_block.astrocure-github,
  ]

  bucket = aws_s3_bucket.astrocure-github.id
  acl    = "private"
}

#-------------------------------------------------------#
# S3 bucket astrocure prod-admin
#-------------------------------------------------------#

resource "aws_s3_bucket" "prod-admin" {
  bucket = var.s3_prod_admin_name
  tags = {
    Name = "prod-admin"
  }
}


resource "aws_s3_bucket_website_configuration" "prod-admin" {
  bucket = aws_s3_bucket.prod-admin.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "prod_bucket_access_block" {
  bucket = aws_s3_bucket.prod-admin.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "prod_bucket_policy" {
  bucket = aws_s3_bucket.prod-admin.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "${aws_s3_bucket.prod-admin.arn}/*"
        ]
      }
    ]
  })
}

#-------------------------------------------------------#
# S3 bucket astrocure.co.in Website
#-------------------------------------------------------#

resource "aws_s3_bucket" "astrocure-web" {
  bucket = var.s3_astrocure_web
  tags = {
    Name = "astrocure.co.in"
  }
}


resource "aws_s3_bucket_website_configuration" "astrocure-web" {
  bucket = aws_s3_bucket.astrocure-web.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "astrocure-web_bucket_access_block" {
  bucket = aws_s3_bucket.astrocure-web.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "astrocure-web_bucket_policy" {
  bucket = aws_s3_bucket.astrocure-web.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "${aws_s3_bucket.astrocure-web.arn}/*"
        ]
      }
    ]
  })
}

#-------------------------------------------------------#
# S3 bucket www.astrocure.co.in Website
#-------------------------------------------------------#

resource "aws_s3_bucket" "www_astrocure-web" {
  bucket = var.s3_www_astrocure_web
  tags = {
    Name = "www.astrocure.co.in"
  }
}


resource "aws_s3_bucket_website_configuration" "www_astrocure-web" {
  bucket = aws_s3_bucket.www_astrocure-web.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "www_astrocure-web_bucket_access_block" {
  bucket = aws_s3_bucket.www_astrocure-web.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "www_astrocure-web_bucket_policy" {
  bucket = aws_s3_bucket.www_astrocure-web.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "${aws_s3_bucket.www_astrocure-web.arn}/*"
        ]
      }
    ]
  })
}

#-------------------------------------------------------#
# S3 bucket astrovidhi www.admin.astrocure.co.in
#-------------------------------------------------------#

resource "aws_s3_bucket" "www-prod-admin" {
  bucket = var.s3_www_prod_admin_name
  tags = {
    Name = "www.admin.astrocure.co.in"
  }
}

resource "aws_s3_bucket_website_configuration" "www-prod-admin" {
  bucket = aws_s3_bucket.www-prod-admin.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "www_prod_bucket_access_block" {
  bucket = aws_s3_bucket.www-prod-admin.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "www_prod_bucket_policy" {
  bucket = aws_s3_bucket.www-prod-admin.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = [
          "${aws_s3_bucket.www-prod-admin.arn}/*"
        ]
      }
    ]
  })
}



