#!/bin/bash -x

# @ Description - Use Cases : Employee Wage Calculation
# @ Author - Roshan Balkrushna Shinde
# @ Since - 18-03-2020 

echo "Welcome To Employee Wage Calculation"


#variables

wagePerHr=20
partTimeHrs=4
fullTimeHrs=8
isPresent=1
hrsPerDay=8
isPartTime=1
isFillTime=2
empHrs=0
noOfWorkingDays=20
totalWorkHrs=0
noOfDays=0

declare -a dailyWage

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
#attendance

#Use_Case_2
function dailyWage()
{
	if [[ $((RANDOM%2)) -eq $isPresent ]]
	then
		dailySalary=$(($wagePerHr * $hrsPerDay ))
		echo "Salary is.."$dailySalary
	else
		echo "Salary = 0"
	fi
}
#dailyWage

#Use_Case_3
function checkPartTime()
{
	if [[ $((RANDOM%3)) -eq $isPartTime ]]
	then
		echo "Employee Is Part Time"
		empHrs=4
	elif [[ $((RANDOM%3)) -eq $isFulltime ]]
	then
		echo "Employee is Full Time"
		empHrs=8
	else
		empHrs=0
	fi
	dailySalary=$(($empHrs * $wagePerHr))
	echo "Salary is.."$dailySalary
}
#checkPartTime

#Use_Case_4
function usingCase()
{
	random=$((RANDOM%3))
	case $random in
		1)
		dailySalary=$(($partTimeHrs * $wagePerHr ))
		echo "Salary is.."$dailySalary;;
		2)
		dailySalary=$(($fullTimeHrs * $wagePerHr ))
		echo "Salary is.."$dailySalary;;
		*)
		echo "Salary is.. 0";;
esac
}

function findHrs()		# Use Case 6 Refactored Here For Output of Use Case 7
{
      random=$((RANDOM%3))
      case $random in
         1)
         empHrs=4 ;;
         2)
         empHrs=8 ;;
         *)
         empHrs=0 ;;
       esac
		echo $empHrs
}

function wageCalculate() 	# Use Case 7 Refactored
{
	empHours=$1
	wage=$(($wagePerHr * $empHours))
	echo  $wage
}

#Use_Case_8
#Use_Case_9
function wageForMonth() 	# Use Case 5 Refactored
{
   while [[ totalWorkHrs -lt 100 && noOfDays -lt $noOfWorkingDays  ]]
	do
		((noOfDays++))
		empHrs=$(findHrs $((RANDOM%3)) )
		totalWorkHrs=$(($totalWorkHrs + $empHrs ))
      dailyWage[noOfDays]=$(wageCalculate $empHrs )
   done
totalSalary=$(($totalWorkHrs * $wagePerHr))
echo "Daily Wage.."${dailyWage[@]}
echo "Day Numbers.."${!dailyWage[@]}
echo "Total Wage of Month.."$totalSalary
}
wageForMonth
