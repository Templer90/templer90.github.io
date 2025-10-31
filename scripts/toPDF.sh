#!/bin/bash
#weasyprint http://127.0.0.1:4000/en/pdf.html ./../downloads/pdf-website.pdf

chromium --headless --disable-gpu --print-to-pdf=output_file_name.pdf http://127.0.0.1:4000/en/pdf.html 
