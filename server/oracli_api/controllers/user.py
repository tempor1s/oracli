from flask import jsonify, make_response, request
from flask_restful import Resource
from bson import json_util
from bson import ObjectId
import json
from pymongo import ReturnDocument

from oracli_api.utils.auth import token_required

import oracli_api


class User(Resource):
    # will get information about the token passed in
    @token_required
    def get(self, data, token):
        # get the user from the db
        user = oracli_api.mentees.find_one({'_id': ObjectId(data.get('_id'))})
        if user is None:
            user = oracli_api.mentors.find_one(
                {'_id': ObjectId(data.get('_id'))})

        return jsonify(json.loads(json_util.dumps(user)))

    @token_required
    def post(self, data, token):
        user_id = ObjectId(data.get('_id'))

        updated_user = oracli_api.mentees.find_one_and_update(
            {'_id': user_id}, {'$set': request.get_json()}, return_document=ReturnDocument.AFTER)

        if updated_user is None:
            updated_user = oracli_api.mentors.find_one_and_update(
                {'_id': user_id}, {'$set': request.get_json()}, return_document=ReturnDocument.AFTER)

        if updated_user is None:
            return jsonify({'message': 'user does not exist. error'})

        return jsonify({'message': 'success', 'updated_user': json.loads(json_util.dumps(updated_user))})
