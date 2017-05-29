FROM ubuntu:16.04

RUN apt-get update && apt-get install -y\
  software-properties-common\
  language-pack-en-base &&\
  export LC_ALL=en_US.UTF-8 &&\
  export LANG=en_US.UTF-8 &&\
  LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php &&\
  apt-get update && apt-get upgrade -yqq &&\
  apt-get install -yqq --no-install-recommends\
  apache2\
  apache2-utils\
  php5.6\
  php5.6-cli\
  php5.6-gd\
  php5.6-json\
  php5.6-mysql\
  php5.6-curl\
  php5.6-xml\
  php5.6-mbstring\
  php-xdebug\
  vim\
  && rm -rf /var/lib/apt/lists/* &&\
  a2enmod rewrite

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]

