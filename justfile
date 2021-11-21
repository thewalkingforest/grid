# prints this list
default:
	@echo "This is an {{arch()}} machine, running {{os()}}"
	@just --list

# prints cargo.toml info
info:
	cat ./Cargo.toml

# Builds release binary/lib
release: doc
  cargo build --release

# Builds program
build:
	cargo build

# Links binary to ~/.local/bin
link:
  #!/usr/bin/env bash
  DIR=$(pwd | awk -F/ '{print $NF}')
  rm -f ~/.local/bin/"$DIR"
  ln -s "$(pwd)"/target/debug/"$DIR" ~/.local/bin

# Checks for compile time errors
check:
	cargo check
	cargo clippy

# generates documentation
doc:
	cargo doc

# Runs tests
test: check
	cargo test

# list number of lines of code
sloc:
	echo "`wc -l ./src/*.rs` lines of code"
