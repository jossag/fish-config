# create role
aws iam create-role --role-name {role_name} --assume-role-policy-document file://{trust_policy_json} --tags {tag}

# create policy
aws iam create-policy --policy-name {policy_name} --policy-document file://{policy_json} --tags {tag}

# attached managed policy to role
aws iam attach-role-policy --role-name {role_name} --policy-arn {policy_arn}

# detatch role policy
aws iam detach-role-policy --role-name {role_name} --policy-arn {policy_arn}

# delete policy
aws iam delete-policy --policy-arn {policy_arn}

# delete role
aws iam delete-role --role-name {role_name}

# deny all on user
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AWSDenyAll --user-name {user}
