alias aws-pw="aws secretsmanager get-random-password --exclude-punctuation"
abbr -a -g asmgsv aws secretsmanager get-secret-value --query SecretString --output text --secret-id
abbr -a -g asmls aws secretsmanager list-secrets
abbr -a -g asm aws secretsmanager
abbr -a -g as3 aws s3