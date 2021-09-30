
SELECT *
FROM Student_performance..StudentsPerformance$
;

--==========================================================================================
----Checking on Number_Of_Students_On_Each_Group
--==========================================================================================


SELECT race_or_ethnicity, COUNT(race_or_ethnicity) As Number_Of_Students_On_Each_Group
FROM Student_performance..StudentsPerformance$
GROUP BY race_or_ethnicity
;


--==========================================================================================
----Checking on Only Male students with readind score 
--==========================================================================================

SELECT gender, reading_score,count(gender) as Total_male, sum(reading_score) as Total_score
FROM Student_performance..StudentsPerformance$
WHERE gender = 'Male'
Group by gender, reading_score
;

--==========================================================================================
----Checking on Only Female students with readind score 
--==========================================================================================

SELECT gender, reading_score,count(gender) as Total_female, sum(reading_score) as Total_score
FROM Student_performance..StudentsPerformance$
WHERE gender = 'female'
Group by gender, reading_score
order by 1,2
;

--==========================================================================================
----Computing the total examination scores of the students and grade for each course considering the Total Pass Mark as 150
--==========================================================================================


SELECT gender, math_score, reading_score, writing_score, 
       (math_score+reading_score+writing_score) as Total_Exam_Score,
CASE
   
    WHEN (math_score+reading_score+writing_score) = 150 THEN 'Pass'
    WHEN (math_score+reading_score+writing_score) > 150 THEN 'Pass'
    ELSE 'Fail'
END AS Final_grade
FROM Student_performance..StudentsPerformance$
Group by gender,math_score,reading_score, writing_score
order by 1,2
;

--==========================================================================================
----Total of female that scored >150
--==========================================================================================

SELECT COUNT(gender) As Total_female_Passed
FROM Student_performance..StudentsPerformance$
Where (math_score+reading_score+writing_score) > 149 And gender = 'Female'

;
--==========================================================================================
----Total of female that scored < 150
--==========================================================================================

SELECT COUNT(gender) As Total_female_Failed
FROM Student_performance..StudentsPerformance$
Where (math_score+reading_score+writing_score) < 150 And gender = 'Female'

;

--==========================================================================================
----Total of male that scored >150
--==========================================================================================

SELECT COUNT(gender) As Total_male_Passed
FROM Student_performance..StudentsPerformance$
Where (math_score+reading_score+writing_score) > 149 And gender = 'male'

;
--==========================================================================================
----Total of male that scored < 150
--==========================================================================================

SELECT COUNT(gender) As Total_male_Failed
FROM Student_performance..StudentsPerformance$
Where (math_score+reading_score+writing_score) < 150 And gender = 'male'

;

--==========================================================================================
---- Percentage of male that failed
--==========================================================================================

SELECT COUNT(gender)*100/103 As Total_male_Failed
FROM Student_performance..StudentsPerformance$
Where (math_score+reading_score+writing_score) < 150 And gender = 'male'

;
--==========================================================================================
---- Percentage of male that Passed
--==========================================================================================

SELECT COUNT(gender)*100/897 As Total_male_Passed
FROM Student_performance..StudentsPerformance$
Where (math_score+reading_score+writing_score) > 149 And gender = 'male'

;

--==========================================================================================
---- Percentage of female that failed
--==========================================================================================


SELECT COUNT(gender)*100/103 As Total_female_Failed
FROM Student_performance..StudentsPerformance$
Where (math_score+reading_score+writing_score) < 150 And gender = 'Female'

;

--==========================================================================================
---- Percentage of female that Passed
--==========================================================================================

SELECT COUNT(gender)*100/897 As Total_female_Passed
FROM Student_performance..StudentsPerformance$
Where (math_score+reading_score+writing_score) > 149 And gender = 'Female'

;

---==========================================================================================
 ----GROUPING THE NUMBER OF STUDENTS THAT PASSED
--============================================================================================
SELECT race_or_ethnicity, COUNT(race_or_ethnicity) As NumberPassed
FROM Student_performance..StudentsPerformance$
WHERE (math_score+reading_score+writing_score) > 149
GROUP BY race_or_ethnicity
;

---==========================================================================================
 ----GROUPING THE NUMBER OF STUDENTS THAT FAILED
--============================================================================================
SELECT race_or_ethnicity, COUNT(race_or_ethnicity) As NumberFailed
FROM Student_performance..StudentsPerformance$
WHERE (math_score+reading_score+writing_score) < 150
GROUP BY race_or_ethnicity
;