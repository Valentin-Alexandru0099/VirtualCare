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
    return render_template("index.html", doctors=doctors)


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST" and (
        request.form["password"] == request.form["confirm-password"]
    ):
        id = queries.count() + 1
        queries.add_account(
            request.form["username"],
            request.form["password"],
            request.form["email"],
            "users",
            id,
        )
        queries.add_patients(id, request.form["username"], request.form["email"])
        return redirect(url_for("register"))
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
    app_data = queries.get_app_data(user_id)
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
        return redirect(url_for("user_page", user_id=user_id))
    return render_template("user_page.html", user=user, app_data=app_data)


@app.route("/doctor/<int:doctor_id>", methods=["POST", "GET"])
def doctor_page(doctor_id):
    patients = queries.doctor_appointments(doctor_id)
    doctor = queries.get_dorctor(doctor_id)
    return render_template("doctor_page.html", doctor=doctor, patients=patients)


@app.route("/appointments", methods=["POST", "GET"])
def post_appointments():
    message = request.form.get("message")
    date = request.form.get("date")
    data = {
        "patient_id": session["id"],
        "doctor_id": request.form.get("option"),
        "message": message,
        "date": date,
    }
    queries.post_appointments(data)
    return redirect(url_for("main_page"))


@app.route("/delete-doctor-appointment/<int:appointment_id>", methods=["GET", "POST"])
def delete_doctor_appointment(appointment_id):
    id = queries.delete_appointment(appointment_id, 'patient_id')
    return redirect(url_for("user_page", user_id=id))


@app.route("/delete-patient-appointment/<int:appointment_id>", methods=["GET", "POST"])
def delete_patient_appointment(appointment_id):
    id = queries.delete_appointment(appointment_id, 'doctor_id')
    return redirect(url_for("doctor_page", doctor_id=id))

if __name__ == "__main__":
    app.run(debug=True)
