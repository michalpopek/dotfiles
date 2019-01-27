# Dotfiles

Before proceeding make sure that you're logged in into your Apple account.

## Installation

1. Install Brew.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Clone this repository in your home directory.

```bash
git clone git@github.com:michalpopek/dotfiles.git ~/.dotfiles
```

3. Install Brew dependencies.

```bash
brew bundle
```

4. Set ZSH as the default shell.

```bash
echo "$(which zsh)" >> /etc/shells
chsh -s $(which zsh)
```

You need to log out and log in for changes to be applied.

5. Run Stow.

```bash
stow editorconfig git iterm prettier zsh
```

6. Configure iTerm.

```bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```
