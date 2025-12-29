## Simple Makefile for Crafting Interpreters (jlox)
## Usage:
##   make build
##   make run [ARGS="path/to/script.lox"]
##   make clean

JAVA      ?= java
JAVAC     ?= javac
OUT_DIR   ?= out
SRC_DIR   ?= com
MAIN_CLASS?= com.craftinginterpreters.lox.Lox

SOURCES := $(shell find "$(SRC_DIR)" -name "*.java")

.PHONY: all build run clean

all: build

build:
	@mkdir -p "$(OUT_DIR)"
	"$(JAVAC)" -d "$(OUT_DIR)" $(SOURCES)

run: build
	"$(JAVA)" -cp "$(OUT_DIR)" "$(MAIN_CLASS)" $(ARGS)

clean:
	rm -rf "$(OUT_DIR)"

