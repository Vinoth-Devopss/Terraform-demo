
# Create ACM astrocure for ELB Hyb..

resource "aws_acm_certificate" "astrocure_certificate" {
  domain_name       = "astrocure.co.in"
  validation_method = "DNS"
    subject_alternative_names = ["*.astrocure.co.in"]

  lifecycle {
    create_before_destroy = true
  }
}
