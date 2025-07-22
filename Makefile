# Makefile for compiling the LaTeX project

# --- Variables ---
LATEXMK = latexmk
MAIN_FILE = main.tex
OUT_DIR = out
PDF_FILE = $(OUT_DIR)/$(MAIN_FILE:.tex=.pdf)

# --- Targets ---

# Default target: build the PDF
all: $(PDF_FILE)

# Rule to build the PDF using latexmk
# -pdf: Generate PDF output
# -outdir: Specify the output directory
# -interaction=nonstopmode: Don't stop on errors
$(PDF_FILE): $(MAIN_FILE) sections/*.tex sections/subsections/*.tex preamble.tex
	$(LATEXMK) -pdf -outdir=$(OUT_DIR) -interaction=nonstopmode $(MAIN_FILE)

# View the generated PDF
view: all
	@echo "Opening $(PDF_FILE)..."
	# Use 'open' on macOS, 'xdg-open' on Linux, 'start' on Windows
	# This is a basic example; you might need to adjust it for your system.
	@open $(PDF_FILE) 2>/dev/null || xdg-open $(PDF_FILE) 2>/dev/null || start $(PDF_FILE) 2>/dev/null || echo "Could not open PDF automatically."


# Clean up generated files
clean:
	@echo "Cleaning up generated files..."
	rm -rf $(OUT_DIR)
	$(LATEXMK) -C

# Phony targets do not represent actual files
.PHONY: all view clean
