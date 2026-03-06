#!/usr/bin/with-contenv bashio

# Read options from HA addon options.json and build settings.json for velbustcp

SERIAL_AUTODISCOVER=$(bashio::config 'serial_autodiscover')
SERIAL_PORT=$(bashio::config 'serial_port')
TCP_PORT=$(bashio::config 'tcp_port')
TCP_SSL=$(bashio::config 'tcp_ssl')
TCP_AUTH=$(bashio::config 'tcp_auth')
TCP_AUTH_KEY=$(bashio::config 'tcp_auth_key')
LOG_LEVEL=$(bashio::config 'log_level')

# Build the settings.json expected by velbustcp
cat > /tmp/settings.json <<EOF
{
  "connections": [
    {
      "host": "",
      "port": ${TCP_PORT},
      "relay": true,
      "ssl": ${TCP_SSL},
      "cert": "/ssl/fullchain.pem",
      "pk": "/ssl/privkey.pem",
      "auth": ${TCP_AUTH},
      "auth_key": "${TCP_AUTH_KEY}"
    }
  ],
  "serial": {
    "autodiscover": ${SERIAL_AUTODISCOVER},
    "port": "${SERIAL_PORT}"
  },
  "logging": {
    "type": "${LOG_LEVEL}",
    "output": "stream"
  }
}
EOF

bashio::log.info "Starting Velbus TCP Bridge..."
bashio::log.info "Serial port: ${SERIAL_PORT} (autodiscover: ${SERIAL_AUTODISCOVER})"
bashio::log.info "TCP port: ${TCP_PORT} (SSL: ${TCP_SSL}, auth: ${TCP_AUTH})"

exec python3 -m velbustcp --settings /tmp/settings.json
