#!/bin/bash
	end=1;
	hcount=0;
	tcount=0;

	while [ $end -ne 0 ]
	do
		choice=$((RANDOM%2))
		if [ $choice -eq 0 ]; then
			hcount=$(($hcount+1));
		else
			tcount=$(($tcount+1));
		fi
	read -p "For exit enter 0   " end ;
	done

	echo "Head count " $hcount;
	echo "Tail count " $tcount;
