from flask_restful import Resource
from flask import jsonify

from oracli_api.utils.auth import token_required

import oracli_api


class Test(Resource):
    @token_required
    def get(self, data, token):
        return jsonify({'message': f'you are in chief :) {data}'})
