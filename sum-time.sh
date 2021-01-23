#!/bin/bash

# simple script to add times together and output the result

echo -e "Please enter a time in the MM:SS format \n"
read input
total_m=0
total_s=0
while [[ -n $input ]]; do
	mins=$(echo "$input" | cut -d":" -f1)
	secnd=$(echo "$input" | cut -d":" -f2)
	valid=true
	if [ "$mins" -ge 60 ] || [ "$mins" -lt 0 ]; then
		echo "Please ensure that mins are in range 0 to 59"
		valid=false
	fi
	if [ "$secnd" -ge 60 ] || [ "$secnd" -lt 0 ]; then
		echo "Please ensure that seconds are in range 0 to 59"
		valid=false
	fi
	if [ $valid = true ]; then
		total_s=$(( total_s + secnd))
		total_m=$(( total_m + mins))
	fi
	read input
done
final_s=$(( total_s % 60 ))
final_m=$(( total_m + ( total_s / 60 ) ))
final_h=$(( final_m / 60 ))
echo "Total time: $final_h hours, $(( final_m % 60))  mins, $final_s seconds"


