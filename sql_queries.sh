#!/bin/bash

# Veriables of sql queries

# query 1
# checks for each uniq value of position opened how many jobs has that number of jobs opened
query1='SELECT "# Of Positions", COUNT("# Of Positions") AS count FROM job_postings GROUP BY "# Of Positions" ORDER BY "# Of Positions";'
curl 127.0.0.1:5000 -X POST -d "$query1"


# query 2
# checks the average range of salary for annual jobs
query2='SELECT AVG("Salary Range From") AS average_range_from, AVG("Salary Range To") AS average_range_to FROM job_postings WHERE "Salary Frequency" = '"'"'Annual'"'"';'
curl 127.0.0.1:5000 -X POST -d "$query2"


# query 3
# check how many jobs posted in each date
query3='SELECT "Posting Date", COUNT(*) AS jobs_posted FROM job_postings WHERE "Posting Date" LIKE "__/__/____" GROUP BY "Posting Date" ORDER BY SUBSTR("Posting Date", 7, 4), SUBSTR("Posting Date", 1, 2), SUBSTR("Posting Date", 4, 2);'
curl 127.0.0.1:5000 -X POST -d "$query3"


