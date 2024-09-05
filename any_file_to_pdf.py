import os
from fpdf import FPDF
from fpdf.enums import XPos, YPos
from PIL import Image
import docx2pdf
import pypandoc

def convert_text_to_pdf(input_file, output_file):
    pdf = FPDF()
    pdf.add_page()
    pdf.set_font("Helvetica", size=12)
    
    with open(input_file, 'r') as file:
        for line in file:
            pdf.cell(200, 10, text=line, new_x=XPos.LMARGIN, new_y=YPos.NEXT)
    
    pdf.output(output_file)

def convert_image_to_pdf(input_file, output_file):
    image = Image.open(input_file)
    pdf_image = image.convert('RGB')
    pdf_image.save(output_file)

def convert_docx_to_pdf(input_file, output_file):
    docx2pdf.convert(input_file, output_file)

def convert_other_files_to_pdf(input_file, output_file):
    # Convert other formats like markdown, html, etc. using Pandoc
    output = pypandoc.convert_file(input_file, 'pdf', outputfile=output_file)
    assert output == "", "Conversion failed!"

def main():
    input_file = input("Enter the file path to convert to PDF: ")
    
    if not os.path.exists(input_file):
        print("File does not exist. Please check the path.")
        return
    
    file_name, file_ext = os.path.splitext(input_file)
    output_file = f"{file_name}.pdf"
    
    if file_ext == '':
        print("No file extension found. Assuming it's a text file.")
        convert_text_to_pdf(input_file, output_file)
    elif file_ext.lower() in ['.txt']:
        convert_text_to_pdf(input_file, output_file)
    elif file_ext.lower() in ['.png', '.jpg', '.jpeg', '.bmp', '.tiff']:
        convert_image_to_pdf(input_file, output_file)
    elif file_ext.lower() == '.docx':
        convert_docx_to_pdf(input_file, output_file)
    else:
        try:
            convert_other_files_to_pdf(input_file, output_file)
        except Exception as e:
            print(f"Could not convert the file: {e}")
            return
    
    print(f"File converted to PDF: {output_file}")

if __name__ == "__main__":
    main()

