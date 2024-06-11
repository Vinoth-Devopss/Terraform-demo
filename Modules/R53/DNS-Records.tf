# Add astrocure DNS Records..
# Zoho Email DNS Records.

#-----------------------------------------#
# astrocure-zoho-DMDK-Record-validations.
#-----------------------------------------#

resource "aws_route53_record" "astrocure-zoho-DMDK" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "zmail._domainkey"
  type = "TXT"
  ttl = 60

  records = [
    "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCEZce7H0xIjYbw4sATOBbjSGMM6y8lTDASBoDrMNjWnCRTmEHXozOhcs6F7vwPtmacEw3n5/bZOVShFiXU6i6T7c1kiTAxXm+RHErzt9gBZGcUWsEycGxX8jT4SwgxJfqUAt6NYqB0xYZGJOXIsJWnj90qZphmoSW1vesXRdl7UwIDAQAB"
  ]
}

#---------------------------------------#
# astrocure-Zoho-MX-Record-validations.
#---------------------------------------#

resource "aws_route53_record" "astrocure_hostinger_mx" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = ""
  type = "MX"
  ttl = 60

  records = [
    "10 mx.zoho.in",
    "20 mx2.zoho.in",
    "50 mx3.zoho.in"

  ]
}

#----------------------------------------#
# astrocure-Zoho-SPF-Record-validations.
#----------------------------------------#


resource "aws_route53_record" "astrocure-Zoho-spf" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = ""
  type = "TXT"
  ttl = 60

  records = [
    "google-site-verification=YUOJ6zoKC_ZaSB5oSld1HcwUTq6g8Hfh-QIoHxaQl5g", "v=spf1 include:zeptomail.net.in include:zoho.in ~all", "atlassian-domain-verification=/mpAGSsMuHvZCh1xJEtQluYc5DSSq1cTarayynvZ/gyW5OjSZ0XrUJWJ9TlfPdXW"
  ]
}

resource "aws_route53_record" "astrocure_mx-1" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "support"
  type = "MX"
  ttl = 300

  records = [
    "10 feedback-smtp.ap-south-1.amazonses.com"
  ]
}

/*
#----------------------------------------#
# astrocure-Zepto-SPF-Record-validations
#----------------------------------------#

resource "aws_route53_record" "astrocure_zeptomail_SPF" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = ""
  type = "TXT"
  ttl = 60

  records = [
    "v=spf1 include:zeptomail.net.in ~all"      
  ]
}
*/

#--------------------------------#
# astrocure-TXT-Record-validations
#--------------------------------#

resource "aws_route53_record" "domainkey" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "5133118._domainkey"
  type = "TXT"
  ttl = 60

  records = [
    "k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCqdxlkqMHEWHbphf7PA/e+XetzUenuWhyBMXVDZhlVE4LeGQeNaTdggckcPEhJK3TXa3GnUdnnnalGu9OFbcFLFk/phI6mAyb5aoukyjNG037ZHNM01cj1oi7uaXWPy6PwIWr+x4rDMPQR8zpxznH9vsqP6TDzEr3dUq9hsOxHaQIDAQAB"
  ]
}

resource "aws_route53_record" "support-astrocure" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "support"
  type = "TXT"
  ttl = 60

  records = [
    "v=spf1 include:amazonses.com ~all"
  ]
}

resource "aws_route53_record" "help-astrocure" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "help"
  type = "CNAME"
  ttl = 60

  records = [
    "cluster89.zeptomail.in"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-1" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "y45mmotnrlr5anske6hs4t2mpu3rxahr._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "y45mmotnrlr5anske6hs4t2mpu3rxahr.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-2" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "wxr6zz7y57hjerhr4jejmramtuvtnwn6._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "wxr6zz7y57hjerhr4jejmramtuvtnwn6.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-3" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "uwdln6rt5yukysnv52j2dfzctq5h7njr._domainkey"
  type = "CNAME"
  ttl = 60

  records = [
    "uwdln6rt5yukysnv52j2dfzctq5h7njr.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-4" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "u6b2izfki6lfun6is5j5g56xw3sjye4x._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "u6b2izfki6lfun6is5j5g56xw3sjye4x.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-5" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "oyzis3c33nwfapbpohub5jcx5uc2kabm._domainkey"
  type = "CNAME"
  ttl = 60  

  records = [
    "oyzis3c33nwfapbpohub5jcx5uc2kabm.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-6" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "ngyfg2g7muinuizp4ync57btj3lmlukc._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "ngyfg2g7muinuizp4ync57btj3lmlukc.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-7" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "lmu3zrhmd33xi2fb32tcgrbss5ouv5fz._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "lmu3zrhmd33xi2fb32tcgrbss5ouv5fz.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-8" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "iii6s2byazhpxtfb65wizzyskzuaowuf._domainkey"
  type = "CNAME"
  ttl = 60

  records = [
    "iii6s2byazhpxtfb65wizzyskzuaowuf.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-9" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "gmj3aad7apyhjr4s7ybp7jamaq644skh._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "gmj3aad7apyhjr4s7ybp7jamaq644skh.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-10" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "gc5nbo2r3u43xp6pr2jf747yg3nyheuy._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "gc5nbo2r3u43xp6pr2jf747yg3nyheuy.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-11" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "3b6o2bc5toqg4vgasx6k7p5tz4agypmu._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "3b6o2bc5toqg4vgasx6k7p5tz4agypmu.dkim.amazonses.com"
  ]
}

resource "aws_route53_record" "astrocure-domainkey-12" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "2f236d63ddkkvbeywofmcdc54shj4nnp._domainkey"
  type = "CNAME"
  ttl = 1800

  records = [
    "2f236d63ddkkvbeywofmcdc54shj4nnp.dkim.amazonses.com"
  ]
}

#--------------------------------#
# astrocure-acm-validations Prod 
#--------------------------------#

resource "aws_route53_record" "astrocure-acm-validations" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "_cb3e7ad0470aad44b6a4eeacf7c5b0e4"
  type = "CNAME"
  ttl = 1800

  records = [
    "_54cb87339a773f66c1c0dc09941a26f4.cmqshkkvmc.acm-validations.aws."
  ]
}


