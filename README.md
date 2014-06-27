# Bikeshare Data Sources

This repository keeps track of the datasets that bike-sharing programs have released. Right now, it's an incomplete list focusing on programs that release trip-history data.

---

## Boston — Hubway

- __Website__: [http://hubwaydatachallenge.org/trip-history-data/](http://hubwaydatachallenge.org/trip-history-data/)

### Trip History

- __Links__: [latest .zip](http://hubwaydatachallenge.org/)
- __Coverage__: 2012-10-01 to 2013-11-30
- __Extra fields__: gender (subscribers only), birth year (subscribers only)

### Station Details

Included in the trip-history download.

---

## Chicago — Divvy

- __Website__: [https://www.divvybikes.com/datachallenge](https://www.divvybikes.com/datachallenge)

### Trip History

- __Links__: [latest .zip](https://www.divvybikes.com/assets/images/Divvy_Stations_Trips_2013.zip)
- __Coverage__: 2013-06-27 to 2013-12-31
- __Extra fields__: gender (subscribers only), birth year (subscribers only)

### Station Details

Included in the trip-history download.

---

## New York City — Citi Bike

- __Website:__ [http://www.citibikenyc.com/system-data](http://www.citibikenyc.com/system-data)

### Trip History

- __Links__: See link above and notes below.
- __Coverage__: 2013-07-01 to 2014-02-28
- __Extra fields__: gender (subscribers only), birth year (subscribers only)

Citi Bike provides month-by-month downloads of its trip history data. To download all available months and merge them into a single CSV file, use [the Bash script included in this repository](scripts/nyc-citibike/fetch-all.sh):

```sh
./scripts/nyc-citibike/fetch-all.sh > PATH/TO/FILE.csv
```

### Station Details

- __Links__: [live JSON](http://www.citibikenyc.com/stations/json)

A JSON file listing all active Citi Bike stations can be downloaded link above. Basic station attributes can also be extracted from the trip history data (see above).

---

## Washington, D.C. — Capital Bikeshare

- __Data homepage:__ [https://www.capitalbikeshare.com/system-data](https://www.capitalbikeshare.com/system-data)

### Trip History Data

- __Where to find it__: [https://www.capitalbikeshare.com/trip-history-data](https://www.capitalbikeshare.com/trip-history-data)
- __Coverage__: 2010-09-15 to 2014-03-31
- __Extra fields__: None

Capital Bikeshare provides quarterly downloads of its trip history data. Data through the third quarter of 2013 are provided as direct CSV downloads. Data for later quarters are provided as ZIP files of CSV files. To download all available quarters and merge them into a single CSV file, use [the Bash script included in this repository](scripts/dc-capital-bikeshare/fetch-all.sh):

```sh
./scripts/dc-capital-bikeshare/fetch-all.sh > PATH/TO/FILE.csv
```

### Station Data

- __Where to find it__: [live XML](https://www.capitalbikeshare.com/data/stations/bikeStations.xml)

A XML file listing all active Capital Bikeshare stations can be downloaded from link above. Basic station attributes can also be extracted from the trip history data (see above).

---
