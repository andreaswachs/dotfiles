function aws_assume_role
    # Assumes a role with AWS

    set -l role_name "wachs-is-cooking"
    set -l duration_seconds "3600"
    
    if test (count $argv) -eq 0
        echo "Usage: aws_assume_role ROLE_ARN [ROLE_SESSION_NAME] [DURATION_SECS]"
    end

    if test (count $argv) -eq 2
        set role_name $argv[2]
    end

    if test (count $argv) -eq 3
        set duration_seconds $argv[3]
    end

    if test "$AWS_VAULT" = ""
        echo "You need to be logged into an AWS session using `av`"
    end

    set -gx AWS_TEMP_CREDS (aws sts assume-role \
        --role-arn $argv[1] \
        --role-session-name "$role_name" \
        --duration-seconds "$duration_seconds" \
        --output json)
    and set -gx AWS_ACCESS_KEY_ID (echo $AWS_TEMP_CREDS | jq -r .Credentials.AccessKeyId)
    and set -gx AWS_SECRET_ACCESS_KEY (echo $AWS_TEMP_CREDS | jq -r .Credentials.SecretAccessKey)
    and set -gx AWS_SESSION_TOKEN (echo $AWS_TEMP_CREDS | jq -r .Credentials.SessionToken)
end
