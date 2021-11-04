resource "aws_route53_record" "wordpress" {
  zone_id = "Z0875892209G6JMLAI3PB"
  name    = "wordpress.elonbitmusk.com"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.web.public_ip] 
}