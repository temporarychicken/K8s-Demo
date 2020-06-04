resource "aws_key_pair" "controller" {
  key_name   = "k8s-server-key"
  public_key = file ("~/.ssh/k8s-key.pub")
}
