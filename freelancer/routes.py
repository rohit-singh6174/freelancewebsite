
from datetime import date
import email
from unicodedata import name

from fileinput import filename
from importlib.metadata import files
from matplotlib.pyplot import title
from freelancer import app,db,bcrypt

from freelancer.forms import StudentRegForm,StudentLoginform,MemberRegForm,MemberLoginForm,AddFreelancingForm,ApplyFreelance,Give_certficate
from freelancer.models import Members, Students,Students_Details,Freelancing,EnrolledFreelancing,ApprovedFreelancing,CompletedFreelancing,CompletionCertificate
from flask import Flask,render_template,url_for,redirect,flash,session,request
from flask_login import login_user,logout_user,current_user,login_required


from fileinput import filename
from importlib.metadata import files

from werkzeug.utils import secure_filename
import os

from flask import make_response
import pdfkit
from sqlalchemy import func
from sqlalchemy import create_engine, MetaData, Table,Column, Numeric, Integer, VARCHAR
from sqlalchemy.engine import result
from sqlalchemy import desc

@app.route("/")
@app.route("/index")
def index():
    return render_template('index.html')


@app.route("/studentregister", methods=['POST','GET'])
def studentregister():
    form=StudentRegForm()
    if form.validate_on_submit():
        print("Hello register ON")
        if current_user.is_authenticated:
         return redirect(url_for('studenthome'))
        
        stud_email= Students_Details.query.filter_by(email=form.email.data).first()
        if stud_email:
            if stud_email.college == form.college.data:
                student=Students.query.filter_by(username=form.username.data).first()
                if student:
                    flash(f'User {form.username.data} Already Exist',category='danger')
                else:
                    encrypted_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
                    newStudent=Students(name=form.name.data,email=form.email.data,phone=form.phone.data,college=form.college.data,department=form.department.data,location=form.location.data,username=form.username.data,password=encrypted_password)
                    db.session.add(newStudent)
                    db.session.commit()
                    flash(f'Account created successfully for {form.username.data}',category='success')
                    return redirect(url_for('studentlogin'))
            else:
                flash(f'College email does not matched',category='danger')
        else:
         flash(f'Invalid Registration{form.email.data}',category='danger')

    
    return render_template('studentregister.html',form=form)

        

@app.route("/studentlogin", methods=['POST','GET'])
def studentlogin():
   
    if current_user.is_authenticated:
        return redirect(url_for('studenthome'))
    form=StudentLoginform()
    if form.validate_on_submit():
        print("hello login")
        student=Students.query.filter_by(username=form.username.data).first()
        if student and bcrypt.check_password_hash(student.password,form.password.data):
            login_user(student)
            print("Login Successfull")
            return redirect(url_for('studenthome'))
        else:
            flash(f'Account Denied {form.username.data}',category='danger')

    return render_template('studentlogin.html',form=form)


@app.route("/studentlogout")
def studentlogout():
    logout_user()
    return redirect(url_for('studentlogin'))


@app.route("/studenthome")
def studenthome():
    username=current_user.username
    print(username)
    student=Students.query.filter_by(username=current_user.username).first()
    viewcert=CompletionCertificate.query.filter_by(email=student.email).all()

    viewwork=ApprovedFreelancing.query.filter_by(stud_email=student.email).all()
    

    return render_template('studenthome.html',user=student,viewcert=viewcert,viewwork=viewwork)



@app.route('/webfreelancing')
def webfreelancing():
    f="Web Development"
    username=current_user.username
    student=Students.query.filter_by(username=current_user.username).first()
    freelancing_list=Freelancing.query.filter_by(freelance="Web Development").order_by(desc(Freelancing.id)).all()

    # print(freelancing_list)
    return render_template('webfreelancing.html',user=student,freelancing_list=freelancing_list,f=f)


@app.route('/mobileapplication')
def mobileapplication():
    f="Mobile Application Development"
    username=current_user.username
    student=Students.query.filter_by(username=current_user.username).first()
    freelancing_list=Freelancing.query.filter_by(freelance="Mobile Application D").order_by(desc(Freelancing.id)).all()

    # print(freelancing_list)
    return render_template('mobileapplication.html',user=student,freelancing_list=freelancing_list,f=f)




