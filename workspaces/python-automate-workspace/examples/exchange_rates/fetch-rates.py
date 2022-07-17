"""
Trivial script to fetch EU currency exchange rates from www.ecb.europa.eu.
The results are saved to /home/static-server/exchange-rates_<DATE>.json
You can view it with Static file server
"""

import http.client as httplib
import json
from datetime import date, datetime, timedelta
from xml.dom.minidom import parseString

exchange_rates = {}
conn = httplib.HTTPSConnection("www.ecb.europa.eu")
conn.request("GET", "/stats/eurofxref/eurofxref-daily.xml")

res = conn.getresponse()
if res.status != 200:
    raise Exception("Response from EU Central Bank is not 200")

xml = res.read()
p = parseString(xml)

for parent in p.getElementsByTagName("Cube"):
    if parent.getAttribute("time") != "":
        # date_is = parent.getAttribute('time')
        for el in parent.getElementsByTagName("Cube"):
            currency = el.getAttribute("currency")
            rate = str(el.getAttribute("rate")).replace(",", ".")
            exchange_rates[currency] = rate

with open(f"/home/static-server/exchange_rates_{date.today()}.json", "w") as fp:
    json.dump(exchange_rates, fp)