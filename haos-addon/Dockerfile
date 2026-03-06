ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python and pip
RUN apk add --no-cache \
    python3 \
    py3-pip

# Install velbustcp from PyPI
RUN pip3 install --no-cache-dir --break-system-packages velbustcp

# Copy addon entrypoint
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
