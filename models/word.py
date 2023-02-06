#!/usr/bin/python
""" holds class Word"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.orm import relationship


class Word(BaseModel, Base):
    """Representation of Word """
    if models.storage_t == "db":
        
        __tablename__ = 'words'
        id = Column(String(60), primary_key=True)
        category_id = Column(String(60), ForeignKey('categories.id'), nullable=False)
        name = Column(String(128), nullable=False)

    else:
        name = ""

    def __init__(self, *args, **kwargs):
        """initializes Word"""
        super().__init__(*args, **kwargs)
