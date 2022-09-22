FROM alpine:latest

RUN apk add --update --no-cache nginx
RUN apk add nginx-debug

COPY nginx.conf /etc/nginx/
COPY symfony.conf /etc/nginx/conf.d/
COPY react.conf /etc/nginx/conf.d/

RUN echo "upstream php-upstream { server symfony:9001; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser -D -g '' -G www-data www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
