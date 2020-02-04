"""Just a basic route for testing!"""

from flask_restful import Resource
from flask import jsonify
import oracli_api


class HelloRoute(Resource):
    def get(self):
        return jsonify({'hello': 'world'})
