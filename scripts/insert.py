import csv
import numpy as np
import random
import pprint
from colorama import Fore, Back, Style, init


def print(s):
    pp = pprint.PrettyPrinter(indent=4)
    pp.pprint(s)

def random_text(n):
    # generate random text
    text = ""
    for _ in range(n):
        text += chr(random.randint(97, 122))
    return text

def random_str_int(digits):
    i = str(random.randint(1, 9)) #first digit non zero
    for _ in range(digits-1):
        i += str(random.randint(0, 9))
    return i

#iterate through csv file, ignoring rows that raise an error
def read(reader, verbose=False):
    eof = False
    while not eof:
        try:
            yield next(reader)
        except StopIteration:
            eof = True
        except UnicodeDecodeError:
            if verbose:
                print(f"line {reader.line_num}: UnicodeDecodeError")

def generate_sql(input_file, limit=None, offset=0, verbose=False):
    init(autoreset=True)
    sql = ""
    with open(input_file, 'r') as f:
        reader = csv.DictReader(f)
        author_pk = set()
        publisher_pk = set()
        publisher_phone_number_pk = set()
        book_pk = set()
        genre_pk = set()
        written_by_pk = set()
        iter = 0
        for row in read(reader, verbose=verbose):
            if iter < offset:
                iter += 1
                continue
            if iter == limit:
                break
            try:
                assert len(row) == 12, f"line {reader.line_num}: row length is {len(row)} instead of 12"
                #params
                authors = [a.replace("'", "") for a in row['authors'].split('/')]
                publisher = row['publisher'].replace("'", "")
                isbn13 = row['isbn13']

                #authors
                for author in authors:
                    if author not in author_pk:
                        author_pk.add(author)
                        sql += "INSERT INTO author (name) VALUES ('" + author + "');\n"

                #publisher
                if publisher not in publisher_pk:
                    publisher_pk.add(publisher)
                    address = random_text(np.random.randint(10,20))
                    email = random_text(np.random.randint(10,15)) + "@" + random_text(np.random.randint(5,10)) + ".com"
                    bank_account = random_str_int(16)
                    sql += "INSERT INTO publisher (name, address, email, bank_account) VALUES ('" + publisher + "', '" + address + "', '" + email + "', '" + bank_account + "');\n"

                #publisher_phone_number
                for _ in range(np.random.randint(1, 3)):
                    phone_number = random_str_int(10)
                    if (publisher, phone_number) not in publisher_phone_number_pk:
                        publisher_phone_number_pk.add((publisher, phone_number))
                        sql += "INSERT INTO publisher_phone_number (publisher, phone_number) VALUES ('" + publisher + "', '" + phone_number + "');\n"

                #books
                if isbn13 not in book_pk:
                    book_pk.add(isbn13)
                    description = random_text(np.random.randint(100, 250))
                    price = str(np.random.randint(10, 100)) + "." + str(np.random.randint(10, 100))
                    count = str(np.random.randint(1, 100))
                    title = row['title'].replace("'", '')
                    sql += '''INSERT INTO book 
                        (isbn, title, n_of_pages, publication_date, language, description, price, count, publisher) VALUES
                        (''' + isbn13 + ", '" + title + "', " + row['num_pages'] + ", '" + row['publication_date'] + "', '" + row['language_code'] + "', '" + description + "', " + price + ", " + count + ", '" + publisher + "');\n"
                
                #genres
                genres = np.random.choice(['fiction', 'non-fiction', 'romance', 'mystery', 'horror', 'science-fiction', 'fantasy', 'thriller', 'drama', 'comedy'], np.random.randint(1, 4), replace=False)
                for genre in genres:
                    if (isbn13, genre) not in genre_pk:
                        genre_pk.add((isbn13, genre))
                        sql += "INSERT INTO genre (isbn, name) VALUES ('" + isbn13 + "', '" + genre + "');\n"

                #written_by
                primary = 1
                for author in authors:
                    if (isbn13, author) not in written_by_pk:
                        written_by_pk.add((isbn13, author))
                        sql += "INSERT INTO written_by (isbn, author, is_primary) VALUES ('" + isbn13 + "', '" + author + "', " + str(primary) + ");\n"
                    primary = 0
                iter += 1
            except Exception as e:
                if verbose:
                    print(e)
                continue

    return sql

def main(input_file, insert_sql_path='scripts/sql/insert.sql', limit=None, offset=0, verbose=False):
    sql = generate_sql(input_file=input_file, limit=limit, offset=offset, verbose=verbose)
    #save sql to file
    with open(insert_sql_path, 'w') as f:
        f.write(sql)
    
if __name__ == '__main__':
    main()