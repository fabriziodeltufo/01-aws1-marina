variable "instance_name" {
  type        = string
  description = "Nome identificativo dell'istanza EC2 e delle risorse collegate"
}

variable "instance_ami" {
  type        = string
  description = "ID dell'AMI AWS da utilizzare per il sistema operativo"
}

variable "instance_type" {
  type        = string
  description = "Tipo di istanza EC2 (es. t3.micro)"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Nome della chiave SSH AWS per l'accesso"
}

variable "subnet_id" {
  type        = string
  description = "ID della Subnet AWS in cui posizionare l'istanza"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Lista di ID dei Security Group da associare all'istanza"
}

variable "root_volume_size" {
  type        = number
  description = "Dimensione del disco principale (root) in GB"
  default     = 8
}

variable "root_volume_type" {
  type        = string
  description = "Tipo di volume per il disco principale (es. gp3)"
  default     = "gp3"
}
