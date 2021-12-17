import os
import registration
from flask import Flask, render_template, url_for, request, redirect, session, flash
from dotenv import load_dotenv
from data import queries
from forms import LoginForm, RegistrationForm


app = Flask(__name__)
app.secret_key = os.getenv("SECRET")
load_dotenv()

@app.route("/", methods=["GET","POST"])
def main_page():
    return render_template("index2.html")


@app.route("/login", methods=["GET", "POST"])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user = queries.is_user_exist(form.username.data)

        if (
            user is not None
            and form.username.data == user["username"]
            and registration.verify_password(form.password.data, user["password"])
        ):
            session["username"] = form.username.data
            session["user_id"] = user["id"]
            flash(f"{form.username.data} logged in")
            return redirect(url_for("main_page"))

        flash("Login Unsuccessful. Please check username and password")

    return render_template("register-login.html", title="Login", form=form)


@app.route("/register", methods=["GET", "POST"])
def register():
<<<<<<< HEAD
    form = RegistrationForm()
    if form.validate_on_submit():
        user_data = {
            "username": form.username.data,
            "email": form.email.data,
            "password": registration.hash_password(form.password.data),
        }

        queries.add_new_user(user_data)
        flash(f"Account for {form.username.data} created! You are now able to log in")
        return redirect(url_for("login"))

    return render_template("register-login.html", title="Register", form=form)


=======
    if request.method == "POST" and (request.form["password"] == request.form["confirm-password"]):
        id = queries.count()
        queries.add_account(request.form["username"], request.form["password"], request.form["email"], "users", id+1)
        return redirect(url_for("main_page"))
    else:
        flash("Passwords does not match !!")
    return render_template("register-login.html", register=True)


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        users = queries.get_all("users")
        for user in users:
            if request.form["password"] == user["password"]:
                print(session)
                session["id"] = user["id"]
                session["username"] = user["username"]
                print(session)
                
                return redirect(url_for("main_page"))
    return render_template("register-login.html", register=False)
>>>>>>> 8f3721587d8deb1b20e9f866fbf3413573d17a98


app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("main_page"))


if __name__ == "__main__":
    app.run(debug=True)
