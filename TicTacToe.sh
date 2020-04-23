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
	checkMatch 0 4 8
	checkMatch 2 4 6
}

function checkTie(){
	playCount=$1
	gamestatus=$2
	if [[ $playCount -eq $totalCount ]] && [[ $gamestatus -eq 0 ]]
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
   	if [ ${Arr[0]} == "$symbolnew" ] && [ ${Arr[1]} == "$symbolnew" ]
   	then
      	if [ ${Arr[2]} == "." ]
	then
		Arr[2]= "$symbolnew"
		flag=true;
	fi

	elif [ ${Arr[1]} == "$symbolnew" ] && [ ${Arr[2]} == "$symbolnew" ]
   	then
      	if [ ${Arr[0]} == "." ]
      	then
            Arr[0]= "$symbolnew"
      		flag=true;
      	fi

	elif [ ${Arr[2]} == "$symbolnew" ] && [ ${Arr[0]} == "$symbolnew" ]
      	then
        if [ ${Arr[1]} == "." ]
        then
            Arr[1]= "$symbolnew"
            flag=true;
         fi

	elif [ ${Arr[3]} == "$symbolnew" ] && [ ${Arr[4]} == "$symbolnew" ]
      	then
      	if [ ${Arr[5]} == "." ]
      	then
            Arr[5]= "$symbolnew"
            flag=true;
      	fi

      	elif [ ${Arr[4]} == "$symbolnew" ] && [ ${Arr[5]} == "$symbolnew" ]
      	then
        if [ ${Arr[3]} == "." ]
        then
            Arr[3]= "$symbolnew"
            flag=true;
        fi

      	elif [ ${Arr[5]} == "$symbolnew" ] && [ ${Arr[3]} == "$symbolnew" ]
      	then
        if [ ${Arr[4]} == "." ]
        then
            Arr[4]= "$symbolnew"
            flag=true;
        fi


      	elif [ ${Arr[6]} == "$symbolnew" ] && [ ${Arr[7]} == "$symbolnew" ]
      	then
      	if [ ${Arr[8]} == "." ]
      	then
            Arr[8]= "$symbolnew"
            flag=true;
      	fi

      	elif [ ${Arr[7]} == "$symbolnew" ] && [ ${Arr[8]} == "$symbolnew" ]
      	then
        if [ ${Arr[6]} == "." ]
        then
            Arr[6]= "$symbolnew"
            flag=true;
        fi

      	elif [ ${Arr[8]} == "$symbolnew" ] && [ ${Arr[6]} == "$symbolnew" ]
      	then
        if [ ${Arr[7]} == "." ]
        then
            Arr[7]= "$symbolnew"
            flag=true;
        fi

	elif [ ${Arr[0]} == "$symbolnew" ] && [ ${Arr[3]} == "$symbolnew" ]
      	then
      	if [ ${Arr[6]} == "." ]
      	then
            Arr[6]= "$symbolnew"
            flag=true;
      	fi

      	elif [ ${Arr[3]} == "$symbolnew" ] && [ ${Arr[6]} == "$symbolnew" ]
      	then
        if [ ${Arr[0]} == "." ]
        then
            Arr[0]= "$symbolnew"
            flag=true;
        fi

      	elif [ ${Arr[0]} == "$symbolnew" ] && [ ${Arr[6]} == "$symbolnew" ]
      	then
        if [ ${Arr[3]} == "." ]
        then
            Arr[3]= "$symbolnew"
            flag=true;
        fi

	elif [ ${Arr[1]} == "$symbolnew" ] && [ ${Arr[4]} == "$symbolnew" ]
      	then
      	if [ ${Arr[7]} == "." ]
      	then
            Arr[7]= "$symbolnew"
            flag=true;
      	fi

      	elif [ ${Arr[4]} == "$symbolnew" ] && [ ${Arr[7]} == "$symbolnew" ]
      	then
        if [ ${Arr[1]} == "." ]
        then
            Arr[1]= "$symbolnew"
            flag=true;
        fi

      	elif [ ${Arr[1]} == "$symbolnew" ] && [ ${Arr[7]} == "$symbolnew" ]
      	then
        if [ ${Arr[4]} == "." ]
        then
            Arr[4]= "$symbolnew"
            flag=true;
        fi

        elif [ ${Arr[2]} == "$symbolnew" ] && [ ${Arr[5]} == "$symbolnew" ]
        then
        if [ ${Arr[8]} == "." ]
        then
            Arr[8]= "$symbolnew"
            flag=true;
        fi

	elif [ ${Arr[8]} == "$symbolnew" ] && [ ${Arr[5]} == "$symbolnew" ]
	then
        if [ ${Arr[2]} == "." ]
        then
            Arr[2]= "$symbolnew"
            flag=true;
        fi

      	elif [ ${Arr[8]} == "$symbolnew" ] && [ ${Arr[2]} == "$symbolnew" ]
      	then
        if [ ${Arr[5]} == "." ]
        then
            Arr[5]= "$symbolnew"
            flag=true;
        fi

	elif [ ${Arr[0]} == "$symbolnew" ] && [ ${Arr[4]} == "$symbolnew" ]
      	then
      	if [ ${Arr[8]} == "." ]
      	then
            Arr[8]= "$symbolnew"
            flag=true;
      	fi

      	elif [ ${Arr[8]} == "$symbolnew" ] && [ ${Arr[4]} == "$symbolnew" ]
      	then
        if [ ${Arr[0]} == "." ]
        then
            Arr[0]= "$symbolnew"
            flag=true;
        fi

      	elif [ ${Arr[0]} == "$symbolnew" ] && [ ${Arr[8]} == "$symbolnew" ]
      	then
        if [ ${Arr[4]} == "." ]
        then
            Arr[4]= "$symbolnew"
            flag=true;
        fi

	elif [ ${Arr[2]} == "$symbolnew" ] && [ ${Arr[4]} == "$symbolnew" ]
      	then
      	if [ ${Arr[6]} == "." ]
      	then
            Arr[6]= "$symbolnew"
            flag=true;
      	fi

      	elif [ ${Arr[4]} == "$symbolnew" ] && [ ${Arr[6]} == "$symbolnew" ]
      	then
        if [ ${Arr[2]} == "." ]
        then
            Arr[2]= "$symbolnew"
            flag=true;
        fi

      	elif [ ${Arr[2]} == "$symbolnew" ] && [ ${Arr[6]} == "$symbolnew" ]
      	then
        if [ ${Arr[4]} == "." ]
        then
            Arr[4]= "$symbolnew"
            flag=true;
        fi
	fi
}
n
function checkBlockLogic() {
 if [ ${Arr[0]} == "$psymbol" ] && [ ${Arr[1]} == "$psymbol" ]
        then
        if [ ${Arr[2]} == "." ]
        then
                Arr[2]="$csymbol";
                flag1=true;
        fi

        elif [ ${Arr[1]} == "$psymbol" ] && [ ${Arr[2]} == "$psymbol" ]
        then
        if [ ${Arr[0]} == "." ]
        then
            	Arr[0]="$csymbol";
                flag1=true;
        fi

        elif [ ${Arr[2]} == "$psymbol" ] && [ ${Arr[0]} == "$psymbol" ]
        then
        if [ ${Arr[1]} == "." ]
        then
            Arr[1]="$csymbol";
            flag1=true;
         fi

        elif [ ${Arr[3]} == "$psymbol" ] && [ ${Arr[4]} == "$psymbol" ]
        then
        if [ ${Arr[5]} == "." ]
        then
            Arr[5]="$csymbol";
            flag1=true;
        fi

 	elif [ ${Arr[4]} == "$psymbol" ] && [ ${Arr[5]} == "$psymbol" ]
        then
        if [ ${Arr[3]} == "." ]
        then
            Arr[3]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[5]} == "$psymbol" ] && [ ${Arr[3]} == "$psymbol" ]
        then
        if [ ${Arr[4]} == "." ]
        then
            Arr[4]="$csymbol";
            flag1=true;
        fi


        elif [ ${Arr[6]} == "$psymbol" ] && [ ${Arr[7]} == "$psymbol" ]
        then
        if [ ${Arr[8]} == "." ]
        then
            Arr[8]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[7]} == "$psymbol" ] && [ ${Arr[8]} == "$psymbol" ]
        then
        if [ ${Arr[6]} == "." ]
        then
            Arr[6]="$csymbol";
            flag1=true;
        fi

 	elif [ ${Arr[8]} == "$psymbol" ] && [ ${Arr[6]} == "$psymbol" ]
        then
        if [ ${Arr[7]} == "." ]
        then
            Arr[7]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[0]} == "$psymbol" ] && [ ${Arr[3]} == "$psymbol" ]
        then
        if [ ${Arr[6]} == "." ]
        then
            Arr[6]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[3]} == "$psymbol" ] && [ ${Arr[6]} == "$psymbol" ]
        then
        if [ ${Arr[0]} == "." ]
        then
            Arr[0]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[0]} == "$psymbol" ] && [ ${Arr[6]} == "$psymbol" ]
        then
        if [ ${Arr[3]} == "." ]
        then
            Arr[3]="$csymbol";
            flag1=true;
        fi

 	elif [ ${Arr[1]} == "$psymbol" ] && [ ${Arr[4]} == "$psymbol" ]
        then
        if [ ${Arr[7]} == "." ]
        then
            Arr[7]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[4]} == "$psymbol" ] && [ ${Arr[7]} == "$psymbol" ]
        then
        if [ ${Arr[1]} == "." ]
        then
            Arr[6]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[1]} == "$psymbol" ] && [ ${Arr[7]} == "$psymbol" ]
        then
        if [ ${Arr[4]} == "." ]
        then
            Arr[4]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[2]} == "$psymbol" ] && [ ${Arr[5]} == "$psymbol" ]
        then
        if [ ${Arr[8]} == "." ]
        then
            Arr[8]="$csymbol";
            flag1=true;
        fi

 	elif [ ${Arr[8]} == "$psymbol" ] && [ ${Arr[5]} == "$psymbol" ]
        then
        if [ ${Arr[2]} == "." ]
        then
            Arr[2]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[8]} == "$psymbol" ] && [ ${Arr[2]} == "$psymbol" ]
        then
        if [ ${Arr[5]} == "." ]
        then
            Arr[5]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[0]} == "$psymbol" ] && [ ${Arr[4]} == "$psymbol" ]
        then
        if [ ${Arr[8]} == "." ]
        then
            Arr[8]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[8]} == "$psymbol" ] && [ ${Arr[4]} == "$psymbol" ]
        then
        if [ ${Arr[0]} == "." ]
        then
            Arr[0]="$csymbol";
            flag1=true;
        fi

 	elif [ ${Arr[0]} == "$psymbol" ] && [ ${Arr[8]} == "$psymbol" ]
        then
        if [ ${Arr[4]} == "." ]
        then
            Arr[4]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[2]} == "$psymbol" ] && [ ${Arr[4]} == "$psymbol" ]
        then
        if [ ${Arr[6]} == "." ]
        then
            Arr[6]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[4]} == "$psymbol" ] && [ ${Arr[6]} == "$psymbol" ]
        then
        if [ ${Arr[2]} == "." ]
        then
            Arr[2]="$csymbol";
            flag1=true;
        fi

        elif [ ${Arr[2]} == "$psymbol" ] && [ ${Arr[6]} == "$psymbol" ]
        then
        if [ ${Arr[4]} == "." ]
        then
            Arr[4]="$csymbol";
            flag1=true;
        fi
        fi
}

