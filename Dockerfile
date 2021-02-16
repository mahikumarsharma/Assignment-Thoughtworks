FROM ubuntu:latest
MAINTAINER mohitsharma.aryan7@gmail.com
RUN  apt-get update -y  && apt-get upgrade  -y && apt-get install wget -y
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y apache2 php php-mysql libapache2-mod-php php-xml php-mbstring
RUN cd /var/www  \
    && wget https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.1.tar.gz \
    && tar -xvzf /var/www/mediawiki-1.35.1.tar.gz \
    && ln -s /var/www/mediawiki-1.35.1/ /var/www/html/mediawiki
ADD files/000-default.conf /etc/apache2/sites-enabled/
RUN phpenmod mbstring \
    && phpenmod xml
RUN service apache2 restart
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
ENTRYPOINT ["/usr/bin/bash"]
