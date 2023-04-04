import requests

def getWeekPrice():
    url = 'https://www.alphavantage.co/query?function=BRENT&interval=weekly&apikey=VJ0EKFU4FBWNT7EG'
    r = requests.get(url)
    data = r.json()

    weeklyPriceArray = []

    for i in range(900):
        weeklyPriceArray.append(data['data'][i])
    
    return weeklyPriceArray
    
def getMonthlyPrice():
    url = 'https://www.alphavantage.co/query?function=BRENT&interval=monthly&apikey=VJ0EKFU4FBWNT7EG'
    r = requests.get(url)
    data = r.json()