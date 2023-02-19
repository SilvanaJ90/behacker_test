#!/usr/bin/python3
""" holds class User"""

import models
from models.base_model import Base, BaseModel
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, Boolean
from sqlalchemy.orm import relationship
from hashlib import md5
from datetime import datetime, timedelta
import jwt
from flask import current_app
from werkzeug.security import generate_password_hash, check_password_hash


class User(BaseModel, Base):
    """Representation of a user """
    if models.storage_t == 'db':
        __tablename__ = 'users'
        id = Column(String(60), primary_key=True)
        email = Column(String(128), nullable=False)
        password = Column(String(128), nullable=False)
        first_name = Column(String(128), nullable=True)
        last_name = Column(String(128), nullable=True)
        is_user = Column(Boolean, default=True)
        test = relationship("Test",
                        backref="users",
                        cascade="all, delete, delete-orphan")

    else:
        is_user = ""
        email = ""
        password = ""
        first_name = ""
        last_name = ""


    @property
    def password(self):
        raise AttributeError('password is not a readable attribute')

    @password.setter
    def password(self, password):
        self.password_hash = generate_password_hash(password)

    def verify_password(self, password):
        return check_password_hash(self.password_hash, password)



    def __init__(self, *args, **kwargs):
        """initializes user"""
        super().__init__(*args, **kwargs)

    def __setattr__(self, name, value):
        """sets a password with md5 encryption"""
        if name == "password":
            value = md5(value.encode()).hexdigest()
        super().__setattr__(name, value)

