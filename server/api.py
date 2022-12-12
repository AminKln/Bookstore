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
    class User:
        def __init__(self, username, email, is_admin, password):
            self.username = username
            self.email = email
            self.is_admin = is_admin
            self.password = password
            self.is_authenticated = True
            self.is_active = True
            self.is_anonymous = False

        def __getitem__(self, key):
            return getattr(self, key)

        def __delitem__(self, key):
            delattr(self, key)

        def get_id(self):
            return self.username
    return User(user['username'], user['email'], user['is_admin'], user['password'])

def update_stock(isbn, count):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    c.execute(f"UPDATE book SET count=count+{count} WHERE isbn='{isbn}'")
    conn.commit()
    conn.close()

def get_book(isbn):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['title', 'description', 'author', 'price', 'isbn', 'publisher', 'count', 'language', 'n_of_pages', 'publication_date']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM book NATURAL JOIN written_by WHERE is_primary=1 AND isbn='{isbn}'")
    result = c.fetchone()
    result = dict(zip(keys, result))
    conn.close()
    return result

def get_books(limit=10):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['title', 'description', 'author', 'price', 'isbn', 'publisher', 'count', 'language', 'n_of_pages', 'publication_date']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM book NATURAL JOIN written_by WHERE is_primary=1 LIMIT {limit}")
    results = c.fetchall()
    conn.close()
    results = [dict(zip(keys, result)) for result in results]
    return results

def search_book(query):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()

    keys = ['title', 'description', 'author', 'isbn']

    if query == None:
        c.execute(f"SELECT " + ', '.join(keys) + " FROM book NATURAL JOIN written_by WHERE is_primary=1 LIMIT 10")
    else:
        c.execute(f"SELECT " + ', '.join(keys) + f" FROM book NATURAL JOIN written_by WHERE is_primary=1 AND title LIKE '%{query}%' LIMIT 10")
    results = c.fetchall()
    conn.close()
    results = [dict(zip(keys, result)) for result in results]
    for result in results:
        result['url'] = f"/book?isbn={result['isbn']}"
    return results

def add_to_cart(user, isbn, count):
    if user == None or isbn == None or count == None:
        return None
    count = int(count)
    if count <= 0:
        return None
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    # check if book is already in cart
    c.execute(f"SELECT count FROM cart WHERE username='{user['username']}' AND isbn='{isbn}'")
    result = c.fetchone()
    update = False
    if result != None:
        count += result[0]
        update = True
    # check if book is in stock
    c.execute(f"SELECT count FROM book WHERE isbn='{isbn}'")
    stock = c.fetchone()[0]
    if stock == 0:
        return None
    count = min(count, stock)
    if update:
        c.execute(f"UPDATE cart SET count={count} WHERE username='{user['username']}' AND isbn='{isbn}'")
    else:
        c.execute(f"INSERT INTO cart (username, isbn, count) VALUES ('{user['username']}', '{isbn}', {count})")
    conn.commit()
    conn.close()

def get_cart(user):
    if user == None:
        return None
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['isbn', 'count']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM cart WHERE username='{user['username']}'")
    results = c.fetchall()
    conn.close()
    results = [dict(zip(keys, result)) for result in results]
    for result in results:
        result['details'] = get_book(result['isbn'])
    return results

def remove_from_cart(user, isbn):
    if user == None or isbn == None:
        return None
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    c.execute(f"DELETE FROM cart WHERE username='{user['username']}' AND isbn='{isbn}'")
    conn.commit()
    conn.close()

def get_orders(user):
    if user == None:
        return None
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['id', 'username', 'isbn', 'order_date', 'count', 'updated_on', 'status']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM order_record WHERE username='{user['username']}'")
    results = c.fetchall()
    conn.close()
    results = [dict(zip(keys, result)) for result in results]
    for result in results:
        result['details'] = get_book(result['isbn'])
    return results

