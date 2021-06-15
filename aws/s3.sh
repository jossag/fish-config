# mb
aws s3 mb s3://BUCKET --region REGION

# rb
aws s3 rb s3://BUCKET --region REGION
aws s3 rb s3://BUCKET --region REGION --force
aws s3api delete-bucket --bucket BUCKET --region REGION

# ls
aws s3 ls
aws s3 ls s3://BUCKET --region REGION
aws s3 ls s3://BUCKET --recursive --region REGION
aws s3 ls s3://BUCKET --recursive --human-readable --summarize --region REGION

# cp
aws s3 cp local-file s3://mytechmint
aws s3 cp /local/dir/data s3://BUCKET --recursive
aws s3 cp s3://BUCKET/getdata.php /local/dir/data
aws s3 cp s3://BUCKET/ /local/dir/data --recursive
aws s3 cp s3://BUCKET/init.xml s3://backup-bucket
aws s3 cp s3://BUCKET s3://backup-bucket --recursive

# bucket website
aws s3 website s3://bucket/ --index-document index.html --error-document error.html

# local dir to remote bucket sync
aws s3 sync --dryrun --region REGION --delete /path/to/files/ s3://BUCKET_NAME/path/to/dest

# local dir to remote bucket copy with gzip content encoding header
aws s3 cp --dryrun --region REGION --recursive --content-encoding 'gzip' /path/to/files/ s3://BUCKET_NAME/path/to/dest

# remote to remote bucket copy
aws s3 cp --dryrun --region REGION --recursive s3://BUCKET_NAME_SOURCE/path/to/source s3://BUCKET_NAME_TARGET/path/to/dest

# cors
aws s3api put-bucket-cors --bucket BUCKET --cors-configuration file://cors.json

# public acl
aws s3api put-bucket-acl --bucket BUCKET --acl public-read

# tag
aws s3api put-bucket-tagging --bucket BUCKET --tagging TagSet=[{Key=FOO,Value=BAR}]

# enable mfa delete
aws s3api put-bucket-versioning --bucket <bucket> --versioning-configuration Status=Enabled,MFADelete=Enabled --mfa "<mfa-arn> <mfa-code>"

# disable mfa delete
aws s3api put-bucket-versioning --bucket <bucket> --versioning-configuration Status=Enabled,MFADelete=Disabled -mfa "<mfa-arn> <mfa-code>"

# presign (1h)
aws s3 presign <bucket> --region <region> --expires-in 3600