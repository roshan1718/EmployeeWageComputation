#!/bin/bash -x

# @ Description - Use Cases : Employee Wage Computation
# @ Author - Roshan Balrushna Shinde
# @ Since - 18-03-2020 

echo "Welcome To Employee Wage Calculation"

#variables
isPresent=1

#Use_Case_1
function attendance()
{
	random=$((RANDOM % 2 ))
	if [[ $random -eq $isPresent ]]
	then
		echo "Employee is Present"
	else
		echo "Employee Is Absent"
	fi
}
attendance
