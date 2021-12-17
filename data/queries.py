import database_connection


@database_connection.connection_handler
def add_account(cursor, username, password, email):
    querie = """
    INSERT INTO (table)
    VALUES(%(username)s, %(password)s, %(email)s)
    """
    cursor.execute(querie, {"username": username, "password": password, "email": email})
