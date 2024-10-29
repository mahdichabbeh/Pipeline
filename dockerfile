FROM almalinux:latest
LABEL maintainer="mahdichabeh1233@gmail.com"

# Install required packages
RUN yum install -y httpd zip unzip \
    && yum clean all  # Clean up to reduce image size

# Add your template
ADD https://html5up.net/massively/download /var/www/html/massively.zip

WORKDIR /var/www/html/
RUN unzip massively.zip \
    && rm -f massively.zip  # Remove the zip file after extraction

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
