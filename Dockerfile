FROM kitpages/symfony
MAINTAINER Kitpages <system@kitpages.fr>

RUN apt-get -qqq update && DEBIAN_FRONTEND=noninteractive apt-get install -qqq -y \
        make \
        git \
        php5-gd \
        php5-mysql \
        php5-xmlrpc \
        php-soap \
        php5-curl \
        php5-mcrypt \
        php5-json \
        php5-mongo \
        imagemagick \
        libpng12-0 \
        libpng12-dev \
        libjpeg62-turbo \
        libjpeg62-turbo-dev \
        wkhtmltopdf \
        xvfb && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN chgrp www-data -R /tmp && chmod g+rwx -R /tmp
