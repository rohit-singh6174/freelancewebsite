import email
from pydoc import describe

from sqlalchemy import null
from freelancer import db,login_manager #login_manager # it will look from _init_ file by default in that it will look for db variable if it there it will import   
from datetime import date
from flask_login import UserMixin
from flask import url_for, redirect


@login_manager.user_loader
def load_user(user_id):
    return Students.query.get(user_id)

@login_manager.unauthorized_handler
def unauthorized():
    return redirect(url_for('studentlogin'))


class Students(db.Model,UserMixin):
    id =db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(40),unique=False,nullable=False)
    email=db.Column(db.String(40),unique=True,nullable=False)
    phone=db.Column(db.BigInteger,unique=True,nullable=False)
    location=db.Column(db.String(20),unique=False,nullable=False)
    college=db.Column(db.String(40),unique=False,nullable=False)
    department=db.Column(db.String(40),unique=False,nullable=False)
    username=db.Column(db.String(20),unique=True,nullable=False)
    password=db.Column(db.String(255),nullable=False)

    def __repr__(self):
        return f'\nname :{self.name},\nemail : {self.email},\nphone : {self.phone},\nlocation : {self.location},\ncollege : {self.college},\ndepartment : {self.department},\nusername : {self.username},\npassword : {self.password} \n'

class Students_Details(db.Model):
    id =db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(40),unique=False,nullable=False)
    email=db.Column(db.String(40),unique=True,nullable=False)
    phone=db.Column(db.BigInteger,unique=True,nullable=False)
    college=db.Column(db.String(40),unique=False,nullable=False)

    def __repr__(self):
        return f'\nname :{self.name},\nemail : {self.email},\nphone : {self.phone},\ncollege : {self.college}'


class Members(db.Model):
    id =db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(40),unique=False,nullable=False)
    email=db.Column(db.String(40),unique=True,nullable=False)
    phone=db.Column(db.BigInteger,unique=True,nullable=False)
    companyname=db.Column(db.String(40),unique=False,nullable=False)
    location=db.Column(db.String(20),unique=False,nullable=False)
    username=db.Column(db.String(20),unique=True,nullable=False)
    password=db.Column(db.String(255),nullable=False)

    def __repr__(self):
        return f'\nname :{self.name},\nemail : {self.email},\nphone : {self.phone},\nlocation : {self.location},\nusername : {self.username},\npassword : {self.password} \n'


class Freelancing(db.Model):
     id =db.Column(db.Integer,primary_key=True)
     title=db.Column(db.String(255),unique=False,nullable=False)
     company=db.Column(db.String(40),unique=False,nullable=False)
     description=db.Column(db.String(4096),unique=False,nullable=False)
     skillrequired=db.Column(db.String(100),unique=False,nullable=False)
     criteria=db.Column(db.String(100),unique=False,nullable=False)
     location=db.Column(db.String(20),unique=False,nullable=False)
     freelance=db.Column(db.String(20),unique=False,nullable=False)
     workmod=db.Column(db.String(20),unique=False,nullable=False)
     start_date=db.Column(db.Date,nullable=False)
     duration=db.Column(db.String(40),unique=False,nullable=False)
     stipend=db.Column(db.String(40),unique=False,nullable=False)

     def __repr__(self):
         return f'\id :{self.id}, \ntitle: {self.title},\ncompany: {self.company},\ndescription: {self.description},\n skillrequired: {self.skillrequired},\ncriteria : {self.criteria} ,\location: {self.location}, \n freelance : {self.freelance},\nworkmod : {self.workmod} \nstart_date : {self.start_date}, \nduration : {self.duration}, \nstipend : {self.stipend}\n'

