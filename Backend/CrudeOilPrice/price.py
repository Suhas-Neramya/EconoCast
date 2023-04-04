import requests #Install the requests library using pip.
import firebase_admin
import datetime
from firebase_admin import credentials
from firebase_admin import firestore



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

addPriceToDataBase()