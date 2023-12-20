if not status is-login
    return
end

# bootstrap Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# Not using universal variables due to:
# https://fishshell.com/docs/current/faq.html#why-doesn-t-set-ux-exported-universal-variables-seem-to-work

# define general environment vars
set -gx EDITOR nvim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LESS -FiMR -j.5 --incsearch

# system-wide tools vars
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
set -gx ANDROID_HOME ~/Library/Android/sdk
set -gx PNPM_HOME ~/.pnpm-home

# $PATH setup
set -l paths \
    $ANDROID_HOME \
    $ANDROID_HOME/emulator \
    $ANDROID_HOME/tools \
    $ANDROID_HOME/tools-bin \
    $ANDROID_HOME/platform-tools \
    $PNPM_HOME \
    ~/.cargo/bin \
    ~/.local/bin

for path in $paths
    fish_add_path $path
end

# direnv
direnv hook fish | source

# version managers
source (nodenv init -|psub)
rbenv init - | source

