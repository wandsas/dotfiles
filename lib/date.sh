#!/usr/sh

# Print a timestamp
# @return date of the format YYYYMMDD_HMS (e.g. 20181027_160749)
#
print_timestamp () {
	echo $(date +'%Y%m%d_%H%M%S')
}

# Print a date as string with digits only
# @return date of the format YYYYMMDD (e.g. 20181027)
#
print_datestamp () {
    echo $(date +'%Y%m%d')
}

# Print a date
# @return date of the format YYYY/MM/DD (e.g. 2018/10/27)
#
print_date () {
    echo $(date +'%Y/%m/%d')
}

# Print a date and the time
# @return date of the format YYYY/MM/DD HH:MM:SS (e.g. 2018/10/27 16:08:22)
#
print_datetime () {
	echo $(date +'%Y/%m/%d %H:%M:%S')
}
