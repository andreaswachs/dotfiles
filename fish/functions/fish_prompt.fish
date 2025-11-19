function fish_prompt --description 'Write out the prompt'
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l purple (set_color c645f5)
    set -l yellow (set_color ffea05)
    set -l kube_color (set_color blue)
    set -l prompt_status ""

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Color the prompt differently when we're root
    set -l suffix "\$"
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    # Color the prompt in red on error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color "[" $last_status "]" $normal
    end

    # Get the name of the current folder we're in
    set -l cwd (pwd | rev | cut -d '/' -f 1 | rev)

    set -l kube_context (yq eval '.current-context' ~/.kube/config)
    if echo $kube_context | grep 0north >/dev/null
        set kube_context (echo $kube_context | cut -f 2 -d '/')
    end

    # echo -s (prompt_login) ' ' $cwd_color ' '  $prompt_status 
    echo -n -s $cwd_color '📂 ' $cwd ' ' $normal

    echo -n -s $kube_color "⛴️ ($kube_context) "
    # toml-cli set ~/.config/alacritty/alacritty.toml window.title "$(fortune -n 80 | tr '\n' ' ')" > /dev/null 2>&1 &

    if ls | grep -E ".*\.tf\$" >/dev/null
        echo -n -s $purple '😈 ' (tofu workspace show || echo "no workspace selected") $normal
    end

    # Check to see if the $AWS_VAULT is non-empty
    if test -n "$AWS_VAULT"
        echo -n -s $normal " ☁️ " (set_color yellow) $AWS_VAULT $normal
    end

    set -l prompt (string shorten -c '..)' -m 30 (fish_vcs_prompt))
    set prompt (string trim -l $prompt)

    if test -n "$prompt"
        echo -n -s ' ' $yellow $prompt $normal
    end

    printf "\n$status_color\$ "
end

set -g __KUBE_PROMPT_DIR "~/.config/fish/resources"
set -g __KUBE_PROMPT_FILE "$__KUBE_PROMPT_DIR/kube_prompt"

# function fish_right_prompt -d "Write out the right prompt"
#     tput sc; tput cuu1; tput cuf 2

#     if test -n "$CMD_DURATION" -a "$CMD_DURATION" -ne 0
#         set -l duration_seconds (math "$CMD_DURATION / 1000")
#         set -l duration_minutes (math "$duration_seconds / 60")
#         if test $CMD_DURATION -lt 1000
#             printf "⏱️ %d ms | " $CMD_DURATION
#         else if test $duration_seconds -lt 60
#             printf "⏱️ %.01f sec | " $duration_seconds
#         else
#             printf "⏱️ %.01f min | " $duration_minutes
#         end
#     end

#     date '+%m/%d/%y %H:%M:%S'

#     tput rc
# end
