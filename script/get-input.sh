#!/bin/bash

YEAR=$1
DAY=$2

if [[ -f "lib/adventofcode/$YEAR/inputs/$DAY.txt" ]]; then
  echo "INPUT FOR $YEAR DAY $DAY ALREADY EXISTS";
  exit 1;
fi

curl --cookie session=$(cat session_cookie.txt) \
  -o lib/adventofcode/$YEAR/inputs/$DAY.txt \
  https://adventofcode.com/$YEAR/day/$DAY/input

