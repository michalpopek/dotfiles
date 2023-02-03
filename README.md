# Dotfiles

The dotfiles are managed using [chezmoi](https://www.chezmoi.io). Download this repo into `~/.local/share/chezmoi`.

Before proceeding make sure that you're logged in into your Apple account.

## Installation

1. Install Brew.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Brew dependencies.

```sh
brew bundle
```

3. Open 1Password and add all necessary vaults.

4. Set the ZSH version installed by Homebrew as the default shell.

```sh
echo "$(which zsh)" | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

You need to log out and log in for changes to be applied.

5. Run chezmoi to put all of the config file into their places.

```sh
chezmoi apply
```
