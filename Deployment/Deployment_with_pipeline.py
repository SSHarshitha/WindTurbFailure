# -*- coding: utf-8 -*-


import streamlit as st
import pickle
import numpy as np
import pandas as pd

# Load the saved pipeline
with open('pipeline.pkl', 'rb') as file:
    pipeline = pickle.load(file)

# Load the saved SVM model
with open('trained_model.sav', 'rb') as file:
    model = pickle.load(file)

# Load the saved feature names
with open('feature_names.pkl', 'rb') as file:
    feature_names = pickle.load(file)


def preprocess_input_data(input_data):
    input_df = pd.DataFrame([input_data], columns=feature_names)
    processed_data = pipeline.transform(input_df)
    return processed_data


def predict_failure(input_data):
    input_data_processed = preprocess_input_data(input_data)
    prediction = model.predict(input_data_processed)

    if prediction[0] == 0:
        return "Failure"
    else:
        return "No Failure"


def main():
    # Giving title of app
    st.title("Failure Prediction App")

    # Getting input from users
    Wind_speed = st.number_input('Wind Speed')
    Power = st.number_input('Power')
    Nacelle_ambient_temperature = st.number_input('Nacelle Ambient Temperature')
    Generator_bearing_temperature = st.number_input('Generator Bearing Temperature')
    Gear_oil_temperature = st.number_input('Gear Oil Temperature')
    Ambient_temperature = st.number_input('Ambient Temperature')
    Rotor_Speed = st.number_input('Rotor Speed')
    Nacelle_temperature = st.number_input('Nacelle Temperature')
    Bearing_temperature = st.number_input('Bearing Temperature')
    Generator_speed = st.number_input('Generator Speed')
    Yaw_angle = st.number_input('Yaw_angle')
    Wind_direction = st.number_input('Wind direction')
    Wheel_hub_temperature = st.number_input('Wheel Hub Temperature')
    Gear_box_inlet_temperature = st.number_input('Gearbox Inlet Temperature')

    # Code for prediction
    predictions = ''

    # Creating button for prediction
    if st.button('Prediction Result'):
        input_data = [Wind_speed, Power, Nacelle_ambient_temperature, Generator_bearing_temperature,
                      Gear_oil_temperature, Ambient_temperature, Rotor_Speed, Nacelle_temperature,
                      Bearing_temperature, Generator_speed, Yaw_angle, Wind_direction, Wheel_hub_temperature,
                      Gear_box_inlet_temperature]
        predictions = predict_failure(input_data)

    st.success(predictions)


if __name__ == '__main__':
    main()
