PDF_FILE_EN = CV\ Eric\ Heinz\ EN.pdf
PDF_FILE_DE = CV\ Eric\ Heinz\ DE.pdf
.PHONY: clean all pdf

clean:
	jekyll clean

all: pdf
	jekyll build
	jekyll serve

pdf:
	jekyll build
	jekyll serve &
	sleep 1
	chromium --headless --disable-gpu  --no-pdf-header-footer --print-to-pdf-no-header --print-to-pdf=downloads/$(PDF_FILE_EN) http://127.0.0.1:4000/en/pdf.html 
	chromium --headless --disable-gpu  --no-pdf-header-footer --print-to-pdf-no-header --print-to-pdf=downloads/$(PDF_FILE_DE) http://127.0.0.1:4000/de/pdf.html 
	killall -SIGINT "jekyll"
