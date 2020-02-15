import datetime

from flask import jsonify, make_response, request
from flask_restful import Resource
import bcrypt
import jwt
import os

import oracli_api
from oracli_api.utils.auth import token_required
from oracli_api.models.mentee import Mentee
from oracli_api.models.mentor import Mentor


class Register(Resource):
    # TODO: Login the user after they are created
    def post(self):
        data = request.get_json()

        # get fields
        name = data.get('name')
        age = data.get('age')
        is_mentor = data.get('is_mentor')
        gender = data.get('gender')
        email = data.get('email')
        password = data.get('password')

        # TODO: Sanitize data :)
        verify_email = None
        try:
            if is_mentor:
                verify_email = oracli_api.mentors.find_one({'email': email})
            else:
                verify_email = oracli_api.mentees.find_one({'email': email})
        except Exception as e:
            print(e)
        # if the user is not in the DB
        if verify_email is not None:
            return jsonify({'message': 'account already exists with ' + str(email)})

        # salt and hash the pw
        salt = bcrypt.gensalt(rounds=12)
        hashed_pw = bcrypt.hashpw(password.encode('utf-8'), salt)

        # this creates either a Mentor or a Mentee depending on the returned data
        current_user = Mentor(name, age, gender, email, hashed_pw) if is_mentor else Mentee(
            name, age, gender, email, hashed_pw)

        current_user.save_new()  # create the new user

        # get the new user
        new_user = oracli_api.mentees.find_one({'email': email})
        if new_user is None:
            new_user = oracli_api.mentors.find_one({'email': email})

        # generate a jwt token for the new user
        token = jwt.encode({'_id': str(new_user.get('_id')), 'exp': datetime.datetime.utcnow(
        ) + datetime.timedelta(days=30)}, os.getenv('SECRET_KEY'))

        # return the token
        return jsonify({'token': token.decode('UTF-8')})
