FROM ubuntu
USER root
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and ensure package versions are up to date
RUN apt-get update && apt-get upgrade -y

# Install necessary packages including locales
RUN apt-get install wget unzip libgomp1 locales -y

# Configure locale to avoid runtime errors
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Set environment variables for locale
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Download DIA-NN version 2.0.2
RUN wget https://github.com/vdemichev/DiaNN/releases/download/2.0/diann-2.0.2.Linux.zip -O diann-2.0.2.Linux.zip

# Unzip the DIA-NN package
RUN unzip diann-2.0.2.Linux.zip

# Set appropriate permissions for the DIA-NN folder
RUN chmod -R 775 /diann-2.0.2

# NOTE: It is entirely the user's responsibility to ensure compliance with DIA-NN license terms.
# Please review the licensing terms for DIA-NN before using or distributing this Docker image.