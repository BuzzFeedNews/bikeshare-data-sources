#!/bin/bash
set -e

echoerr() { echo "$@" 1>&2; }

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMP_DIR=$(mktemp -d -t capitalbikeshare)
echoerr "Storing temporary files in $TMP_DIR"
BASE_URI="http://www.capitalbikeshare.com/assets/files/trip-history-data"

function fetch_csv() {
    QUARTER=$1    
    URL="$BASE_URI/$QUARTER.csv"
    curl $URL > $TMP_DIR/$QUARTER.csv
}

function fetch_zip() {
    QUARTER=$1
    SHORT_ID=$(echo $1 | tr -d "-")
    TMPFILE=$TMP_DIR/tmp-$QUARTER.zip
    URL="$BASE_URI/$QUARTER.zip"
    curl $URL > $TMPFILE
    unzip $TMPFILE -d $TMP_DIR 1>&2
    rm $TMPFILE
}

# Download the CSVs
while read quarter; do 
    fetch_csv $quarter;
done < $HERE/quarterly-csvs.txt

# Download and unzip the zip files
while read quarter; do 
    fetch_zip $quarter;
done < $HERE/quarterly-zips.txt

## Merge all the quarterly files into one big one
QUARTERLIES=($(find $TMP_DIR -name "*.csv" -not -name "*tmp*"))
head -1 ${QUARTERLIES[0]}
for quarter in ${QUARTERLIES[@]}; do
    tail -n +2 $quarter;
done

# Clean up
rm $TMP_DIR/*.csv
rmdir $TMP_DIR
