-- creates the database and user from setup_mysql_dev.sql file in mysql
DROP DATABASE IF EXISTS test_profile_db;
cat setup_mysql_dev.sql | sudo mysql -hlocalhost -uroot -p
clave sudo

-- displays the database created
echo "SHOW DATABASES;" | mysql -utest_bh_dev -p | grep test_profile_db
clave bd

echo "SHOW GRANTS FOR 'test_bh_dev'@'localhost';" | sudo mysql -uroot -p
clave sudo

-- shows the user created
echo "SHOW GRANTS FOR 'test_bh_dev'@'localhost';" | sudo mysql -uroot -p

echo 'create Category name="cumplimiento"' | HBNB_MYSQL_USER=test_bh_dev HBNB_MYSQL_PWD=test_bh_pwd 
HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=test_profile_db HBNB_TYPE_STORAGE=db ./console.py 

-- test - modify mysql
HBNB_ENV=test HBNB_MYSQL_USER=test_bh_dev HBNB_MYSQL_PWD=test_bh_pwd HBNB_MYSQL_HOST=localhost HBNB_MYSQL_DB=test_profile_db HBNB_TYPE_STORAGE=db python3 -m unittest discover tests 