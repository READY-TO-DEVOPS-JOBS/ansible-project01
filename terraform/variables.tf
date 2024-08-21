# Define Terraform variables
# In terraform/variables.tf

variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances"
  default     = "ami-0a0e5d9c7acc336f1"
}

variable "instance_type" {
  description = "The instance type for the EC2 instances"
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instances"
  default     = "admin_test_key_pair"
}

variable "instance_count" {
  description = "Number of agent instances to create"
  default     = 2
}