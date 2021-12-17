import os
from flask import Flask, render_template, url_for, request, redirect, session


app = Flask(__name__)
app.secret_key = os.getenv("SECRET")


@app.route("/")
def main_page():
    return render_template("index.html")


if __name__ == "__main__":
    app.run(debug=True)