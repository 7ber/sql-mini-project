/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */

SELECT name
FROM   Facilities
WHERE  membercost > 0;



/* Q2: How many facilities do not charge a fee to members? */

SELECT COUNT(*)
FROM   Facilities
WHERE  membercost = 0;



/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT facid, name, membercost, monthlymaintenance
FROM Facilities
WHERE membercost >0
AND membercost < ( monthlymaintenance *20 /100 );



/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

SELECT *
FROM Facilities
WHERE facid
IN ( 1, 5 );



/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

SELECT name
CASE WHEN monthlymaintenance >100
THEN 'expensive'
ELSE 'cheap'
END AS cost
FROM Facilities;



/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

SELECT firstname, surname, joindate
FROM Members
WHERE joindate=
(SELECT MAX(joindate)
FROM Members);


/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

SELECT DISTINCT CONCAT( m.firstname, " ", m.surname ) AS name, f.name AS facility
FROM Bookings b
JOIN Facilities f ON b.facid = f.facid
JOIN Members m ON b.memid = m.memid
WHERE f.name LIKE 'Tennis%'
ORDER BY name



/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */

SELECT DISTINCT CONCAT( m.firstname, " ", m.surname ) AS name, f.name AS fac_name,
CASE WHEN b.memid =0
THEN f.guestcost * b.slots
ELSE f.membercost * b.slots
END AS cost
FROM Bookings AS b
JOIN Facilities AS f ON b.facid = f.facid
JOIN Members AS m ON b.memid = m.memid
WHERE b.starttime LIKE '2012-09-14%'
HAVING cost >30
ORDER BY cost DESC


/* Q9: This time, produce the same result as in Q8, but using a subquery. */

SELECT DISTINCT CONCAT( m.firstname, " ", m.surname ) AS name, tt.fac_name, tt.cost
FROM (

SELECT f.name AS fac_name, b.starttime,
CASE WHEN b.memid =0
THEN f.guestcost * b.slots
ELSE f.membercost * b.slots
END AS cost
FROM Bookings AS b
JOIN Facilities AS f ON b.facid = f.facid
JOIN Members AS m ON b.memid = m.memid
) AS tt
WHERE tt.starttime LIKE '2012-09-14%'
AND tt.cost >30
ORDER BY tt.cost DESC




/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

SELECT f.name AS fac_name,
CASE WHEN b.memid =0
THEN f.guestcost * b.slots + f.initialoutlay - f.monthlymaintenance
ELSE f.membercost * b.slots + f.initialoutlay - f.monthlymaintenance
END AS revenue
FROM Facilities AS f
JOIN Bookings AS b ON b.facid = f.facid
GROUP BY fac_name
HAVING revenue < 1000
ORDER BY revenue
