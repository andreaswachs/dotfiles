function list_kube_contexts
    yq '.contexts[].name' ~/.kube/config
end
