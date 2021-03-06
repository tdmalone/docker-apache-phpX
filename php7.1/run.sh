#!/usr/bin/env bash

# Safer bash scripts.
set -eo pipefail

PHP_ERROR_REPORTING=${PHP_ERROR_REPORTING:-"E_ALL & ~E_DEPRECATED & ~E_NOTICE"}
sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php/7.1/apache2/php.ini
sed -ri 's/^display_errors\s*=\s*Off/display_errors = On/g' /etc/php/7.1/cli/php.ini
sed -ri "s/^error_reporting\\s*=.*$//g" /etc/php/7.1/apache2/php.ini
sed -ri "s/^error_reporting\\s*=.*$//g" /etc/php/7.1/cli/php.ini
echo "error_reporting = $PHP_ERROR_REPORTING" >> /etc/php/7.1/apache2/php.ini
echo "error_reporting = $PHP_ERROR_REPORTING" >> /etc/php/7.1/cli/php.ini

source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND
