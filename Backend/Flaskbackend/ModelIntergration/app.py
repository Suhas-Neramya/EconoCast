import requests
from flask import Flask, jsonify
import pickle


app = Flask(__name__)

# Load the trained model
filename = '/home/suhasneramya/sdgpFlask/econocast_model.pkl'
with open(filename, 'rb') as file:
    model = pickle.load(file)

# Load the vectorizer from file
with open('/home/suhasneramya/sdgpFlask/vectorizer.pkl', 'rb') as f:
    vectorizer = pickle.load(f)


def get_prediction1(text):
    main = text
    main = [main]
    main = vectorizer.transform(main)
    prediction = model.predict(main)

    return prediction


# Define the API endpoint for prediction
@app.route('/predict', methods=['GET', 'POST'])
def predict():
    url = 'https://newsapi.org/v2/everything'
    params = {
        'q': 'crude oil',
        'sortBy': 'publishedAt',
        'apiKey': 'f099ad81f7434501bbb8e1441347c466'  # Replace with your NewsAPI key
    }

    # Make API request and parse response
    response = requests.get(url, params=params)
    data = response.json()

    # Retrieve the news text from the API response
    news_text = data['articles'][0]['description']

    # Preprocess the news text
    prediction = get_prediction1(news_text)

    prediction_list = prediction.tolist()
    return jsonify({'prediction': prediction_list})


@app.route('/latestNews', methods=['GET', 'POST'])
def news():
    url = 'https://newsapi.org/v2/everything'
    params = {
        'q': 'crude oil',
        'sortBy': 'publishedAt',
        'apiKey': 'f099ad81f7434501bbb8e1441347c466'  # Replace with your NewsAPI key
    }

    # Make API request and parse response
    response = requests.get(url, params=params)
    data = response.json()

    # Retrieve the news text from the API response
    news_text = data['articles'][0]['title']

    return jsonify({'News': news_text})



if __name__ == '__main__':
    app.run(debug=False)
