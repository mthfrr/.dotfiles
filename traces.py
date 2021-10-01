#!/usr/bin/env python
import http.client
import re
from subprocess import check_output
import sys

if (len(sys.argv) != 2):
    print(f"Usage : {sys.argv[0]} [Cookie]")
    exit(1)

url = "traces.assistants.epita.fr"
cookie = sys.argv[1]
header = {
        "Cookie": f"sessionid={cookie}",
        "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0",
        "Host": "traces.assistants.epita.fr",
        "Accept": "text/html",
        "Accept-Language": "en-US,en;q=0.5"
        }
print(header)
c = http.client.HTTPSConnection(url)
c.request("GET", "/traces/", headers=header)
r = c.getresponse()
print(f"HTTP {r.status}")
assert(r.status == 200)
content = r.read().decode("utf-8")
data = content.replace("\n", "")
data = data.replace(" ", "")
data = re.findall(r"<tbody>.*?</tbody>", data)
data = [re.findall(r"(?<=<td>).*?(?=</td>)", x) for x in data][10:]
# print(data)
TAG = 4
SUCC = 5
LINK = 7
tags_status = list([(x[TAG], "badge-success" in x[SUCC]) for x in data])
tags_status = dict(tags_status)
# print(tags_status)
tags_link = list([(x[TAG], re.findall(r'(?<=href=")[^>]*(?=">)', x[LINK])) for x in data])
tags_link = map(lambda x: x if x[1] != [] else (x[0], "Unavailable"), tags_link)
tags_link = dict(tags_link)
#print("\n".join(map(lambda x: str(x), tags_link.items())))
tags = map(lambda x: x[10:], check_output(["git", "for-each-ref",  "--sort=creatordate",  "--format",
    "%(refname)", "refs/tags"]).decode("utf-8").split()[:-1])
base = lambda x: re.sub(r"-[^-]*$", "", x)
report = {}
for t in tags:
    if (t in tags_status):
        report[base(t)] = (tags_status[t], tags_link[t])
passed = list(map(lambda x: (x[0], x[1][1]), filter(lambda x: x[1][0], report.items())))
failed = list(map(lambda x: (x[0], x[1][1]), filter(lambda x: not x[1][0], report.items())))
print(f"{len(failed)}/{len(report)} failed")
for f, l in failed:
    print(f"- {f} : {l}")
