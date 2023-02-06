#!/usr/bin/python3
""" holds class Category"""
import models
from models.base_model import BaseModel, Base
from models.word import Word
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.orm import relationship


class Category(BaseModel, Base):
    """Representation of Category """
    if models.storage_t == "db":
        __tablename__ = 'categories'
        id = Column(String(60), primary_key=True)
        name = Column(String(128), nullable=False)
        description = Column(String(128), nullable=True)
        file_name = Column(String(128), nullable=True)
        words= relationship("Word",
                              backref="categories",
                              cascade="all, delete, delete-orphan")
    else:
        name = ""
        description = ""
        file_name = ""

    def __init__(self, *args, **kwargs):
        """initializes category"""
        super().__init__(*args, **kwargs)

    if models.storage_t != "db":
        @property
        def categories(self):
            """getter for list of word instances related to the category"""
            word_list = []
            all_categories = models.storage.all(Word)
            for word in all_categories.values():
                if word.category_id == self.id:
                    word_list.append(word)
            return word_list
