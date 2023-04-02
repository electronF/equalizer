from datetime import datetime as dt

from sqlalchemy import (
    Column, Integer,
    String, DateTime,
    ForeignKey
)

from sqlalchemy.orm import (
    relationship, backref
)

from marshmallow_sqlalchemy import auto_field

from ..configs import db, ma


class User(db.Model):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True)
    full_name = Column(String, nullable=True)
    created_at = Column(DateTime, default=dt.now())

    def __repr__(self) -> str:
        return """User(
            id={}, full_name='{}', create_at='{}')""".format(
            self.id, self.full_name, self.created_at
        )


class UserSchema(ma.SQLAlchemySchema):
    class Meta:
        model = User
        load_instance = True #Optional: deserialize to model instance
    id = auto_field()
    full_name = auto_field()
    created_at = auto_field()