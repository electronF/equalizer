import os
import tornado.web
import tornado.autoreload
import asyncio

from tornado_sqlalchemy import SQLAlchemy

import settings

PORT = 8888

from webapi.providers.user import UserProviderHandler
from webapi.providers.asset import AssetsProviderHandler
from webapi.providers.botmessage import BotMessageProviderHandler
from webapi.providers.search import SearchProviderHandler
from webapi.providers.organization import OrganizationsProviderHandler



def make_app():
    return tornado.web.Application(
        [
            # (r'.', IndexHandler),
            (r'/api/user/*', UserProviderHandler),
            (r'/api/botmessage/*', BotMessageProviderHandler),
            (r'/api/asset/*', AssetsProviderHandler),
            (r'/api/search/*', SearchProviderHandler),
            (r'/api/organization/*', OrganizationsProviderHandler)
        ],
        **(settings.SETTINGS))

async def main():
    app = make_app()
    app.listen(port=PORT, address="localhost")
    print(f"I am listen on port: {PORT}")

    shutdown_event = asyncio.Event()
    await shutdown_event.wait()




if __name__ == "__main__":
    asyncio.run(main())
    autoreload_files()
    # tornado.ioloop.IOLoop.current().start()
