# dotfiles
## Installation 
- Make sure you have stow installed and check:
```sh
stow --version
```
# Reminder to myself
This command takes the target directory and makes a sym-link to that directory use with caution to avoid duplicates.
Also the second argument is which directory contents you want to make symlink of here in the example I'm currently in `~/dotfiles` directory and I want to make sym-link of contents of zsh directory in the home directory.
```sh 
stow -t /home/user zsh
```
