from flask import Flask, request, make_response
from flask_restful import Api, Resource
import pyrebase
import random
import string
import json
from geopy.distance import distance as geopy_distance

# Initialize Firebase (config omitted for brevity)
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

app = Flask(_name_)
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
            'report_count': 0
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

if _name_ == '_main_':
    app.run(debug=True, host="0.0.0.0", port=5000)