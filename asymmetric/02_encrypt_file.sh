source ../utils.sh
set -e
cyan Our base file:
hexdump -C secret_message.txt

cyan Convert RSA format to PEM
openssl rsa -in id_rsa -outform pem >id_rsa.pem
openssl rsa -in id_rsa -pubout -outform pem >id_rsa.pub.pem

cyan Create a 256-bit random key
openssl rand -base64 32 > key.bin

hexdump -C key.bin

# Encrypt the key using RSA
openssl rsautl -encrypt -inkey id_rsa.pub.pem -pubin -in key.bin -out key.bin.enc

cyan Encrypted random key:
hexdump -C key.bin.enc

# Encrypt the file itself using AES
openssl enc -aes-256-cbc -salt -in secret_message.txt -out secret_message.enc -pass file:./key.bin

cyan Encrypted file:
hexdump -C secret_message.enc
