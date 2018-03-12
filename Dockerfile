FROM richarvey/nginx-php-fpm:latest

MAINTAINER phprush "jjy0712@163.com"

RUN docker-php-ext-install phalcon

RUN echo 'date.timezone = "Asia/Shanghai"' > /usr/local/etc/php/conf.d/docker-vars.ini

ADD . /var/www/website/

ADD ./deploy/nginx-phalcon.conf /etc/nginx/conf.d/default.conf

CMD ["/start.sh"]

