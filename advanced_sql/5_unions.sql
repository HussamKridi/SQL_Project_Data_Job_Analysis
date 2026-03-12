-- Get jobs and companies from January 
SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION ALL

    SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs

UNION ALL

        SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    march_jobs

-- Union = Returns values without duplicates
-- UNION ALL = return values with duplicated and this is mostly what we use




/*
Practice Problem 1 – UNION Operators

Write a query to get the corresponding skill and skill type for each job posting in the first quarter (Q1).

Requirements:
- Include job postings even if they do not have any associated skills.
- Only consider job postings with a salary greater than $70,000.
- Use UNION to combine the results.

Tables:
job_postings_fact
skills_job_dim
skills_dim

Output:
job_id
skills
skill_type
*/