#!/bin/sh

#Config xray (Trojan)

rm -rf /etc/xray/config.json
cat << EOF > /etc/xray/config.json
{
  "inbounds": [
    {
      "port": $PORT,
      "protocol": "trojan",
      "settings": {
        "password": "$PASSWORD"
      },
      "streamSettings": {
        "network": "$NETWORK"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

#run xray server

xray -c /etc/xray/config.json
