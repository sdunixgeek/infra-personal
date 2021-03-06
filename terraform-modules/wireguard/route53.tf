data "aws_route53_zone" "wg" {
  count = var.zone_name == "" || var.domain_name == "" ? 0 : 1

  name = var.zone_name
}

resource "aws_route53_record" "wg" {
  for_each = toset([for zone in data.aws_route53_zone.wg : zone.id])

  zone_id = each.value
  name    = var.domain_name
  type    = "A"
  ttl     = 60
  records = [aws_eip.wg.public_ip]
}
