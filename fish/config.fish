fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
# fish_add_path /opt/homebrew/opt/gnu-sed/libexec/gnubin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/go/bin
fish_add_path /Users/andreaswachs/go/bin
fish_add_path /Users/andreaswachs/Library/Python/3.9/bin
fish_add_path /Users/andreaswachs/opt/bin
fish_add_path /Users/andreaswachs/.asdf/shims
fish_add_path /Users/andreaswachs/.local/bin
fish_add_path /opt/homebrew/opt/ruby/bin
fish_add_path ~/.istioctl/bin
fish_add_path /opt/homebrew/opt/postgresql@16/bin
fish_add_path ~/.config/emacs/bin
fish_add_path /opt/homebrew/opt/dotnet@8/bin
fish_add_path /Users/andreaswachs/.orbstack/bin
fish_add_path /Users/andreaswachs/opt/llama.cpp/build/bin
fish_add_path ~/.krew/bin

set -gx OPENAI_API_KEY empty
set -gx RUBY_VERSION "3.3.4"

set -gx GPG_TTY fish -c tty
set -gx GOPRIVATE "github.com/<ORG>/*"

set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set -gx KUBE_EDITOR nvim
set -gx EDITOR hx

alias vi nvim
alias vim nvim

set -gx fish_cursor_unknown block

if status is-interactive
    # Commands to run in interactive sessions can go here

    abbr l lazygit
    abbr k kubectl
    abbr kns kubens
    abbr tf terraform
    abbr e emacs
    abbr a aws
    abbr c cursor
    abbr ca cursor-agent

    abbr ghostty_conf "$HOME/Library/Application\ Support/com.mitchellh.ghostty/config"

    abbr br bin/rails

    set -U fish_greeting ""

    fzf --fish | source
end
