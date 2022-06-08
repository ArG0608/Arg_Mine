import requests
##response_API = requests.get('https://www.askpython.com/')
response_API = requests.get('https://api.nytimes.com/svc/books/v3')
print(response_API.status_code)