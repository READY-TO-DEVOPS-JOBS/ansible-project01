# Terraform provider configuration for AWS
# In terraform/provider.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"  # Use the latest 4.x version
    }
  }
}

provider "aws" {
  region = var.aws_region

  # If you want to specify credentials here (not recommended for security reasons)
  # access_key = "your-access-key"
  # secret_key = "your-secret-key"

  # Alternatively, you can use environment variables or AWS CLI configuration
}