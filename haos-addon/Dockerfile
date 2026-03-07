ARG BUILD_FROM
FROM $BUILD_FROM

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    linux-headers

# Install velbustcp from GitHub
RUN pip3 install --no-cache-dir \
    git+https://github.com/velbus/python-velbustcp.git

# Copy add-on run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
