from flask import Flask
import datetime
import requests

app = Flask(__name__)

@app.route('/api/hello')
def hello():
    hostname = "server1"
    current_datetime = datetime.datetime.now().strftime('%Y%m%d%H%M')
    version = "v1"
    weather_response = requests.get(f"https://api.openweathermap.org/data/2.5/weather?q=Dhaka&appid=29b3d7694f829fb1d453d619ebbe62d6")
    weather_data = weather_response.json()
    temperature = weather_data['main']['temp']
    temperature_celsius = round(temperature - 273.15, 2)  # Convert from Kelvin to Celsius
    return {
        "hostname": hostname,
        "datetime": current_datetime,
        "version": version,
        "weather": {
            "dhaka": {
                "temperature": temperature_celsius,
                "temp_unit": "c"
            }
        }
    }

if __name__ == '__main__':
    app.run(debug=True)
