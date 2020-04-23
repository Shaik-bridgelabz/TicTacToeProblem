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
	check=$(( RANDOM % 2 ))
	if [ $check -eq 1 ]
	then
		psymbol=o;
		csymbol=x;
	else
		psymbol=x;
		csymbol=o;
	fi
	echo "Player Symbol is" $psymbol
	echo "Computer Symbol is" $csymbol
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
	if [ $gameStatus != 1 ]
   then
      echo "GameOver"
      echo "Player with symbol ($symbol) win!"
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

function checkTie(){
	playCount=$1
	if [[ $playCount -eq $totalCount ]]
	then
	echo	"Match tie"
	exit
	fi
}

function putpSymbol() {

	ids=$(( $1 * 3 + $2 ))
	if [ ${Arr[$ids]} == "." ]
	then
		Arr[$ids]=$3
	else
		echo "You cant place there!"
		readInput
fi
}

function putcSymbol() {

   ids=$(( $1 * 3 + $2 ))
   if [ ${Arr[$ids]} == "." ]
   then
      Arr[$ids]=$3
   else
      echo "You cant place there!"
      compTurn
fi
}

function checkWinLogic() {
	symbolnew=$1;
   	if [ ${Arr[$0]} == $symbolnew ] && [ ${Arr[$1]} == $symbolnew ]
   	then
      	if [ ${Arr[2]} == "." ]
	then
		${Arr[2]}= $symbolnew
		flag=true;
	fi

	elif [ ${Arr[$1]} == $symbolnew ] && [ ${Arr[$2]} == $symbolnew ]
   	then
      	if [ ${Arr[0]} == "." ]
      	then
            ${Arr[0]}= $symbolnew
      		flag=true;
      	fi

	elif [ ${Arr[$2]} == $symbolnew ] && [ ${Arr[$0]} == $symbolnew ]
      	then
        if [ ${Arr[1]} == "." ]
        then
            ${Arr[1]}= $symbolnew
            flag=true;
         fi

	elif [ ${Arr[$3]} == $symbolnew ] && [ ${Arr[$4]} == $symbolnew ]
      	then
      	if [ ${Arr[5]} == "." ]
      	then
            ${Arr[5]}= $symbolnew
            flag=true;
      	fi

      	elif [ ${Arr[$4]} == $symbolnew ] && [ ${Arr[$5]} == $symbolnew ]
      	then
        if [ ${Arr[3]} == "." ]
        then
            ${Arr[3]}= $symbolnew
            flag=true;
        fi

      	elif [ ${Arr[$5]} == $symbolnew ] && [ ${Arr[$3]} == $symbolnew ]
      	then
        if [ ${Arr[4]} == "." ]
        then
            ${Arr[4]}= $symbolnew
            flag=true;
        fi


      	elif [ ${Arr[$6]} == $symbolnew ] && [ ${Arr[$7]} == $symbolnew ]
      	then
      	if [ ${Arr[8]} == "." ]
      	then
            ${Arr[8]}= $symbolnew
            flag=true;
      	fi

      	elif [ ${Arr[$7]} == $symbolnew ] && [ ${Arr[$8]} == $symbolnew ]
      	then
        if [ ${Arr[6]} == "." ]
        then
            ${Arr[6]}= $symbolnew
            flag=true;
        fi

      	elif [ ${Arr[$8]} == $symbolnew ] && [ ${Arr[$6]} == $symbolnew ]
      	then
        if [ ${Arr[7]} == "." ]
        then
            ${Arr[7]}= $symbolnew
            flag=true;
        fi

	elif [ ${Arr[$0]} == $symbolnew ] && [ ${Arr[$3]} == $symbolnew ]
      	then
      	if [ ${Arr[6]} == "." ]
      	then
            ${Arr[6]}= $symbolnew
            flag=true;
      	fi

      	elif [ ${Arr[$3]} == $symbolnew ] && [ ${Arr[$6]} == $symbolnew ]
      	then
        if [ ${Arr[0]} == "." ]
        then
            ${Arr[0]}= $symbolnew
            flag=true;
        fi

      	elif [ ${Arr[$0]} == $symbolnew ] && [ ${Arr[$6]} == $symbolnew ]
      	then
        if [ ${Arr[3]} == "." ]
        then
            ${Arr[3]}= $symbolnew
            flag=true;
        fi

	elif [ ${Arr[$1]} == $symbolnew ] && [ ${Arr[$4]} == $symbolnew ]
      	then
      	if [ ${Arr[7]} == "." ]
      	then
            ${Arr[7]}= $symbolnew
            flag=true;
      	fi

      	elif [ ${Arr[$4]} == $symbolnew ] && [ ${Arr[$7]} == $symbolnew ]
      	then
        if [ ${Arr[1]} == "." ]
        then
            ${Arr[1]}= $symbolnew
            flag=true;
        fi

      	elif [ ${Arr[$1]} == $symbolnew ] && [ ${Arr[$7]} == $symbolnew ]
      	then
        if [ ${Arr[4]} == "." ]
        then
            ${Arr[4]}= $symbolnew
            flag=true;
        fi

        elif [ ${Arr[$2]} == $symbolnew ] && [ ${Arr[$5]} == $symbolnew ]
        then
        if [ ${Arr[8]} == "." ]
        then
            ${Arr[8]}= $symbolnew
            flag=true;
        fi

	elif [ ${Arr[$8]} == $symbolnew ] && [ ${Arr[$5]} == $symbolnew ]
	then
        if [ ${Arr[2]} == "." ]
        then
            ${Arr[2]}= $symbolnew
            flag=true;
        fi

      	elif [ ${Arr[$8]} == $symbolnew ] && [ ${Arr[$2]} == $symbolnew ]
      	then
        if [ ${Arr[5]} == "." ]
        then
            ${Arr[5]}= $symbolnew
            flag=true;
        fi

	elif [ ${Arr[$6]} == $symbolnew ] && [ ${Arr[$3]} == $symbolnew ]
      	then
      	if [ ${Arr[9]} == "." ]
      	then
            ${Arr[9]}= $symbolnew
            flag=true;
      	fi

      	elif [ ${Arr[$6]} == $symbolnew ] && [ ${Arr[$9]} == $symbolnew ]
      	then
        if [ ${Arr[3]} == "." ]
        then
            ${Arr[3]}= $symbolnew
            flag=true;
        fi

      	elif [ ${Arr[$3]} == $symbolnew ] && [ ${Arr[$9]} == $symbolnew ]
      	then
        if [ ${Arr[6]} == "." ]
        then
            ${Arr[6]}= $symbolnew
            flag=true;
        fi

	elif [ ${Arr[$2]} == $symbolnew ] && [ ${Arr[$4]} == $symbolnew ]
      	then
      	if [ ${Arr[6]} == "." ]
      	then
            ${Arr[6]}= $symbolnew
            flag=true;
      	fi

      	elif [ ${Arr[$4]} == $symbolnew ] && [ ${Arr[$6]} == $symbolnew ]
      	then
        if [ ${Arr[2]} == "." ]
        then
            ${Arr[2]}= $symbolnew
            flag=true;
        fi

      	elif [ ${Arr[$2]} == $symbolnew ] && [ ${Arr[$6]} == $symbolnew ]
      	then
        if [ ${Arr[4]} == "." ]
        then
            ${Arr[4]}= $symbolnew
            flag=true;
        fi
	fi
}

