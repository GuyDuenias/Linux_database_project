#!/bin/bash

# checks what are the top 5 most wanted jobs in NYC
interesting_query='SELECT "Job Category", COUNT(*) AS count_by_category FROM job_postings GROUP BY "Job Category" ORDER BY count_by_category DESC LIMIT 5;'
curl -X POST http://127.0.0.1:5000/ -d "$interesting _query"



# Result
#Engineering, Architecture, & Planning|812
#Social Services|296
#Finance, Accounting, & Procurement|294
#Building Operations & Maintenance|269
#Legal Affairs|263
