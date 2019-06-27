home=/Users/vasilis/Work/working_on/projects/lambda/packaging
cp ./function_work_in_progress.py ./lambda_function.py
rm -f package.zip
cd packages ; zip -r9 /Users/vasilis/Work/working_on/projects/lambda/packaging/function.zip .
cd $home
zip -g function.zip lambda_function.py
zip -g function.zip config.py 
zip -g function.zip util.py
aws lambda update-function-code --function-name pg_lambda --zip-file fileb://function.zip

clear
echo "done"
rm -f outfile ;aws lambda invoke --function-name "pg_lambda" outfile ;cat outfile
