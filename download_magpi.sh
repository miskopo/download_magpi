#!/bin/sh
# sysinfo_page - Script to download MagPi issue(s)

# check if wget is installed
[[ -z $(command -v wget) ]] && { echo "wget is required" >&2; exit 1; }

BASE_URL="https://www.raspberrypi.org/magpi-issues/MagPi"
TARGET_PATH=""

usage(){
	echo "helptext placeholder"
}

[[ $# -lt 1 ]] && { usage; exit 1; }
while [ "$1" != "" ]; do
    case $1 in
        -n | --number )         shift
                                ISSUE_NUMBER=$1
                                ;;
	-o | --output )		shift
				TARGET_PATH=$1
				;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

BEGIN_RANGE=$(echo $ISSUE_NUMBER | cut -d "-" -f1);
END_RANGE=$(echo $ISSUE_NUMBER | cut -d "-" -f2);

[[ -z $END_RANGE ]] && END_RANGE=$BEGIN_RANGE;
echo $BEGIN_RANGE;
echo $END_RANGE;

[[ -z "$TARGET_PATH" ]] && TARGET_PATH="."

# Download issue(s)
for ISSUE_NUMBER in $(seq $BEGIN_RANGE $END_RANGE); do
	wget -P $TARGET_PATH --show-progress "${BASE_URL}${ISSUE_NUMBER}".pdf;
done;

exit 0
