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
        wkhtmltopdf && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD config/supervisord/conf.d/app-log.conf /etc/supervisor/conf.d/app-log.conf

RUN chgrp www-data -R /tmp && chmod g+rwx -R /tmp
