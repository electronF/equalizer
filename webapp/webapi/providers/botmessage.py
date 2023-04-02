import os
import datetime
import tornado.web

from typing import Dict

from ..models.message import Message, MessageSchema


class BotMessageProviderHandler(tornado.web.RequestHandler):
    def get(self, search_text:Dict[str, object]=None):
        # connect to chat gpt here
        message = Message()
        message.datetime = datetime.datetime.now()
        message.sender_id = 1
        message.text = "Super"

        print(f"message: {search_text}")

        message_schema = MessageSchema()
        out = message_schema.dumps(message)

        self.write(out)
    
    def post():
        pass

    def update():
        pass

    def delete():
        pass