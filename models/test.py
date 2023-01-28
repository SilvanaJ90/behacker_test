#!/usr/bin/python
""" holds class Test"""
import models
from models.base_model import BaseModel, Base
from os import getenv
import sqlalchemy
from sqlalchemy import Column, String, Integer, Float, ForeignKey, Table
from sqlalchemy.orm import relationship

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
    """Representation of Test """
    if models.storage_t == 'db':
        __tablename__ = 'test'
        user_id = Column(String(60), ForeignKey('users.id'), nullable=False)
        name = Column(String(128), nullable=False)
        result = Column(Integer, nullable=True)

    else:
        user_id = ""
        name = ""
        result = ""
        words_ids = []

    def __init__(self, *args, **kwargs):
        """initializes Test"""
        super().__init__(*args, **kwargs)


