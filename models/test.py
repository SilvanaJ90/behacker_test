#!/usr/bin/python
""" holds class test"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, ForeignKey, Integer, DateTime, Table
from sqlalchemy.orm import relationship
from datetime import datetime


if models.storage_t == 'db':
    user_test = Table('user_test', Base.metadata,
                          Column('words_id', String(60),
                                 ForeignKey('words.id', onupdate='CASCADE',
                                            ondelete='CASCADE'),
                                 primary_key=True),
                          Column('test_id', String(60),
                                 ForeignKey('test.id', onupdate='CASCADE',
                                            ondelete='CASCADE'),
                                 primary_key=True))

class Test(BaseModel, Base):
    """Representation of tests """
    if models.storage_t == 'db':
        __tablename__ = 'test'
        id = Column(String(60), primary_key=True)
        user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
        name = Column(String(1024), nullable=False)
        result = Column(Integer, nullable=True)
        created_at = Column(DateTime, default=datetime.utcnow)
        updated_at = Column(DateTime, default=datetime.utcnow)
        words = relationship("Word",
                                 secondary=user_test,
                                 viewonly=False)
        
    else:
        name = ""
        result = ""
        words_ids = []

    def __init__(self, *args, **kwargs):
        """initializes tests"""
        super().__init__(*args, **kwargs)

        @property
        def words(self):
            """getter attribute returns the list of word instances"""
            from models.word import Word
            word_list = []
            all_words = models.storage.all(Word)
            for word in all_words.values():
                if word.place_id == self.id:
                    word_list.append(word)
            return word_list
