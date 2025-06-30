#!/bin/bash

echo "Simple Process Manager"
echo "-----------------------"
read -p "Enter the process name: " processname

echo "1 for view"
echo "2 for kill"
echo "3 to stop the process"
read -p "Enter your choice: " choice

simple_spinner() {
    spin='|/-\'
    for i in {1..10}
    do
        for j in $spin
        do
            echo -ne "\rLoading... $j"
            sleep 0.1
        done
    done
    echo -ne "\rDone!        \n"
}

case $choice in
    1)
        simple_spinner
        ps aux | grep "$processname"
        ;;
    2)
        simple_spinner
        pkill "$processname"
        echo "Process killed."
        ;;
    3)
        simple_spinner
        pkill -STOP "$processname"
        echo "Process stopped."
        ;;
    *)
        echo "Invalid choice."
        ;;
esac

