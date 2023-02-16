#!/usr/bin/python3
""" objects that handle all default Categories"""
from models.category import Category
from models import storage
from app.routes import app_routes
from flask import abort, jsonify, make_response, request, render_template, redirect, url_for
from flasgger.utils import swag_from

@app_routes.route('/registro')
def register():
    return render_template('registro.html')

@app_routes.route('/')
def index():
    return render_template('index.html')

@app_routes.route('/test')
def test():
    return render_template('test.html')

@app_routes.route('/ver_categorias')
def get_categories():
    return render_template("ver_categorias.html")