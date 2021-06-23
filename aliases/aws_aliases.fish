# secretsmanager
alias awspw="aws secretsmanager get-random-password --exclude-punctuation"
abbr -a -g asmgsv aws secretsmanager get-secret-value --query SecretString --output text --secret-id
abbr -a -g asmls aws secretsmanager list-secrets
abbr -a -g asm aws secretsmanager

# s3
abbr -a -g as3 aws s3
abbr -a -g as3l aws s3 ls
abbr -a -g as3p aws s3 presign

# ec2 instance metadata
abbr -a -g ec2 http --body http://169.254.169.265/latest
abbr -a -g ec2m http --body http://169.254.169.265/latest/meta-data
abbr -a -g ec2u http --body http://169.254.169.265/latest/user-data
abbr -a -g ec2d http --body http://169.254.169.265/latest/dynamic

# cloudformation
abbr -a -g acf aws cloudformation