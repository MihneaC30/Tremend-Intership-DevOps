// 1. Create a database named "company" within the MySQL container.

docker run --name mysql-db -e MYSQL_ROOT_PASSWORD=password -d mysql:latest
docker exec -it mysql-db mysql -uroot -ppassword -e "CREATE DATABASE company;"

// 2. Import the company.sql Dump

docker exec -i mysql-db mysql -uroot -ppassword company ~/Dekstop/company.sql

// 3. Create a User with Permissions:

CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON company.* TO 'newuser'@'localhost';
FLUSH PRIVILEGES;

// 4. Find the Average Salary for Each Department:

SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department;

