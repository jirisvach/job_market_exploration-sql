# sql_job_project
In this project I wanted to demonstrate my skills in using SQL and find out some interesting facts about the job market for Data Analyst position.
<br>I used only PostgeSQL in Visual Studio Code.

## Main questions:
**1) What are the top 10 paying companies for Data Analyst role?** <br>
**2) What are the top 10 paying skills?** <br>
**3) What are the most frequent skills and their average salary?** <br>
**4) Compare different Meta Data Analyst roles salary with average salary** <br>

### Query_0 <br>
Step zero is to set up a new connection between VS Code and the PG Admin server, create a new database, create tables and import all data from csv files into the tables.
<br>
![01](https://github.com/jirisvach/sql_job_project/assets/74241688/44ea3e4d-aaa7-47c5-9766-24b145a0458b)<br>
<br>
The connection test was successful, let´s check the PG Admin server and connect the new sql_job_project database.
<br>
![02](https://github.com/jirisvach/sql_job_project/assets/74241688/b7be19a1-0432-4390-bf33-7e73b24c5b54)<br>
<br>
The database is running successfully, the next step is to create new tables. The tables columns need to be  the same as in the csv files.
**NOTE:** I´ve used several data types:
  - TEXT and VARCHAR(255) - VARCHAR for columns where I don´t expect a length of more than 255 characters
  - INT and NUMERIC - INT for id´s and NUMERIC for any values lenghth
  - BOOLEAN - for TRUE/FALSE values
  - TIMESTAMP - date time values
<br>
