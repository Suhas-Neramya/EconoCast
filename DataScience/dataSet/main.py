from bs4 import BeautifulSoup
import requests

url = 'https://www.hellenicshippingnews.com/category/oil-energy/oil-companies-news/'
page = requests.get(url)
print(page)

soup = BeautifulSoup(page.content,'html.parser')
newsList = soup.find_all('article', class_='item-list')

for news in newsList:
    headLine = news.find('h2',class_='post-title').text
    date = news.find('span',class_='tie-date').text

    print(headLine)
    print(date)
    print()
