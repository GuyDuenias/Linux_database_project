#!/bin/python3

from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get():
  return str("Usage:") #Prints usage information following a GET

@app.route('/', methods=['POST'])
def post():
  received_value = str(request.get_data(as_text=True)) #Gets the data from the POST request
  answer = calculate_answer(received_value)
  return str(answer) #Returns the data to the user

def calculate_answer(received_value):

    import sqlite3

    # Connect to the SQLite database
    conn = sqlite3.connect('jobs.db')
    cursor = conn.cursor()

    # Execute the query
    cursor.execute(received_value)

    # Fetch the results (assuming you're expecting one or more rows)
    answer = cursor.fetchall()

    #Format the results: convert each tuple to a string and join them with newline characters
    formatted_answer = "\n".join([str(row) for row in answer])

    # Append a success message on a new line
    success_message = "\nQuery executed successfully!\n"

    # Close the database connection
    conn.close()

    return formatted_answer + success_message

if __name__ == "__main__":
  app.run(host='0.0.0.0')
