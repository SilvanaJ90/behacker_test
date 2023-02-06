#!/usr/bin/python3
""" objects that handles all default RestFul API actions for words """
from models.word import Word
from models.category import Category
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from


@app_views.route('/categories/<category_id>/words', methods=['GET'],
                 strict_slashes=False)
@swag_from('documentation/word/words_by_category.yml', methods=['GET'])
def get_words(category_id):
    """
    Retrieves the list of all words objects
    of a specific category, or a specific word
    """
    list_words = []
    category = storage.get(Category, category_id)
    if not category:
        abort(404)
    for word in category.words:
        list_words.append(word.to_dict())

    return jsonify(list_words)


@app_views.route('/words/<word_id>/', methods=['GET'], strict_slashes=False)
@swag_from('documentation/word/get_word.yml', methods=['GET'])
def get_word(word_id):
    """
    Retrieves a specific word based on id
    """
    word = storage.get(Word, word_id)
    if not word:
        abort(404)
    return jsonify(word.to_dict())


@app_views.route('/words/<word_id>', methods=['DELETE'], strict_slashes=False)
@swag_from('documentation/word/delete_word.yml', methods=['DELETE'])
def delete_word(word_id):
    """
    Deletes a word based on id provided
    """
    word = storage.get(Word, word_id)

    if not word:
        abort(404)
    storage.delete(word)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/categories/<category_id>/words', methods=['POST'],
                 strict_slashes=False)
@swag_from('documentation/word/post_word.yml', methods=['POST'])
def post_word(category_id):
    """
    Creates a word
    """
    category = storage.get(Category, category_id)
    if not category:
        abort(404)
    if not request.get_json():
        abort(400, description="Not a JSON")
    if 'name' not in request.get_json():
        abort(400, description="Missing name")

    data = request.get_json()
    instance = Word(**data)
    instance.category_id = category.id
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/words/<word_id>', methods=['PUT'], strict_slashes=False)
@swag_from('documentation/word/put_word.yml', methods=['PUT'])
def put_word(word_id):
    """
    Updates a word
    """
    word = storage.get(Word, word_id)
    if not word:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'category_id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(word, key, value)
    storage.save()
    return make_response(jsonify(word.to_dict()), 200)
