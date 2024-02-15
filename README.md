# SQL Project: Healthcare Dataset Exploration

## Overview
This project explores a healthcare dataset I obtained from Kaggle, and analysed in MySQL. In this project, I performed exploratory data analysis (EDA) to answer specific questions.

## Dataset Details
- **Dataset Name**: Healthcare Dataset
- **Source**: [Kaggle - Healthcare Dataset](https://www.kaggle.com/datasets/prasad22/healthcare-dataset)
- **Description**: The following are the columns in the dataset and their brief descriptions:
--**Name**: This column represents the name of the patient associated with the healthcare record.
**Age**: The age of the patient at the time of admission, expressed in years.
**Gender**: Indicates the gender of the patient, either "Male" or "Female."
**Blood Type**: The patient's blood type, which can be one of the common blood types (e.g., "A+", "O-", etc.).
**Medical Condition**: This column specifies the primary medical condition or diagnosis associated with the patient, such as "Diabetes," "Hypertension," "Asthma," and more.
**Date of Admission**: The date on which the patient was admitted to the healthcare facility.
**Doctor**: The name of the doctor responsible for the patient's care during their admission.
**Hospital**: Identifies the healthcare facility or hospital where the patient was admitted.
**Insurance Provider**: This column indicates the patient's insurance provider, which can be one of several options, including "Aetna," "Blue Cross," "Cigna," "UnitedHealthcare," and "Medicare."
**Billing Amount**: The amount of money billed for the patient's healthcare services during their admission. This is expressed as a floating-point number.
**Room Numbe**r: The room number where the patient was accommodated during their admission.
**Admission Type**: Specifies the type of admission, which can be "Emergency," "Elective," or "Urgent," reflecting the circumstances of the admission.
**Discharge Date**: The date on which the patient was discharged from the healthcare facility, based on the admission date and a random number of days within a realistic range.
**Medication**: Identifies a medication prescribed or administered to the patient during their admission. Examples include "Aspirin," "Ibuprofen," "Penicillin," "Paracetamol," and "Lipitor."
**Test Results**: Describes the results of a medical test conducted during the patient's admission. Possible values include "Normal," "Abnormal," or "Inconclusive," indicating the outcome of the test.
**Length of Stay**: Derived column to calculate the duration of stay of each patient from admission to discharge

## Questions Explored
1. How many patients have each admission type and what is the average length of stay for each type?
2. What is the average age of the patients?
3. What is the population for each gender?
4.  What are the most common medical conditions among the patients and how many patients have each condition?
5.  How many patients have each blood type and what is the percentage distribution?
6.  Which insurance provider covers the most patients and what is the total billing amount for each provider?
7.  Which hospital is the most popular among patients in the dataset?
8.  What is the average billing amount for each hospital?
9.  Who are the top 10 most popular doctors?
10. What are the most common test results and how many times does each occur?
11. What are the most common medications prescribed to the patient and how many patients received each medication?

## SQL Queries
We used several SQL queries to extract relevant information from the dataset. Some of the key queries include:
- SELECT statements to retrieve specific columns.
- Aggregation functions (e.g., AVG, COUNT) to summarize data.
- JOIN operations to combine relat
- GROUP BY and ORDER BY
- Employed use of CTEs and Subqueries among other manipulations of SQL queries
  
## Results and Insights
- 

