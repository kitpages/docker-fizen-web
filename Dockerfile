FROM kibatic/symfony:7.2
MAINTAINER Kitpages <system@kibatic.com>

RUN apt-get -qqq update && DEBIAN_FRONTEND=noninteractive apt-get install -qqq -y \
		vim \
		less \
        php7.2-gd \
        php7.2-mysql \
        php7.2-xmlrpc \
        php7.2-soap \
        php7.2-curl \
        php7.2-json \
        php7.2-mongo \
        php7.2-apcu \
        php7.2-bcmath \
        gnupg2 \
        imagemagick \
        libpng-dev \
        libjpeg62-turbo \
        libjpeg62-turbo-dev \
        wkhtmltopdf \
        xvfb \
        pdftk && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/supervisor/conf.d/app-log.conf /etc/supervisor/conf.d/app-log.conf

RUN chgrp www-data -R /tmp && chmod g+rwx -R /tmp
