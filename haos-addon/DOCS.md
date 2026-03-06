# Velbus TCP Bridge - Home Assistant OS Addon

This addon bridges a [Velbus](https://www.velbus.eu/) serial bus installation to TCP/IP, allowing Home Assistant (via the `velbus` integration) and other clients to communicate with your Velbus devices over the network.

## How it works

The addon connects to the Velbus USB/serial interface attached to your Home Assistant host and exposes it as a TCP server. The official Home Assistant Velbus integration can then connect to `localhost:<port>` instead of directly accessing the serial port.

## Prerequisites

- A Velbus USB interface (e.g. VMB1USB, VMBRSUSB) connected to your HA host
- The `velbus` integration configured to use a TCP connection

## Configuration

| Option | Default | Description |
|---|---|---|
| `serial_autodiscover` | `true` | Automatically detect the Velbus USB device. Disable to specify a port manually. |
| `serial_port` | `/dev/ttyUSB0` | Serial port to use when autodiscover is disabled (e.g. `/dev/ttyACM0`). |
| `tcp_port` | `27015` | TCP port the bridge will listen on. |
| `tcp_ssl` | `false` | Enable TLS encryption on the TCP listener. Requires valid SSL certificates in `/ssl/`. |
| `tcp_auth` | `false` | Require clients to authenticate with a key before communicating. |
| `tcp_auth_key` | `""` | Authentication key clients must send when `tcp_auth` is enabled. |
| `log_level` | `info` | Logging verbosity: `debug` or `info`. |

## Home Assistant Velbus integration setup

After starting the addon, configure the Velbus integration to connect via TCP:

1. Go to **Settings → Devices & Services → Add integration → Velbus**
2. Select **TCP** as the connection type
3. Set **Host** to `localhost` (or your HA IP if connecting remotely)
4. Set **Port** to the value of `tcp_port` (default: `27015`)

## SSL support

When `tcp_ssl` is enabled the addon reads certificates from the HA `/ssl/` share:

- **Certificate**: `/ssl/fullchain.pem`
- **Private key**: `/ssl/privkey.pem`

These are the same files used by other HA addons such as the Let's Encrypt addon.

## Identifying your serial port

If autodiscovery does not find your device, disable it and set `serial_port` manually. Common ports on HA hardware:

| Device | Typical port |
|---|---|
| USB serial adapter | `/dev/ttyUSB0` |
| USB CDC ACM device | `/dev/ttyACM0` |
| Raspberry Pi GPIO UART | `/dev/ttyAMA0` |

You can inspect available serial ports in the HA terminal with:

```bash
ls /dev/tty*
```

## Support

- [Velbus documentation](https://www.velbus.eu/)
- [python-velbustcp repository](https://github.com/Velleman/python-velbustcp)
- [Home Assistant Velbus integration](https://www.home-assistant.io/integrations/velbus/)
