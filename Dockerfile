# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update Ubuntu packages and install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    expect

# Install PufferPanel
RUN curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | sudo bash
RUN sudo apt-get install -y pufferpanel

# Copy expect script for user creation
COPY create_admin.expect /tmp/

# Run the expect script to add an admin user
RUN sudo expect /tmp/create_admin.expect

# Expose ports
EXPOSE 8080 5657

# Start the panel
CMD ["sudo", "systemctl", "enable", "--now", "pufferpanel"]
