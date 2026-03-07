#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json
SETTINGS_FILE=/data/settings.json

# Read add-on options via bashio
SERIAL_PORT=$(bashio::config 'serial_port')
SERIAL_AUTODISCOVER=$(bashio::config 'serial_autodiscover')
TCP_PORT=$(bashio::config 'tcp_port')
TCP_SSL_PORT=$(bashio::config 'tcp_ssl_port')
NTP_ENABLED=$(bashio::config 'ntp_enabled')
NTP_SYNCTIME=$(bashio::config 'ntp_synctime')
LOG_LEVEL=$(bashio::config 'log_level')

bashio::log.info "Starting Velbus TCP Bridge..."
bashio::log.info "Serial port: ${SERIAL_PORT} (autodiscover: ${SERIAL_AUTODISCOVER})"
bashio::log.info "TCP ports: ${TCP_PORT} (plain), ${TCP_SSL_PORT} (SSL)"

# Generate settings.json from add-on options
cat > "${SETTINGS_FILE}" <<EOF
{
  "ntp": {
    "enabled": ${NTP_ENABLED},
    "synctime": "${NTP_SYNCTIME}"
  },
  "connections": [
    {
      "host": "",
      "port": ${TCP_SSL_PORT},
      "relay": true,
      "ssl": false,
      "cert": "",
      "pk": "",
      "auth": false,
      "auth_key": ""
    },
    {
      "host": "0.0.0.0",
      "port": ${TCP_PORT},
      "relay": true,
      "ssl": false,
      "cert": "",
      "pk": "",
      "auth": false,
      "auth_key": ""
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

bashio::log.info "Generated settings: ${SETTINGS_FILE}"

exec velbustcp --settings "${SETTINGS_FILE}"
