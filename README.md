Parent directory is a default directory where links are put after `stow` command. 

- `stow -R */` restow all directories
- `stow -n */` doesn't apply actual command, just gives an information what it should do
- `stow -t ~ folder1 folder1` links are created in home location for folder1 and folder2
- `stow -D */` delete all previously created links

***

### Note on autosuggestion plugin

It requires additional steps to be performed. In particular: 
- Download zsh-autosuggestions by 
  `git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`
- Download zsh-syntax-highlighting by 
  `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`
