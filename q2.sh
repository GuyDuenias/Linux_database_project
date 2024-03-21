#!/bin/bash

# install server
sudo apt-get update
sudo apt-get install sqlite3

# Database and table names (modify as needed)
DATABASE_NAME="jobs.db"
TABLE_NAME="job_postings"

# Check if csv file exists
if [ ! -f "Jobs_NYC_Postings.csv" ]; then
  echo "Error: CSV file 'Jobs_NYC_Postings.csv' not found!"
  exit 1
fi

# Create the database (if it doesn't exist)
sqlite3 "$DATABASE_NAME" ".mode csv" ".header on" &>/dev/null

# Define table schema with appropriate data types
sqlite3 "$DATABASE_NAME" <<EOF
CREATE TABLE IF NOT EXISTS $TABLE_NAME (
  "Job ID" INTEGER,
  "Agency" TEXT,
  "Posting Type" TEXT,
  "# Of Positions" INTEGER,
  "Business Title" TEXT,
  "Civil Service Title" TEXT,
  "Title Classification" TEXT,
  "Title Code No" INTEGER,
  "Level" INTEGER,
  "Job Category" TEXT,
  "Full-Time/Part-Time indicator" TEXT,
  "Career Level" TEXT,
  "Salary Range From" REAL,
  "Salary Range To" REAL,
  "Salary Frequency" TEXT,
  "Work Location" TEXT,
  "Division/Work Unit" TEXT,
  "Job Description" TEXT,
  "Minimum Qual Requirements" TEXT,
  "Preferred Skills" TEXT,
  "Additional Information" TEXT,
  "To Apply" TEXT,
  "Hours/Shift" TEXT,
  "Work Location 1" TEXT,
  "Recruitment Contact" TEXT,
  "Residency Requirement" TEXT,
  "Posting Date" DATE,
  "Post Until" DATE,
  "Posting Updated" DATE,
  "Process Date" DATE
);
.mode csv
.import Jobs_NYC_Postings.csv $TABLE_NAME
EOF

# Success message
echo "Database '$DATABASE_NAME' created and data imported successfully!"
