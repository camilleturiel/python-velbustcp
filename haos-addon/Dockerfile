ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python and pip
RUN apk add --no-cache \
    python3 \
    py3-pip \
    git

# Install velbustcp from GitHub
RUN pip3 install --no-cache-dir --break-system-packages \
    git+https://github.com/velbus/python-velbustcp.git

# Copy addon entrypoint
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
