from flask import Flask, jsonify
from flask_restful import Api
from pymongo import MongoClient
import os
from dotenv import load_dotenv

# import controllers
from oracli_api.controllers.hello import HelloRoute
from oracli_api.controllers.login import Login
from oracli_api.controllers.register import Register
from oracli_api.controllers.test import Test
from oracli_api.controllers.user import User, Matched
from oracli_api.controllers.mentees import Mentees
from oracli_api.controllers.mentors import Mentors, AddMentee, RemoveMentee

# load environment variables
load_dotenv()
# application instantiation
app = Flask("api")
# api instantiation
api = Api(app)
# app config from config
app.config.from_object(os.getenv('APP_SETTINGS'))
# mongodb stuff
try:
    host = os.environ.get('DATABASE_URL', 'mongodb://db:27017/oracli')
    client = MongoClient(host=f'{host}?authSource=admin')

    db = client.get_default_database()

    users = db.users
except Exception as e:
    print(e)

# Home Route - TODO: Add homepage here
api.add_resource(HelloRoute, '/')

# Authentication Routes
# api.add_resource(TokenAuth, '/token')
api.add_resource(Login, '/login')
# Signup Route
api.add_resource(Register, '/register')
# test route
api.add_resource(Test, '/test')
# user route
api.add_resource(User, '/user')
# route to check to make sure a user is matched
api.add_resource(Matched, '/user/matched')
# mentors route
api.add_resource(Mentors, '/mentors')
# add a mentee to a mentor
api.add_resource(AddMentee, '/mentors/add/<string:mentee_id>')
# remove a mentee from a mentor
api.add_resource(RemoveMentee, '/mentors/remove/<string:mentee_id>')
# mentees route
api.add_resource(Mentees, '/mentees')
