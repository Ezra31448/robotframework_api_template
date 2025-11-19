# browser_options.py

from selenium.webdriver.chrome.options import Options

def get_chrome_options():
    """
    Creates and returns a configured ChromeOptions object
    for automated testing.
    """
    options = Options()

    options.add_experimental_option("prefs", {
        "credentials_enable_service": False,
        "profile.password_manager_enabled": False,
        "profile.password_manager_leak_detection": False
    })

    options.add_argument('--disable-extensions')
    options.add_argument('--disable-plugins')
    options.add_argument('--disable-blink-features=AutomationControlled')
    options.add_argument('--disable-notifications')
    options.add_argument('--disable-save-password-bubble')

    
    return options