from flask import Flask, request, make_response
from flask_restful import Api, Resource
import pyrebase
import random
import string
import json
from geopy.distance import distance as geopy_distance
from datetime import datetime

# Initialize Firebase (config omitted for brevity)

current_datetime = datetime.now()

# Format the date and time as required
formatted_date = current_datetime.strftime("%d-%m-%Y")
formatted_time = current_datetime.strftime("%H:%M")

config = {
    "apiKey": "your-api-key",
    "authDomain": "hackfestsample.firebaseapp.com",
    "projectId": "hackfestsample",
    "storageBucket": "hackfestsample.appspot.com",
    "messagingSenderId": "302159149041",
    "appId": "1:302159149041:web:2ea1b09c9bf479d7a2f650",
    "measurementId": "G-K9515KVH2Y",
    "serviceAccount": "./serviceAccount.json",
    "databaseURL": "https://hackfestsample-default-rtdb.firebaseio.com"
}

firebase = pyrebase.initialize_app(config)
db = firebase.database()

app = Flask(__name__)
api = Api(app)

def generate_issue_id():
    # Generate a random issue_id
        letters_and_digits = string.ascii_letters + string.digits
        return ''.join(random.choices(letters_and_digits, k=10))

class CreateIssue(Resource):
    def post(self):
        # Get data from POST request
        data = request.json
        print(data)
        user_id = data.get('user_id')
        title = data.get('title')
        description = data.get('description')
        imageUrlList = data.get('imageUrlList')
        latitude = data.get('latitude')
        longitude = data.get('longitude')
        category = data.get('category')

        # Generate a new issue_id
        issue_id = generate_issue_id()

        # Additional fields
        additional_data = {
            'listSupportedUser': ["hi"],
            'origin': user_id,
            'support_count': 0,
            'report_count': 0,
            'date': formatted_date,
            'time': formatted_time
        }

        # Combine data and additional fields
        data_with_additional = {**data, **additional_data}
        
        print(data_with_additional)

        
        try:
            db.child("issue-table").child(issue_id).set(data_with_additional)
            
            print("hi")
            user_data = db.child('users-table').child(user_id).get().val()
        
            
            if user_data is None:
                user_data = [issue_id]
            else:
                # issue_ids = user_data.get('issue_ids', [])
                # print(issue_ids)
                # issue_ids.append(issue_id)
                # user_data['issue_ids'] = issue_ids
                user_data = [*user_data, issue_id]
            db.child('users-table').child(user_id).set(user_data)
            
            return {'issue_id': issue_id, 'message': 'Issue created successfully'}, 201
        except Exception as e:
            return {'message': str(e)}, 500
class Increment_support(Resource):       
    # Endpoint to increment support count
    def post(self):
        # Extract user_id and issue_id from request body
        # user_id = json.form.get('user_id')
        data = request.json
        issue_id = data.get('issue_id')
        
        # Fetch the data from the database
        data = db.child("issue-table").child(issue_id).get().val()
        
        # Check if data exists and support_count key is present
        if data and 'support_count' in data:
            # Increment the support count by 1
            new_support_count = data['support_count'] + 1
            
            # Update the support count in the database
            db.child("issue-table").child(issue_id).update({"support_count": new_support_count})
            
            return {"message": "Support count incremented successfully."}, 200
        else:
            return {"message": "Data or support count not found."}, 404
        
class Increment_report(Resource):
    def post(self):
        data = request.json
        issue_id = data.get('issue_id')
        # Fetch the data from the database
        data = db.child("issue-table").child(issue_id).get().val()
        
        # Check if data exists and report_count key is present
        if data and 'report_count' in data:
            # Increment the report count by 1
            new_report_count = data['report_count'] + 1
            
            # Update the report count in the database
            db.child("issue-table").child(issue_id).update({"report_count": new_report_count})
            
            print("Report count incremented successfully.")
        else:
            print("Data or report count not found.")

class GetUserIssues(Resource):
    def post(self):
        data = request.json
        user_id = data.get('user_id')
        issue_ids = db.child('issue-table').child(user_id).get().val()
        
        return {
            "issue_ids": issue_ids
        }


class FilterLocationIssues(Resource):
    def calculate_distance(self, location1, location2):
            return geopy_distance(location1, location2).km
        
    def post(self):
        data = request.json
        print(data)
        issue_ids = db.child('issue-table').get().val()
        filtered_issues = []
        # print(issue_ids)
        for issue in issue_ids:
        #     issue_data = issue
            issue_location = (issue_ids[issue]['latitude'], issue_ids[issue]['longitude'])
            # print(issue_location)
        
            distance = self.calculate_distance((data["latitude"], data["longitude"]), issue_location)
            if distance <= 0.5:  # 500 meters in kilometers
                filtered_issues.append({issue: issue_ids[issue]})

        return {"filtered_issues": filtered_issues}      
    
    
# Add resource to API
api.add_resource(FilterLocationIssues, '/filter_issues')
api.add_resource(GetUserIssues, '/get_user_issues')
api.add_resource(CreateIssue, '/create_issue')
api.add_resource(Increment_report,'/increment_report')
api.add_resource(Increment_support,'/increment_support')


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=5000)