FROM nginx:alpine AS nginx_builder

# nginx:alpine contains NGINX_VERSION environment variable, like so:
# ENV NGINX_VERSION 1.15.0

# headers-more-nginx-module version
ENV HEADERS_MORE_VERSION 0.33

# Download sources
RUN wget "https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" -O nginx.tar.gz && \
    wget "https://github.com/openresty/headers-more-nginx-module/archive/v${HEADERS_MORE_VERSION}.tar.gz" -O headers-more.tar.gz

# For latest build deps, see https://github.com/nginxinc/docker-nginx/blob/master/mainline/alpine/Dockerfile
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    make \
    openssl-dev \
    pcre-dev \
    zlib-dev \
    linux-headers \
    libxslt-dev \
    gd-dev \
    geoip-dev \
    perl-dev \
    libedit-dev \
    mercurial \
    bash \
    alpine-sdk \
    findutils

# Reuse same cli arguments as the nginx:alpine image used to build
RUN CONFARGS=$(nginx -V 2>&1 | sed -n -e 's/^.*arguments: //p') \
	mkdir /usr/src && \
    tar -zxC /usr/src -f nginx.tar.gz && \
    tar -xzvf "headers-more.tar.gz" && \
    HEADERSMOREDIR="$(pwd)/headers-more-nginx-module-${HEADERS_MORE_VERSION}" && \
    cd /usr/src/nginx-$NGINX_VERSION && \
    ./configure --with-compat $CONFARGS --add-dynamic-module=$HEADERSMOREDIR && \
    make && make install

FROM nginx:alpine

# Extract the dynamic module headers more from the nginx_builder image
COPY --from=nginx_builder /usr/local/nginx/modules/ngx_http_headers_more_filter_module.so /etc/nginx/modules/ngx_http_headers_more_filter_module.so

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]