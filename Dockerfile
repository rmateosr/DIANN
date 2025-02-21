FROM ubuntu
USER root
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and upgrade
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y wget unzip libgomp1 locales

# Configure locale
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Set environment variables
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Download and extract DIA-NN
RUN wget https://github.com/vdemichev/DiaNN/releases/download/2.0/DIA-NN-2.0.2-Academia-Linux.zip -O diann.zip && \
    unzip diann.zip && \
    rm diann.zip

# Set appropriate permissions
RUN chmod -R 775 DIA-NN-2.0.2-Academia-Linux

# Set working directory
WORKDIR /DIA-NN-2.0.2-Academia-Linux

# Define entrypoint (adjust as needed)
ENTRYPOINT ["./diann"]
