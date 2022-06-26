# README

This script grabs the most recent COVID numbers for NYC from the New York Times' Github page. I use this in a custom WeatherCAL (a Javascript based iOS homescreen widget) on my iPhone.

More details of that [here](https://danielbeadle.net/post/2021-12-23-weather-cal-custom/)

Cron: `15 * * * * ~/NYC_COVID/update.sh >/dev/null 2>&1`
