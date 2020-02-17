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
from oracli_api.controllers.user import User
from oracli_api.controllers.mentees import Mentees
from oracli_api.controllers.mentors import Mentors

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

    mentors = db.mentors
    mentees = db.mentees
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
# mentors route
api.add_resource(Mentors, '/mentors')
# mentees route
api.add_resource(Mentees, '/mentees')
