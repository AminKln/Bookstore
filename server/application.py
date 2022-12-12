import sqlite3
from flask import Flask, render_template, request, redirect, url_for, g, session
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from functools import wraps
import os
import pprint
from . import api
from copy import deepcopy


app = Flask(__name__)
app.secret_key = 'my-secret-key'
login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(username):
    return api.get_user(username)

def run():
    app.run(debug=True)

@app.before_request
def before_request():
    # g.request = request
    pass

@app.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('index'))
    if request.method == 'GET':
        return render_template('login.html')
    elif request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = authenticate(username, password)
        if user == None:
            return render_template('login.html', error='Invalid username or password')
        
        login_user(user)
        return redirect(url_for('index'))

def authenticate(username, password):
    user = api.get_user(username)
    if user == None:
        return None
    if user['password'] == password:
        del user['password']
        return user

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if current_user.is_authenticated:
            return f(*args, **kwargs)
        return redirect(url_for('login'))
    return decorated_function

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('index'))

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search', methods=['GET'])
def search():
    if request.method == 'GET':
        #parse the query string
        query = request.args.get('query')
        books = api.search_book(query)
        return render_template('search.html', results=books)
    
@app.route('/book', methods=['GET'])
def book():
    if request.method == 'GET':
        isbn = request.args.get('isbn')
        book = api.get_book(isbn)
        return render_template('book.html', book=book)

@app.route('/books', methods=['GET'])
def books():
    if request.method == 'GET':
        books = api.get_books(limit=100)
        return render_template('books.html', books=books)

@app.route('/cart', methods=['GET', 'POST'])
@login_required
def cart():
    if request.method == 'GET':
        cart = api.get_cart(current_user)
        print(cart)
        return render_template('cart.html', cart=cart, total=lambda cart: sum([item['details']['price'] * item['count'] for item in cart]))
    elif request.method == 'POST':
        isbn = request.form['isbn']
        count = request.form['count']
        api.add_to_cart(current_user, isbn, count)
        return redirect(url_for('cart'))

@app.route('/cart/remove', methods=['get'])
def remove_from_cart():
    isbn = request.args.get('isbn')
    api.remove_from_cart(current_user, isbn)
    return redirect(url_for('cart'))

@app.route('/orders', methods=['GET'])
@login_required
def orders():
    if request.method == 'GET':
        orders = api.get_orders(current_user)
        return render_template('orders.html', orders=orders)

@app.route('/order', methods=['GET'])
@login_required
def order():
    if request.method == 'GET':
        id = request.args.get('id')
        order = api.get_order(id)
        return render_template('order.html', order=order)

@app.route('/checkout', methods=['GET'])
def checkout():
    if request.method == 'GET':
        api.checkout(current_user)
        return redirect(url_for('orders'))

@app.route('/update-stock', methods=['POST'])
def update_stock():
    isbn = request.form['isbn']
    count = request.form['count']
    api.update_stock(isbn, count)
    return redirect(url_for('book', isbn=isbn))

@app.route('/sales-by-book', methods=['GET'])
@login_required
def sales_by_book():
    if request.method == 'GET':
        if current_user['is_admin'] != 1:
            return redirect(url_for('index'))
        sales = api.get_sales_by_book()
        return render_template('sales-by-book.html', sales=sales)

@app.route('/authors', methods=['GET'])
def authors():
    if request.method == 'GET':
        authors = api.get_authors()
        return render_template('authors.html', authors=authors)

@app.route('/author', methods=['GET'])
def author():
    if request.method == 'GET':
        name = request.args.get('name')
        if name == None:
            return redirect(url_for('authors'))
        author = api.get_author(name)
        if author == None:
            return redirect(url_for('authors'))
        author = {
            'name': author[0],
            'books': api.get_author_books(author[0])
        }
        return render_template('author.html', author=author)

def print(s):
    pp = pprint.PrettyPrinter(indent=4)
    pp.pprint(s)

if __name__ == '__main__':
    run(__name__)