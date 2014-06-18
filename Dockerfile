# FROM ubuntu:14.04
FROM ushios/ubuntu14
MAINTAINER Ushio Shugo <ushio.s@gmail.com>

# install packages
ADD ./root/packages.sh /packages.sh
RUN chmod 755 /packages.sh
RUN /packages.sh
RUN rm -f /packages.sh

# middleware settings
ADD ./root/etc/supervisor/conf.d/apache2.conf /etc/supervisor/conf.d/apache2.conf

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
