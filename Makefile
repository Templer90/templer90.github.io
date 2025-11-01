PDF_FILE = CV\ Eric\ Heinz.pdf
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
	chromium --headless --disable-gpu  --no-pdf-header-footer --print-to-pdf-no-header --print-to-pdf=downloads/$(PDF_FILE) http://127.0.0.1:4000/en/pdf.html 
	killall -SIGINT "jekyll"
