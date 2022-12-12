# Bookstore - COMP3005 Project

## Setup
it is recommended to initialize the database with `-lim 100`. The rest of the data is not clean.

```
pip install -r requirements.txt
python manage.py init_db [-lim LIMIT] [-v]
```

## Run
- for owner view
    - username: `admin`
    - password: `admin`
- for user view
    - username: `user`
    - password: `user`

```
python manage.py runserver
```

