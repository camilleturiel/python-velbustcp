ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.11-alpine3.18
FROM $BUILD_FROM

# Install system dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-serial \
    build-base \
    linux-headers

# Copy application source
WORKDIR /app
COPY ../src ./src
COPY ../setup.cfg ./setup.cfg
COPY ../setup.py ./setup.py
COPY ../pyproject.toml ./pyproject.toml
COPY ../requirements.txt ./requirements.txt
COPY ../version.txt ./version.txt

# Install the package
RUN pip3 install --no-cache-dir .

# Copy add-on run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
