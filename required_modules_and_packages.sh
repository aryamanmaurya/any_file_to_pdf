#!/bin/bash

# Update the system
echo "Updating the system..."
sudo yum update -y

# Install Python and pip if not already installed
echo "Installing Python and pip..."
sudo yum install -y python3 python3-pip

# Install necessary Python libraries
echo "Installing Python libraries..."
pip3 install fpdf2 Pillow docx2pdf pypandoc

# Install EPEL repository
echo "Installing EPEL repository..."
sudo yum install -y epel-release

# Install Pandoc
echo "Installing Pandoc..."
sudo yum install -y pandoc

# Verify installations
echo "Verifying installations..."
python3 -m pip show fpdf2 Pillow docx2pdf pypandoc
pandoc --version

echo "All dependencies have been installed successfully!"

