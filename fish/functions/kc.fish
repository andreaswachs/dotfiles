function kc
    yq '.contexts[].name' ~/.kube/config | fzf --reverse | xargs -n1 kubectx
end
