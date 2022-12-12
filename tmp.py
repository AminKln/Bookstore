import sqlite3
import pprint

def get_user(username):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['username', 'email', 'is_admin', 'password']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM user WHERE username='{username}'")
    user = c.fetchone()
    conn.close()
    if user == None:
        return None
    user = dict(zip(keys, user))
    user['is_authenticated'] = False
    user['is_active'] = True
    user['is_anonymous'] = False
    user['get_id'] = lambda: user['username']

    return user

def prnt(s):
    pp = pprint.PrettyPrinter(indent=4)
    pp.pprint(s)

# Test get_user
prnt(get_user('admin'))