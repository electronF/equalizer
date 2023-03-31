import os
import tornado.web
import tornado.autoreload
import asyncio

from tornado_sqlalchemy import SQLAlchemy

import settings

PORT = 8888

def make_app():
    return tornado.web.Application(
        [
            (r'.', IndexHandler),
            (r'/editorial/*', EditorialHomeHandler),
            (r'/editorial/home', EditorialHomeHandler),
            (r'/editorial/article', ArticleWriterHandler),
            (r"/images/profiles/(.*)", 
                tornado.web.StaticFileHandler, 
                {'path': os.path.join(".", "data", "users", "images", "profiles")}
            ),
            (r"/images/miniatures/(.*)", 
                tornado.web.StaticFileHandler, 
                {'path': os.path.join(".", "data", "users", "images", "miniatures")}
            ),
            (r"/images/covers/(.*)", 
                tornado.web.StaticFileHandler, 
                {'path': os.path.join(".", "data", "users", "images", "covers")}
            ),
        ],
        **(settings.SETTINGS))

async def main():
    app = make_app()
    app.listen(PORT)
    print(f"I am listen on port: {PORT}")

    shutdown_event = asyncio.Event()
    await shutdown_event.wait()




if __name__ == "__main__":
    asyncio.run(main())
    autoreload_files()
    # tornado.ioloop.IOLoop.current().start()
