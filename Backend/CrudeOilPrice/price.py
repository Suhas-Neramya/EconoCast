import requests #Install the requests library using pip.



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

price = connectAPI()
print('Latest Price :',price)