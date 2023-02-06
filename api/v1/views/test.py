#!/usr/bin/python3ategories
""" objects that handle all default RestFul API actions for Places """
from models.test import Test
from models.user import User
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from

@app_views.route('/users/<user_id>/tests', methods=['GET'],
                 strict_slashes=False)
@swag_from('documentation/test/tests_by_user.yml', methods=['GET'])
def get_tests(user_id):
    """
    Retrieves the list of all tests objects
    of a specific user, or a specific test
    """
    list_tests = []
    user = storage.get(User, user_id)
    if not user:
        abort(404)
    for test in user.tests:
        list_tests.append(test.to_dict())

    return jsonify(list_tests)


@app_views.route('/tests/<test_id>/', methods=['GET'], strict_slashes=False)
@swag_from('documentation/test/get_test.yml', methods=['GET'])
def get_test(test_id):
    """
    Retrieves a specific test based on id
    """
    test = storage.get(Test, test_id)
    if not test:
        abort(404)
    return jsonify(test.to_dict())


@app_views.route('/tests/<test_id>', methods=['DELETE'], strict_slashes=False)
@swag_from('documentation/test/delete_test.yml', methods=['DELETE'])
def delete_test(test_id):
    """
    Deletes a test based on id provided
    """
    test = storage.get(Test, test_id)

    if not test:
        abort(404)
    storage.delete(test)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/users/<user_id>/tests', methods=['POST'],
                 strict_slashes=False)
@swag_from('documentation/test/post_test.yml', methods=['POST'])
def post_test(user_id):
    """
    Creates a test
    """
    user = storage.get(User, user_id)
    if not user:
        abort(404)
    if not request.get_json():
        abort(400, description="Not a JSON")
    if 'name' not in request.get_json():
        abort(400, description="Missing name")

    data = request.get_json()
    instance = Test(**data)
    instance.user_id = user.id
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/tests/<test_id>', methods=['PUT'], strict_slashes=False)
@swag_from('documentation/test/put_test.yml', methods=['PUT'])
def put_test(test_id):
    """
    Updates a test
    """
    test = storage.get(Test, test_id)
    if not test:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'user_id', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(test, key, value)
    storage.save()
    return make_response(jsonify(test.to_dict()), 200)
