#!/bin/bash
# usage: ./set-canary.sh <percent to canary>   e.g. 10, 50, 100, 0
P=$1
S=$((100-P))
line() { if [ "$2" -eq 0 ]; then echo "server $1:8080 down;"; else echo "server $1:8080 weight=$2;"; fi; }
CONF="events {}
http {
  upstream app {
    $(line stable $S)
    $(line canary $P)
  }
  server { listen 80; location / { proxy_pass http://app; } }
}"
echo "$CONF" | docker exec -i nginx sh -c 'cat > /etc/nginx/nginx.conf'
docker exec nginx nginx -s reload