import requests
import json



# Define the data containing user_id and issue_id
data = {
    # "user_id": "WkBdRPVHrKVHwq8aCNNIMXH2T3f2",
    "issue_id": "DAL5rSMm6L"
}

# Make a POST request to the Flask endpoint
response = requests.post('http://172.16.17.12:5000/increment_report', json=data)

print(response.text)

