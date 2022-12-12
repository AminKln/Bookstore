import os


DB_NAME = 'Bookstore.db'
DB_PATH = os.path.join(os.getcwd(), DB_NAME)

SQL_BUILD_TABLE_PATH = os.path.join(os.getcwd(), 'scripts', 'sql', 'models.sql')
SQL_DATA_PATH = os.path.join(os.getcwd(), 'scripts', 'sql', 'data.sql')

SERVER_PATH = os.path.join(os.getcwd(), 'server/application.py')