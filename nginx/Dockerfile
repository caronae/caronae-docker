FROM nginx:alpine

ADD nginx.conf /etc/nginx/
ADD ssl.conf /etc/nginx/snippets/

ARG ENABLE_UFRJ_AUTHENTICATION=false
ARG ENABLE_SSL=false

RUN adduser -D -H -u 1000 -s /bin/bash www-data

RUN rm /etc/nginx/conf.d/default.conf

COPY sites/ /etc/nginx/sites-available/

RUN if [ "$ENABLE_UFRJ_AUTHENTICATION" != "true" ]; then\
	rm /etc/nginx/sites-available/ufrj.conf; \
fi

RUN if [ "$ENABLE_SSL" != "true" ]; then\
	rm /etc/nginx/sites-available/ssl_proxy.conf; \
fi 

CMD ["nginx"]

EXPOSE 8000 8001 80 443