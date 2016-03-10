#!/bin/bash

########################################################
#
# Places a seeded list of players into pools of size $1.
#
# USAGE: ./poolmaker.sh [PLAYERS PER POOL] [PLAYER 1]...
#
########################################################

# Constants
SEPARATOR=" , "
FORWARDS=1
BACKWARDS=0

# Ensure proper usage
if [ $# -lt 2 ]
then
    echo "USAGE: $0 [PLAYERS PER POOL] [PLAYER 1]..."
    exit 1
fi

# Calculate number of pools needed
numPlayers=$(($# - 1))
poolSize=$1
numPools=$((numPlayers / poolSize))
# Round up
if [[ ( $((numPlayers % poolSize)) -ne 0 ) && ( $((numPlayers % poolSize)) -ge $((poolSize / 2)) ) ]]
then
    numPools=$((numPools + 1))
fi
# Ensure at least one pool
if [ $numPools -eq 0 ]
then
    $numPools=1
fi

# DEBUG: Print number of players per pool
echo "$numPlayers players in $numPools pools"

# Place players into pools
declare -a pool
currPlayer=0
currPool=0
direction=$FORWARDS
shift

for i in $@
do
    # Test if string is null
    if [ -z "${pool[$currPool]}" ]
    then
	pool[$currPool]=$i
    else
	pool[$currPool]=${pool[$currPool]}$SEPARATOR$i
    fi

    #Determine which pool is next
    if [ $direction -eq $FORWARDS ]
    then
	if [ $currPool -eq $((numPools - 1)) ]
	then
	    direction=$BACKWARDS
	else
	    currPool=$((currPool + 1))
	fi
    else
	if [ $currPool -eq 0 ]
	then
	    direction=$FORWARDS
	else
	    currPool=$((currPool - 1))
	fi
    fi
done

# Print pools
count=0
while [ $count -lt $numPools ]
do
    echo "POOL $((count + 1)): ${pool[$count]}"
    count=$((count + 1))
done
