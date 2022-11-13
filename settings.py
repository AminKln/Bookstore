import os


DB_NAME = 'Bookstore.db'
DB_PATH = os.path.join(os.getcwd(), DB_NAME)

SQL_BUILD_TABLE_PATH = os.path.join(os.getcwd(), 'scripts', 'sql', 'build_tables.sql')

SERVER_PATH = os.path.join(os.getcwd(), 'server/server.py')