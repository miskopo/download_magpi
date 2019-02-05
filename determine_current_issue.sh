#!/bin/sh
THIS_MONTH=$(date +"%m")
THIS_YEAR=$(date +"%Y")
# as of 1/2019 issue 77 was published. New issue is published each month
# ex eo efficitur following formula:
echo $((76 + $THIS_MONTH + ($THIS_YEAR % 2019) * 12))
