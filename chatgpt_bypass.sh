#!/bin/sh

echo "\n[+] Input": $1
echo "\n[+] Output:" 

curl=`cat <<EOS
curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
     "model": "gpt-4",
     "messages": [{"role": "user", "content": "$1"}],
     "max_tokens": 4000,
     "temperature": 1.0
   }' \
--insecure | jq -r '.choices[]'.message.content
EOS`

eval ${curl}
