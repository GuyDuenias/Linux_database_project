#!/bin/bash

# checks what are the top 5 most wanted jobs in NYC
interesting_query='SELECT "Job Category", COUNT(*) AS count_by_category FROM job_postings GROUP BY "Job Category" ORDER BY count_by_category DESC LIMIT 5;'
curl 127.0.0.1:5000 -X POST -d "$interesting_query"



# Result
#Engineering, Architecture, & Planning|812
#Social Services|296
#Finance, Accounting, & Procurement|294
#Building Operations & Maintenance|269
#Legal Affairs|263
# "Engineering, Architecture, & Planning" topping NYC job postings highlights investment in infrastructure and sustainability, showcasing the city's evolving, diverse economic priorities.
