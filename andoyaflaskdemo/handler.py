from andoyawsgi import Adapter

from .app import app

handle = Adapter(app)
