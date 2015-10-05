FROM ubuntu:14.04

MAINTAINER Pavel Paulau <Pavel.Paulau@gmail.com>

EXPOSE 80

# Install core dependencies
RUN apt-get update && apt-get install -y wget

# Install latest stable nginx
RUN wget http://nginx.org/keys/nginx_signing.key
RUN apt-key add nginx_signing.key
RUN echo "deb http://nginx.org/packages/ubuntu/ trusty nginx\ndeb-src http://nginx.org/packages/ubuntu/ trusty nginx" > /etc/apt/sources.list.d/nginx.list
RUN apt-get update && apt-get install -y nginx

# Add configuration files
ADD nginx.conf /etc/nginx/nginx.conf
ADD app /var/www/app

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
