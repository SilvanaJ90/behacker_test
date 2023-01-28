#!/usr/bin/python
""" holds class Word"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, Integer
from sqlalchemy.orm import relationship


class Word(BaseModel, Base):
    """Representation of words"""
    if models.storage_t == "db":
        __tablename__ = 'words'
        categories_id = Column(String(60), ForeignKey('categories.id'), nullable=False)
        name = Column(String(50), nullable=False)

    else:
        categories_id = ""
        name = ""

    def __init__(self, *args, **kwargs):
        """initializes word"""
        super().__init__(*args, **kwargs)
