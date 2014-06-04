#!/bin/bash
# Sends a very large CSV to stdout
# Example usage: 
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/fetch-month.sh $(cat $DIR/months.txt)
