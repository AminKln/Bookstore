import sqlite3
from sqlite3 import OperationalError

def run_sql(db_path, sql_path, verbose=False):
    con = sqlite3.connect(db_path)
    db = con.cursor()

    sql = open(sql_path, 'r').read()
    sql = [s for s in sql.split(';')]
    for statement in sql:
        try:
            db.execute(statement)
        except OperationalError as e:
            if verbose:
                print(statement)
                (e)
    con.commit()

    db.close()
    con.close()
    
