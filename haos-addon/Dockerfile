ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python and pip
RUN apk add --no-cache \
    python3 \
    py3-pip

# Copy and install the velbustcp package from local source
WORKDIR /app
COPY src ./src
COPY setup.cfg setup.py pyproject.toml ./
RUN pip3 install --no-cache-dir --break-system-packages .

# Copy addon entrypoint
COPY haos-addon/run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
