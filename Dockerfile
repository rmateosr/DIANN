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

# Find the extracted directory name and set correct permissions
RUN extracted_dir=$(ls -d DIA-NN*/ 2>/dev/null | head -n 1) && \
    chmod -R 775 "$extracted_dir" && \
    echo "Extracted directory: $extracted_dir"

# Set working directory dynamically
WORKDIR $extracted_dir

# Define entrypoint (adjust if needed)
ENTRYPOINT ["./diann"]
