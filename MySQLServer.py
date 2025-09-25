import mysql.connector

def create_alx_book_store_db():
    """
    Connects to the MySQL server and creates the 'alx_book_store' database
    if it does not already exist.
    """
    db_config = {
        'host': 'localhost',
        'user': 'your_mysql_username',  # Replace with your MySQL username
        'password': 'your_mysql_password' # Replace with your MySQL password
    }

    connection = None
    cursor = None

    try:
        # Establish a connection to the MySQL server
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        # SQL statement to create the database if it doesn't exist
        # Using IF NOT EXISTS prevents errors if the database already exists
        create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
        cursor.execute(create_db_query)

        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as err:
        print(f"Error connecting to MySQL: {err}")

    finally:
        # Close the cursor and connection if they were opened
        if cursor:
            cursor.close()
        if connection:
            connection.close()

if __name__ == "__main__":
    create_alx_book_store_db()