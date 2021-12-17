import os
from flask import Flask, render_template, url_for, request, redirect, session


app = Flask(__name__)
app.secret_key = os.getenv("SECRET")


@app.route("/")
def main_page():
    return render_template("index.html")


@app.route("/register")
def register():
    return render_template("register-login.html")

@app.route("/login")
def login():
    return render_template("register-login.html")


app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("main_page"))


if __name__ == "__main__":
    app.run(debug=True)