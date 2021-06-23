#!/usr/bin/env bash

# create key
aws kms create-key --description "My Master Key"

# alias
aws kms create-alias --target-key-id {id} --alias-name "alias/jonas"

# encrypt
aws kms encrypt --key-id {id} --plaintext "Hello World" --output text --query CiphertextBlob | base64 --decode > output.dat

# decrypt
aws kms decrypt --ciphertext-blob fileb://output.dat --query Plaintext --output text

# update alias
aws kms update-alias --alias-name alias/{alias} --target-key-id {id}

------------------

# create data key (envelope encryption)
aws kms generate-data-key --key-id alias/jonas --key-spec AES_256 > data_key.json

# ciphertextblob decode64
sed -nr 's/^.*"CiphertextBlob":\s*"(.*?)".*$/\1/p' data_key.json | openssl base64 -d > ciphertext_blob_decoded

# plaintext decode64
sed -nr 's/^.*"Plaintext":\s*"(.*?)".*$/\1/p' data_key.json | openssl base64 -d > plaintext_key_decoded

# rm data key
shred --iterations=100 --remove=wipesync --zero data_key.json

# encrypt
echo "Hello World" > decrypted_data.txt
openssl enc -aes-256-cbc -md sha512 -pbkdf2 -iter 100000 -salt -kfile plaintext_key_decoded -in decrypted_data.txt -out encrypted_data.txt

# rm plaintext decoded key
shred --iterations=100 --remove=wipesync --zero plaintext_key_decoded

# rm decrypted data
shred --iterations=100 --remove=wipesync --zero decrypted_data.txt

# kms decrypt
aws kms decrypt --ciphertext-blob fileb://ciphertext_blob_decoded --query 'Plaintext' --output text | openssl base64 -d -out plaintext_key_decoded

# openssl decrypt
openssl enc -d -aes-256-cbc -md sha512 -pbkdf2 -iter 100000 -salt -kfile plaintext_key_decoded -in encrypted_data.txt -out decrypted_data.txt

# decrypted
cat decrypted_data.txt

openssl - https://askubuntu.com/a/1126882
