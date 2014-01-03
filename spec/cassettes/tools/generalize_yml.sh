#!/bin/bash

if [ "$1" == '-h' ]; then
	printf "This tool searches the specified YML cassette and resets all time/session\nspecific details, making it much easier to find duplicates.\n\nUsage:\n\n$0 <yml_file>\n\n"
	exit 0
fi

INFILE=$1

if [ -f "$INFILE" ]; then

	# Dates
	sed -r -i 's/(Mon|Tue|Wed|Thu|Fri|Sat|Sun).*GMT/Thu, 01 Jan 1970 00:00:00 GMT/' $INFILE

	#GRIDHTTP_PASSCODE
	sed -r -i 's/GRIDHTTP_PASSCODE=[a-zA-Z0-9]*/GRIDHTTP_PASSCODE=0000000000000000000000/' $INFILE

	#rack.session
	sed -r -i 's/rack.session=[^;]*/rack.session=000000000000000000000000000000000000000000000000000000000000%0A000000000000000000000000000000000000000000000000000000000000%0A000000000000000000000000000000000000000000000000000000000000%0A000000000000000000000000000000000000000000000000000000000000%0A000000000000000000000000000000000000000000000000000000000000%0A000000000000000000000000000000000000000000000000000000000000%0A00000000000000000000000000000000000000000000000000%3D%3D%0A--0000000000000000000000000000000000000000/' $INFILE

else
	printf "\n$0: File to generalize must be passed as argument.\n" >&2
	exit 1
fi

exit 0
