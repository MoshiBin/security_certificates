openssl rsautl -decrypt -inkey id_rsa.pem -in key.bin.enc -out key.bin
openssl enc -d -aes-256-cbc -in secret_message.enc -out secret_message.txt -pass file:./key.bin
