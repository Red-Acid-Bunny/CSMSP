BUILD_PDF := ./build_pdf
RESULT := ./result
SRC_TEX := ./src_tex
MAIN_SRC := result.tex

COMPILER_TEX_PREFIX := TEXINPUTS=".:$(BUILD_PDF):"
COMPILER_TEX_FLAGS := -output-directory $(BUILD_PDF)/ $(MAIN_SRC)

COMPILER_TEX := $(COMPILER_TEX_PREFIX) pdflatex $(COMPILER_TEX_FLAGS)


all: build
	echo $@

build: add_src_tex
	bash ru2en.sh ans
	flatpak run org.octave.Octave Test.m > octave.log
	python3 generateLatexAns.py
	$(COMPILER_TEX)

add_src_tex: $(BUILD_PDF)
	cp $(SRC_TEX)/* $(BUILD_PDF)/

$(BUILD_PDF):
	mkdir -p $@

clean:
	rm -f $(BUILD_PDF)/* octave.log

PHONY: clean all build add_src_tex
