/*
 Compare Data Analytics jobs from Meta with average Data analyst salary
 */
-- filter data only for Data Analyst jobs
SELECT *
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
LIMIT 10;
-- show only jobs where salary year avg is not null
SELECT *
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
LIMIT 10;
-- show only columns we need
SELECT job_id,
    company_id,
    job_title,
    salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
LIMIT 10;
-- combine table with company dim table
SELECT job_id,
    name as company_name,
    job_title,
    salary_year_avg
FROM job_postings_fact
    JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
LIMIT 10;
-- filter only Meta company
SELECT job_id,
    name as company_name,
    job_title,
    salary_year_avg
FROM job_postings_fact
    JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND name = 'Meta'
LIMIT 10;
-- use window function to show global avg salary
SELECT job_id,
    name as company_name,
    job_title,
    salary_year_avg,
    ROUND(
        AVG(salary_year_avg) OVER (PARTITION BY job_title_short),
        0
    ) AS global_avg
FROM job_postings_fact
    JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND name = 'Meta'
LIMIT 10;