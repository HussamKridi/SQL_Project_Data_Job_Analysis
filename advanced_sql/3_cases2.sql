SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY location_category;


/*

Lable new column as follows: 
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'Local'
- otherwise 'Onsite' 

*/

SELECT
    job_title,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 120000 THEN 'High Salary'
        WHEN salary_year_avg BETWEEN 70000 AND 119999 THEN 'Standard Salary'
        WHEN salary_year_avg < 70000 THEN 'Low Salary'
        ELSE 'Not Specified'
    END AS salary_category
FROM job_postings_fact
WHERE job_title LIKE '%Data Analyst%'
ORDER BY salary_year_avg DESC;