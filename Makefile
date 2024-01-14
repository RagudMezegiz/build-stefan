# Copyright 2024 David Terhune. All rights reserved.
#

# Fix broken shell on Windows
ifeq ($(OS), Windows_NT)
SHELL := powershell.exe
RM = rm -force
endif

all: build-stefan.pdf

MD_FILES = build-stefan.md summary.md $(wildcard games/*.md)
TEX_FILES = $(wildcard tex/*.tex)
YAML_FILES = build-stefan.yaml metadata.yaml

build-stefan.pdf: $(MD_FILES) $(TEX_FILES) $(YAML_FILES)
	pandoc --defaults=build-stefan.yaml

.PHONY: clean

# Workaround for SHELL not correctly used on Windows
ifeq ($(OS), Windows_NT)
clean:
	$(SHELL) $(RM) *.pdf
else
clean:
	$(RM) *.pdf
endif
