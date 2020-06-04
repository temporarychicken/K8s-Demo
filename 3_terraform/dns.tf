# Set some defaults for AWS like region.
#provider "aws" {
# profile = "default"
# region  = "eu-west-2"
#}


# Locate the correct zone from Route53

data "aws_route53_zone" "selected" {
  name         = "nginxdemo.net"
  private_zone = false
}



resource "aws_route53_record" "dockerregistry" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "dockerregistry.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.docker-registry.public_ip ]

}

resource "aws_route53_record" "k8s" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "k8s.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.k8s-master.public_ip ]

}



resource "aws_route53_record" "worker-node-1" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "worker-node-1.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.worker-node-1.public_ip ]

}


resource "aws_route53_record" "worker-node-2" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "worker-node-2.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.worker-node-2.public_ip ]

}

resource "aws_route53_record" "k8sdashboard" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "k8sdashboard.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.k8s-master.public_ip ]

}

resource "aws_route53_record" "ingressdashboard" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "ingressdashboard.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
# records = ["${chomp(http.myip.body)}"]
  records = [ aws_instance.k8s-master.public_ip ]

}
