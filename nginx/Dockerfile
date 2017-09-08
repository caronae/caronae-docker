FROM nginx:alpine

ADD nginx.conf /etc/nginx/

ARG PHP_BACKEND_CONTAINER=caronae-backend
ARG PHP_UFRJ_CONTAINER=caronae-ufrj-authentication
ARG PHP_UPSTREAM_PORT=9000

RUN adduser -D -H -u 1000 -s /bin/bash www-data

# Set upstream conf and remove the default conf
RUN echo "upstream php-backend-upstream { server ${PHP_BACKEND_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf
RUN echo "upstream php-ufrj-upstream { server ${PHP_UFRJ_CONTAINER}:${PHP_UPSTREAM_PORT}; }" >> /etc/nginx/conf.d/upstream.conf
RUN rm /etc/nginx/conf.d/default.conf

CMD ["nginx"]

EXPOSE 80 81 443
