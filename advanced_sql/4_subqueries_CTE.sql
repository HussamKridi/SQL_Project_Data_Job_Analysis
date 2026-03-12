SELECT * 
FROM( -- subQuery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- SubQuery ends here

WITH january_jobs AS ( -- CTE definition starts here
        SELECT *
        FROM job_postings_fact
        WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here 

SELECT * 
FROM january_jobs;


SELECT   company_id,
         name AS company_name 
FROM  
         company_dim
WHERE company_id IN (
SELECT 
        company_id
FROM  
        job_postings_fact 
WHERE 
        job_no_degree_mention = true
ORDER BY 
        company_id
)


/*
Find companies that have the most job openings.
- Get the total number of job postings per company id (job_postings_fact)
- Return the total number of jobs with the company name (company_dim)
*/
WITH company_job_count AS (
SELECT 
        company_id,
        COUNT(*) AS total_jobs
FROM 
        job_postings_fact
GROUP BY 
        company_id
)

SELECT company_dim.name AS company_name,
        company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC

-- Practice Problem 1 

SELECT 
    s.skills,
    top_skills.skill_count
FROM skills_dim AS s
JOIN (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY skill_count DESC
    LIMIT 5
) AS top_skills
    ON s.skill_id = top_skills.skill_id
ORDER BY top_skills.skill_count DESC;

-- Practice Problem 2

SELECT
    company_counts.company_id,
    company_counts.total_job_postings,
    CASE
        WHEN company_counts.total_job_postings < 10 THEN 'Small'
        WHEN company_counts.total_job_postings BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM (
    SELECT
        company_id,
        COUNT(*) AS total_job_postings
    FROM job_postings_fact
    GROUP BY company_id
) AS company_counts
ORDER BY company_counts.total_job_postings DESC;
