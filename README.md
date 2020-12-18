# Dotfiles

Before proceeding make sure that you're logged in into your Apple account.

## Installation

1. Install Brew.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Brew dependencies.

```bash
brew bundle
```

3. Install zgen

```bash
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```

4. Clone this repository in your home directory.

```bash
git clone git@github.com:michalpopek/dotfiles.git
```

5. Run Stow.

```bash
stow -t ~ editorconfig git iterm zsh
```

6. Set ZSH as the default shell.

```bash
echo "$(which zsh)" >> /etc/shells
chsh -s $(which zsh)
```

You need to log out and log in for changes to be applied.

7. Configure iTerm.

```bash
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```
