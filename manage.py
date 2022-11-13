import argparse
import sys
import os
from server import server
from scripts import init_database
from settings import *

def main():
    # "bookstore" in os.environ["PATH"] -> makes bookstore an available package in all files (didnt work)
    # sys.path.append(os.path.abspath("../bookstore"))
    
    parser = argparse.ArgumentParser()
    parser.add_argument('command', help='command to run', choices=['init_db', 'runserver', 'dbshell', 'test', 'help'])
    args = parser.parse_args()

    if args.command == 'init_db':
        print('Initializing database...')
        init_database.init(DB_PATH, SQL_BUILD_TABLE_PATH)
        print('Database Initialized!')

    elif args.command == 'runserver':
        print('Running server...')
        server.run(SERVER_PATH, DB_PATH)
        print('Shutting down server...')

    elif args.command == 'help':
        os.system('python3 manage.py -h')

    elif args.command == 'dbshell':
        os.system(f'sqlite3 {DB_PATH}')

if __name__ == '__main__':
    main()