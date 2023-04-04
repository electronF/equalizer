import os
import datetime
import tornado
import tornado.web

from typing import Dict

from ..models.message import Message, MessageSchema

import json


class BotMessageProviderHandler(tornado.web.RequestHandler):
    def get(self, search_text:Dict[str, object]=None):
       
        a = self.request.body.decode().split('\r\n')[3]
        print(json.loads(a))
        message = Message()
        message.datetime = datetime.datetime.now()
        message.sender_id = 1
        message.text = "Super"

        message_schema = MessageSchema()
        out = message_schema.dumps(message)

        self.write(out)
    
    def post():
        pass

    def update():
        pass

    def delete():
        pass