function takeAvailCorners(){

if [[ ${Arr[0]} == "." ]]
then
	Arr[0]="$csymbol"
	flag2="true";
elif [[ ${Arr[2]} == "." ]]
then
        Arr[$2]="$csymbol"
        flag2="true";
elif [[ ${Arr[6]} == "." ]]
then
        Arr[$6]="$csymbol"
        flag2="true";
elif [[ ${Arr[8]} == "." ]]
then
        Arr[$8]="$csymbol"
        flag2="true";
fi

}

function readInput() {
	read -p "Enter [row] value " row
	read -p "Enter [Coloumn] value " col
	if [ $row -le 2 ] && [ $col -le 2 ]
	then
   		putpSymbol $row $col $psymbol
	else
   		echo "Wrong Input, Please reenter Row and Coloumn"
		readInput
	fi
}

function playerTurn() {
   playCount=$(($playCount+1));
   readInput
   dispBoard
   checkWin
   if [ $gameStatus != 1 ]
   then
      echo "GameOver"
      echo "Player ($psymbol) win!"
   exit
   fi

   checkTie $playCount $gameStatus
   compTurn
}

function compTurn() {
	playCount=$(($playCount+1))
	flag="false";
	flag1="false";
	flag2="false";
	checkWinLogic $csymbol
   	if [[ $flag == false ]]
	then
		checkBlockLogic
		if [[ $flag1 == false ]]
		then
			takeAvailCorners
		if [[ $flag2 == false ]]
		then
			for (( i=0;i<3;i++ ))
			do
			for (( j=0;j<3;j++ ))
			do
			id=$(( $i * 3 + $j ))
			if [[ ${Arr[id]} == "." ]]
			then
				Arr[$id]}="$csymbol";
			else
				echo "Invalid Position"
			fi
			done
			done
		fi
		fi
	fi
dispBoard
checkWin
if [ $gameStatus != 1 ]
   then
      echo "GameOver"
      echo "Computer ($csymbol) win!"
      exit
   fi

checkTie $playCount $gameStatus
playerTurn
}

function checkToss(){
        toss=$(( RANDOM % 2))
        if [ $toss -eq 1 ]
        then
                echo "Player Won Toss(Play first)"
                playerTurn
        else
                echo "Computer Won Toss(Play first)"
                compTurn
        fi
}

playCount=0;
totalCount=9;
reset
dispBoard
checkSymbol
checkToss
