import datetime

from flask import jsonify, make_response, request
from flask_restful import Resource
import bcrypt
import jwt

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
        try:
            if is_mentor:
                verify_email = oracli_api.mentors.find_one({'email': email})
            else:
                verify_email = oracli_api.mentees.find_one({'email': email})
        except Exception as e:
            print(e)
        print('verify email', verify_email)
        # if the user is not in the DB
        if verify_email is None:
            # TODO: Hash password
            # this creates either a Mentor or a Mentee depending on the returned data
            current_user = Mentor(name, age, gender, email, password) if is_mentor else Mentee(
                name, age, gender, email, password)

            print(current_user)

            current_user.save_new()  # create the new user

            return jsonify({'success': 'user has been created in the database'})
        else:
            return jsonify({'message': 'account already exists with ' + str(email)})
