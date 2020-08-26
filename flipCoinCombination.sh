#!/bin/bash
declare -A combination
single() {
	tcount=0; hcount=0;
	read -p "Enter the limit : " limit
	for ((i=0; i<$limit; i++))
	do
		choice=$((RANDOM%2))
		if [ $choice -eq 0 ]; then
			hcount=$(($hcount+1));
			combination[H]=$hcount;
		else
			tcount=$(($tcount+1));
			combination[T]=$tcount;
		fi
	done

	headPercent=`printf %.3f "$(($hcount*100*100/$limit))e-2"`;
	tailPercent=`printf %.3f "$(($tcount*100*100/$limit))e-2"`;
	echo "${!combination[@]}";
	echo "${combination[@]}";
	echo "Percentage of head : "$headPercent;
	echo "Percentage of tail : "$tailPercent;
}

single