@app.route('/freelanceview/<freelance_id>', methods=['POST','GET'])
def freelancview(freelance_id):
    form=ApplyFreelance()
    username=current_user.username
    student=Students.query.filter_by(username=current_user.username).first()
    freelance_view=Freelancing.query.filter_by(id=freelance_id).first()
 
    if form.validate_on_submit():
        print("Hello freelancing add")
        email=form.email.data
        print(email)
        file = form.pdf.data
        print(file)
        filename = secure_filename(file.filename)
        print(filename)
        
        
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        
        enroll=EnrolledFreelancing(stud_name=form.name.data,stud_email=form.email.data,pdf=filename,title=freelance_view.title,company=freelance_view.company,location=freelance_view.location,freelance=freelance_view.freelance,workmod=freelance_view.workmod,start_date=freelance_view.start_date,duration=freelance_view.duration,stipend=freelance_view.stipend)
        
        db.session.add(enroll)
        db.session.commit()

        print("Enroll Sucessfull")
        form.name.data=""
        form.email.data=""
        form.pdf.data=""


    return render_template('viewjob.html',form=form,user=student,freelance_view=freelance_view)







#Members
@app.route("/memberregister", methods=['POST','GET'])
def memberregister():
    form=MemberRegForm()
    if form.validate_on_submit():
        mem=Members.query.filter_by(username=form.username.data).first()
        if mem:
             flash(f'Account Already created for {form.username.data}',category='danger')
        else:
            encrypted_password = bcrypt.generate_password_hash(form.password.data).decode('utf-8')
            member=Members(name=form.name.data,email=form.email.data,phone=form.phone.data,companyname=form.companyname.data,location=form.location.data,username=form.username.data,password=encrypted_password)
            db.session.add(member)
            db.session.commit()
            flash(f'Account created successfully for {form.username.data}',category='success')
            return redirect(url_for('memberlogin'))

    return render_template('memberregister.html',form=form)



@app.route("/memberlogin", methods=['POST','GET'])
def memberlogin():
    form=MemberLoginForm()
    if form.validate_on_submit():
        member=Members.query.filter_by(username=form.username.data).first()
        if member and bcrypt.check_password_hash(member.password,form.password.data):
            session['name']=member.name
            session['email']=member.email
            session['username']=member.username
            session['companyname']=member.companyname
            
            flash(f'{form.username.data} login Successfully ',category='success')
            return redirect(url_for('memberaccount'))
        
        else:
            if 'username' in session:
                flash(f'{form.username.data} login Successfully ',category='success')
                return redirect(url_for('memberaccount'))
            else:
                flash(f'{form.username.data} login Unsuccessfully ',category='danger')
        
    return render_template('memberlogin.html', form=form)



@app.route("/homemember")
def homemember():
   if 'username' in session:
        name=session["name"]
        username= session["username"]
        email=session["email"]
        company=session["companyname"]

    



    #pie summary
        summary_certified= CompletionCertificate.query.filter_by(company=company).count()
        summary_completed= CompletedFreelancing.query.filter_by(company=company).count()

        print(summary_certified)
        print(summary_completed)

        # summary_completed=freelancers_sum.func.count(CompletionCertificate.id).scalar()
        # print(summary_completed)


        # summary_completed=db.session.query(func.count(CompletedFreelancing.id)).scalar() 
    
        # summary_certified=db.session.query(func.count(CompletionCertificate.id).filter(company=company)).scalar() 


        
        # freelance_completed="SELECT * from "
        # freelance_completed.func.count(CompletionCertificate.id).group_by(CompletionCertificate.freelance).all()
        
        # count_all=db.session.query(func.count(distinct(tuple_(freelance_completed.freelance,freelance_completed.id)))).scalar()
        # print(freelance_completed)
        # for x in freelance_completed:
        #     print(x.freelance)
        # freelance= session.query(freelance_completed.freelance,func.count(freelance_completed.id)).group_by(Table.column).all()
        # count_all=db.session.query(func.count(freelance_completed.id)).scalar()
        # for region in freelance_completed:
        #     new_courier.freelance_completed.append(CompletionCertificate(region=region))
        
      


   else: 
        return redirect(url_for('memberlogin'))
   return render_template("homemember.html",summary_certified=summary_certified,summary_completed=summary_completed)

@app.route("/addfreelancing", methods=["POST", "GET"])
def addfreelancing():
    form=AddFreelancingForm()
    if form.validate_on_submit():
        # start_date = form.start_date.data
        # start_date_str = start_date.strftime('%m-%d-%y')
        # print(start_date_str)
        print("submit12")
        freelance=Freelancing(title=form.title.data,company=form.company.data,description=form.description.data,skillrequired=form.skillrequired.data,criteria=form.criteria.data,location=form.location.data,freelance=form.freelance.data,workmod=form.workmod.data,start_date=form.start_date.data,duration=form.duration.data,stipend=form.stipend.data)
        db.session.add(freelance)
        db.session.commit()
        flash(f'Freelance has been posted Successfuly {form.title.data}',category='success')
    return render_template('addfreelancing.html',form=form)

@app.route("/memberaccount")
def memberaccount():
    if 'username' in session:
        name=session["name"]
        username= session["username"]
        email=session["email"]
        company=session["companyname"]
       

    else:
        return redirect(url_for('memberlogin'))

    return render_template('memberaccount.html')





