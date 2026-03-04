# sensitive environment variables
if test -f ~/.config/fish/env.fish
    source ~/.config/fish/env.fish
end
# --- Environment Variables ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx BROWSER zen-browser
set -gx PAGER less
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

#doom emacs 
set -gx PATH $HOME/.config/emacs/bin $PATH

#python
set -gx PATH ~/Library/Python/3.9/bin $PATH
# Flutter
set -Ux PATH $HOME/Developer/flutter/bin $PATH
# Android SDK
set -Ux ANDROID_HOME $HOME/Library/Android/sdk
set -Ux ANDROID_SDK_ROOT $ANDROID_HOME
# Java
set -Ux JAVA_HOME (/usr/libexec/java_home -v 17)
set -Ux PATH $JAVA_HOME/bin $PATH
# Android tools
set -Ux PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH
set -Ux PATH $ANDROID_HOME/platform-tools $PATH
set -Ux PATH $ANDROID_HOME/emulator $PATH
# Ruby and Gems
set -gx PATH /opt/homebrew/opt/ruby/bin $PATH
set -gx PATH /opt/homebrew/lib/ruby/gems/3.4.0/bin $PATH

# --- User binaries ---
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin

# --- pnpm ---
# NOTE: pnpm self-managed shims directory (latest practice - no global PREFIX override)
set -gx PNPM_HOME ~/.local/share/pnpm
set -gx PATH $PNPM_HOME $PATH

starship init fish | source

zoxide init fish | source

carapace _carapace fish | source

set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS \
  --color=bg:#080808 \
  --color=bg+:#262626 \
  --color=border:#2e2e2e \
  --color=fg:#b2b2b2 \
  --color=fg+:#e4e4e4 \
  --color=gutter:#262626 \
  --color=header:#80a0ff \
  --color=hl+:#f09479 \
  --color=hl:#f09479 \
  --color=info:#cfcfb0 \
  --color=marker:#f09479 \
  --color=pointer:#ff5189 \
  --color=prompt:#80a0ff \
  --color=spinner:#36c692"

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# --- Aliases ---
alias md='mkdir -p'
function mdz
    mkdir -p $argv
    and cd $argv[1]
end
function zl
    z $argv
    and ls
end
alias v='nvim'
alias oc='opencode'
alias c='clear'
alias ls="eza -al --color=always --group-directories-first --icons"
alias lst="eza -al --color=always --group-directories-first --icons --tree"
alias so="source ~/.config/fish/config.fish"
alias metro='dart run nylo_framework:main'
alias afkon='sudo pmset -a disablesleep 1'
alias afkoff='sudo pmset -a disablesleep 0'

# --- Greeting ---
set fish_greeting # Disable default Fish greeting
fish_default_key_bindings
