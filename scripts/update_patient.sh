API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/patients"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "patient": {
        "first_name": "'"${FNAME}"'",
      "last_name": "'"${LNAME}"'"
    }
  }'
