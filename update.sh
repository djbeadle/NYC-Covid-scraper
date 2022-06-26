#!/bin/bash

# Live totals
# curl https://raw.githubusercontent.com/nytimes/covid-19-data/master/live/us-counties.csv -o data.csv

# Live moving averages
curl https://raw.githubusercontent.com/nytimes/covid-19-data/master/rolling-averages/us-counties-recent.csv -o data.csv

# date,geoid,county,state,cases,cases_avg,cases_avg_per_100k,deaths,deaths_avg,deaths_avg_per_100k
# 2021-12-21,USA-36998,New York City,New York,17958,10049.14,120.54,33,15.43,0.19

tac data.csv | grep -m 1 "New York City" > current_cases_avg.txt
awk -F "\"*,\"*" '{print $6}' current_cases_avg.txt > current_cases_avg_only.txt
cp current_cases_avg_only.txt /var/www/livefromhere/media/current_cases_avg_only.txt

# { echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c < current_cases_avg_only.txt)\r\n\r\n"; cat current_cases_avg_only.txt; } | nc -l 8080
