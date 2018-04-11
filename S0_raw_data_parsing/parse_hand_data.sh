#!/bin/bash

dirs=($(find . -type d))
for dir in "${dirs[@]}"; do
(
  cd "$dir"
  echo "======================================================"
  echo $PWD
  counter=0; 
  for f in *.bag;
  do
	let counter=$counter+1
	echo "Processing file $f into demo $counter"
	rostopic echo -b $f -p /LasaDataStream > data_hand_$counter.txt
  done
)
done
