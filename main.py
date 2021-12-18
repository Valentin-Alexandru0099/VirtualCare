import os
from flask import Flask, render_template, url_for, request, redirect, session, flash
from dotenv import load_dotenv
from data import queries
from werkzeug.security import check_password_hash


app = Flask(__name__)
app.secret_key = os.getenv("SECRET")
load_dotenv()


@app.route("/", methods=["GET", "POST"])
def main_page():
    doctors = queries.get_all("doctors")
    return render_template("index2.html", doctors=doctors)


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST" and (
        request.form["password"] == request.form["confirm-password"]
    ):
        id = queries.count()
        queries.add_account(
            request.form["username"],
            request.form["password"],
            request.form["email"],
            "users",
            id + 1,
        )
        queries.add_patients(id + 1, request.form["username"], request.form["email"])
        return redirect(url_for("register"))
    else:
        flash("Passwords does not match !!")
    return render_template("register-login.html", register=True)


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        users = queries.get_all("users")
        doctors = queries.get_all("doctors")
        for user in users:
            if user["username"] == request.form["username"] and check_password_hash(
                user["password"], request.form["password"]
            ):
                session["id"] = user["id"]
                session["username"] = user["username"]
                session["emai"] = user["email"]
                for doctor in doctors:
                    if session["username"] == doctor["username"]:
                        session["doctor"] = True
                return redirect(url_for("main_page"))
    return render_template("register-login.html", register=False)


@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("main_page"))


@app.route("/user/<int:user_id>", methods=["POST", "GET"])
def user_page(user_id):
    user = queries.get_user(user_id)
    if request.method == "POST":
        data = {
            "name": request.form["name"],
            "age": request.form["age"],
            "surname": request.form["surname"],
            "contact": request.form["contact"],
            "adress_line": request.form["adress_line"],
            "gender": request.form["gender"],
            "height": request.form["height"],
            "weight": request.form["weight"],
            "country": request.form["country"],
            "region": request.form["region"],
            "disease": request.form["disease"],
            "surgery": request.form["surgeries"],
            "user_id": user_id,
        }
        queries.edit_patient(data)
        return redirect(url_for('user_page', user_id))
    return render_template("user_page.html", user=user)


@app.route("/doctor/<int:doctor_id>", methods=["POST", "GET"])
def doctor_page(doctor_id):
    patients = queries.doctor_appointments(doctor_id)
    return render_template("doctor_page.html", doctor_id=doctor_id, patients=patients)


@app.route("/calendar", methods=["POST", "GET"])
def calendar():
    return render_template("{{url_for('static', filename='index.html')}}")

  
@app.route('/appointments', methods=["POST", "GET"])
def post_appointments():
    message = request.form.get('message')
    date = request.form.get('date')
    data = {
        'p_id': session["id"],
        'd_id': request.form.get("option"),
        'message': message,
        'date': date
    }
    queries.post_appointments(data)
    return redirect(url_for('main_page'))

if __name__ == "__main__":
    app.run(debug=True)
