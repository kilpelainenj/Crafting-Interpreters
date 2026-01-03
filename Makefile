## Simple Makefile for Crafting Interpreters (jlox)
## Usage:
##   make build
##   make run [ARGS="path/to/script.lox"]
##   make ast [AST_DIR="com/craftinginterpreters/lox"]
##   make clean

JAVA      ?= java
JAVAC     ?= javac
OUT_DIR   ?= out
SRC_DIR   ?= com
MAIN_CLASS?= com.craftinginterpreters.lox.Lox
AST_CLASS ?= com.craftinginterpreters.tool.GenerateAst
AST_DIR   ?= com/craftinginterpreters/lox

SOURCES := $(shell find "$(SRC_DIR)" -name "*.java")

.PHONY: all build run ast clean

all: build

build:
	@mkdir -p "$(OUT_DIR)"
	"$(JAVAC)" -d "$(OUT_DIR)" $(SOURCES)

run: build
	"$(JAVA)" -cp "$(OUT_DIR)" "$(MAIN_CLASS)" $(ARGS)

ast: build
	"$(JAVA)" -cp "$(OUT_DIR)" "$(AST_CLASS)" "$(AST_DIR)"

clean:
	rm -rf "$(OUT_DIR)"

