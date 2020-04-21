#!/bin/bash -x

function reset() {
	echo "========================================"
	echo "TicTacToe game "
	Arr=(. . . . . . . . .)
	player=0;
	gameStatus=1;
	echo "Game Started"
}

function checkSymbol() {
	if [ $player -eq 0 ]
	then
		symbol=o;
		echo "Players Symbol is $symbol"
		csymbol=x;
		echo "Computers Symbol is $csymbol"
	fi
}

function checkToss(){
	toss=$(( RANDOM % 2))
	if [ $toss -eq 1 ]
	then
		turn=1;
		echo "Player Won Toss(Play first)"
	else
		turn=0;
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
	symbol=o;
	if [ $row -le 2 ] && [ $col -le 2 ]
	then
   	putSymbol $row $col $symbol
	else
   	echo "Wrong Input, Please reenter Row and Coloumn"
	fi
}


reset
dispBoard
echo "Lets Start Game"
checkToss
checkSymbol
while [ $gameStatus == 1 ]
do
	((turn++))
	if [ $(($turn%2)) == 0 ]
	then
	echo "Players Turn"
	readInput
	dispBoard
	checkWin
	else
	echo "Computers Turn"
	row=$((RANDOM%3))
	col=$((RANDOM%3))
	csymbol=x
	putSymbol $row $col $csymbol
	dispBoard
	checkWin
	fi
done
	if [ $gameStatus != 1 ]
	then
		echo "GameOver"
		echo "Player ($symbol) win!"
	fi


