function av
    aws-vault list | tail -n +3 | awk '{ print $1 }'
end
