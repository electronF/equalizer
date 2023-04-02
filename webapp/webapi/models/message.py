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


class Message(db.Model):
    __tablename__ = "messages"

    id = Column(Integer, primary_key=True)
    datetime = Column(DateTime, default=dt.now())
    sender_id = Column(String, ForeignKey("users.id"))
    text = Column(String, nullable=True) #nullable=True
    image_path = Column(String, nullable=True)
    video_path = Column(String, nullable=True)
    audio_path = Column(String, nullable=True)
    document_path = Column(String, nullable=True)

    def __repr__(self) -> str:
        return """Message(
            id={}, datetime='{}', serder_id='{}',
            text='{}', image_path='{}', video_path={},
            audio_path='{}', document_path='{}' 
            )""".format(
            self.id, self.datetime, self.sender_id,
            self.text, self.image_path, self.video_path,
            self,audio_path, self.document_path
        )


class MessageSchema(ma.SQLAlchemySchema):
    class Meta:
        model = Message
        load_instance = True #Optional: deserialize to model instance
    id = auto_field()
    datetime = auto_field()
    sender_id = auto_field()
    text = auto_field()
    image_path = auto_field()
    video_path = auto_field()
    audio_path = auto_field()
    document_path = auto_field()
