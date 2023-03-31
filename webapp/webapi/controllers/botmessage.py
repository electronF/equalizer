import os
import tornado.web
import tornado.autoreload
import asyncio

from tornado_sqlalchemy import SQLAlchemy


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")
    
    def create():
        pass

    def update():
        pass

    def delete():
        pass