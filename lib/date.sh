#!/usr/bin/env sh

#
# Print a timestamp (e.g. 20181027_160749)
#
print-timestamp () {
	echo $(date +'%Y%m%d_%H%M%S')
}

#
# Print a date as string with digits only (e.g. 20181031)
#
print-datestamp () {
    echo $(date +'%Y%m%d')
}

#
# Print a date (e.g. 2018/10/27)
#
print-date () {
    echo $(date +'%Y/%m/%d')
}

#
# Print a date and the time (e.g. 2018/10/27 16:08:22)
#
print-datetime () {
	echo $(date +'%Y/%m/%d %H:%M:%S')
}

# vim:ft=sh:fenc=utf-8:
