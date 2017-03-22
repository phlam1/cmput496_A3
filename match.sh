#!/bin/bash
set -eu
RESULTDIR="test2"
# Modify paths to your programs below as needed
NOGO1="cmput496_A3/Go3/Go3.py"
NOGO2="cmput496_A3/Go4/Go4.py -s 50"
TWOGTP="gogui-twogtp"

run() {
echo Match with $NUGAMES games on board size $BOARDSIZE. Storing results in $RESULTDIR

mkdir -p $RESULTDIR
$TWOGTP -black "$NOGO1" -white "$NOGO2" \
-auto  -komi 6.5 -size $BOARDSIZE -games $NUGAMES \
-sgffile $RESULTDIR/game -alternate -threads 9

$TWOGTP -analyze $RESULTDIR/game.dat -force
}

NUGAMES=100
BOARDSIZE=5
run
