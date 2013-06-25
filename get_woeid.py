import sys
import json
import urllib
import urllib2

query = urllib.quote_plus('select * from geo.placefinder where text="' + sys.argv[1] + '"')
data = json.load(urllib2.urlopen('http://query.yahooapis.com/v1/public/yql?q=' + query + '&format=json'))
if not data:
    sys.stderr.write("No data returned from yahoo api\n")
    quit(1)

path = ['query', 'results', 'Result']
for key in path:
    if data.has_key(key) and data[key]:
        data = data[key]
    else:
        sys.stderr.write("No result.\n")
        quit(1)

woeid = data['woeid']
for key in ['line' + str(i) for i in range(1,5)]:
    if data[key]:
        name=data[key]
        break;

print woeid + '\t' + name
quit(0)