def get_order(id):
    if id == None:
        return None
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['id', 'username', 'isbn', 'order_date', 'count', 'updated_on', 'status']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM order_record WHERE id={id}")
    result = c.fetchone()
    conn.close()
    result = dict(zip(keys, result))
    result['details'] = get_book(result['isbn'])
    return result

def checkout(user):
    THRESHOLD = 10
    if user == None:
        return None
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    c.execute(f"SELECT isbn, count FROM cart WHERE username='{user['username']}'")
    results = c.fetchall()
    for result in results:
        isbn = result[0]
        count = result[1]
        c.execute(f"SELECT count FROM book WHERE isbn='{isbn}'")
        book_count = c.fetchone()[0]
        if book_count < count:
            return False
    for result in results:
        isbn = result[0]
        count = result[1]
        c.execute(f"INSERT INTO order_record (username, isbn, count, status) VALUES ('{user['username']}', '{isbn}', {count}, 'pending')")
        c.execute(f"UPDATE book SET count=count-{count} WHERE isbn='{isbn}'")
    c.execute(f"DELETE FROM cart WHERE username='{user['username']}'")
    conn.commit()
    conn.close()
    ensure_stock(isbn, THRESHOLD)
    return True

def ensure_stock(isbn, threshold):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    c.execute(f"SELECT count FROM book WHERE isbn='{isbn}'")
    count = c.fetchone()[0]
    if count < threshold:
        c.execute(f"UPDATE book SET count={threshold} WHERE isbn='{isbn}'")
        c.execute(f"INSERT INTO order_record (username, isbn, count, status) VALUES ('admin', '{isbn}', {threshold - count}, 'pending')")
    conn.commit()
    conn.close()

def sales_by_book(start_date="date('now', '-1 month')", end_date="date('now')"):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['isbn', 'title', 'author', 'count', 'price', 'publisher_fees']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM book INNER JOIN order_record ON book.isbn=order_record.isbn WHERE order_date BETWEEN {start_date} AND {end_date} AND username!='admin'")
    sales = c.fetchall()
    sales = [dict(zip(keys, result)) for result in sales]
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM book INNER JOIN order_record ON book.isbn=order_record.isbn WHERE order_date BETWEEN {start_date} AND {end_date} AND username='admin'")
    expenses = c.fetchall()
    expenses = [dict(zip(keys, result)) for result in expenses]
    expenses = sum([result['count'] * result['price'] for result in expenses])
    conn.close()
    print(sales)
    print(expenses)

    return (sales, expenses)

def prev_month_sales(isbn):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['count']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM order_record WHERE isbn='{isbn}' AND order_date BETWEEN date('now', '-1 month') AND date('now')")
    result = c.fetchone()
    conn.close()
    result = dict(zip(keys, result))
    print(result)
    return result

def get_authors():
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['name']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM author")
    results = c.fetchall()
    conn.close()
    results = [dict(zip(keys, result)) for result in results]
    return results

def get_author(name):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    # keys = ['author', 'title', 'book.isbn', 'price', 'count']
    # c.execute(f"SELECT " + ', '.join(keys) + f" FROM author INNER JOIN written_by ON author.name=written_by.author INNER JOIN book ON written_by.isbn=book.isbn WHERE name='{name}' AND is_primary=1")
    c.execute(f"SELECT name FROM author WHERE name='{name}'")
    result = c.fetchone()
    conn.close()
    # keys[2] = 'isbn'
    return result

def get_author_books(name):
    conn = sqlite3.connect('Bookstore.db')
    c = conn.cursor()
    keys = ['title', 'book.isbn', 'price', 'count']
    c.execute(f"SELECT " + ', '.join(keys) + f" FROM author INNER JOIN written_by ON author.name=written_by.author INNER JOIN book ON written_by.isbn=book.isbn WHERE name='{name}' AND is_primary=1")
    results = c.fetchall()
    conn.close()
    keys[1] = 'isbn'
    results = [dict(zip(keys, result)) for result in results]
    return results

def print(s):
    pp = pprint.PrettyPrinter(indent=4)
    pp.pprint(s)
