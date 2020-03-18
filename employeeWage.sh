#!/bin/bash -x

# @ Description - Use Cases : Employee Wage Calculation
# @ Author - Roshan Balkrushna Shinde
# @ Since - 18-03-2020 

echo "Welcome To Employee Wage Calculation"

#variables
isPresent=1
wagePerHour=20
hrsPerDay=8

#Use_Case_1
function attendance()
{
	if [[ $((RANDOM%2)) -eq $isPresent ]]
	then
		echo "Employee is Present"
	else
		echo "Employee Is Absent"
	fi
}
attendance

#Use_Case_2
function dailyWage()
{
	if [[ $((RANDOM%2)) -eq $isPresent ]]
	then
		dailySalary=$(($wagePerHour * $hrsPerDay ))
		echo "Salary is.."$dailySalary
	else
		echo "Salary = 0"
	fi
}
dailyWage
