#!/bin/bash
declare -A combination

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
}

triplet() {
	countHHH=0; countHHT=0; countHTH=0; countTHT=0; countTTH=0;
	countTTT=0; countHTT=0; countTHH=0;

        for ((i=0; i<$1; i++))
        do
                choice=$((RANDOM%8));
                case $choice in
                        0)
                                countHHH=$(($countHHH+1))
                                ;;
                        1)
                                countHHT=$(($countHHT+1))
                                ;;
                        2)
                                countHTH=$(($countHTH+1))
                                ;;
                        3)
                                countTHT=$(($countTHT+1))
                                ;;
			4)
                                countTTH=$(($countTTH+1))
                                ;;
                        5)
                                countTTT=$(($countTTT+1))
                                ;;
                        6)
                                countHTT=$(($countHTT+1))
                                ;;
                        7)
                                countTHH=$(($countTHH+1))
                                ;;

                esac
        done
        combination[HHH]=$countHHH;
        combination[HHT]=$countHHT;
        combination[HTH]=$countHTH;
        combination[THT]=$countTHT;
	combination[TTH]=$countTTH;
        combination[TTT]=$countTTT;
        combination[HTT]=$countHTT;
        combination[THH]=$countTHH;



	count=0;
	#For calculating percentage of singlet, doublet and triplet.
	echo "The Single, Doublet and Triplet count are";
	for n in ${!combination[@]}
	do
		temp=`printf "${combination[$n]}"`
		echo $n " : " $temp;
		percent[$(($count))]=`printf %.3f "$(($temp*100*100/$1))e-2"`;
		key[$(($count))]=`printf "$n"`;
		count=$(($count+1));
	done

	echo "The percentage are as follows";
	for ((j=o; j<count; j++ ))
	do
	echo "${key[$j]}  :  ${percent[$j]}"

	done
}

	read -p "Enter the limit : " limit

	single $limit
	doublet $limit
	triplet $limit

