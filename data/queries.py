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
def get_specific(cursor, user_id):
    querie = "SELECT * FROM appointments WHERE patient_id=%(user_id)s"
    cursor.execute(querie, {"user_id": user_id})
    return cursor.fetchall()


@database_connection.connection_handler
def get_doctor_name(cursor, user_id):
    querie = "SELECT doctors.name FROM doctors WHERE id IN(SELECT appointments.doctor_id FROM appointments WHERE appointments.patient_id=%(user_id)s)"
    cursor.execute(querie, {"user_id":user_id})
    return cursor.fetchall()


@database_connection.connection_handler
def edit_patient(cursor, data):
    querie = """
    UPDATE patients
    SET name=%(name)s, age=%(age)s, surname=%(surname)s, contact=%(contact)s, adress_line=%(adress_line)s, gender=%(gender)s, height=%(height)s, weight=%(weight)s, country=%(country)s, region=%(region)s, disease=%(disease)s, surgery=%(surgery)s
    WHERE id=%(user_id)s
    """
    cursor.execute(querie, data)


@database_connection.connection_handler
def post_appointments(cursor, data):
    querie = """INSERT INTO appointments (patient_id, doctor_id, message, date) 
                VALUES (%(patient_id)s, %(doctor_id)s, %(message)s, %(date)s)
                """
    cursor.execute(querie, data)


@database_connection.connection_handler
def get_user(cursor, user_id):
    querie = "SELECT * FROM patients WHERE id=%(user_id)s"
    cursor.execute(querie, {"user_id": user_id})
    return cursor.fetchone()



@database_connection.connection_handler
def get_app_data(cursor, user_id):
    querie = f"""
    SELECT appointments.*, doctors.name
    FROM appointments
    FULL JOIN doctors
    ON appointments.doctor_id=doctors.id
    WHERE appointments.patient_id=%(user_id)s
    """
    cursor.execute(querie, { "user_id": user_id})
    return cursor.fetchall()


@database_connection.connection_handler
def delete_appointment(cursor, id, col):
    querie = f"DELETE FROM appointments WHERE id=%(id)s RETURNING {col}"
    cursor.execute(querie, {"id":id})
    return cursor.fetchone()[col]


@database_connection.connection_handler
def doctor_appointments(cursor, doctor_id):
    querie ="""
    SELECT appointments.*, patients.name, patients.email, patients.contact, patients.surname
    FROM appointments
    FULL JOIN patients
    ON appointments.patient_id=patients.id
    WHERE appointments.doctor_id=%(doctor_id)s
    """ 
    cursor.execute(querie, {"doctor_id":doctor_id})
    return cursor.fetchall()

    
@database_connection.connection_handler
def get_dorctor(cursor, doctor_id):
    querie ="""
    SELECT * from doctors WHERE id=%(doctor_id)s
    """ 
    cursor.execute(querie, {"doctor_id":doctor_id})
    return cursor.fetchone()
