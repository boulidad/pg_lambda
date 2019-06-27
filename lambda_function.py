#!/usr/bin/python
import sys
import logging
import json
import psycopg2
from slacker import Slacker
from config import *
from util import make_conn, fetch_data

def lambda_handler(event, context):

    slack = Slacker(slackapi)
    query_cmd = "select now()::timestamp(0),count(*) from pg_stat_activity;"
    print (query_cmd)
    conn = make_conn()
    result = fetch_data(conn, query_cmd)
    conn.close()
    message = json.dumps(result, indent=2, sort_keys=True, default=str)
    slack.chat.post_message('@vasilis', message)
    return result
