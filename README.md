
# File Conversion Tool

This repository contains scripts to convert various file formats into PDF using Python. The project includes:

- `any_file_to_pdf.py`: A Python script to handle file conversions.
- `required_modules_and_packages.sh`: A shell script to set up the environment and install necessary dependencies.

## Features

- Converts various file formats (e.g., docx, images) to PDF.
- Uses Python libraries like `fpdf2`, `Pillow`, `docx2pdf`, and `pypandoc`.
- Installs all dependencies and verifies them.

## Prerequisites

Make sure you have the following installed on your system:

- Python 3.x
- pip (Python package installer)
- Yum (for package management in RHEL/CentOS environments)

## Installation

### Step 1: System Update and Package Installation

Run the `required_modules_and_packages.sh` script to update the system and install the required modules.

```bash
bash required_modules_and_packages.sh
```

This script will:

- Update the system using `yum`.
- Install Python 3 and `pip`.
- Install the required Python packages (`fpdf2`, `Pillow`, `docx2pdf`, `pypandoc`).
- Install Pandoc, a universal document converter.

### Step 2: Python Libraries

If you want to install the Python libraries manually, use:

```bash
pip3 install fpdf2 Pillow docx2pdf pypandoc
```

## Usage

Once all the dependencies are installed, you can use the `any_file_to_pdf.py` script to convert your files to PDF.

```bash
python3 any_file_to_pdf.py input_file output_file.pdf
```

### Example:

```bash
python3 any_file_to_pdf.py sample.docx output.pdf
```

This will convert the `sample.docx` file to `output.pdf`.

## Verifying Installations

The `required_modules_and_packages.sh` script includes steps to verify the installation of required libraries and Pandoc. You can also manually verify them:

```bash
python3 -m pip show fpdf2 Pillow docx2pdf pypandoc
pandoc --version
```

If the dependencies are installed successfully, the script will display their versions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
