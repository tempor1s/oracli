"""Just a basic route for testing!"""

from flask_restful import Resource 
from flask import jsonify, render_template, make_response
import oracli_api


class HelloRoute(Resource):
    def __init__(self):
        pass
    def get(self):
        headers = {'Content-Type': 'text/html'}
        return make_response(render_template('index.html'), 200, headers)
