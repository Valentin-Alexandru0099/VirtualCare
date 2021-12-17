import os
from flask import Flask, render_template, url_for, request, redirect, session, flash
from data import queries

app = Flask(__name__)
app.secret_key = os.getenv("SECRET")


@app.route("/")
def main_page():
    return render_template("index.html")


@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        if request["password"] == request["confirm_password"]:
            queries.add_account(request["username"], request["password"], request["email"])
        else:
            flash("Passwords does not match !!")
    return render_template("register-login.html", register=True)


@app.route("/login", methods=["GET", "POST"])
def login():
    return render_template("register-login.html", register=False)


app.route("/logout")


def logout():
    session.clear()
    return redirect(url_for("main_page"))


if __name__ == "__main__":
    app.run(debug=True)
