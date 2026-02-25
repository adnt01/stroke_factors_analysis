PRAGMA table_info("healthcare-dataset-stroke-data");
/* 
0	id	INTEGER
1	gender	TEXT
2	age	INTEGER
3	hypertension	INTEGER
4	heart_disease	INTEGER
5	ever_married	TEXT
6	work_type	TEXT
7	Residence_type	TEXT
8	avg_glucose_level	REAL
9	bmi	TEXT
10	smoking_status	TEXT
11	stroke	INTEGER 
*/

SELECT DISTINCT age from "healthcare-dataset-stroke-data";

-- notably, there are ages here that are decimals. they all seem to be under the age of two,
-- where age is measured in months (the decimals are in breakpoints of 0.08, which correspond to
-- 1 per 12 months (accounting for concatenation of 0.08333 repeating)

SELECT DISTINCT gender from "healthcare-dataset-stroke-data";

-- male, female, other

SELECT DISTINCT hypertension from "healthcare-dataset-stroke-data";

-- binary (1,0) for incidence of hypertension or not

SELECT DISTINCT heart_disease from "healthcare-dataset-stroke-data";

-- binary (1,0) for incidence of heart disease or not

SELECT DISTINCT ever_married from "healthcare-dataset-stroke-data";

-- binary (1,0) for married or not

SELECT DISTINCT work_type from "healthcare-dataset-stroke-data";

-- private, self-employed, government job, is a child, or has never worked

SELECT age, work_type
FROM "healthcare-dataset-stroke-data"
WHERE work_type = 'children'
   OR work_type = 'Never_worked'
   ORDER BY age;
   
-- the youngest age that you see never_worked is at 13, though most of the 13-year-olds' data still states 'children'
-- this makes sense, since this is worldwide data from WHO, and it stands to reason that some countries
-- have far more lax labour laws.

SELECT DISTINCT Residence_type from "healthcare-dataset-stroke-data";

-- either urban or rural. given that this is international data, this isn't particularly helpful;
-- by what metric is something considered urban or rural, or somewhere in between
-- depending on the socieconomic development level of the country a certain data point was taken from?

SELECT DISTINCT smoking_status from "healthcare-dataset-stroke-data";

-- formerly smoked, never smoked, smokes, Unknown
-- is it appropriate to treat Unknown as never smoked? What story does an unknown value tell?

SELECT DISTINCT stroke from "healthcare-dataset-stroke-data";

-- binary (1,0) for incidence of stroke or not

SELECT *
FROM "healthcare-dataset-stroke-data"
WHERE bmi IS NOT NULL
  AND bmi NOT REGEXP '^[-+]?[0-9]*\.?[0-9]+$';

-- bmi is a text field when it should be a number, because it has 201 entries where it says N/A instead.
-- this is 3.9% of the dataset.
-- why N/A? not sure, but 40 of them are inputted as stroke victims.
-- this makes it such that we can't just remove these entries, even though it's less than 5% of the dataset. 
-- we only have 250 stroke victims in the dataset, so removing a good sixth of them could be catastrophic. 
-- we need to find out if the data is MCAR or MAR (MNAR would be spectacularly hard to prove, it's not happening with only 5000 entries).

-- in any case, this dataset is SKEWED. It has far more cases of no strokes than confirmed strokes.

SELECT max(avg_glucose_level) FROM "healthcare-dataset-stroke-data"

-- expected values, ranging from severely hypoglycemic to hyperglycemic
-- for visualization purposes, you can make a categorical variable afterwards that gives a name to different ranges of mg/dL