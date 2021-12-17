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


@app.route("/register", methods=["GET", "POST"])
def register():
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


@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("main_page"))


if __name__ == "__main__":
    app.run(debug=True)
