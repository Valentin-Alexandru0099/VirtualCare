from werkzeug import datastructures
import database_connection
from werkzeug.security import generate_password_hash


@database_connection.connection_handler
def get_all(cursor, table):
    querie = f"SELECT * FROM {table}"
    cursor.execute(querie)
    return cursor.fetchall()


@database_connection.connection_handler
def add_account(cursor, username, password, email, table, id):
    querie = f"""
    INSERT INTO {table}
    VALUES(%(id)s, %(username)s, %(email)s, %(password)s)
    """
    cursor.execute(
        querie,
        {
            "username": username,
            "email": email,
            "password": generate_password_hash(password),
            "id": id,
        },
    )


@database_connection.connection_handler
def add_patients(cursor, id, username, email):
    querie = "INSERT INTO patients(id, username, email) values(%(id)s, %(username)s, %(email)s)"
    cursor.execute(querie, {"id": id, "username": username, "email": email})


@database_connection.connection_handler
def count(cursor):
    querie = "SELECT COUNT(*) AS id FROM users"
    cursor.execute(querie)
    return cursor.fetchone()["id"]


@database_connection.connection_handler
def get_user(cursor, user_id):
    querie = "SELECT * FROM patients WHERE id=%(user_id)s"
    cursor.execute(querie, {"user_id": user_id})
    return cursor.fetchone()


@database_connection.connection_handler
def edit_patient(cursor, data):
    querie = """
    INSERT INTO patients(name, age, surname, contact, adress_line, gender, height, weight, country, region, disease, surgery)
    VALUES(,,,,,,,,%(country)s,%(region)s,%(disease)s,%(surgery)s)
    """
    querie = """
    UPDATE patients
    SET name=%(name)s, age=%(age)s, surname=%(surname)s, contact=%(contact)s, adress_line=%(adress_line)s, gender=%(gender)s, height=%(height)s, weight=%(weight)s, country=%(country)s, region=%(region)s, disease=%(disease)s, surgery=%(surgery)s
    WHERE id=%(user_id)s
    """
    cursor.execute(querie, data)


@database_connection.connection_handler
def doctor_appointments(cursor, doctor_id):
    querie = """SELECT doctors.name, patients.name, patients.surname, patients.id as patientID, doctors.p_id as doctorID
                FROM doctors
                JOIN patients on patients.id = doctors.p_id
                GROUP BY doctors.name, patients.name, patients.id,  doctors.p_id"""
    cursor.execute(querie, doctor_id)
    return cursor.fetchall()
