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
    cursor.execute(querie, {"username": username, "email": email, "password": password, "id":id})


@database_connection.connection_handler
def count(cursor):
    querie = "SELECT COUNT(*) AS id FROM users"
    cursor.execute(querie)
    return cursor.fetchone()["id"]
