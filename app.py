from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

# Load the model
file_path = "random_forest_model.pkl"  # Path to the model file
with open(file_path, 'rb') as file:
    model = pickle.load(file)


# Define a route for the home page
@app.route('/')
def home():
    return "Welcome to the ML Prediction API!"


# Define the prediction route
@app.route('/predict', methods=['POST'])
def predict():
    data = request.json  # Get the JSON data from the request
    features = data['features']  # Extract the features

    # Convert to 2D array (since the model expects 2D input)
    features = np.array(features).reshape(1, -1)

    # Make the prediction
    prediction = model.predict(features)

    # Return the prediction as JSON
    return jsonify({'prediction': prediction.tolist()})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001)