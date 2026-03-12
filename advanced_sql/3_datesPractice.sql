-- Problem 1
SELECT 
    AVG(salary_year_avg),
    AVG(salary_hour_avg),
    job_schedule_type
FROM job_postings_fact
WHERE job_posted_date > '2023-06-01'
GROUP BY job_schedule_type;
-- Problem 2
SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    COUNT(job_id) AS number_of_postings
FROM 
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY 
    month
ORDER BY
     month;
--Problem 3
SELECT
    company.name
FROM job_postings_fact AS job
JOIN company_dim AS company
    ON job.company_id = company.company_id
WHERE job.job_health_insurance = TRUE
AND EXTRACT(YEAR FROM job.job_posted_date) = 2023
AND EXTRACT(QUARTER FROM job.job_posted_date) = 2;
    

