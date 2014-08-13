#!/bin/sh

# first install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install various things
brew install python \
	go \
	scala \
	tree \
	vim \
	zsh

