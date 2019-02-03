#!/bin/sh
# sysinfo_page - Script to download MagPi issue(s)

# check if wget is installed
[[ -z $(command -v wget) ]] && { echo "wget is required" >&2; exit 1; }

BASE_URL="https://www.raspberrypi.org/magpi-issues/MagPi${ISSUE_NUMBER}.pdf"

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

exit 0
