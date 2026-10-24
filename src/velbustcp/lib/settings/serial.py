from typing import Dict, Optional  # noqa: F401
from velbustcp.lib.util.util import str2bool


class SerialSettings():

    port: str = ""
    autodiscover: bool = True
    dtr: Optional[bool] = None  # None: leave the line as the OS set it on open
    rts: Optional[bool] = None

    @staticmethod
    def parse(settings_dict):
        # type: (Dict[str, str]) -> SerialSettings

        settings = SerialSettings()

        # Port
        if "port" in settings_dict:
            settings.port = settings_dict["port"]

        # Autodiscover
        if "autodiscover" in settings_dict:
            settings.autodiscover = str2bool(settings_dict["autodiscover"])

        # Modem control lines (some RS232 interfaces only answer with specific DTR/RTS levels)
        if "dtr" in settings_dict:
            settings.dtr = str2bool(settings_dict["dtr"])

        if "rts" in settings_dict:
            settings.rts = str2bool(settings_dict["rts"])

        return settings
