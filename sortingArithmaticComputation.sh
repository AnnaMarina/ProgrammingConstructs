#!/bin/bash

declare -A arithmatic

        echo "Enter the 3 inputs";
        read num1;
        read num2;
        read num3;

	arithmatic[a*b+c]=$(($num1*$num2+$num3));
        arithmatic[a+b*c]=$(($num1+$num2*$num3));
        arithmatic[c+a/b]=$(($num3+$num1/$num2));
        arithmatic[a%b+c]=$(($num1%$num2+$num3));

	i=0;
        for n in ${arithmatic[@]};
        do
                array[(($i))]=$(($n));
                i=$(($i+1));
        done;
        echo "The array is : "${array[@]};

	 for (( i=0; i<${#array[@]}; i++))
                do
                        for (( j=$(($i+1)); j<${#array[@]}; j++))
                        do
                                num1=`printf "${array[$i]}"`
                                num2=`printf "${array[$j]}"`;
                                if [ $num2 -gt $num1 ]; then
                                temp1=$num1
                                temp2=$num2
                                array[(($i))]=$temp2
                                array[(($j))]=$temp1
                        fi
                done
        done
        echo "The Descending order is : "${array[@]};

