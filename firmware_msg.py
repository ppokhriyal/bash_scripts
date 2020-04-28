#!/usr/bin/python
#Author : VXL Software
#PyGtk Firmware Error message box

import gtk
import sys

class PyApp(gtk.Window):

	def __init__(self):
		super(PyApp,self).__init__()

		self.set_position(gtk.WIN_POS_CENTER)
		self.set_size_request(450,150)
		self.set_title("Error : Firmware Update")
		message = gtk.Label(str(sys.argv[1]))
		self.connect("delete_event",self.delete_event)
		self.add(message)
		self.show_all()

	def delete_event(self,widget,event,donnees=None):
		gtk.main_quit()
		return False

PyApp()
gtk.main()

