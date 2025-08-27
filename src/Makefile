# Makefile for compiling and running C programs in the SRC directory

# Variables for compiler
CC = gcc
CFLAGS = -Wall -g

# Variables for directories
SRC_DIR = ./
BUILED_DIR = ../build


# get all .c files in the src directory
TEST_NAMES = $(notdir $(basename $(wildcard $(SRC_DIR)/*.c)))


.PHONY: help
help:
	@printf "Usage: make [options]\n\n"
	@printf "Options:\n"
	@printf "  <test_name>				Compile and run a specific test program\n"
	@printf "  clean           	 		Remove all compiled binaries\n"



$(BUILED_DIR)/%: $(SRC_DIR)/%.c
	@$(CC) $(CFLAGS) -o $@ $<


# [make <test_name>]
.PHONY: $(TEST_NAMES)
$(TEST_NAMES): %: $(BUILED_DIR)/%
	@$(BUILED_DIR)/$@


# [make clean]
.PHONY: clean
clean:
	@rm -f $(BUILED_DIR)/*