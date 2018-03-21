# Docker, Apache and PHP 5.6

Quick start:

    $ PHP_VERSION=5.6
    $ WEB_ROOT=/path/to/your/web/root
    $ HOST_PORT=8080

    $ git clone https://github.com/tdmalone/docker-apache-phpX.git
    $ docker build --tag php${PHP_VERSION} docker-apache-phpX/php${PHP_VERSION}
    $ docker run --rm --detach --publish ${HOST_PORT}:80 --volume ${WEB_ROOT}:/var/www --name php${PHP_VERSION} php${PHP_VERSION}

Then visit http://localhost:8080.

If you set your web root to the folder that docker-apache-phpX was cloned into (eg. by running `WEB_ROOT=$PWD`), then you can visit http://localhost:8080/docker-apache-phpX/phpinfo.php to prove that you're running PHP 5.6.

When you've finished, you can clean up by running:

    $ docker stop php${PHP_VERSION}

## More info

See the [root README for this repo](https://github.com/tdmalone/docker-apache-phpX#README).
