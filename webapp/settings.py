import os

from frontend.views import uimodules

SETTINGS = {
    "debug": True,
    "ui_modules": uimodules,
    "static_path": os.path.join("frontend","views","static")
}