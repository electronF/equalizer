import os
import datetime
import tornado
import tornado.web
import time
from typing import Dict

from ..models.message import Message, MessageSchema

import json


class BotMessageProviderHandler(tornado.web.RequestHandler):
    def get(self, search_text:Dict[str, object]=None):

        query_data = json.loads(self.request.body.decode().split('\r\n')[3])
        out_message = ""

        if("bonjour" in query_data['text'].lower()):
            out_message = "Bonjour! Je suis le bot de nom equalizer. Si vous avez des questions n'hesitez pas a les poser. Je ferai de mon mieux pour vous satisfaire"
        elif("Comment tu vas? " in  query_data['text'].lower()):
            out_message = "Bien merci de vous en preocuper. Mes circuits vont bien. Et vous?"
        elif("bien" in query_data['text'].lower()):
            out_message = "Super! Comment pourrai je vous aider?"
        elif ("question".lower() in query_data['text'].lower() or 'probleme' in query_data['text'].lower()):
            out_message = "Okay! Allez y! Qu'est ce qui vous preoccupe? Essayez d'etre explicite afin de m'aider a comprendre"
        else:
            out_message = "Oops! Je ne comprend pas voulez vous renvoyer votre message?"
        
        time.sleep(.25)
        
        message = Message()
        message.datetime = datetime.datetime.now()
        message.sender_id = 1
        message.text = out_message
        message_schema = MessageSchema()
        out = message_schema.dumps(message)
        self.write(out)
    
    def post():
        pass

    def update():
        pass

    def delete():
        pass