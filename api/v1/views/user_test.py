#!/usr/bin/python3word
""" objects that handle all default RestFul API actions for test - word """
from models.test import Test
from models.word import Word
from models import storage
from api.v1.views import app_views
from os import environ
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from


@app_views.route('tests/<test_id>/words', methods=['GET'],
                 strict_slashes=False)
@swag_from('documentation/user_test/get_user_test.yml',
           methods=['GET'])
def get_user_tests(test_id):
    """
    Retrieves the list of all word objects of a test
    """
    test = storage.get(Test, test_id)

    if not test:
        abort(404)

    if environ.get('HBNB_TYPE_STORAGE') == "db":
        words = [word.to_dict() for word in test.words]
    else:
        words = [storage.get(Word, word_id).to_dict()
                     for word_id in test.word_ids]

    return jsonify(words)


@app_views.route('/tests/<test_id>/words/<word_id>',
                 methods=['DELETE'], strict_slashes=False)
@swag_from('documentation/user_test/delete_user_test.yml',
           methods=['DELETE'])
def delete_user_test(test_id, word_id):
    """
    Deletes a word object of a test
    """
    test = storage.get(Test, test_id)

    if not test:
        abort(404)

    word = storage.get(Word, word_id)

    if not word:
        abort(404)

    if environ.get('HBNB_TYPE_STORAGE') == "db":
        if word not in test.words:
            abort(404)
        test.words.remove(word)
    else:
        if word_id not in test.word_ids:
            abort(404)
        test.word_ids.remove(word_id)

    storage.save()
    return make_response(jsonify({}), 200)


@app_views.route('/tests/<test_id>/words/<word_id>', methods=['POST'],
                 strict_slashes=False)
@swag_from('documentation/user_test/post_user_test.yml',
           methods=['POST'])
def post_user_test(test_id, word_id):
    """
    Link a word object to a test
    """
    test = storage.get(Test, test_id)

    if not test:
        abort(404)

    word = storage.get(Word, word_id)

    if not word:
        abort(404)

    if environ.get('HBNB_TYPE_STORAGE') == "db":
        if word in test.words:
            return make_response(jsonify(word.to_dict()), 200)
        else:
            test.words.append(word)
    else:
        if word_id in test.word_ids:
            return make_response(jsonify(word.to_dict()), 200)
        else:
            test.word_ids.append(word_id)

    storage.save()
    return make_response(jsonify(word.to_dict()), 201)
