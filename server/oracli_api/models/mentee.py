from oracli_api.models import user

import uuid

import oracli_api


class Mentee(user.User):
    def __init__(self, name, age, gender, email=None, password=None):
        super().__init__(name, age, gender, email, password)
        self.is_mentor = False
        self.mentor = None
        self.why_mentor = ""

    def serialize(self):
        return {
            "name": self.name,
            "age": self.age,
            "is_mentor": self.is_mentor,
            "gender": self.gender,
            "email": self.email,
            "password": self.password,
            "about": self.about_you,
            "interests": self.areas_of_interest,
            "mentor": self.mentor,
            "why_mentor": self.why_mentor
        }

    def save_new(self):
        oracli_api.mentees.insert_one(self.serialize())
