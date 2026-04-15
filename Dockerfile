FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY site/ /var/www/hdy/

EXPOSE 8088
