#!/bin/bash

	choice=$((RANDOM%2))
	if [ $choice -eq 0 ]; then
		echo "Heads.";
	else
		echo "Tails.";
	fi
