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
        id = Column(String(60), primary_key=True)
        name = Column(String(128), nullable=False)
        users = relationship("User",
                        backref="rol",
                        cascade="all, delete, delete-orphan")
    else:
        name = ""

    def __init__(self, *args, **kwargs):
        """initializes Rol"""
        super().__init__(*args, **kwargs)
