FROM alpine:3.8

MAINTAINER Vincent Composieux <vincent.composieux@gmail.com>

RUN apk add --update --no-cache nginx

COPY nginx.conf /etc/nginx/
COPY sentimento.conf /etc/nginx/conf.d/

RUN echo "upstream php-upstream { server symfony:9001; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser -D -g '' -G www-data www-data

CMD ["nginx"]


EXPOSE 80
EXPOSE 443