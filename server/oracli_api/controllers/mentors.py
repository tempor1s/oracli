from flask import jsonify
from flask_restful import Resource
from bson import json_util
import json

from oracli_api.utils.auth import token_required

import oracli_api


class Mentors(Resource):
    @token_required
    def get(self, data, token):
        # get all mentors from db and return them
        mentors = list(oracli_api.users.find({"is_mentor": True}))
        return jsonify(json.loads(json_util.dumps(mentors)))
