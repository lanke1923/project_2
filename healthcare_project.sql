USE healthcare;

SELECT 
    *
FROM
    healthcare_dataset
ORDER BY `Date of Admission` DESC;

-- Are there any duplicate values in the dataset?	    
WITH Ranked_records AS (
	SELECT `Name`,
		`Hospital`,
        `Medical Condition` ,
        RANK()OVER(PARTITION BY `Name`, `Hospital`,`Medical Condition` 
        ORDER BY `Name`) AS ranking
FROM healthcare_dataset
)
SELECT 
		`Name`,
		`Hospital`,
        `Medical Condition`
FROM Ranked_records
	WHERE ranking > 1;

-- I will reformat the data by adding a new calculated column to show the length of stay in days for each patient    
ALTER TABLE healthcare_dataset
	ADD `Length of Stay` int;
    
UPDATE healthcare_dataset 
SET 
    `Length of Stay` = (SELECT DATEDIFF(`Discharge Date`, `Date of Admission`));

-- Then I will subset my dataset to perform univariate analysis 
SELECT DISTINCT
    `Admission Type`
FROM
    healthcare_dataset;
    
-- How many patients have each admission type and what is the average length of stay for each type?
SELECT 

    `Admission Type`,
    COUNT(`Medical Condition`) AS Number_of_patients,
    AVG(`Duration_of_Admission(days)`) AS avg_length_of_stay
FROM
    healthcare_dataset
WHERE
    `Admission Type` = 'Urgent' 
UNION SELECT 
    `Admission Type`,
    COUNT(`Medical Condition`) AS Number_of_patients,
    AVG(`Duration_of_Admission(days)`) AS avg_length_of_stay
FROM
    healthcare_dataset
WHERE
    `Admission Type` = 'Emergency' 
UNION SELECT 
    `Admission Type`,
    COUNT(`Medical Condition`) AS Number_of_patients,
    AVG(`Duration_of_Admission(days)`) AS avg_length_of_stay
FROM
    healthcare_dataset
WHERE
    `Admission Type` = 'Elective';

-- What is the average age of the patients?
SELECT 
    ROUND(AVG(`Age`)) AS Average_age
FROM
    healthcare_dataset;

-- What is the population for each gender?
SELECT DISTINCT
    `Gender`, COUNT(*) AS Population
FROM
    healthcare_dataset
GROUP BY `Gender`;
 
 -- What are the most common medical conditions among the patients and how many patients have each condition?
SELECT 
    `Medical Condition`, COUNT(*) AS Number_of_patients
FROM
    healthcare_dataset
GROUP BY `Medical Condition`
ORDER BY Number_of_patients DESC;

-- How many patients have each blood type and what is the percentage distribution?
SELECT @n := COUNT(`Blood Type`) FROM healthcare_dataset;
SELECT 
    `Blood Type`,
    COUNT(`Blood Type`) AS occurence,
	(COUNT(`Blood Type`)*100)/@n AS percentage_distribution
FROM
    healthcare_dataset
GROUP BY `Blood Type`;

-- Which insurance provider covers the most patients and what is the total billing amount for each provider?
SELECT 
    `Insurance Provider`,
    COUNT(*) AS Insurance_occurence,
    FLOOR(SUM(`Billing Amount`)) AS total_billing_amount
FROM
    healthcare_dataset
GROUP BY `Insurance Provider`
ORDER BY Insurance_occurence DESC;

-- Which hospital is the most popular among patients in the dataset?
WITH hospital_mode AS(
	SELECT  `Hospital`, COUNT(*) AS Hospital_occurence
	FROM healthcare_dataset
		GROUP BY `Hospital`
)
SELECT `Hospital`, `Hospital_occurence`
	FROM hospital_mode
		WHERE Hospital_occurence = (
				SELECT MAX(Hospital_occurence)
					FROM hospital_mode);

-- What is the average billing amount for each hospital?
SELECT 
    `Hospital`,
    COUNT(`Name`) AS Number_of_patients,
    ROUND(AVG(`Billing Amount`), 2) AS avg_billing_amount
FROM
    healthcare_dataset
GROUP BY `Hospital`
ORDER BY avg_billing_amount DESC;

-- Who are the top 10 most popular doctors?
SELECT 
    `Doctor`, COUNT(*) AS visits
FROM
    healthcare_dataset
GROUP BY `Doctor`
ORDER BY visits DESC
LIMIT 10;

-- What are the most common test results and how many times does each occur?
SELECT `Test Results`, COUNT(`Test Results`) AS patients_recorded
	FROM  healthcare_dataset
    GROUP BY `Test Results`;

-- What are the most common medications prescribed to the patient and how many patients received each medication?
SELECT `Medication`, COUNT(*) AS patients_recorded
	FROM  healthcare_dataset
    GROUP BY `Medication`;
  
-- 	Additonally I visualized the length of stay with a simple histogram
SELECT 
    `Length of Stay`,
    COUNT(*) AS count,
    RPAD('', COUNT(*) / 15, '*') AS bar
FROM
    healthcare_dataset
GROUP BY `Length of Stay`
ORDER BY count DESC;



   
