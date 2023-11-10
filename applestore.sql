USE applestore;

-- 1. Which are the different genres?

SELECT distinct prime_genre
FROM applestore2;

-- 2. Which is the genre with more apps rated?

SELECT prime_genre, SUM(rating_count_tot) AS total_rating_count
FROM applestore2
GROUP BY prime_genre
ORDER BY total_rating_count DESC
LIMIT 1;

-- 3. Which is the genre with more apps?
SELECT prime_genre, COUNT(track_name) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count DESC
LIMIT 1;

-- 4. Which is the one with less?
SELECT prime_genre, COUNT(track_name) AS app_count
FROM applestore2
GROUP BY prime_genre
ORDER BY app_count ASC
LIMIT 1;

-- 5. Take the 10 apps most rated.
SELECT track_name, SUM(rating_count_tot) AS total_rating_count
FROM applestore2
GROUP BY track_name
ORDER BY total_rating_count DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT track_name, user_rating
FROM applestore2
ORDER BY user_rating DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

-- These are the apps that have received the highest number of ratings.
-- The total rating count can be an indicator of an app's popularity and user engagement. 

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

--  These are the names of the top 10 apps that have received the highest user ratings.
-- High user ratings generally indicate that users are satisfied with the app's quality, features, and overall user experience.

-- 9. Now compare the data from questions 5 and 6. What do you see?

-- We can see that the top 10 apps most rated are diffetent from the top 10 apps best rated.

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?

SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT price, COUNT(track_name) AS app_count, AVG(user_rating) AS avg_rating
FROM applestore2
GROUP BY price
ORDER BY price;

-- This query groups apps by price, showing the count of apps and the average user rating within each price tier.
-- We can see that on average higher-priced apps have better ratings compare to the lower-priced ones.

SELECT price, SUM(rating_count_tot) AS total_rating_count
FROM applestore2
GROUP BY price
ORDER BY  total_rating_count DESC;

/* With this query we can observe how the total rating count varies across different price points.
 We can see that the apps that are free or lower-priced, have a higher number of rates,
 which means that users are more willing to rate and engage with these apps.
 
 Conclusion: Yes, people care about the price, even though higher-priced apps have a better rating on average,
 the number of ratings decreases significantly as the app´s price increase, which suggest that this is due to a decrease of users as well.
