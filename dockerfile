# Use the CentOS base image
FROM centos:latest

# Update the repository URLs and install httpd
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo && \
    yum -y update && \
    yum -y install httpd && \
    yum clean all

# Set the working directory
WORKDIR /var/www/html

# Create the index.html file with content
RUN echo "pinki123" > /var/www/html/index.html

# Expose port 80
EXPOSE 80

# Set the default command to start httpd service in the foreground
CMD ["httpd", "-D", "FOREGROUND"]
