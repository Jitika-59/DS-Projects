import requests

url = "https://yt-api.p.rapidapi.com/channel/videos"

payload = {}
headers = {
	"x-rapidapi-key": "446886d041msh8286c687ada83cbp1064a9jsn8d7fb625041f",
	"x-rapidapi-host": "yt-api.p.rapidapi.com",
	"Content-Type": "application/x-www-form-urlencoded"
}

response = requests.post(url, data=payload, headers=headers)

print(response.json())