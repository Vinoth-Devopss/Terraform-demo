# create Hosted zones for astrocure.co.in domain
resource "aws_route53_zone" "astrocure" {
  name = "astrocure.co.in"
}

resource "aws_route53_record" "nameservers" {
  allow_overwrite = true
  name            = "astrocure.co.in"
  ttl             = 3600
  type            = "NS"
  zone_id         = aws_route53_zone.astrocure.zone_id

  records = aws_route53_zone.astrocure.name_servers
}
