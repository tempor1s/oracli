from flask import jsonify
from flask_restful import Resource
from bson import json_util
import json

from oracli_api.utils.auth import token_required

import oracli_api


class Mentees(Resource):
    @token_required
    def get(self, data, token):
        # get all mentees from db and return them
        mentees = list(oracli_api.users.find({"is_mentor": False}, {"password":  0}))
        return jsonify(json.loads(json_util.dumps(mentees)))


class UnmatchedMentees(Resource):
    @token_required
    def get(self, data, token):
        # get all mentees from the db that do not have a mentor
        mentees = list(oracli_api.users.find({"is_mentor": False, "mentor": None}, {"password": 0}))
        return jsonify(json.loads(json_util.dumps(mentees)))
