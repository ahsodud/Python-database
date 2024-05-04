import psycopg2
import csv

conn = psycopg2.connect(dbname="db_12136995", host="localhost", user="postgres", password="password", port="5432")
cursor = conn.cursor()
conn.autocommit = True

with open('books_genre_authors.csv', 'r', encoding='utf-8') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=',')
    for row in csv_reader:
        postgres_insert_query = "INSERT INTO Author (AuthorName) VALUES (%s)"
        record_to_insert = (row['authors'],)
        cursor.execute(postgres_insert_query, record_to_insert)
        postgres_insert_query = "INSERT INTO Book (ISBN, Title, Published, Pages, Language) VALUES (%s, %s, %s, %s, %s)"
        record_to_insert = (row['isbn'], row['title'], row['date_published'], row['pages'], row['language'],)
        cursor.execute(postgres_insert_query, record_to_insert)
        postgres_insert_query = "INSERT INTO Genre (genrename) VALUES (%s)"
        record_to_insert = (row['subjects'],)
        cursor.execute(postgres_insert_query, record_to_insert)
        postgres_insert_query = "INSERT INTO AuthorBook (isbn) VALUES (%s)"
        record_to_insert = (row['isbn'],)
        cursor.execute(postgres_insert_query, record_to_insert)
        postgres_insert_query = "INSERT INTO BookGenre (isbn) VALUES (%s)"
        record_to_insert = (row['isbn'],)
        cursor.execute(postgres_insert_query, record_to_insert)

with open('country.csv', 'r', encoding='utf-8') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=',')
    for row in csv_reader:
        postgres_insert_query = "INSERT INTO Country (iso_3166, countryname, cid) VALUES (%s, %s, %s)"
        record_to_insert = (row['Country Code'], row['Country Name'], row['Country-ID'],)
        cursor.execute(postgres_insert_query, record_to_insert)

with open('friends.csv', 'r', encoding='utf-8') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=',')
    for row in csv_reader:
        postgres_insert_query = "INSERT INTO Friendship (user1, user2) VALUES (%s, %s)"
        record_to_insert = (row['user_id'], row['friend_id'],)
        cursor.execute(postgres_insert_query, record_to_insert)

with open('rating.csv', 'r', encoding='utf-8') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=',')
    for row in csv_reader:
        postgres_insert_query = "INSERT INTO Rating (uid, isbn, rating) VALUES (%s, %s, %s)"
        record_to_insert = (row['User-ID'], row['ISBN'], row['Book-Rating'],)
        cursor.execute(postgres_insert_query, record_to_insert)

with open('user.csv', 'r', encoding='utf-8') as csv_file:
    csv_reader = csv.DictReader(csv_file, delimiter=',')
    for row in csv_reader:
        postgres_insert_query = "INSERT INTO Users (age, username) VALUES (%s, %s)"
        record_to_insert = (row['Age'], row['username'],)
        cursor.execute(postgres_insert_query, record_to_insert)

cursor.close()
conn.close()