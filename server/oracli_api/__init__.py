from flask import Flask, jsonify
from flask_restful import Api
from oracli_api.controllers.hello import HelloRoute
from pymongo import MongoClient
import os
from dotenv import load_dotenv
load_dotenv()

# application instantiation
app = Flask("api")
# api instantiation
api = Api(app)
# app config from config
app.config.from_object(os.getenv('APP_SETTINGS'))
# mongodb stuff
try:
    client = MongoClient(host=os.getenv('DATABASE_URL'))
    db = client.get_default_database()
    # TODO: Add collections here :)
    # for example: user = db.user
except Exception as e:
    print(e)

# TODO: Add api resources here
api.add_resource(HelloRoute, '/')
