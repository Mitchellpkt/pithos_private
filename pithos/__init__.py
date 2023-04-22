import os
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gio

resource_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../data/gresource')
resource = Gio.Resource.load(resource_path)
Gio.resources_register(resource)
