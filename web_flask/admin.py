#!/usr/bin/python3
""" Starts a Flash Web Application """
from models import storage
from models.category import Category
from models.word import Word
from models.user import User
from models.test import Test
from models.rol import Rol
from os import environ
from flask import Flask, render_template
app = Flask(__name__)
# app.jinja_env.trim_blocks = True
# app.jinja_env.lstrip_blocks = True


@app.teardown_appcontext
def close_db(error):
    """ Remove the current SQLAlchemy Session """
    storage.close()


@app.route('/bhtest', strict_slashes=False)
def hbnb():
    """ HBNB is alive! """
    categories = storage.all(Category).values()
    categories = sorted(categories, key=lambda k: k.name)
    st_ct = []

    for category in categories:
        st_ct.append([category, sorted(category.words, key=lambda k: k.name)])

    test = storage.all(Test).values()
    test = sorted(test, key=lambda k: k.name)

    roles = storage.all(Rol).values()
    roles = sorted(roles, key=lambda k: k.name)

    return render_template('admin.html',
                           categories=st_ct,
                           test=test,
                           roles=roles)


if __name__ == "__main__":
    """ Main Function """
    app.run(host='0.0.0.0', port=5000)
