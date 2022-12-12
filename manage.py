import argparse
import sys
import os
from server import application
from scripts import sql, insert
from settings import *
from colorama import Fore, Back, Style, init

init(autoreset=True)

def main():
    # "bookstore" in os.environ["PATH"] -> makes bookstore an available package in all files (didnt work)
    # sys.path.append(os.path.abspath("../bookstore"))
    
    parser = argparse.ArgumentParser()
    parser.add_argument('command', help='command to run', choices=['init_db', 'runserver', 'dbshell', 'test', 'help'])
    parser.add_argument('-lim', '--limit', help='limit the number of rows to insert', type=int, default=None)
    parser.add_argument('-v', '--verbose', help='verbose mode', action='store_true')

    args = parser.parse_args()

    if args.command == 'init_db':
        print('Initializing database...')
        try:
            print("\nCreating tables...")
            sql.run_sql(DB_PATH, SQL_BUILD_TABLE_PATH)
            print(Fore.GREEN + f"Tables created!")
        except Exception as e:
            print(Fore.RED + f"Table creation failed!")
            print(e)
            exit()
        try:
            print("\nInserting data...")
            insert.main("books.csv", sql_data_path=SQL_DATA_PATH, limit=args.limit, verbose=args.verbose)
            sql.run_sql(DB_PATH, SQL_DATA_PATH)
            print(Fore.GREEN + f"Data inserted!")
        except Exception as e:
            print(Fore.RED + f"Data insertion failed!")
            print(e)
            raise(e)
        print(Fore.GREEN + f"\nDatabase Initialized!")

    elif args.command == 'runserver':
        print('Running server...')
        application.run()
        print('Shutting down server...')

    elif args.command == 'help':
        os.system('python3 manage.py -h')

    elif args.command == 'dbshell':
        os.system(f'sqlite3 {DB_PATH} -cmd ".headers on" -cmd ".mode column"')
        # os.system(f'sqlite3 {DB_PATH}')


if __name__ == '__main__':
    main()