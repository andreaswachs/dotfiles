fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/go/bin
fish_add_path /Users/andreas/go/bin
fish_add_path /Users/andreas/opt/bin
fish_add_path /Users/andreas/.local/bin
fish_add_path /Users/andreas/.orbstack/bin
fish_add_path /Users/andreas/.tofuenv/bin

launchctl setenv SSH_AUTH_SOCKET "/Users/andreas/.bitwarden-ssh-agent.sock"
set -gx SSH_AUTH_SOCKET "/Users/andreas/.bitwarden-ssh-agent.sock"
launchctl setenv SSH_AUTH_SOCK "/Users/andreas/.bitwarden-ssh-agent.sock"
set -gx SSH_AUTH_SOCK "/Users/andreas/.bitwarden-ssh-agent.sock"
# set -gx SSH_AUTH_SOCK /Users/andreas/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock

set -gx OPENAI_API_KEY empty
set -gx RUBY_VERSION "3.3.4"

set -gx GPG_TTY fish -c tty
# set -gx GOPRIVATE "github.com/<ORG>/*"

set -gx KUBE_EDITOR hx
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
    abbr av aws-vault

    abbr ghostty_conf "$HOME/Library/Application\ Support/com.mitchellh.ghostty/config"
    set -U fish_greeting ""

    fzf --fish | source
end
