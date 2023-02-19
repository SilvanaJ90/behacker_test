#!/usr/bin/python3
""" objects that handle all default RestFul API actions for Users """
from models.user import User
from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from
from werkzeug.security import check_password_hash
from flask_login import login_user
from flask_jwt_extended import create_access_token
from flask_jwt_extended import jwt_required, get_jwt_identity

@app_views.route('/user_type/users', methods=['GET'],
                 strict_slashes=False)
@swag_from('documentation/user/users_by_rol.yml', methods=['GET'])
def get_roles_user():
    """
    Retrieves the list of all users objects
    of a specific rol, or a specific user
    """
    list_users = []
    rol_users = storage.get(User, is_user=True)
    if not rol_users:
        abort(404)
    for user in rol_users:
        list_users.append(user.to_dict())
    return jsonify(list_users), 200

@app_views.route('/users', methods=['GET'], strict_slashes=False)
@swag_from('documentation/user/all_users.yml')
def get_users():
    """
    Retrieves the list of all user objects
    or a specific user
    """
    all_users = storage.all(User).values()
    list_users = []
    for user in all_users:
        list_users.append(user.to_dict())
    return jsonify(list_users)


@app_views.route('/users/<user_id>', methods=['GET'], strict_slashes=False)
@swag_from('documentation/user/get_user.yml', methods=['GET'])
def get_user(user_id):
    """ Retrieves an user """
    user = storage.get(User, user_id)
    if not user:
        abort(404)

    return jsonify(user.to_dict())


@app_views.route('/users/<user_id>', methods=['DELETE'],
                 strict_slashes=False)
@swag_from('documentation/user/delete_user.yml', methods=['DELETE'])
def delete_user(user_id):
    """
    Deletes a user Object
    """

    user = storage.get(User, user_id)

    if not user:
        abort(404)

    storage.delete(user)
    storage.save()

    return make_response(jsonify({}), 200)



@app_views.route('/users', methods=['POST'], strict_slashes=False)
@swag_from('documentation/user/post_user.yml', methods=['POST'])
def post_user():
    """
    Creates a user
    """
    if not request.get_json():
        abort(400, description="Not a JSON")
    if 'email' not in request.get_json():
        abort(400, description="Missing email")
    if 'password' not in request.get_json():
        abort(400, description="Missing password")

    data = request.get_json()
    instance = User(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)

@app_views.route('/users/<user_id>', methods=['PUT'], strict_slashes=False)

@swag_from('documentation/user/put_user.yml', methods=['PUT'])
def put_user(user_id):
    """
    Updates a user
    """
    user = storage.get(User, user_id)

    if not user:
        abort(404)

    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'email', 'created_at', 'updated_at']

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(user, key, value)
    storage.save()
    return make_response(jsonify(user.to_dict()), 200)


@app_views.route('/users/login', methods=['POST'], strict_slashes=False)
@swag_from('documentation/user/login_user.yml', methods=['POST'])    
def login():
    data = request.get_json()
    if not data or not data.get('email') or not data.get('password'):
        return jsonify({'error': 'missing data'}), 400

    email = data['email']
    password = data['password']
    user = storage.get(User, email)
    if not user or not user.verify_password(password):
        return jsonify({'error': 'invalid credentials'}), 401

    access_token = create_access_token(identity=user.id)
    if user.is_user:
        return jsonify({'message': 'user authenticated', 'is_user': True, 'access_token': access_token}), 200
    else:
        return jsonify({'message': 'user authenticated', 'is_user': False, 'access_token': access_token}), 200


@app_views.route('/protected', methods=['GET'])
@swag_from('documentation/user/protected.yml', methods=['GET'])    
def protected():
    current_user_id = get_jwt_identity()
    user = storage.get(User, "id", current_user_id)
    if user.is_user:
        return jsonify({'message': 'Welcome to the user area!'}), 200
    else:
        return jsonify({'message': 'Welcome to the admin'})

