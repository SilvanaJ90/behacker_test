#!/usr/bin/python3
""" holds class Category"""
import models
from models.base_model import BaseModel, Base
from models.word import Word
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey
from sqlalchemy.orm import relationship


class Category (BaseModel, Base):
    """Representation of categories"""
    if models.storage_t == "db":
        __tablename__ = 'categories'
        name = Column(String(128), nullable=False)
        description = Column(String(128), nullable=True)
        file = Column(String(128), nullable=True)
        words = relationship("Word",
                              backref="categories",
                              cascade="all, delete, delete-orphan")
    else:
        name = ""
        description = ""
        file = ""

    def __init__(self, *args, **kwargs):
        """initializes categories"""
        super().__init__(*args, **kwargs)

    if models.storage_t != "db":
        @property
        def words(self):
            """getter for list of words instances related to the categories"""
            word_list = []
            all_words = models.storage.all(Word)
            for word in all_words.values():
                if word.categories_id == self.id:
                    word_list.append(Word)
            return word_list
