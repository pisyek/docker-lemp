FROM nginx:1.17.6

RUN apt update -y && apt install -y nginx-extras

COPY ./nginx.conf /etc/nginx/nginx.conf