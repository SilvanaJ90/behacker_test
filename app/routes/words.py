#!/usr/bin/python3
""" objects that handle all default Words"""
from models.category import Category
from models.word import Word
from models import storage
from app.routes import app_routes
from flask import abort, jsonify, make_response, request, render_template, redirect, url_for
from flasgger.utils import swag_from

@app_routes.route('/')
def index():
    return render_template('index.html')

@app_routes.route('/index')
def iindex():
    return render_template("index.html")


@app_routes.route("/admin")
def admin():
    return render_template("admin.html")



