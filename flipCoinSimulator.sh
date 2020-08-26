#!/bin/bash
	end=1;
	hcount=0;
	tcount=0;

	while [ $hcount -lt 21 ]
	do
		choice=$((RANDOM%2))
		if [ $choice -eq 0 ]; then
			hcount=$(($hcount+1));
		else
			tcount=$(($tcount+1));
		fi
		if [ $tcount -eq 21 ]; then
			echo "Tail wins by " $(($tcount-$hcount));
			break;
		elif [ $hcount -eq 21 ]; then
			echo "Head wins by " $(($hcount-$tcount));
		fi
	done

	echo "Head count " $hcount;
	echo "Tail count " $tcount;
