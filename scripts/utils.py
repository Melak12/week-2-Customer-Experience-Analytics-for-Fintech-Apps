# Application name and id mapping to be used for scraping
from enum import Enum
import logging


class AppName(Enum):
    CBE = 'CBE'
    BOA = 'BOA'
    DASHEN = 'DASHEN'

APP_NAME_ID_MAPPING = {
    AppName.CBE: 'com.combanketh.mobilebanking',
    AppName.BOA: 'com.boa.boaMobileBanking',
    AppName.DASHEN: 'com.dashen.dashensuperapp',
}

def get_appid(self, app_name: 'AppName'):
    """
    Get the app ID for a given app name (AppName enum).
    """
    if app_name in APP_NAME_ID_MAPPING:
        return APP_NAME_ID_MAPPING[app_name]
    else:
        logging.error(f"App name '{app_name}' not found in mapping.")
        return None