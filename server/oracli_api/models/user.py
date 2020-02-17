"""User model"""

import uuid

import oracli_api


class User(object):
    def __init__(self, name, age, gender, email=None, password=None):
        self.name = name
        self.age = age
        self.is_mentor = None
        self.gender = ""
        self.email = email
        self.password = password
        self.about_you = ""
        self.areas_of_interest = ""
