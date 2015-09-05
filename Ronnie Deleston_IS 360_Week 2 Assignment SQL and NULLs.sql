#How many airplanes have listed speeds? 
SELECT *
FROM planes
WHERE speed IS NOT NULL;
#What is the minimum listed speed and the maximum listed speed?
SELECT tailnum, year, type, Max(speed) AS "Maximum Speed"
FROM planes;
#What is the total distance flown by all of the planes in January 2013?
SELECT SUM(distance)
FROM flights
WHERE month=1 AND year=2013;
#What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT SUM(distance)
FROM flights
WHERE month=1 AND year=2013 AND tailnum='';
#What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?
Select planes.manufacturer, SUM(flights.distance)
FROM flights
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.month=7 AND flights.year=2013 AND flights.day=5
GROUP BY planes.manufacturer;
#LEFT JOIN
Select planes.manufacturer, SUM(flights.distance)
FROM flights
LEFT OUTER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.month=7 AND flights.year=2013 AND flights.day=5
GROUP BY planes.manufacturer;
#Which flight had the least delays in the month of September?
Select *, MIN(dep_delay)
FROM flights
WHERE month=9;

