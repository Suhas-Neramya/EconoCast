from bs4 import BeautifulSoup
import requests
import csv
from tqdm import tqdm

fields = ['News', 'Date']


def createURL(pageNumber):
    return 'https://www.hellenicshippingnews.com/category/oil-energy/oil-companies-news/page/' + pageNumber + '/'


def call():
    with open('dataset.csv', 'w', encoding='utf-8', newline='') as csvFile:

        csvWriter = csv.writer(csvFile)
        csvWriter.writerow(fields)

        for j in tqdm(range(2, 1700)):

            number = str(j)

            page = requests.get(createURL(number))

            soup1 = BeautifulSoup(page.content, 'html.parser')

            newsList = soup1.find_all('article', class_='item-list')

            for news in newsList:

                link = news.find('a')
                page2 = requests.get(link.attrs['href'])

                newsList2 = ''

                soup2 = BeautifulSoup(page2.content, 'html.parser')

                news_Ptag = soup2.find('div', class_='post-inner').find('div', class_='entry').find_all('p')
                date = news.find('span', class_='tie-date').text

                for i in news_Ptag:
                    newsList2 = newsList2 + i.text

                csvWriter.writerow([newsList2, date])

            pass

call()
