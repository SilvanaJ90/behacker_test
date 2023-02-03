#!/usr/bin/python3
""" objects that handle all default Words"""
from models.category import Category
from models.word import Word
from models import storage
from app.views import app_views
from flask import abort, jsonify, make_response, request, render_template, redirect, url_for
from flasgger.utils import swag_from

@app_views.route('/')
def index():
    return render_template('index.html')

@app_views.route('/index')
def iindex():
    return render_template("index.html")


@app_views.route("/admin")
def admin():
    return render_template("admin.html")



