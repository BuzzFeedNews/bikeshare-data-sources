#!/bin/bash
set -e

echoerr() { echo "$@" 1>&2; }

TMP_DIR=$(mktemp -d -t citibike)
echoerr "Storing temporary files in $TMP_DIR"

function fetch() {
    MONTH=$1
    SHORT_ID=$(echo $1 | tr -d "-")
    TMPFILE=$TMP_DIR/tmp-$MONTH.zip
    URL="https://s3.amazonaws.com/tripdata/$SHORT_ID-citibike-tripdata.zip"
    curl $URL > $TMPFILE
    unzip $TMPFILE -d $TMP_DIR 1>&2
    rm $TMPFILE
    mv $TMP_DIR/$MONTH*.csv $TMP_DIR/$MONTH.csv
}

# Download and unzip the files
for month in $@; do 
    fetch $month;
done

# Merge all the monthly files into one big one
MONTHLIES=($(find $TMP_DIR -name "*.csv" -not -name "*tmp*"))
head -1 ${MONTHLIES[0]}
for month in ${MONTHLIES[@]}; do
    tail -n +2 $month;
done

# Clean up
rm $TMP_DIR/*.csv
rmdir $TMP_DIR
