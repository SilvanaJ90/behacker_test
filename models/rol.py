#!/usr/bin/python
""" holds class Rol"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship


class Rol(BaseModel, Base):
    """Representation of Rol """
    if models.storage_t == 'db':
        __tablename__ = 'roles'
        name = Column(String(128), nullable=False)
        users = relationship("User", backref="user")
    else:
        name = ""

    def __init__(self, *args, **kwargs):
        """initializes Rol"""
        super().__init__(*args, **kwargs)
