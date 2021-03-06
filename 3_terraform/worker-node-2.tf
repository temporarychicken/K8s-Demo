resource "aws_instance" "worker-node-2" {
  ami                         = data.aws_ami.k8s-base-machine.id # eu-west-2
  instance_type               = "t2.medium"
  key_name                    = "k8s-server-key"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.nginx-web-facing.id]
  subnet_id                   = aws_subnet.main.id
  private_ip                  = "10.0.0.50"



  tags = {
    Name = "worker-node-2"
  }
}
