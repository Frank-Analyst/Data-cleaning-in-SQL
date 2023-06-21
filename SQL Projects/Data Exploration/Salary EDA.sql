SELECT * FROM adult;

#1. How many unique workclass values are there in the dataset?
SELECT SUM(DISTINCT(workclass))
FROM adult;

#2. What is the average age of individuals in the dataset?
SELECT AVG(age)
FROM adult;

#3. Which occupation has the highest capital gain on average?
SELECT occupation, AVG(`capital-gain`) AS average_capgain
FROM adult
GROUP BY occupation
ORDER BY average_capgain DESC
LIMIT 1;

#4. How many individuals have a capital loss greater than 0?
SELECT COUNT(`capital-loss`) AS individuals_caploss
FROM adult
WHERE `capital-loss` > '0';

#5. What is the most common education level among individuals who work more than 40 hours per week?
SELECT education, COUNT(`hours-per-week`) AS HPW_over_40hrs
FROM adult
WHERE `hours-per-week` > '40'
GROUP BY education
ORDER BY HPW_over_40hrs DESC;

#6. Which race has the highest average educational number (educational years completed)?
SELECT race, AVG(`educational-num`) AS avg_edu_num
FROM adult
GROUP BY race
ORDER BY avg_edu_num DESC;

#7. How many individuals are married and work in the private sector?
SELECT COUNT(age)
FROM adult
WHERE `marital-status` = 'Married' AND workclass = 'Private';

#8. What is the average hours worked per week for individuals with a bachelor's degree?
SELECT education, AVG (`hours-per-week`)
FROM adult
WHERE education = 'Bachelors'
GROUP BY education;

#9. Which native country has the highest number of individuals with a capital gain greater than 5000?
SELECT `native-country`, COUNT(`capital-gain`) AS highest_capital_gain
FROM adult
WHERE `capital-gain` > '5000'
GROUP BY `native-country`
ORDER BY highest_capital_gain DESC
LIMIT 1;

#10. How many individuals have a relationship of "Husband" and a capital gain greater than 0?
SELECT COUNT(`capital-gain`)
FROM adult
WHERE relationship = 'Husband' AND `capital-gain` > 0;


#11. What is the average age of individuals with a capital gain greater than 5000 and a capital loss greater than 2000?
SELECT AVG(age)
FROM adult
WHERE `capital-gain` > '5000' AND `capital-loss` > '2000';

#12. Which occupation has the highest average hours worked per week among individuals with a capital gain greater than 10000?
SELECT occupation, AVG(`hours-per-week`) AS avg_hrs
FROM adult
WHERE `capital-gain` > '10000'
GROUP BY occupation
ORDER BY avg_hrs DESC
LIMIT 1 ;

#13. What is the percentage of individuals who are married and have a capital gain greater than 5000 compared to the total married individuals?
SELECT
    COUNT(CASE WHEN `marital-status` = 'Married-civ-spouse' AND `capital-gain` > 5000 THEN 1 END) AS MarriedWithHighCapitalGain,
    COUNT(CASE WHEN `marital-status` = 'Married-civ-spouse' THEN 1 END) AS TotalMarried,
    (COUNT(CASE WHEN `marital-status` = 'Married-civ-spouse' AND `capital-gain` > 5000 THEN 1 END) / COUNT(CASE WHEN `marital-status` = 'Married-civ-spouse' THEN 1 END)) * 100 AS Percentage
FROM adult;

#14. Among individuals who work in the private sector, what is the highest capital gain achieved by each education level?
SELECT education, MAX(`capital-gain`) AS max_cg
FROM adult
WHERE workclass = 'Private'
GROUP BY education
ORDER BY max_cg DESC
LIMIT 1;

#15. How many individuals have a capital gain higher than their capital loss?
SELECT COUNT(`capital-gain`) AS Individual_hcg
FROM adult
WHERE `capital-gain` > `capital-loss`;

