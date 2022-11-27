
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
import os
from distutils.command.upload import upload
import email
from fileinput import filename
from importlib.metadata import files


app = Flask(__name__)
app.config['SECRET_KEY']='thisiswebsite'
app.config['SQLALCHEMY_DATABASE_URI'] ='mysql://root:''@localhost/freelancer'
app.config['SQLALCHEMY_TRACK_MODIFICATION']=False

app.config['UPLOAD_FOLDER']="freelancer\static\pdf"






db=SQLAlchemy(app)
bcrypt=Bcrypt(app)
login_manager =LoginManager(app)

from freelancer import routes