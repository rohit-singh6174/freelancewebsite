from flask import Flask
from flask_wtf import FlaskForm
from wtforms import StringField,PasswordField,SubmitField,SelectField,DateField,TextAreaField,FileField
from wtforms.validators import DataRequired,Length,EqualTo,Email
from flask_wtf.file import FileField, FileRequired,FileAllowed
from fileinput import filename
from importlib.metadata import files

import freelancer

location=[('Ahmednaga','Ahmednaga'),
('Akola','Akola'),
('Aurangabad','Aurangabad'),
('Bhandara','Bhandara'),
('Buldhana','Buldhana'),
('Chandrapur','Chandrapur'),
('Mumbai City','Mumbai City'),
('Mumbai Suburban','Mumbai Suburban')
]  


freelancing=[('Web Development','Web Development'),
('Mobile Application Development','Mobile Application Development'),
('Software Development','Software Development'),
('Graphics Design','Graphics Design'),
('Artificial Intelligence','Artificial Intelligence'),
('Networking','Networking'),
('Security','Security'),
('Cloud Computing','Cloud Computing')
] 

workingmod=[
('Online','Online'),
('Offline','Offline'),
('Hybrid','Hybrid')
]

freelanceduration=[
    ('1 Month','1 Month'),
    ('2 Month','2 Month'),
    ('3 Month','3 Month'),
    ('6 Month','6 Month'),
    ('9 Month more','9 Month more'),
]

class StudentRegForm(FlaskForm):
    name = StringField('name',validators=[DataRequired(),Length(min=3,max=20)])
    email= StringField('Email',validators=[DataRequired(),Email()])
    phone= StringField('phone',validators=[DataRequired(),Length(min=10,max=10)])
    college=StringField('college',validators=[DataRequired(),Length(min=2,max=100)])
    department=StringField('department',validators=[DataRequired(),Length(min=2,max=30)])
    location=SelectField('location',choices=location)
    username = StringField('Username',validators=[DataRequired(),Length(min=3,max=20)])
    password=PasswordField('Password',validators=[DataRequired(),Length(min=6,max=20)])
    confirm_password= PasswordField('Confirm Password',validators=[DataRequired(),EqualTo('password')])

    submit=SubmitField(label='Sign Up')

class StudentLoginform(FlaskForm):
    username = StringField('Username',validators=[DataRequired(),Length(min=3,max=20)])
    password=PasswordField('Password',validators=[DataRequired(),Length(min=6,max=20)])
    submit=SubmitField(label='Login')


class MemberRegForm(FlaskForm):
    name = StringField('name',validators=[DataRequired(),Length(min=3,max=20)])
    email= StringField('Email',validators=[DataRequired(),Email()])
    phone= StringField('phone',validators=[DataRequired(),Length(min=10,max=10)])
    companyname = StringField('companyname',validators=[DataRequired(),Length(min=2,max=50)])
    location=SelectField('location',choices=location)
    username = StringField('Username',validators=[DataRequired(),Length(min=3,max=20)])
    password=PasswordField('Password',validators=[DataRequired(),Length(min=6,max=20)])
    confirm_password= PasswordField('Confirm Password',validators=[DataRequired(),EqualTo('password')])
    submit=SubmitField(label='Sign Up')


class MemberLoginForm(FlaskForm):
    username = StringField('Username',validators=[DataRequired(),Length(min=3,max=20)])
    password=PasswordField('Password',validators=[DataRequired(),Length(min=6,max=20)])
    submit=SubmitField(label='Login')


class AddFreelancingForm(FlaskForm):
    title=StringField('title',validators=[DataRequired(),Length(min=5,max=255)])
    company=StringField('company',validators=[DataRequired(),Length(min=2,max=40)])
    description=TextAreaField('description',validators=[DataRequired(),Length(min=10,max=4096)],render_kw={"rows": 70, "cols": 11})
    skillrequired=StringField('skillrequired',validators=[DataRequired(),Length(min=3,max=100)])
    criteria=StringField('criteria',validators=[DataRequired(),Length(min=3,max=500)])
    location=SelectField('location',choices=location)
    freelance=SelectField('location',choices=freelancing)
    workmod=SelectField('workmod',choices=workingmod)
    start_date=DateField('Start Date',format='%Y-%m-%d')
    duration=SelectField('duration',choices=freelanceduration)
    stipend=StringField('stipend',validators=[DataRequired(),Length(min=3,max=7)])
    submit=SubmitField(label='Post Freelancing')


class ApplyFreelance(FlaskForm):
    name = StringField('name',validators=[DataRequired(),Length(min=3,max=20)])
    email= StringField('Email',validators=[DataRequired(),Email()])
    pdf= FileField('pdf', validators=[FileRequired(), FileAllowed(['pdf'], 'PDF Only !')])
    submit=SubmitField(label='Upload')


class Give_certficate(FlaskForm):
  email= StringField('Email',validators=[DataRequired(),Email()])
  name = StringField('name',validators=[DataRequired(),Length(min=3,max=20)])
  pdf = FileField()
  submit=SubmitField(label='Upload')
