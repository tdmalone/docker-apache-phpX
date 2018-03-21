# Docker, Apache and PHPx

Dockerfiles for running (almost) every minor version of PHP, with Apache.

Based on [work](https://github.com/bylexus/docker-apache-php53) originally by [Alexander Schenkel](https://github.com/bylexus).

PHP versions available:
* [PHP 5.3](php5.3/) (Ubuntu 12.04 LTS Precise)
* [PHP 5.4](php5.4/) (Ubuntu 13.04 Raring)
* [PHP 5.5](php5.5/) (Ubuntu 14.04 LTS Trusty)
* [PHP 5.6](php5.6/) (Ubuntu 15.10 Wily)
* [PHP 7.0](php7.0/) (Ubuntu 16.04 LTS Xenial)
* [PHP 7.1](php7.1/) (Ubuntu 17.10 Artful)
* [PHP 7.2](php7.2/) (Ubuntu 17.10 Artful)

PHP versions maybe coming soon:
* PHP 5.2

## Why?

Because sometimes, you have to work with old software, and it's not immediately straightforward to figure out how to on newer systems!

I put these together primarily as a tool to help me at work, where we're frequently upgrading old versions of WordPress and plugins that won't (yet) work on newer versions of PHP.

## Usage

Currently you need to build these images yourself, but Docker Hub builds are coming shortly.

Here's an easy way to build and start a PHP 5.3 container, for example:

    $ PHP_VERSION=5.3
    $ WEB_ROOT=/path/to/your/web/root
    $ HOST_PORT=8080

    $ git clone https://github.com/tdmalone/docker-apache-phpX.git
    $ docker build --tag php${PHP_VERSION} docker-apache-phpX/php${PHP_VERSION}
    $ docker run --rm --detach --publish ${HOST_PORT}:80 --volume ${WEB_ROOT}:/var/www --name php${PHP_VERSION} php${PHP_VERSION}

This example will start a PHP 5.3 container named `php5.3`, on http://localhost:8080, starting from your web root.

If you set your web root to the folder that docker-apache-phpX was cloned into (eg. by running `WEB_ROOT=$PWD`), then you can visit http://localhost:8080/docker-apache-phpX/phpinfo.php to prove that you're running the PHP version you chose.

When you've finished, you can clean up by running:

    $ docker stop php${PHP_VERSION}

## TODO

* Make files writable by the web server
* Increase the PHP upload limit to something much larger than the default
* Make error logs available somewhere easy
* Further documentation

## Development

Ubuntu has been chosen for these Dockerfiles for its ease-of-use and large, well maintained package repository. Wherever possible, LTS releases are used for increased stability.

To assist in creating new images or debugging current ones, you may find these links helpful:

* The [Ubuntu releases list](https://wiki.ubuntu.com/Releases)
* Details on eg. specific [PHP5 versions in Trusty](https://launchpad.net/ubuntu/trusty/+source/php5) or [PHP7 versions in Xenial](https://launchpad.net/ubuntu/xenial/+source/php7.0) (just change the release names and version numbers in the URLs for other combinations)
* If particular versions aren't available, they may be in an [alternative repository](https://launchpad.net/~ondrej/+archive/ubuntu/php/) (see [this workaround](https://github.com/tdmalone/docker-apache-phpX/blob/master/php7.2/Dockerfile#L13-L16) for adding)
* If a version of Ubuntu is out of support, you may need to [change the APT sources list](https://askubuntu.com/a/91821/421637)
* Package versions for APT are pinned as [recommended by Hadolint](https://github.com/hadolint/hadolint/wiki/DL3008) - this is done by first building unpinned, and determining from that which versions are selected

To debug an image, swap `--detach` with `--interactive --tty` and add `bash` to the end, like this:

    $ docker run --rm --interactive --tty --publish ${HOST_PORT}:80 --volume ${WEB_ROOT}:/var/www --name php${PHP_VERSION} php${PHP_VERSION} bash

Then run `run` to simulate what would have happened if you started the container detached.

## License

[MIT](LICENSE).
