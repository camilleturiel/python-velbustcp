ARG BUILD_FROM
FROM $BUILD_FROM

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    linux-headers

# Copy and install the package from local source
WORKDIR /app
COPY src/ ./src/
COPY setup.cfg setup.py pyproject.toml ./
RUN pip3 install --no-cache-dir .

# Copy add-on run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
