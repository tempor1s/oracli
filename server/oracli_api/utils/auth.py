from functools import wraps
import os

from flask import jsonify, request
import jwt

import oracli_api


def token_required(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        try:
            token = request.get_json().get('token')
        except Exception as e:
            print(e)
            token = None
        finally:
            if not token:
                return jsonify({'message': 'auth token is missing'})
        try:
            data = jwt.decode(token, os.getenv('SECRET_KEY'))
            # so hacky lol
            kwargs['data'] = data
            kwargs['token'] = token
        except:
            return jsonify({'error': 'internal server error'})

        return f(*args, **kwargs)

    return wrapper
