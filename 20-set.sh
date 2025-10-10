#!/bin/bash

set -e #here e for exit .error vachinappudu exit avvamani

error(){
    #echo "There is an errror in $LINEND, command is: $BASH_COMMAND" 
}

trap 'echo "There is an errror in $LINEND, command is: $BASH_COMMAND"' ERR

echo "Hello.."
echo "Before error.."
hsdgajh #here shell understands there is an error and signal is ERR
echo "After error"
