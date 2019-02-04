#!/bin/bash

# What does it do?
# Parse a text file and count total of subunits in each unit.

# Please review count-subunits-per-unit.md for more details.

file="$1"

if [ -z ${file} ]; then
		echo -e "\nPlease give a file name as a parameter"
		echo "ex: ./count-subunits-per-unit.sh sourcefile.txt"
		exit 1
fi

# Determine last unit number
line=`tail -n1 ${file}`   # Determine largest unit #. With sample data above,
 						  #	it would be  11
unitNum1=${line%-*}
unitNum2=${unitNum1:(-2)}  # Extracts numeric portion of unit. 
						   # Use -2 if unit99 is higest.
						   # Use -3 if unit999 is highest.


# Calculate total of subunits per unit and print output
echo -e "\n====================="
echo -e "Unit #\t Total of subunits"
echo "====================="
echo ""
for i in $(seq -w 1 ${unitNum2}); 
do
	count=`grep -i unit${i} ${file} | wc -l`
	count=`echo ${count} | xargs`
	echo -e "unit${i}    ${count}"
done

echo -e "\n=== END ==="
