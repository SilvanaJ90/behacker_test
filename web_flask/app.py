#!/usr/bin/python3
""" Starts a Flash Web Application """
from models import storage
from models.category import Category
from models.word import Word
from models.user import User
from models.test import Test
from models.rol import Rol
from flask import Flask, render_template
app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/index")
def iindex():
    return render_template("index.html")

@app.route("/admin")
def admin():
    return render_template("admin.html")

@app.route("/ver_categorias")
@app.route("/words")
def ver_categorias():
    categories = storage.all(Category).values()
    categories = sorted(categories, key=lambda k: k.name)
    st_ct = []

    for category in categories:
        st_ct.append([category, sorted(category.words, key=lambda k: k.name)])

    return render_template("ver_categorias.html",
                                categories=st_ct)


        

@app.route("/login")
def login():
    return render_template("login.html")

@app.route("/registro")
def registro():
    return render_template("registro.html")

@app.route("/crear_categoria")
def crear_categoria():
    return render_template("crear_categoria.html")


if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000, debug=True)