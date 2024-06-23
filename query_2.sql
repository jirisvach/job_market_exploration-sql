/*
 Identify top 10 paying skills
 */
-- since I´ve made top 10 paying jobs query in previous file, now i just need to join it with skills table
SELECT *
FROM skills_dim
LIMIT 10;
-- skills table needs to be joined with skills job dim table
SELECT *
FROM skills_job_dim
LIMIT 10;
--
SELECT job_id,
    skills
FROM skills_job_dim
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LIMIT 10;
-- now lets implement the previous top paying jobs by using with function
WITH top_jobs AS(
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
)
SELECT top_jobs.*,
    skills_dim.skills
FROM skills_job_dim
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    INNER JOIN top_jobs ON skills_job_dim.job_id = top_jobs.job_id
LIMIT 10;
-- sort the table by hishest avg salary
WITH top_jobs AS(
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
    LIMIT 100
)
SELECT top_jobs.*,
    skills_dim.skills
FROM skills_job_dim
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    INNER JOIN top_jobs ON skills_job_dim.job_id = top_jobs.job_id
ORDER BY salary_year_avg DESC;
-- count the skills in top 100 paying jobs
WITH top_jobs AS(
    SELECT job_id
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 100
)
SELECT skills_dim.skills,
    COUNT(skills)
FROM skills_job_dim
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    INNER JOIN top_jobs ON skills_job_dim.job_id = top_jobs.job_id
GROUP BY skills
ORDER BY COUNT(skills) DESC
LIMIT 10;