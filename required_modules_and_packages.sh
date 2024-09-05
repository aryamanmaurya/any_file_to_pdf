#!/bin/bash

# Function to install dependencies using yum or dnf (CentOS/RHEL/Fedora)
install_yum_dnf_dependencies() {
    echo "Updating the system using $1..."
    sudo $1 update -y

    echo "Installing Python and pip..."
    sudo $1 install -y python3 python3-pip

    echo "Installing EPEL repository (only for CentOS/RHEL)..."
    sudo $1 install -y epel-release

    echo "Installing Pandoc..."
    sudo $1 install -y pandoc
}

# Function to install dependencies using apt (Ubuntu/Debian)
install_apt_dependencies() {
    echo "Updating the system using apt..."
    sudo apt update -y

    echo "Installing Python and pip..."
    sudo apt install -y python3 python3-pip

    echo "Installing Pandoc..."
    sudo apt install -y pandoc
}

# Detect the package manager
if [ -x "$(command -v yum)" ]; then
    PACKAGE_MANAGER="yum"
    install_yum_dnf_dependencies "$PACKAGE_MANAGER"
elif [ -x "$(command -v dnf)" ]; then
    PACKAGE_MANAGER="dnf"
    install_yum_dnf_dependencies "$PACKAGE_MANAGER"
elif [ -x "$(command -v apt)" ]; then
    PACKAGE_MANAGER="apt"
    install_apt_dependencies
else
    echo "Unsupported package manager. Please install dependencies manually."
    exit 1
fi

# Install necessary Python libraries
echo "Installing Python libraries..."
pip3 install fpdf2 Pillow docx2pdf pypandoc

# Verify installations
echo "Verifying installations..."
python3 -m pip show fpdf2 Pillow docx2pdf pypandoc
pandoc --version

echo "All dependencies have been installed successfully!"
