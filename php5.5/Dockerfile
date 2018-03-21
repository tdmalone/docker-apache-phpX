
FROM ubuntu:14.04

LABEL maintainer="tdmalone@gmail.com"

RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
      apache2=2.4.7-1ubuntu4.18 \
      php5=5.5.9+dfsg-1ubuntu4.24 \
      php5-cli=5.5.9+dfsg-1ubuntu4.24 \
      libapache2-mod-php5=5.5.9+dfsg-1ubuntu4.24 \
      php5-gd=5.5.9+dfsg-1ubuntu4.24 \
      php5-mysql=5.5.9+dfsg-1ubuntu4.24 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run && \
    a2enmod rewrite

EXPOSE 80

VOLUME ["/var/www"]
CMD ["/usr/local/bin/run"]
