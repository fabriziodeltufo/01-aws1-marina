variable "instance_name" {
  type        = string
  description = "The identifying name for the EC2 instance and its related resources"
}

variable "instance_ami" {
  type        = string
  description = "The AWS AMI ID to use for the operating system"
}

variable "instance_type" {
  type        = string
  description = "The EC2 instance type size (e.g., t3.micro)"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "The name of the AWS SSH Key Pair for secure access"
}

variable "subnet_id" {
  type        = string
  description = "The AWS Subnet ID where the instance will be deployed"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of AWS Security Group IDs to associate with the instance"
}

variable "root_volume_size" {
  type        = number
  description = "The size of the root block device volume in GB"
  default     = 8
}

variable "root_volume_type" {
  type        = string
  description = "The type of the root block device volume (e.g., gp3)"
  default     = "gp3"
}
