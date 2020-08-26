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
