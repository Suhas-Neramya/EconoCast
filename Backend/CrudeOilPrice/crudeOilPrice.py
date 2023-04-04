import requests

def getWeekPrice():
    url = 'https://www.alphavantage.co/query?function=BRENT&interval=weekly&apikey=VJ0EKFU4FBWNT7EG'
    r = requests.get(url)
    data = r.json()
