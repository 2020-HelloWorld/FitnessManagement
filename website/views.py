from flask import Blueprint, render_template, request, flash, jsonify
from flask_login import login_required, current_user
from . import db
import json
from . import mydb
mycursor = mydb.cursor()

views = Blueprint('views', __name__)


@views.route('/', methods=['GET', 'POST'])
@login_required
def home():
    l = []
    if request.method == 'POST':
        note = request.form.get('note')
        mycursor.execute(note)
        for x in mycursor:
            l.append(x)
            print(x)
    return render_template("home.html", user=current_user,table = l)

@views.route('/statistics',methods=['GET','POST'])
@login_required
def statistics():
    if request.method =='GET':
        gender,height,weight,fname,mname,lname = (0,0,0,0,0,0)
        mycursor.execute(f'SELECT * FROM user_info where id like "{current_user.Userid}"')
        for i in mycursor:
            print(i)
            gender,height,weight,fname,mname,lname = i[1:]
    else:
        gender,height,weight,fname,mname,lname = (0,0,0,0,0,0)
        mycursor.execute(f'SELECT * FROM user_info where id like "{current_user.Userid}"')
        for i in mycursor:
            print(i)
            gender,height,weight,fname,mname,lname = i[1:]
        if request.form.get('name')!="":
            fname = request.form.get('name')
        if request.form.get('weight')!="":
            weight = request.form.get('weight')
        if request.form.get('height')!="":
            height = request.form.get('height')
        mycursor.execute(f'UPDATE user_info SET fname="{fname}",height={height},weight={weight} WHERE id="{current_user.Userid}"')
        mydb.commit()
    return render_template("statistics.html",user=current_user,gender=gender,height=height,weight=weight,fname=fname,mname=mname,lname=lname)

