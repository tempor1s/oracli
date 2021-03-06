import datetime
import os

from flask import jsonify, make_response, request
from flask_restful import Resource
import bcrypt
import jwt

import oracli_api


class Login(Resource):
    def post(self):
        # posted login credentials
        credentials = request.get_json()
        # get credentials from post request
        email = credentials.get('email')
        password = credentials.get('password')

        # check to see if the user is a mentee
        verify_user = oracli_api.users.find_one({'email': email})

        # the user does not exist in either database, so tell the client
        if verify_user is None:
            return jsonify({'message': 'user not found'})

        # encrpt given password and check it against one stored in the db
        if bcrypt.checkpw(password.encode('utf-8'), verify_user.get('password')):
            # generate a jwt token
            token = jwt.encode({'_id': str(verify_user.get('_id')), 'exp': datetime.datetime.utcnow(
            ) + datetime.timedelta(days=30)}, os.getenv('SECRET_KEY'))
            # return the token
            return jsonify({'token': token.decode('UTF-8')})
        else:
            return jsonify({'message': 'Incorrect password.'})
