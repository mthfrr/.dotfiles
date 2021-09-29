#!/usr/bin/env python
import http.client
import re
from subprocess import check_output
import sys

if (len(sys.argv) != 2):
    print(f"Usage : {sys.argv[0]} [cookie]")
    exit(1)

url = "traces.assistants.epita.fr"
cookie = sys.argv[1]
header = {
        "Cookie": f"sessionid={cookie}",
        "User-Agent": "Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0"
        }

c = http.client.HTTPSConnection(url)
c.request("GET", "/", headers=header)
r = c.getresponse()
content = r.read().decode("utf-8")
data = content.replace("\n", "")
data = data.replace(" ", "")
data = re.findall(r"<tbody>.*?</tbody>", data)
data = [re.findall(r"(?<=<td>).*?(?=</td>)", x) for x in data]
tags_status = list([(x[2], "badge-success" in x[3]) for x in data])
tags_status = dict(tags_status)
tags_link = list([(x[2], re.findall(r'(?<=href=")[^>]*(?=">)', x[4])[0]) for x in data])
tags_link = dict(tags_link)
tags = check_output(["git", "for-each-ref",  "--sort=creatordate",  "--format",
    "%(refname)", "refs/tags"]).decode("utf-8").split()[:-1]
base = lambda x: re.sub(r"-[^-]*$", "", x)
report = {}
for t in tags:
    report[base(t)] = (tags_status[t], tags_link[t])
passed = list(map(lambda x: (x[0], x[1][1]), filter(lambda x: x[1][0], report.items())))
failed = list(map(lambda x: (x[0], x[1][1]), filter(lambda x: not x[1][0], report.items())))
print(f"{len(failed)}/{len(report)} failed")
for f, l in failed:
    print(f"- {f[20:]}: {l}")
