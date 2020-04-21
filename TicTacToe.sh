#!/bin/bash -x
function reset() {
echo "========================================"
echo "TicTacToe game "
Arr=(.........)
player=1;
gameStatus=1;
echo "Game Started"
}
reset

if [ $player -eq 1 ]
then
	symbol=o;
else
	symbol=x;
fi

echo "Player Symbol is" $symbol
