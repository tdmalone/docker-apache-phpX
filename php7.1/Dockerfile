
FROM ubuntu:17.10

LABEL maintainer="tdmalone@gmail.com"

RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
      apache2=2.4.27-2ubuntu3 \
      php7.1=7.1.15-0ubuntu0.17.10.1 \
      php7.1-cli=7.1.15-0ubuntu0.17.10.1 \
      libapache2-mod-php7.1=7.1.15-0ubuntu0.17.10.1 \
      php7.1-gd=7.1.15-0ubuntu0.17.10.1 \
      php7.1-mysql=7.1.15-0ubuntu0.17.10.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run && \
    a2enmod rewrite

EXPOSE 80

VOLUME ["/var/www"]
CMD ["/usr/local/bin/run"]
