import datetime
import os

from flask import jsonify, make_response, request
from flask_restful import Resource
import bcrypt
import jwt

import oracli_api


class Login(Resource):
    def post(self):
        # store json
        headers = request.headers
        credentials = request.get_json()
        print('credentials', credentials)
        email = credentials.get('email')
        password = credentials.get('password')

        # check to see if the user is a mentee
        verify_user = oracli_api.mentees.find_one({'email': email})
        if verify_user is None:
            verify_user = oracli_api.mentors.find_one({'email': email})

        # the user does not exist in either database, so tell the client
        if verify_user is None:
            return jsonify({'message': 'user not found.'})

        # generate a jwt token
        token = jwt.encode({'_id': str(verify_user.get('_id')), 'exp': datetime.datetime.utcnow(
        ) + datetime.timedelta(days=30)}, os.getenv('SECRET_KEY'))
        # return the token
        return jsonify({'token': token.decode('UTF-8')})
