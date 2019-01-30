set -x
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt

{ set +x; } &>/dev/null

source ../../utils.sh

cyan Inspecting newly signed certificate

set -x
openssl x509 -in server.crt -noout -text
