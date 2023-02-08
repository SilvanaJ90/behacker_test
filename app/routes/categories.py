#!/usr/bin/python3
""" objects that handle all default Categories"""
from models.category import Category
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

@app_routes.route('/ver_categorias', methods=['GET'], strict_slashes=False)
def get_categories():
    """
    Retrieves the list of all Categories objects
    """
    categories = storage.all(Category).values()
    categories = sorted(categories, key=lambda k: k.name)
    st_ct = []

    for category in categories:
        st_ct.append([category, sorted(category.words, key=lambda k: k.name)])

    return render_template("ver_categorias.html",
                                categories=st_ct)



@app_routes.route('/ver_categorias/<categories_id>', methods=['GET', 'POST'])
def delete_categories(categories_id):
    """
    Deletes a Category Object
    """
    categories = storage.get(Category, categories_id)
    if not categories:
        abort(404)
    storage.delete(categories)
    storage.save()
    return redirect(url_for('app_routes.get_categories'))

@app_routes.route('/crear_categorias', methods=['GET', 'POST'])
def create_categories():
    """if request.method == "GET":
        name = request.form.get['name_category']
        description = request.form.get['description']
        file_name = request.form['file_name']
    
        new_category = Category(name, description, file_name)

        storage.new(new_category)
        storage.save()"""
    return render_template("crear_categoria.html")

@app_routes.route('/calegoria/<categories_id>/words', methods=['GET', 'POST'])
def words(categories_id):
    """
    words list
    """
    categories = storage.all(Category).values()
    categories = sorted(categories, key=lambda k: k.name)
    st_ct = []

    for category in categories:
        st_ct.append([category, sorted(category.words, key=lambda k: k.name)])
    return render_template("words.html",
                        categories=st_ct)

