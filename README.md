# Download MagPi shell script

This script downloads issue with provided number from MagPi server.

# Parameters

-n | --number  - issue number, or range of numbers to download, e.g. 72, 78-90
-o | --output  - output folder, `.` is implicit

# Usage

This will download issue number 77 to the current directory

`download_magpi.sh -n 77`

This will download issues `45-57` into `Books` directory in user's home

`download_magpi.sh -n 45-57 -o ~/Books`

# Automatic issue number determination
If you want to regularly download new issues (i.e. every month), substitute 
issue number with `determine_current_issue.sh` script, i.e.

`download_magpi.sh -n $(./determine_current_issue.sh) [--output]`

and put it into `cron`.


