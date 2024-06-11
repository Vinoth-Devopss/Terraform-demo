/*
#-----------------------------------------------------------------------------#
# astrovidhi cloudfront for prod-admin.astrocure.co.in website
#-----------------------------------------------------------------------------#

locals {
  prod_admin_origin_id   = "${var.s3_prod_admin_name}-origin"
  prod_admin_domain_name = "${var.s3_prod_admin_name}.s3-website.${var.region}.amazonaws.com"
}

resource "aws_cloudfront_distribution" "prod_admin" {
  
  enabled = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  aliases = [var.s3_prod_admin_name]
  
  origin {
    origin_id      = local.prod_admin_origin_id
    domain_name    = local.prod_admin_domain_name
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  default_cache_behavior {
    
    target_origin_id = local.prod_admin_origin_id
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  // Here's where our certificate is loaded in!
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:623683966429:certificate/b69d696c-ceb7-4fd4-b48b-b7ee7eb11208"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1"
  }

  price_class = "PriceClass_200"
  
}

resource "aws_cloudfront_origin_access_identity" "prod_admin_origin_access_identity" {
  comment = "access-identity-${var.s3_prod_admin_name}.s3.amazonaws.com"
}

*/

#-----------------------------------------------------------------------------#
# astrovidhi cloudfront for astrocure.co.in website
#-----------------------------------------------------------------------------#

locals {
  astrocure_web_origin_id   = "${var.s3_astrocure_web}-origin"
  astrocure_web_domain_name = "${var.s3_astrocure_web}.s3-website.${var.region}.amazonaws.com"
}

resource "aws_cloudfront_distribution" "astrocure_website" {
  
  enabled = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  aliases = [var.s3_astrocure_web]
  
  origin {
    origin_id      = local.astrocure_web_origin_id
    domain_name    = local.astrocure_web_domain_name
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  default_cache_behavior {
    
    target_origin_id = local.astrocure_web_origin_id
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  // Here's where our certificate is loaded in!
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:623683966429:certificate/b69d696c-ceb7-4fd4-b48b-b7ee7eb11208"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1"
  }

  price_class = "PriceClass_200"
  
}

resource "aws_cloudfront_origin_access_identity" "astrocure_web_origin_access_identity" {
  comment = "access-identity-${var.s3_astrocure_web}.s3.amazonaws.com"
}


#-----------------------------------------------------------------------------#
# astrovidhi cloudfront for www.admin.astrocure.co.in
#-----------------------------------------------------------------------------#

locals {
  www_prod_admin_origin_id   = "${var.s3_www_prod_admin_name}-origin"
  www_prod_admin_domain_name = "${var.s3_www_prod_admin_name}.s3-website.${var.region}.amazonaws.com"
}

resource "aws_cloudfront_distribution" "www_prod_admin" {
  
  enabled = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  aliases = [var.s3_www_prod_admin_name]
  
  origin {
    origin_id      = local.www_prod_admin_origin_id
    domain_name    = local.www_prod_admin_domain_name
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  default_cache_behavior {
    
    target_origin_id = local.www_prod_admin_origin_id
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  // Here's where our certificate is loaded in!
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:623683966429:certificate/04d4b5e1-e3c9-4284-8e06-b3f894341a5a"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1"
  }

  price_class = "PriceClass_200"
  
}

resource "aws_cloudfront_origin_access_identity" "www_prod_admin_origin_access_identity" {
  comment = "access-identity-${var.s3_www_prod_admin_name}.s3.amazonaws.com"
}

#-----------------------------------------------------------------------------#
# astrovidhi cloudfront for www.astrocure.co.in website.
#-----------------------------------------------------------------------------#

locals {
  www_astrocure_web_origin_id   = "${var.s3_www_astrocure_web}-origin"
  www_astrocure_web_domain_name = "${var.s3_www_astrocure_web}.s3-website.${var.region}.amazonaws.com"
}

resource "aws_cloudfront_distribution" "www_astrocure_website" {
  
  enabled = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  aliases = [var.s3_www_astrocure_web]
  
  origin {
    origin_id      = local.www_astrocure_web_origin_id
    domain_name    = local.www_astrocure_web_domain_name
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  default_cache_behavior {
    
    target_origin_id = local.www_astrocure_web_origin_id
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]

    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  // Here's where our certificate is loaded in!
  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:623683966429:certificate/b69d696c-ceb7-4fd4-b48b-b7ee7eb11208"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1"
  }

  price_class = "PriceClass_200"
  
}

resource "aws_cloudfront_origin_access_identity" "www_astrocure_web_origin_access_identity" {
  comment = "access-identity-${var.s3_www_astrocure_web}.s3.amazonaws.com"
}
