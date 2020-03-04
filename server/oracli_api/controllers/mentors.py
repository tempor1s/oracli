from flask import jsonify
from flask_restful import Resource
from bson import json_util, ObjectId
import json

from oracli_api.utils.auth import token_required

import oracli_api


class Mentors(Resource):
    @token_required
    def get(self, data, token):
        # get all mentors from db and return them
        mentors = list(oracli_api.users.find({"is_mentor": True}, {"password": 0}))
        return jsonify(json.loads(json_util.dumps(mentors)))


class AddMentee(Resource):
    @token_required
    def post(self, data, token, mentee_id):
        # get the logged in user id (the mentor)
        mentor_id = {'_id': ObjectId(data.get('_id'))}
        # get the mentee id passed from the URL
        mentee_id = {'_id': ObjectId(mentee_id)}

        # add the mentee id to the mentors list of mentees
        oracli_api.users.find_one_and_update(
            mentor_id, {'$addToSet': {"mentees": mentee_id}})
        # find the mentee in the db and update their mentor field with the new mentor
        oracli_api.users.find_one_and_update(
            mentee_id, {'$set': {'mentor': mentor_id}})

        # tell the end user that the operation was successful
        return jsonify({'message': 'Success :)'})


class RemoveMentee(Resource):
    @token_required
    def post(self, data, token, mentee_id):
        # get the mentees id from the url
        mentee_id = {'_id': ObjectId(mentee_id)}
        # get the mentor from the currently logged in user
        mentor_id = {'_id': ObjectId(data.get('_id'))}

        # find the user in the db and update their mentor field with the new mentor
        oracli_api.users.find_one_and_update(
            mentee_id, {'$set': {'mentor': None}})
        # find the mentor in the database and remove the mentee from them
        oracli_api.users.find_one_and_update(
            mentor_id, {'$pull': {"mentees": mentee_id}})

        # tell the end user that the operation was successful
        return jsonify({'message': 'Success :)'})
