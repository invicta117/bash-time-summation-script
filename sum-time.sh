#!/bin/bash

# simple script to add times together and output the result

echo -e "Please enter a time in the HH:MM format \n"
read input
total_h=0
total_m=0
while [[ -n $input ]]; do
	hour=$(echo "$input" | cut -d":" -f1)
	mins=$(echo "$input" | cut -d":" -f2)
	valid=true
	if [ "$mins" -ge 60 ] || [ "$mins" -lt 0 ]; then
		echo "Please ensure that mins are in range 0 to 59"
		valid=false
	fi
	if [ "$hour" -lt 0 ]; then
		echo "Please ensure that hours are greater than 0"
		valid=false
	fi
	if [ $valid = true ]; then
		total_h=$(( total_h + hour))
		total_m=$(( total_m + mins))
	fi
	read input
done
total_h=$(( total_h + ( total_m / 60 )))
final_m=$(( total_m % 60 ))
echo "Total time: $total_h hours, $final_m mins"

