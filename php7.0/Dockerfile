
FROM ubuntu:16.04

LABEL maintainer="tdmalone@gmail.com"

RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
      apache2=2.4.18-2ubuntu3.5 \
      php7.0=7.0.28-0ubuntu0.16.04.1 \
      php-cli=1:7.0+35ubuntu6.1 \
      libapache2-mod-php7.0=7.0.28-0ubuntu0.16.04.1 \
      php-gd=1:7.0+35ubuntu6.1 \
      php-mysql=1:7.0+35ubuntu6.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run && \
    a2enmod rewrite

EXPOSE 80

VOLUME ["/var/www"]
CMD ["/usr/local/bin/run"]
