#!/bin/bash

PREFPATH=./nodepref.conf
. $PREFPATH

[[ -d $RUNPATH ]] || mkdir $RUNPATH

function start {
    echo Committing new targets: $TGTLIST
	cp -L $TGTLIST $RUNPATH/current.lst

	# iteratively start instances
	pidfiles=()
    while read line
	do
		a=( $line )
		a[0]=$RUNPATH/instance-${a[0]}-${a[1]}-${a[2]}.pid
		pidfiles+=(${a[0]})
		createInstance ${a[0]} ${a[1]} ${a[2]} ${a[3]} ${a[4]} ${a[5]}
    done < $RUNPATH/current.lst

    # check if they are alive
	sleep 2
	for fn in "${pidfiles[@]}"
	do
		pid=$(<$fn)
		ps -p $pid > /dev/null
		if [[ $? != 0 ]]; then stop; exit; fi
	done
}

