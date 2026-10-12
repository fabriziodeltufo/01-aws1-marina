# Definisce l'istanza EC2 principale usando le variabili
resource "aws_instance" "aws_marinastore" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true
  ebs_optimized               = true

  tags = {
    Name = var.instance_name
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required" # Configurazione sicura per i metadati
    instance_metadata_tags      = "disabled"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    iops                  = 3000
    throughput            = 125
  }
}

# Associa l'IP pubblico statico (Elastic IP) all'istanza sopra
resource "aws_eip" "aws_marinastore_eip" {
  instance = aws_instance.aws_marinastore.id
  domain   = "vpc"

  tags = {
    Name = "${var.instance_name}-eip"
  }
}
