cat <<EOF > Dockerfile
FROM ubuntu
USER root
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and upgrade
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install wget unzip libgomp1 locales -y

# Configure locale
RUN locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Set environment variables
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Download DIA-NN version 2.0
RUN wget https://github.com/vdemichev/DiaNN/releases/download/2.0/DIA-NN-2.0.2-Academia-Linux.zip -O diann-2.0.2.Linux.zip

# Unzip the DIA-NN package
RUN unzip diann-2.0.2.Linux.zip

# Set appropriate permissions
RUN chmod -R 775 /diann-2.0

# NOTE: Ensure compliance with DIA-NN license terms.
EOF
