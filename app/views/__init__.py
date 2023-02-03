#!/usr/bin/python3
""" Blueprint for API """
from flask import Blueprint

app_views = Blueprint('app_views', __name__, url_prefix='/bhprofile', template_folder='templates/admin', static_folder='static')

from app.views.index import *
from app.views.categories import *

