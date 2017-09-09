FROM nginx:alpine

ADD nginx.conf /etc/nginx/
ADD ssl.conf /etc/nginx/snippets/

ARG PHP_BACKEND_CONTAINER=caronae-backend
ARG PHP_UFRJ_CONTAINER=caronae-ufrj-authentication
ARG PHP_UPSTREAM_PORT=9000
ARG ENABLE_SSL=false

RUN adduser -D -H -u 1000 -s /bin/bash www-data

RUN echo "upstream php-backend-upstream { server ${PHP_BACKEND_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf

RUN echo "upstream php-ufrj-upstream { server ${PHP_UFRJ_CONTAINER}:${PHP_UPSTREAM_PORT}; }" >> /etc/nginx/conf.d/upstream.conf

RUN rm /etc/nginx/conf.d/default.conf

COPY sites/ /etc/nginx/sites-available/
RUN if [ "$ENABLE_SSL" != "true" ]; then rm /etc/nginx/sites-available/ssl_proxy.conf; fi 

CMD ["nginx"]

EXPOSE 8000 8001 80 443