from oracli_api.models import user
from oracli_api.models import mentor

import uuid

import oracli_api


class Mentor(user.User):
    def __init__(self, name, age, gender, email=None, password=None):
        super().__init__(name, age, gender, email, password)
        self.is_mentor = True
        self.mentees = []
        self.job_experience = ""

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
            "mentees": self.mentees,
            "job_experience": self.job_experience
        }

    def save_new(self):
        oracli_api.users.insert_one(self.serialize())
