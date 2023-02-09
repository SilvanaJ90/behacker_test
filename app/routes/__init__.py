#!/usr/bin/python3
""" Blueprint for API """
from flask import Blueprint

app_routes = Blueprint('app_routes', __name__, url_prefix='/bhprofile', template_folder='templates/admin', static_folder='static')

from app.routes.index import *
from app.routes.categories import *
