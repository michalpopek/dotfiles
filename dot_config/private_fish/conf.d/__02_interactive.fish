if not status is-interactive
    return
end

# turn off welcome greeting
set -gx fish_greeting ''

# tools configuration
set -gx EDITOR code --wait
set -gx BAT_THEME ansi

# initialize zoxide
zoxide init fish | source

# abbreviations
abbr -a g git
abbr -a ll eza -alh
abbr -a p pnpm
abbr -a y yarn
abbr -a ya yarn add
abbr -a yb yarn build
abbr -a yg yarn global
abbr -a yst yarn start
abbr -a yt yarn test
abbr -a yui yarn upgrade-interactive
