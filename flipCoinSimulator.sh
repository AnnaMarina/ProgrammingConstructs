#!/bin/bash

	tie () {
	temp=0;
	while [ $temp -lt 2 ]
	do
		choice=$((RANDOM%2))
                if [ $choice -eq 0 ]; then
                        hcount=$(($hcount+1));
                else
                        tcount=$(($tcount+1));
		fi
		temp=$(($hcount-$tcount))
		if [ $(($tcount-$hcount)) -eq 2 ]; then
		break;
		fi
	done
	}


	end=1;
	hcount=5;
	tcount=5;

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

		elif [ $tcount -eq 21 -a $hcount -eq 21 ]; then
			tie
			break;
		fi
	done

	echo "Head count " $hcount;
	echo "Tail count " $tcount;
