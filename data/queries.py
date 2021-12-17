import database_connection
from psycopg2.extras import RealDictCursor

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
<<<<<<< HEAD
    cursor.execute(querie, {"username": username, "password": password, "email": email})

@database_connection.connection_handler
def is_user_exist(cursor: RealDictCursor, datum):
    """Check if user exist in a database"""

    base_query = f"""
        SELECT *
        FROM users
        WHERE {'email' if '@' in datum else 'username'} = %(datum)s;
    """
    cursor.execute(base_query, {"datum": datum})

    return cursor.fetchone()

@database_connection.connection_handler
def add_new_user(cursor: RealDictCursor, user_data):
    """Add new user to a database"""

    query = """INSERT INTO users (username, email, password) VALUES (%(username)s,%(email)s,%(password)s);"""
    cursor.execute(
        query,
        {
            "username": user_data["username"],
            "email": user_data["email"],
            "password": user_data["password"],
        },
    )
=======
    cursor.execute(querie, {"username": username, "email": email, "password": password, "id":id})


@database_connection.connection_handler
def count(cursor):
    querie = "SELECT COUNT(*) AS id FROM users"
    cursor.execute(querie)
    return cursor.fetchone()["id"]
>>>>>>> 8f3721587d8deb1b20e9f866fbf3413573d17a98
