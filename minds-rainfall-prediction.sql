-- Creating the model 
CREATE MODEL mindsdb.rainfall_prediction_model
FROM files.weather_data
  (SELECT * FROM files.weather_data LIMIT 10000)
PREDICT WeatherType;


-- Checking the status of the model 
SELECT status
FROM mindsdb.models
WHERE name='rainfall_prediction_model';

-- Checking model predictions
SELECT WeatherType, WeatherType_explain
FROM mindsdb.rainfall_prediction_model
WHERE DryBulbCelsius = 100
AND RelativeHumidity = 10;