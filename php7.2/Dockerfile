
FROM ubuntu:17.10

LABEL maintainer="tdmalone@gmail.com"

# @see https://ayesh.me/Ubuntu-PHP-7.2
# @see https://askubuntu.com/a/493467/421637
# @see https://askubuntu.com/a/490910/421637
RUN apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
      software-properties-common=0.96.24.17 && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install --assume-yes --no-install-recommends \
      apache2=2.4.27-2ubuntu3 \
      php7.2=7.2.3-1+ubuntu17.10.1+deb.sury.org+1 \
      php7.2-cli=7.2.3-1+ubuntu17.10.1+deb.sury.org+1 \
      libapache2-mod-php7.2=7.2.3-1+ubuntu17.10.1+deb.sury.org+1 \
      php7.2-gd=7.2.3-1+ubuntu17.10.1+deb.sury.org+1 \
      php7.2-mysql=7.2.3-1+ubuntu17.10.1+deb.sury.org+1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY run.sh /usr/local/bin/run

RUN chmod +x /usr/local/bin/run && \
    a2enmod rewrite

EXPOSE 80

VOLUME ["/var/www"]
CMD ["/usr/local/bin/run"]
