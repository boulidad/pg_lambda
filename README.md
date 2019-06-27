Lambda function (works with python 3.6) that talks to RDS and reports to slack.
Includes psycopg2 statically linked to libpq (11.4) 
Doesn't include slacker, you'll have to package it as per amazon instructions :
https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html#python-package-dependencies
You'll also need to make a "slack app" and get a slack api key, see here :
https://api.slack.com

