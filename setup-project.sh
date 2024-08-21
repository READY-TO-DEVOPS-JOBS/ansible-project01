#!/bin/bash

# Define the project directory and subdirectories
PROJECT_DIR="aws-ansible-terraform-setup"
ANSIBLE_DIR="$PROJECT_DIR/ansible"
TERRAFORM_DIR="$PROJECT_DIR/terraform"

# Create the project directory and subdirectories
mkdir -p $ANSIBLE_DIR/{roles/common/{tasks,files,templates,handlers,vars,defaults},inventory}
mkdir -p $TERRAFORM_DIR/{scripts,modules}
echo "Project directories created."

# Navigate to the project directory
cd $PROJECT_DIR

# Initialize a Git repository
git init
echo ".DS_Store" > .gitignore  # Add more files to ignore as needed
git add .
git commit -m "Initial commit with project structure for Ansible and Terraform setup"
echo "Git repository initialized."

# Create Ansible Playbook file
touch $ANSIBLE_DIR/site.yml
echo "---" > $ANSIBLE_DIR/site.yml
echo "# Main playbook to apply roles" >> $ANSIBLE_DIR/site.yml

# Create Ansible Inventory file
touch $ANSIBLE_DIR/inventory/hosts
echo "# Ansible inventory file" > $ANSIBLE_DIR/inventory/hosts
echo "[agents]" >> $ANSIBLE_DIR/inventory/hosts

# Create Terraform main configuration file
touch $TERRAFORM_DIR/main.tf
echo "# Terraform configuration file for AWS setup" > $TERRAFORM_DIR/main.tf

# Create Terraform variables file
touch $TERRAFORM_DIR/variables.tf
echo "# Define Terraform variables" > $TERRAFORM_DIR/variables.tf

# Create Terraform output file
touch $TERRAFORM_DIR/output.tf
echo "# Terraform output values" > $TERRAFORM_DIR/output.tf

# Create Terraform provider configuration file
touch $TERRAFORM_DIR/provider.tf
echo "# Terraform provider configuration for AWS" > $TERRAFORM_DIR/provider.tf

# Create README.md
touch README.md
echo "# AWS Ansible Terraform Setup" > README.md
echo "This project includes Ansible roles and Terraform configurations for managing AWS infrastructure and applications." >> README.md

echo "Setup complete. Remember to configure AWS CLI, Terraform, and Ansible according to your project needs."
