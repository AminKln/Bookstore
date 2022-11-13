import sqlite3
from flask import Flask
import os

app = Flask(__name__)

def run(server_path, db_path=None):
    os.system(f'flask --app {server_path} run')

@app.route('/')
def index():
    return 'Hello World!'