shell=/bin/bash

BUILD_PDF := ./build_pdf
SRC_TEX := ./src_tex
RESULT := ./result
FUNCTIONS_PATH := ./src/functions

MAIN_SRC := ./result.tex
SET_FILE_PATH := ./Settings.txt

COMPILER_TEX_PREFIX := TEXINPUTS=".:$(BUILD_PDF):"
COMPILER_TEX_FLAGS := -output-directory $(BUILD_PDF)/ $(MAIN_SRC)
COMPILER_TEX := $(COMPILER_TEX_PREFIX) pdflatex $(COMPILER_TEX_FLAGS)

GET_SET := bash $(FUNCTIONS_PATH)/GetSetting.sh $(SET_FILE_PATH)
DATA_FILE_PATH := $(shell $(GET_SET) PathToDataFile)
MODE := $(shell $(GET_SET) Mode)


all: print_set build 

print_set: 
	echo ${DATA_FILE_PATH}
	echo ${MODE}

build: add_src_tex $(MODE)
	$(COMPILER_TEX)

add_src_tex: $(BUILD_PDF)
	cp $(SRC_TEX)/* $(BUILD_PDF)/

# Interval Sample Mode
IntervalSample: $(MODE)_get_result
	echo $@
	#python3 generateLatexAns.py

IntervalSample_get_result: $(MODE)_preparing_input_data
	echo $@
	#flatpak run org.octave.Octave Test.m > $(BUILD_PDF)/octave.log

IntervalSample_preparing_input_data:
	echo $@
	#bash $(FUNCTIONS_PATH)/SDN.sh $(DATA_FILE_PATH) $(BUILD_PDF)/ans
	bash $(FUNCTIONS_PATH)/IntervalSampleTable/ISPreparationTable.sh $(DATA_FILE_PATH) $(BUILD_PDF)/ans

# Grouped Sample Mode
GroupedSample: $(MODE)_get_result
	echo $@
	#python3 generateLatexAns.py

GroupedSample_get_result: $(MODE)_preparing_input_data
	echo $@
	#flatpak run org.octave.Octave Test.m > $(BUILD_PDF)/octave.log

GroupedSample_preparing_input_data:
	echo $@
	#bash $(FUNCTIONS_PATH)/SDN.sh $(DATA_FILE_PATH) $(BUILD_PDF)/ans
	#bash $(FUNCTIONS_PATH)/GroupedSampleTable/SCPreparationTable.sh $(BUILD_PDF)/ans $(BUILD_PDF)/ans
	
# Single Column Mode
SingleColumn: $(MODE)_get_result
	echo $@
	python3 generateLatexAns.py

SingleColumn_get_result: $(MODE)_preparing_input_data
	echo $@
	flatpak run org.octave.Octave Test.m > $(BUILD_PDF)/octave.log

SingleColumn_preparing_input_data:
	echo $@
	bash $(FUNCTIONS_PATH)/SDN.sh $(DATA_FILE_PATH) $(BUILD_PDF)/ans
	bash $(FUNCTIONS_PATH)/SingleColumnTable/SCPreparationTable.sh $(BUILD_PDF)/ans $(BUILD_PDF)/ans

$(BUILD_PDF):
	mkdir -p $@

clean:
	rm -f $(BUILD_PDF)/* octave.log

PHONY: clean all build add_src_tex $(BUILD_PDF) IntervalSample IntervalSample_get_result IntervalSample_preparing_input_data GroupedSample GroupedSample_get_result GroupedSample_preparing_input_data SingleColumn SingleColumn_get_result SingleColumn_preparing_input_data
