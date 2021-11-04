resource "aws_route53_record" "blog" {
  zone_id = "Z0875892209G6JMLAI3PB"
  name    = "blog.elonbitmusk.com"
  type    = "A"
  ttl     = "300"
  records = ["127.0.0.1"]
}