function checkBlockLogic() {
pSymbol=$1;
cSymbol=$2;

 if [ ${Arr[$0]} == $pSymbol ] && [ ${Arr[$1]} == $pSymbol ]
        then
        if [ ${Arr[2]} == "." ]
        then
                ${Arr[2]}= $cSymbol
                flag1=true;
        fi

        elif [ ${Arr[$1]} == $pSymbol ] && [ ${Arr[$2]} == $pSymbol ]
        then
        if [ ${Arr[0]} == "." ]
        then
            ${Arr[0]}= $cSymbol
                flag1=true;
        fi

        elif [ ${Arr[$2]} == $pSymbol ] && [ ${Arr[$0]} == $pSymbol ]
        then
        if [ ${Arr[1]} == "." ]
        then
            ${Arr[1]}= $cSymbol
            flag1=true;
         fi

        elif [ ${Arr[$3]} == $pSymbol ] && [ ${Arr[$4]} == $pSymbol ]
        then
        if [ ${Arr[5]} == "." ]
        then
            ${Arr[5]}= $cSymbol
            flag1=true;
        fi

 	elif [ ${Arr[$4]} == $pSymbol ] && [ ${Arr[$5]} == $pSymbol ]
        then
        if [ ${Arr[3]} == "." ]
        then
            ${Arr[3]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$5]} == $pSymbol ] && [ ${Arr[$3]} == $pSymbol ]
        then
        if [ ${Arr[4]} == "." ]
        then
            ${Arr[4]}= $cSymbol
            flag1=true;
        fi


        elif [ ${Arr[$6]} == $pSymbol ] && [ ${Arr[$7]} == $pSymbol ]
        then
        if [ ${Arr[8]} == "." ]
        then
            ${Arr[8]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$7]} == $pSymbol ] && [ ${Arr[$8]} == $pSymbol ]
        then
        if [ ${Arr[6]} == "." ]
        then
            ${Arr[6]}= $cSymbol
            flag1=true;
        fi

 	elif [ ${Arr[$8]} == $pSymbol ] && [ ${Arr[$6]} == $pSymbol ]
        then
        if [ ${Arr[7]} == "." ]
        then
            ${Arr[7]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$0]} == $pSymbol ] && [ ${Arr[$3]} == $pSymbol ]
        then
        if [ ${Arr[6]} == "." ]
        then
            ${Arr[6]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$3]} == $pSymbol ] && [ ${Arr[$6]} == $pSymbol ]
        then
        if [ ${Arr[0]} == "." ]
        then
            ${Arr[0]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$0]} == $pSymbol ] && [ ${Arr[$6]} == $pSymbol ]
        then
        if [ ${Arr[3]} == "." ]
        then
            ${Arr[3]}= $cSymbol
            flag1=true;
        fi

 	elif [ ${Arr[$1]} == $pSymbol ] && [ ${Arr[$4]} == $pSymbol ]
        then
        if [ ${Arr[7]} == "." ]
        then
            ${Arr[7]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$4]} == $pSymbol ] && [ ${Arr[$7]} == $pSymbol ]
        then
        if [ ${Arr[1]} == "." ]
        then
            ${Arr[6]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$1]} == $pSymbol ] && [ ${Arr[$7]} == $pSymbol ]
        then
        if [ ${Arr[4]} == "." ]
        then
            ${Arr[4]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$2]} == $pSymbol ] && [ ${Arr[$5]} == $pSymbol ]
        then
        if [ ${Arr[8]} == "." ]
        then
            ${Arr[8]}= $cSymbol
            flag1=true;
        fi

 	elif [ ${Arr[$8]} == $pSymbol ] && [ ${Arr[$5]} == $pSymbol ]
        then
        if [ ${Arr[2]} == "." ]
        then
            ${Arr[2]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$8]} == $pSymbol ] && [ ${Arr[$2]} == $pSymbol ]
        then
        if [ ${Arr[5]} == "." ]
        then
            ${Arr[5]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$6]} == $pSymbol ] && [ ${Arr[$3]} == $pSymbol ]
        then
        if [ ${Arr[9]} == "." ]
        then
            ${Arr[9]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$6]} == $pSymbol ] && [ ${Arr[$9]} == $pSymbol ]
        then
        if [ ${Arr[3]} == "." ]
        then
            ${Arr[3]}= $cSymbol
            flag1=true;
        fi

 	elif [ ${Arr[$3]} == $pSymbol ] && [ ${Arr[$9]} == $pSymbol ]
        then
        if [ ${Arr[6]} == "." ]
        then
            ${Arr[6]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$2]} == $pSymbol ] && [ ${Arr[$4]} == $pSymbol ]
        then
        if [ ${Arr[6]} == "." ]
        then
            ${Arr[6]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$4]} == $pSymbol ] && [ ${Arr[$6]} == $pSymbol ]
        then
        if [ ${Arr[2]} == "." ]
        then
            ${Arr[2]}= $cSymbol
            flag1=true;
        fi

        elif [ ${Arr[$2]} == $pSymbol ] && [ ${Arr[$6]} == $pSymbol ]
        then
        if [ ${Arr[4]} == "." ]
        then
            ${Arr[4]}= $cSymbol
            flag1=true;
        fi
        fi
}


function readInput() {
	read -p "Enter [row] value " row
	read -p "Enter [Coloumn] value " col
	symbol=o;
	if [ $row -le 2 ] && [ $col -le 2 ]
	then
   	putpSymbol $row $col $symbol
	else
   	echo "Wrong Input, Please reenter Row and Coloumn"
	fi
}

function playerTurn() {
   readInput
   dispBoard
   checkWin
   checkTie $playCount
}

function compTurn() {
	flag="false";
	flag1="false";
	checkWinLogic $csymbol
   	if [[ $flag == true ]]
	then
		dispBoard
   		checkWin
   		checkTie $playCount
	else
		checkBlockLogic $pSymbol $cSymbol
		if [[ $flag1 == true ]]
		then
		dispBoard
		checkWin
		checkTie $playCount
		fi
	fi
}


playCount=0;
totalCount=9;

reset
dispBoard
checkToss
checkSymbol
while [ $gameStatus == 1 ]
do
	((playCount++))
	((turn++))
	if [ $(($turn%2)) == 0 ]
	then
		echo "Players Turn"
		playerTurn

	else
		echo "Computers Turn"
		compTurn
	fi
done
