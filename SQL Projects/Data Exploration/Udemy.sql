SELECT * FROM udemy;

# How many courses are available in the dataset?

SELECT COUNT(course_title) AS course_available
FROM udemy;

# What are the different subjects of the courses?

SELECT DISTINCT subject
FROM udemy;

# How many courses are paid and how many are free?

SELECT
    COUNT(is_paid) AS total_courses,
    SUM(CASE WHEN is_paid = 'TRUE' THEN 1 ELSE 0 END) AS paid_courses,
    SUM(CASE WHEN is_paid = 'FALSE' THEN 1 ELSE 0 END) AS free_courses
FROM
    udemy;

# What is the average price of the paid courses?

SELECT AVG(price) AS average_price
FROM udemy
WHERE is_paid = 'TRUE';

# What is the maximum number of subscribers for a course?

SELECT MAX(num_subscribers)
FROM udemy;

# What is the minimum duration of a course in hours?

SELECT
    MIN(content_duration)
FROM udemy;

#  Which course has the highest number of lectures?

SELECT course_title, num_lectures
FROM udemy
ORDER BY num_lectures DESC
LIMIT 1;

# How many courses are published in each year?

SELECT EXTRACT(YEAR FROM published_timestamp) AS publication_year, COUNT(course_title) AS course_count
FROM udemy
GROUP BY EXTRACT(YEAR FROM published_timestamp)
ORDER BY publication_year;

# What are the top 5 courses with the most reviews?

SELECT course_title, num_reviews
FROM udemy
ORDER BY num_reviews DESC
LIMIT 5;

# What is the total duration of all the courses combined?

SELECT
    SUM(content_duration)
FROM udemy;

# What is the average number of subscribers for the free courses?

SELECT
    AVG(num_subscribers)
FROM udemy
WHERE is_paid = FALSE;

# Which course has the highest price?

SELECT course_title, price
FROM udemy
ORDER BY price DESC
LIMIT 10;

# How many courses are there in each level (Beginner, Intermediate, Advanced)?

SELECT level, COUNT(course_title)
FROM udemy
GROUP BY level;

# What is the total number of lectures across all courses?

SELECT SUM(num_lectures)
FROM udemy;

# Which courses were published in the year 2022?

SELECT course_title, published_timestamp
FROM udemy
WHERE EXTRACT(YEAR FROM published_timestamp) = 2022;

# What is the average duration of the courses in minutes?

SELECT AVG(content_duration)
FROM udemy;

# How many courses have a price higher than $100?

SELECT COUNT(course_title)
FROM udemy
WHERE price > 100;

# What is the total number of reviews for all courses?

SELECT SUM(num_reviews)
FROM udemy;

# Which subject has the most number of courses?

SELECT subject, COUNT(course_title) AS count
FROM udemy
GROUP BY subject
ORDER BY count DESC

# How many courses have a duration longer than 3 hours?

SELECT COUNT(course_title)
FROM udemy
WHERE content_duration > '3 hours';