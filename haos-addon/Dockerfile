ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python and build dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-serial

# Copy application source
WORKDIR /app
COPY ../src ./src
COPY ../setup.cfg ./setup.cfg
COPY ../setup.py ./setup.py
COPY ../pyproject.toml ./pyproject.toml

# Install the velbustcp package
RUN pip3 install --no-cache-dir .

# Copy addon entrypoint
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
