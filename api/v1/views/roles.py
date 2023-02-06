#!/usr/bin/python3
""" objects that handles all default RestFul API actions for roles"""
from models.rol import Rol

from models import storage
from api.v1.views import app_views
from flask import abort, jsonify, make_response, request
from flasgger.utils import swag_from


@app_views.route('/roles', methods=['GET'], strict_slashes=False)
@swag_from('documentation/rol/all_roles.yml')
def get_roles():
    """
    Retrieves a list of all roles
    """
    all_roles = storage.all(Rol).values()
    list_roles = []
    for rol in all_roles:
        list_roles.append(rol.to_dict())
    return jsonify(list_roles)


@app_views.route('/roles/<rol_id>/', methods=['GET'],
                 strict_slashes=False)
@swag_from('documentation/rol/get_rol.yml', methods=['GET'])
def get_rol(rol_id):
    """ Retrieves an rol """
    rol = storage.get(Rol, rol_id)
    if not rol:
        abort(404)

    return jsonify(rol.to_dict())


@app_views.route('/roles/<rol_id>', methods=['DELETE'],
                 strict_slashes=False)
@swag_from('documentation/rol/delete_rol.yml', methods=['DELETE'])
def delete_rol(rol_id):
    """
    Deletes an rol  Object
    """

    rol = storage.get(Rol, rol_id)

    if not rol:
        abort(404)

    storage.delete(rol)
    storage.save()

    return make_response(jsonify({}), 200)


@app_views.route('/roles', methods=['POST'], strict_slashes=False)
@swag_from('documentation/rol/post_rol.yml', methods=['POST'])
def post_rol():
    """
    Creates an rol
    """
    if not request.get_json():
        abort(400, description="Not a JSON")

    if 'name' not in request.get_json():
        abort(400, description="Missing name")

    data = request.get_json()
    instance = Rol(**data)
    instance.save()
    return make_response(jsonify(instance.to_dict()), 201)


@app_views.route('/roles/<rol_id>', methods=['PUT'],
                 strict_slashes=False)
@swag_from('documentation/rol/put_rol.yml', methods=['PUT'])
def put_rol(rol_id):
    """
    Updates an rol
    """
    if not request.get_json():
        abort(400, description="Not a JSON")

    ignore = ['id', 'created_at', 'updated_at']

    rol = storage.get(Rol, rol_id)

    if not rol:
        abort(404)

    data = request.get_json()
    for key, value in data.items():
        if key not in ignore:
            setattr(rol, key, value)
    storage.save()
    return make_response(jsonify(rol.to_dict()), 200)
