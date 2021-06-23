#!/usr/bin/env bash

# create lambda layer
aws lambda publish-layer-version --layer-name {layer_name} --description "Description" --license-info "MIT" --content S3Bucket={bucket},S3Key=layer.zip --compatible-runtimes python3.6 python3.7 python3.8

# create function
aws lambda create-function --function-name {lambda_function_name} --zip-file fileb://{lambda_zip} --handler submit_live_job.handler --runtime python3.8 --role {lambda_role_arn} --layers {lambda_layer_version_arn} --tags KEY=VALUE

# test function
aws lambda invoke --function-name {lambda_function_name} --payload file:///lambda-test.json lambda-test.log --cli-binary-format raw-in-base64-out
cat lambda-test.log

# delete function
aws lambda delete-function --function-name {lambda_function_name}