@app.route('/freelancereq')
def freelancereq():
    if 'username' in session:
       name=session["name"]
       username= session["username"]
       email=session["email"]
       company=session["companyname"]
       req= EnrolledFreelancing.query.filter_by(company=company).all()

    else:
        return redirect(url_for('memberlogin'))


    return render_template('freelancereq.html',req=req)


#freelancer requestapproved

@app.route("/freelance_selected/<int:id>")
def freelance_selected(id):
    free_req=EnrolledFreelancing.query.filter_by(id=id).first()
    f_approved =ApprovedFreelancing(stud_name=free_req.stud_name, stud_email=free_req.stud_email, title=free_req.title, company=free_req.company,location=free_req.location, freelance=free_req.freelance,workmod=free_req.workmod,start_date=free_req.start_date, duration=free_req.duration, stipend=free_req.stipend)
    db.session.add(f_approved)
    
    db.session.delete(free_req)
    db.session.commit()
    print("Approved Successfully")
    flash(f'Approved for Freelancing ',category='success')


    return redirect(url_for("freelancereq"))


@app.route("/freelance_notselected/<int:id>")
def freelance_notselected(id):
    free_req=EnrolledFreelancing.query.filter_by(id=id).first()
    print(free_req.stud_name)
    db.session.delete(free_req)
    db.session.commit()

    return redirect(url_for("freelancereq"))


#working freelance

@app.route('/freelanceworking')
def freelanceworking():
    if 'username' in session:
       name=session["name"]
       username= session["username"]
       email=session["email"]
       company=session["companyname"]
       approved= ApprovedFreelancing.query.filter_by(company=company).all()

    else:
        return redirect(url_for('memberlogin'))

    return render_template('freelanceworking.html',approved=approved)



@app.route("/freelance_completed/<int:id>")
def freelance_completed(id):
    approved =ApprovedFreelancing.query.filter_by(id=id).first()
    
    #
    id= approved.id
    name = approved.stud_name
    title=approved.title
    company=approved.company
    date_now= date.today()
    filename="certificate"+str(id)+".pdf"

    print(filename)
    html = render_template("certificate.html",
    name=name,title=title,company=company,date=date_now
    )
    
    pdf = pdfkit.from_string(html, False)
    response = make_response(pdf)
    response.headers["Content-Type"] = "application/pdf"
    response.headers["Content-Disposition"] = "inline; filename="+filename

    completed= CompletedFreelancing(stud_name=approved.stud_name, stud_email=approved.stud_email, title=approved.title, company=approved.company,location=approved.location, freelance=approved.freelance,workmod=approved.workmod,start_date=approved.start_date,completion_date=date_now,stipend=approved.stipend)
    
    #query
   
    db.session.add(completed)
    db.session.delete(approved)
    db.session.commit()
   
    flash(f'Completed Successfully ',category='success')
    return response


@app.route("/freelance_notcompleted/<int:id>")
def freelance_notcompleted(id):
    approved=ApprovedFreelancing.query.filter_by(id=id).first()
    db.session.delete(approved)
    db.session.commit()
    return redirect(url_for("freelanceworking"))


@app.route('/give_certificate')
def give_certificate():
    if 'username' in session:
       name=session["name"]
       username= session["username"]
       email=session["email"]
       company=session["companyname"]
       
       completed=CompletedFreelancing.query.filter_by(company=company).all()
    
    else:
        return redirect(url_for('memberlogin'))

    return render_template('give_certificate.html',completed=completed)


@app.route('/upload_certificate/<string:id>', methods = ['GET', 'POST'])
def upload_certificate(id):
    user=CompletedFreelancing.query.filter_by(id=id).first()
    form=Give_certficate()
    if form.validate_on_submit():
        print("Certificate Submitted")
        name=form.name.data
        email=form.email.data
        file=form.pdf.data
        filename = secure_filename(file.filename)
        print(filename)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

        cert=CompletionCertificate(name=name,email=email,title=user.title,company=user.company,freelance=user.freelance,workmod=user.workmod,start_date=user.start_date,completion_date=user.completion_date,stipend=user.completion_date,pdf=file.filename)
        db.session.add(cert)
        db.session.delete(user)
        db.session.commit()
        flash(f'Completed Successfully ',category='success')
        return redirect(url_for("give_certificate"))

    return render_template('upload_certificate.html',form=form,user=user)

@app.route('/completed_cert', methods = ['GET', 'POST'])
def completed_cert():
    students=CompletionCertificate.query.all()

    return render_template("completed_cert.html",view=students)

@app.route('/memberlogout')
def memberlogout():
    session.pop("name",None)
    session.pop("email",None)
    session.pop("username",None)
    session.pop("companyname",None)
    return redirect(url_for('memberlogin'))