class EnrolledFreelancing(db.Model):
     id =db.Column(db.Integer,primary_key=True)
     stud_name=db.Column(db.String(40),unique=False,nullable=False)
     stud_email=db.Column(db.String(40),unique=False,nullable=False)
     pdf=db.Column(db.String(255),unique=False,nullable=False)
     title=db.Column(db.String(255),unique=False,nullable=False)
     company=db.Column(db.String(40),unique=False,nullable=False)
     location=db.Column(db.String(20),unique=False,nullable=False)
     freelance=db.Column(db.String(20),unique=False,nullable=False)
     workmod=db.Column(db.String(20),unique=False,nullable=False)
     start_date=db.Column(db.Date,nullable=False)
     duration=db.Column(db.String(40),unique=False,nullable=False)
     stipend=db.Column(db.String(40),unique=False,nullable=False)

     def __repr__(self):
         return f'\id :{self.id},\nname :{self.stud_name},\nemail : {self.stud_email} ,\ntitle: {self.title},\ncompany: {self.company},\nstart_date : {self.start_date}, \nduration : {self.duration}, \nstipend : {self.stipend}\n'


class ApprovedFreelancing(db.Model):
     id =db.Column(db.Integer,primary_key=True)
     stud_name=db.Column(db.String(40),unique=False,nullable=False)
     stud_email=db.Column(db.String(40),unique=False,nullable=False)
     title=db.Column(db.String(255),unique=False,nullable=False)
     company=db.Column(db.String(40),unique=False,nullable=False)
     location=db.Column(db.String(20),unique=False,nullable=False)
     freelance=db.Column(db.String(20),unique=False,nullable=False)
     workmod=db.Column(db.String(20),unique=False,nullable=False)
     start_date=db.Column(db.Date,nullable=False)
     duration=db.Column(db.String(40),unique=False,nullable=False)
     stipend=db.Column(db.String(40),unique=False,nullable=False)

     def __repr__(self):
         return f'\id :{self.id},\nname :{self.stud_name},\nemail : {self.stud_email} ,\ntitle: {self.title},\ncompany: {self.company},\nstart_date : {self.start_date}, \nduration : {self.duration}, \nstipend : {self.stipend}\n'

class CompletedFreelancing(db.Model):
     id =db.Column(db.Integer,primary_key=True)
     stud_name=db.Column(db.String(40),unique=False,nullable=False)
     stud_email=db.Column(db.String(40),unique=False,nullable=False)
     title=db.Column(db.String(255),unique=False,nullable=False)
     company=db.Column(db.String(40),unique=False,nullable=False)
     location=db.Column(db.String(20),unique=False,nullable=False)
     freelance=db.Column(db.String(20),unique=False,nullable=False)
     workmod=db.Column(db.String(20),unique=False,nullable=False)
     start_date=db.Column(db.Date,nullable=False)
     completion_date=db.Column(db.Date,nullable=False)
     stipend=db.Column(db.String(40),unique=False,nullable=False)

     def __repr__(self):
         return f'\id :{self.id},\nname :{self.stud_name},\nemail : {self.stud_email} ,\ntitle: {self.title},\ncompany: {self.company},\nstart_date : {self.start_date}, \Completion_date : {self.completion_date}, \nstipend : {self.stipend}\n'

class CompletionCertificate(db.Model):
    id =db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(40),unique=False,nullable=False)
    email=db.Column(db.String(40),unique=False,nullable=False)
    title=db.Column(db.String(255),unique=False,nullable=False)
    company=db.Column(db.String(40),unique=False,nullable=False)
    freelance=db.Column(db.String(20),unique=False,nullable=False)
    workmod=db.Column(db.String(20),unique=False,nullable=False)
    start_date=db.Column(db.Date,nullable=False)
    completion_date=db.Column(db.Date,nullable=False)
    stipend=db.Column(db.String(40),unique=False,nullable=False)
    pdf = db.Column(db.String(50),unique=True,nullable=False)

    def __repr__(self):
         return f'\id :{self.id},\nname :{self.name},\nemail : {self.email} ,\ntitle: {self.title},\nstart_date : {self.start_date}, \Completion_date : {self.completion_date}, \nstipend : {self.stipend}\nself: {self.pdf}\n'

    
