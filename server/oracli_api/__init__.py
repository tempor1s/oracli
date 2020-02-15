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
    client = MongoClient(host=f'{os.getenv('DATABASE_URL')}?authSource=admin')

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
