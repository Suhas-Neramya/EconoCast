from bs4 import BeautifulSoup
import requests
import string
import csv
from tqdm import tqdm

fields = ['News', 'Date']


def getNews():
    headLine = news.find('h2', class_='post-title').text.lower().translate(
        str.maketrans("", "", string.punctuation))
    date = news.find('span', class_='tie-date').text

    return [headLine, date]


def createURL(pageNumber):
    return 'https://www.hellenicshippingnews.com/category/oil-energy/oil-companies-news/page/' + pageNumber + '/'


with open('dataset.csv', 'w',encoding='utf-8', newline='') as csvFile:
    csvWriter = csv.writer(csvFile)
    csvWriter.writerow(fields)

    for i in tqdm(range(2, 1354)):
        number = str(i);

        page = requests.get(createURL(number))

        soup = BeautifulSoup(page.content, 'html.parser')
        newsList = soup.find_all('article', class_='item-list')

        for news in newsList:
            csvWriter.writerow(getNews())

        pass
