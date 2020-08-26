#!/bin/bash

	choice=$((RANDOM%2))
	if [ $choice -eq 0 ]; then
		echo "Heads. Win!";
	else
		echo "Tails. Loose! ";
	fi
