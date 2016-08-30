#!/bin/bash

for i in {1..10}
do
	sed 's/<RAND1>/'$RANDOM'/' in.Al_100_100 > temp.txt
	sed 's/<RAND2>/'$RANDOM'/' temp.txt > Al-case-$(($i)).in
	rm temp.txt
done

ls Al-case* | awk '{print "../../.././lammps-submit -i "$1" -n 512 -w 8:00:00"}' | sh
