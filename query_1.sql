/*
 Identify top 10 paying companies for Data analyst 
 
 */
-- let´s check the data in job posting fact table
SELECT *
FROM job_postings_fact
LIMIT 10;
-- now i need to filter out only job title which includes data analyst
SELECT *
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
LIMIT 10;
-- now count the amount of records
SELECT COUNT(*) AS number_of_data_analyst_jobs
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst';
-- filer only columns we need
SELECT job_id,
    company_id,
    job_title,
    salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
LIMIT 10;
-- salary year avg column contains some null values
SELECT job_id,
    company_id,
    job_title,
    salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
LIMIT 10;
-- now i need to join job posting fact table with company dim table, to see company names
SELECT *
FROM company_dim
LIMIT 10;
-- company id is the column i will make join on
SELECT job_id,
    name AS company_name,
    job_title,
    salary_year_avg
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
LIMIT 10;
-- final step is to sort the salary year avg column from high to low and add the job location
SELECT job_id,
    name AS company_name,
    job_title,
    job_location,
    salary_year_avg
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;