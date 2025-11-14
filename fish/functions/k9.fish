function k9
    set -l context (list_kube_contexts | fzf --reverse)

    k9s --context $context
end
