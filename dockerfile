FROM centos:latest
LABEL maintainer="mahdichabeh1233@gmail.com"
RUN yum install -y httpd \
zip\
unzip
ADD https://html5up.net/massively/download /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80