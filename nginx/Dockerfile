FROM nginx:latest

RUN mkdir -p /etc/nginx/templates \
    mkdir -p /tmp/nginx

COPY nginx.conf /etc/nginx/
COPY react.conf /etc/nginx/conf.d/
COPY templates/* /etc/nginx/templates/
COPY html/index.html.template /tmp/nginx/

RUN envsubst < /tmp/nginx/index.html.template > /usr/share/nginx/html/index.html; \
    rm -fR /tmp/nginx

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
