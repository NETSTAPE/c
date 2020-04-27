# -*- coding: utf-8 -*-

import requests

r = requests.get('https://api.github.com')
print(r.status_code)