#!/bin/bash

#This allows the \n to work
shopt -s xpg_echo



function showIntro(){
	clear
	echo "\n\n================================================================================="
	echo "  This is a password generator that save your generated password in a textfile"
	echo "================================================================================="
	echo "\nWhat do you want to do? \n1. READ HOW TO\n2. GENERATE PASSWORD\nANY OTHER KEYS TO EXIT"
	read RESPONSE
	RESPONSE=$(($RESPONSE))
	if [ $RESPONSE -eq 1 ];then
		ShowHelp
	
	elif [ $RESPONSE -eq 2 ];then
		Generate
	else
		exit
	fi
}


function Generate(){
	clear
	#first clear the .txt file
  	echo "" > mypassword.txt
 	echo "======================================================"
 	echo "What character lenght do you want your password to be?"
 	echo "======================================================"
 	read LENGTH
 	echo "=========================================="
 	echo "How many password do you want to generate?"
 	echo "=========================================="
 	read NUMBER
	NUMBER=$(($NUMBER))
 	for i in $(seq 1 $NUMBER);do
 	openssl rand -base64 48 | cut -c1-$LENGTH >> mypassword.txt
 	done
	echo "=============================================================================="
 	echo "Password generated successfully. Kindly check mypassword.txt for your password"
	echo "=============================================================================="
	echo "Do you want to view the password here?\n1 FOR YES\n2 TO GO HOME\nANY OTHER KEY TO QUIT"
	echo "=============================================================================="
	read SHOW
	SHOW=$(($SHOW))
	if [ $SHOW -eq 1 ];then
		showPassword
	elif [ $SHOW -eq 2 ];then
		showIntro
	fi

}


#This will show the password once generated
function showPassword(){
	cat mypassword.txt
	PromptForMore
}


#This will show the How TO
function ShowHelp(){
	clear
	echo "============================================================================================================================="
	echo "This is a password generator. The idea behind this is to insert the length of the password you want and also put the numbers of password you want to generate.\nAfter generating these passwords, they are saved in a file called mypassword.txt. There, you can open and use your password."
	echo "=============================================================================================================================="
	PromptForMore
}


#This handles the repitition of the program
function PromptForMore(){
	echo "===================================="
	echo "Go back home?\n1 for yes\nANY OTHER KEYS TO QUIT"
	echo "===================================="
	read ANSWER
	ANSWER=$(($ANSWER))
	#LOGIC
	if [ $ANSWER -eq 1 ];then
		showIntro
	fi
}
showIntro
