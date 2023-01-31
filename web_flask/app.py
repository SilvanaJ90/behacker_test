#!/usr/bin/python3
""" Starts a Flash Web Application """

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
def ver_categorias():
    return render_template("ver_categorias.html")

@app.route("/login")
def login():
    return render_template("login.html")

@app.route("/registro")
def registro():
    return render_template("registro.html")

if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000, debug=True)