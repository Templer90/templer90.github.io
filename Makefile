PDF_FILE = CV-\ Eric\ Heinz.html
PDF_FOLDER = _pdf
.PHONY: clean all pdf

clean:
	jekyll clean

all:
	jekyll build
	jekyll serve

pdf:
	jekyll build
	mkdir -p $(PDF_FOLDER)
	mkdir -p $(PDF_FOLDER)/css
	cp _site/css/*.* $(PDF_FOLDER)/css
	cp _site/en/resume.html $(PDF_FOLDER)/$(PDF_FILE)
	sed -i -E 's~<!--// pdf-exclude-start -->.*<!--// pdf-exclude-end -->~~g' $(PDF_FOLDER)/$(PDF_FILE)
	sed -i -E 's~/css/~./css/~g' $(PDF_FOLDER)/$(PDF_FILE)
	grep '[^[:space:]]' $(PDF_FOLDER)/$(PDF_FILE) > $(PDF_FOLDER)/tmp
	mv $(PDF_FOLDER)/tmp $(PDF_FOLDER)/$(PDF_FILE)
	zip -r CV-\ Eric\ Heinz.zip $(PDF_FOLDER)
	@echo "GO TO "
	@echo "\t https://html2pdf.com/de/"
