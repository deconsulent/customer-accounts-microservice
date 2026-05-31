import logging
from flask import Flask
from flask_talisman import Talisman
from flask_cors import CORS

app = Flask(__name__)

# Initialize Talisman with security headers
talisman = Talisman(app)

# Configure CORS
CORS(app)

app.config.from_object('config.Config')

# Import routes
from service import routes
