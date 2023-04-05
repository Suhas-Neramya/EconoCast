import requests
from flask import Flask, jsonify
import firebase_admin
import datetime
from firebase_admin import credentials
from firebase_admin import firestore


app = Flask(__name__)


def connectAPI():
    # latest price link from Oil Price API
    url = 'https://api.oilpriceapi.com/v1/prices/latest'

    headers = {
        'Authorization': 'Token 554cbbbd17d7439328d647d02bca0fa9'
    }

    params = {
        'commodity': 'brent_crude'
    }

    response = requests.get(url, headers=headers, params=params)

    data = response.json()

    return (data['data']['price'])


def initializeFirebaseApp():
    cred = credentials.Certificate('econocast-72fdc-firebase-adminsdk-2er3u-212c1c2255.json')
    firebase_admin.initialize_app(cred)


def addPriceToDataBase():

    # set current time and date
    now = datetime.datetime.now()
    formatted_date = now.strftime("%Y-%m-%d %H:%M:%S")
    #print(formatted_date)

    # Add price data to Firestore
    price_data = {
        'Price' : connectAPI(),
        'Time' : firestore.SERVER_TIMESTAMP
    }

    doc_ref = db.collection('prices').document(formatted_date)
    doc_ref.set(price_data)


#price = connectAPI()
initializeFirebaseApp()


# Create a Firestore client
db = firestore.client()


# Define the API endpoint for prediction
@app.route('/latestPrice', methods=['GET', 'POST'])
def getLatestPrice():
    docs_ref = db.collection('prices')
    last_doc = docs_ref.order_by('Time', direction=firestore.Query.DESCENDING).limit(1).get()

    for doc in last_doc:
        price = doc.get('Price')
        return jsonify({'Price': price})



if __name__ == '__main__':
    app.run(debug=False)


