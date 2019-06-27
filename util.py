#!/usr/bin/python

import psycopg2

db_host = "<RDS HOSTNAME>"
db_port = 5432
db_name = "postgres"
db_user = "dba"
db_pass = "ThisIsEmpty"
db_table = "pg_stat_activity"


def make_conn():
    conn = None
    try:
        conn = psycopg2.connect("dbname='%s' user='%s' host='%s' password='%s'" % (db_name, db_user, db_host, db_pass))
    except:
        print ("I am unable to connect to the database")
    return conn


def fetch_data(conn, query):
    result = []
    columns = ('time','process_count')
    #query = "select now()::timestamp(0), count(*) from pg_stat_activity;"
    cursor = conn.cursor()
    cursor.execute(query)
    raw = cursor.fetchall()
    for line in raw:
          result.append(dict(zip(columns, line)))
    return result