#----------------------------------------------#
# astrocure-acm-validations Dev - Web & Admin
#----------------------------------------------#

resource "aws_route53_record" "astrocure-dev-acm-validations" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "_aa2f2f208b8b65fce1a4f72865b0dbc9.dev"
  type = "CNAME"
  ttl = 1800

  records = [
    "_d988e6e109e2bc26a946907f4f60a73d.mhbtsbpdnt.acm-validations.aws."
  ]
}


resource "aws_route53_record" "astrocure-dev-admin-acm-validations" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "_88f7ec64260e0eb5e9b71e3af5321df9.dev-admin"
  type = "CNAME"
  ttl = 1800

  records = [
    "_fbdf6b43c34ba39b03b3c50f0e683e4d.mhbtsbpdnt.acm-validations.aws."
  ]
}


resource "aws_route53_record" "astrocure-prod-admin-acm-validations" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "_4d918cc62caf1a6ac792120817c291b4.admin"
  type = "CNAME"
  ttl = 1800

  records = [
    "_05d2c18c6458fd3cc192011deb90f8e1.mhbtsbpdnt.acm-validations.aws."
  ]
}



#------------------------------------------------#
# astrocure-acm-validations Test - Web & Admin
#------------------------------------------------#

resource "aws_route53_record" "astrocure-test-acm-validations" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "_9a450fc1a4767ab53987b61f11d17fcb.test"
  type = "CNAME"
  ttl = 1800

  records = [
    "_0ad54bab25898e0450c6270e7c22fc0d.mhbtsbpdnt.acm-validations.aws."
  ]
}

resource "aws_route53_record" "astrocure-test-admin-acm-validations" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "_2c035d1c088e0e2b5b2494c812794ba6.test-admin"
  type = "CNAME"
  ttl = 1800

  records = [
    "_90a7c0f9bb69c00d4cf96d9f5e1e8494.mhbtsbpdnt.acm-validations.aws."
  ]
}

#--------------------------------#
# Astrocure-Prod-A-Records-validations
#--------------------------------#
resource "aws_route53_record" "prod-api" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "prod-api"
  type = "CNAME"
  ttl = 60

  records = [
    "prod-astrocure-co-in-479440979.ap-south-2.elb.amazonaws.com"
  ]
}

resource "aws_route53_record" "prod-api-1" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "prod-api-1"
  type = "A"
  ttl = 60

  records = [
    "18.61.54.152"
  ]
}

resource "aws_route53_record" "prod-api-2" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "prod-api-2"
  type = "A"
  ttl = 60

  records = [
    "18.61.193.127"
  ]
}

#--------------------------------------------#
# astrocure-CName-Records-For-CF-validations
#--------------------------------------------#

resource "aws_route53_record" "prod-admin" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "admin"
  type = "CNAME"
  ttl = 60

  records = [
    "dqw67aw7rj9ix.cloudfront.net."
  ]
}


resource "aws_route53_record" "www_prod-admin" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "www.admin"
  type = "CNAME"
  ttl = 60

  records = [
    "d2e32kewsmlzul.cloudfront.net."
  ]
}


resource "aws_route53_record" "www_astrocure" {
  zone_id = aws_route53_zone.astrocure.zone_id
  name = "www"
  type = "CNAME"
  ttl = 60

  records = [
    "d2wczulp06jwh3.cloudfront.net."
  ]
}






