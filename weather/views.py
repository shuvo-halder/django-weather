from django.shortcuts import render
import requests
# Create your views here.


def home(request):
    city = request.GET.get('city','dhaka')
    api_key = "152880484a86633e4638f4d675354a01"

    url = f"https://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"
    response = requests.get(url)
    data = response.json()

    weather_data = {
        'city' : city,
        'temperature' : data['main']['temp'],
        'description' : data['weather'][0]['description']
    }
    return render(request, 'weather/home.html', weather_data)

    