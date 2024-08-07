terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}


resource "aws_acm_certificate" "create" {
  domain_name       = var.domain
  validation_method = "DNS"
  tags = var.tags
}


resource "cloudflare_record" "certificate_validation" {
  for_each = {for dvo in aws_acm_certificate.create.domain_validation_options : dvo.domain_name => dvo}
  zone_id  = var.cloudflare_zone_id
  name     = each.value.resource_record_name
  value    = each.value.resource_record_value
  type     = each.value.resource_record_type
  ttl      = 60
}
