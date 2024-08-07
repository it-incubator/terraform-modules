variable "cloudflare_zone_id" {
  description = "Your CloudFlare Zone ID"
  type        = string
}

variable "domain" {
  description = "Your Domain"
  type        = string
}


variable "tags" {
  description = "Your Tags"
  type        = map(string)
}


