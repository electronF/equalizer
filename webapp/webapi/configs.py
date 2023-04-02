import os
import connexion
from tornado_sqlalchemy import SQLAlchemy
from flask_marshmallow  import Marshmallow

from .constants import DATABASE_NAME

rootdir = os.path.abspath(os.path.join(os.path.dirname(__file__), "providers"))
basedir = os.path.abspath(os.path.dirname(__file__))

# Create the connexion application instance
connex_app = connexion.App(__name__, specification_dir=rootdir)

# Get the underlying Flask app instance
app = connex_app.app

# Build the Sqlite ULR for SqlAlchemy
DATABASE_PATH = os.path.join(basedir, DATABASE_NAME)
sqlite_url = "sqlite:////" + DATABASE_PATH

# Configure the SqlAlchemy part of the app instance
app.config["SQLALCHEMY_ECHO"] = False
app.config["SQLALCHEMY_DATABASE_URI"] = sqlite_url
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

# Create the SqlAlchemy db instance
db = SQLAlchemy(app)

# Initialize Marshmallow
ma = Marshmallow(app)