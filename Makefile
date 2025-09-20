.PHONY: all
all:
	@stow -D */
	@stow zsh
	@stow git --ignore=^ignore$