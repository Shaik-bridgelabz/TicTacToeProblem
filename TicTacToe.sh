#!/bin/bash -x

function reset() {
	echo "========================================"
	echo "TicTacToe game "
	Arr=(. . . . . . . . .)
	player=1;
	gameStatus=1;
	echo "Game Started"
}

function checkSymbol() {
	if [ $player -eq 1 ]
	then
		symbol=o;
	else
		symbol=x;
	fi
	echo "Player Symbol is" $symbol
}

function checkToss(){
	toss=$(( RANDOM % 2))
	if [ $toss -eq 1 ]
	then
		echo "Player Won Toss(Play first)"
	else
		echo "Computer Won Toss(Play first)"
	fi
}

function dispBoard(){
	echo "row/col 0 1 2"
	echo "0 ${Arr[0]} ${Arr[1]} ${Arr[2]}"
	echo "1 ${Arr[3]} ${Arr[4]} ${Arr[5]}"
	echo "2 ${Arr[6]} ${Arr[7]} ${Arr[8]}"
}

function checkMatch(){
	if [ ${Arr[$1]} != "." ] && [ ${Arr[$1]} == ${Arr[$2]} ] && [ ${Arr[$2]} == ${Arr[$3]} ]
	then
		gameStatus=0;
	fi
}

function checkWin(){
	checkMatch 0 1 2
	checkMatch 3 4 5
	checkMatch 6 7 8
	checkMatch 0 3 6
	checkMatch 1 4 7
	checkMatch 2 5 8
	checkMatch 3 6 9
	checkMatch 2 4 6
}

function putSymbol() {
	ids=$(( $1 * 3 + $2 ))
	if [ ${Arr[$ids]} == "." ]
	then
		Arr[$ids]=$3
	else
		echo "You cant place there!"
	fi
}

function readInput() {
	read -p "Enter [row] value " row
	read -p "Enter [Coloumn] value " col
	if [ $row -le 2 ] && [ $col -le 2 ]
	then
   	putSymbol $row $col $symbol
	else
   	echo "Wrong Input, Please renter Row and Coloumn"
	fi
}


reset
dispBoard
checkToss
checkSymbol
echo "Lets Start Game"
while [ $gameStatus == 1 ]
do
	readInput
	dispBoard
	checkWin
done
	if [ $gameStatus != 1 ]
	then
		echo "GameOver"
		echo "Player ($symbol) win!"
	fi


