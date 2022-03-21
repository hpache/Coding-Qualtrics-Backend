FROM ubuntu
ENV DEBIAN_FRONTEND = noninteractive
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get install -y php
RUN apt-get install -y libapache2-mod-php
RUN apt-get install -y vim
RUN apt-get install -y python3
RUN apt-get clean

WORKDIR /var/www/html

COPY . . 

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
RUN apache2ctl restart
RUN chown www-data:www-data /var/www/html