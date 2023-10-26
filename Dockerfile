# Base image
FROM alpine:latest

# Install dependencies
RUN apk --no-cache add \
    python3 \
    py3-pip \
    curl \
    gettext \
    && pip3 install awscli

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

# Install helm
RUN curl -LO https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz \
    && tar -zxvf helm-v3.6.3-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

# Set default command
CMD ["sh"]
