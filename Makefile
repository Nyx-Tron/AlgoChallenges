# Makefile for compiling and running C programs in the AlgoChallenges directory

# Variables for compiler
CC = gcc
CFLAGS = -Wall -g

# Variables for directories
SRC_DIR = ./src
BUILED_DIR = ./build


# get all .c files in the src directory
TEST_NAMES = $(notdir $(basename $(wildcard $(SRC_DIR)/*.c)))


.PHONY: help
help:
	@printf "Usage: make [options]\n\n"
	@printf "Options:\n"
	@printf "  build\t\t\tCompile all test programs\n"
	@printf "  run\t\t\tCompile and run all test programs\n"
	@printf "  <test_name>\t\tCompile and run a specific test program\n"
	@printf "  clean\t\t\tRemove all compiled binaries\n"
	@printf "\n"
	@printf "Examples:\n"
	@printf "  make build\t\t# Build all test programs\n"
	@printf "  make run\t\t# Build and run all test programs\n"
	@printf "  make test1\t\t# Build and run test1 program\n"
	@printf "  make test1 test2\t# Build and run multiple tests\n"
	@printf "  make clean\t\t# Remove all compiled files\n"
	@printf "\n"
	@printf "Available tests: $(TEST_NAMES)\n"




# [make build]
.PHONY: build
build: $(addprefix $(BUILED_DIR)/, $(TEST_NAMES))

$(BUILED_DIR)/%: $(SRC_DIR)/%.c
	@$(CC) $(CFLAGS) -o $@ $<

# [make run] 
.PHONY: run
run: build
	@for test in $(TEST_NAMES); do \
		printf "\033[32mRunning $$test...\033[0m\n"; \
		$(BUILED_DIR)/$$test; \
	done

# [make <test_name>]
.PHONY: $(TEST_NAMES)
$(TEST_NAMES): %: $(BUILED_DIR)/%
	@$(BUILED_DIR)/$@


# [make clean]
.PHONY: clean
clean:
	@rm -f $(BUILED_DIR)/*