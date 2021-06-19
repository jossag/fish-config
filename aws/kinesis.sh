# produce
aws kinesis put-record --stream-name {name} --partition-key {key} --data "my data" --cli-binary-format raw-in-base64-out

# list 
aws kinesis describe-stream --stream-name {name}

# get iterator
aws kinesis get-shard-iterator --stream-name {name} --shard-id {id} --shard-iterator-type TRIM_HORIZON

# consume
aws kinesis get-records --shard-iterator {iterator-id}
