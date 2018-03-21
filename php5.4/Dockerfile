
FROM ubuntu:13.04

LABEL maintainer="tdmalone@gmail.com"

# @see https://askubuntu.com/a/91821/421637
RUN sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
      apache2=2.2.22-6ubuntu5.1 \
      php5=5.4.9-4ubuntu2.4 \
      php5-cli=5.4.9-4ubuntu2.4 \
      libapache2-mod-php5=5.4.9-4ubuntu2.4 \
      php5-gd=5.4.9-4ubuntu2.4 \
      php5-mysql=5.4.9-4ubuntu2.4 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run && \
    a2enmod rewrite

EXPOSE 80

VOLUME ["/var/www"]
CMD ["/usr/local/bin/run"]
