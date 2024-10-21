FROM centos:latest

LABEL maintainer="mahdichabeh1233@gmail.com"

# Install required packages
RUN yum install -y httpd zip unzip \
    && yum clean all  # Clean up to reduce image size

# Download the ZIP file and add it to the image
ADD https://html5up.net/massively/download /var/www/html/massively.zip

# Change working directory
WORKDIR /var/www/html/

# Unzip the downloaded file
RUN unzip massively.zip \
    && rm -f massively.zip  # Remove the zip file after extraction

# Move contents if necessary
RUN cp -rvf massively/* . \
    && rm -rf massively  # Clean up extracted folder

# Set the command to run the HTTP server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose the port for the HTTP server
EXPOSE 80
