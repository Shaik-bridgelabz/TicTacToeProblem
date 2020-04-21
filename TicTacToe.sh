#!/bin/bash -x
function reset() {
echo "========================================"
echo "TicTacToe game "
Arr=(. . . . . . . . .)
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

function checkToss(){
toss=$(( RANDOM % 2))
if [ $toss -eq 1 ]
then
	echo "Player Won Toss(Play first)"
else
	echo "Computer Won Toss(Play first)"
fi
}
checkToss

function dispBoard(){
echo "row/col 0 1 2"
echo "0 ${Arr[0]} ${Arr[1]} ${Arr[2]}"
echo "1 ${Arr[3]} ${Arr[4]} ${Arr[5]}"
echo "2 ${Arr[6]} ${Arr[7]} ${Arr[8]}"
}
dispBoard
