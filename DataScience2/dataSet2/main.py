from bs4 import BeautifulSoup
import requests
import csv
from tqdm import tqdm

fields = ['News', 'Date']


def getNews():
    headLine = news.find('h2', class_='categoryArticle__title').text
    date = news.find('p', class_='categoryArticle__meta').text.split("at")

    return [headLine, date[0]]


def createURL(pageNumber):
    return 'https://oilprice.com/Latest-Energy-News/World-News/Page-' + pageNumber + '.html'


with open('dataset.csv', 'w',encoding='utf-8', newline='') as csvFile:
    csvWriter = csv.writer(csvFile)
    csvWriter.writerow(fields)

    for i in tqdm(range(40, 51)):
        number = str(i);

        page = requests.get(createURL(number))

        soup = BeautifulSoup(page.content, 'html.parser')
        newsList = soup.find_all('div', class_='categoryArticle')

        for news in newsList:
            csvWriter.writerow(getNews())

        pass
