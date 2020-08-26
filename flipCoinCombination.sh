#!/bin/bash
declare -A combination
declare -A percent
single() {
	countT=0; countH=0;

	for ((i=0; i<$1; i++))
	do
		choice=$((RANDOM%2))
		if [ $choice -eq 0 ]; then
			countH=$(($countH+1));
		else
			countT=$(($countT+1));
		fi
	done

	combination[H]=$countH;
	combination[T]=$countT;
}

doublet() {
	countHH=0; countHT=0; countTH=0; countTT=0;

	for ((i=0; i<$1; i++))
	do
		choice=$((RANDOM%4));
		case $choice in
			0)
				countHH=$(($countHH+1))
			;;

			1)
				countHT=$(($countHT+1))
			;;

			2)
				countTH=$(($countTH+1))
			;;

			3)
				countTT=$(($countTT+1))
			;;

		esac
	done
	combination[HH]=$countHH;
	combination[HT]=$countHT;
	combination[TH]=$countTH;
	combination[TT]=$countTT;

	i=0;

	#For calculating percentage of singlet and doublet.
	for n in ${!combination[@]}
	do
		temp=`printf "${combination[$n]}"`
		percent[$(($i))]=`printf %.3f "$(($temp*100*100/$1))e-2"`;
		key[$(($i))]=`printf "$n"`;
		i=$(($i+1));
	done

	#To print the single and doublet
	echo "The single and doublet are";
	echo "${!combination[@]}";
        echo "${combination[@]}";

	echo "The percentage are as follows";
	for ((j=o; j<i; j++ ))
	do
	echo "${key[$j]}  :  ${percent[$j]}"

	done
	#echo "${key[@]}";
	#echo "${percent[@]}";
}
	read -p "Enter the limit : " limit

	single $limit
	doublet $limit
