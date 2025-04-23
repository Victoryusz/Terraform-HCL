### Bloco de config do Par de chaves. ###
resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

### Bloco de config da Instância EC2. ###
resource "aws_instance" "vm" {
  ami                         = "ami-04f7a54071e74f488"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name                                   # Referenciamento ao name do key pair para acesso SSH. #
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id           # Sub-rede da VPC configurada anteriormente. #
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id] # Grupo de segurança da VPC. #
  associate_public_ip_address = true

  tags = {
    Name = "vm-terraform" ## Nome da Maquina virtual (EC2)
  }
}
