#!/bin/sh
options=("Start!" "Get me the heck outta here!")
move="Select an option to continue."
level1=("Take Hallway 1" "Take Hallway 2")
doors=("Go through the 1st door" "Go through the 2nd door")

#Warp Tube
warp() {
    clear
    echo "You found a warp tube!!!"
    echo
    echo "Select Option 1 to continue."
    select user_in in "Continue";
    do
        case $user_in in
            "Continue")
                echo "Good luck!"
                echo
                exit
                ;;
             *) echo "Not a valid option!";;
        esac
    done
}
#Level 1b
level1b() {
    echo "You're in Hall 2"
    echo "Now there are two doors in front of you."
    echo "Which door would you like to try?"
    echo
    echo $move
    select user_in in "${doors[@]}";
    do
        case $user_in in
            "Go through the 1st door")
                echo "Going through the 1st door..."
                echo
                level1a
                ;;
            "Go through the 2nd door")
                echo "Going through the 2nd door..."
                echo
                echo "Ooops, that door leads to certain death."
                echo
                echo "You died."
                exit
                ;;
            *) echo "Not a valid option!";;
        esac
    done
}

#Level 1a
level1a() {
    echo "You're in Hall 1"
    echo "Now there are two doors in front of you."
    echo "Which door would you like to try?"
    echo
    echo $move
    select user_in in "${doors[@]}";
    do
        case $user_in in
            "Go through the 1st door")
                echo "Going through the 1st door..."
                echo
                level1b
                ;;
            "Go through the 2nd door")
                echo "Going through the 2nd door..."
                echo
                warp
                ;;
            *) echo "Not a valid option!";;
        esac
    done
}

#Level 1 submenu
level1start() {
    echo "You're in a room and there's a fork in the road."
    echo "There are two Hallways in front of you, which way will you go?"
    echo
    echo $move
    select user_in in "${level1[@]}";
    do
        case $user_in in
            "Take Hallway 1")
                echo "You went down Hallway 1!"
                echo
                level1a
                ;;
            "Take Hallway 2")
                echo "You went down Hallway 2!"
                echo
                exit
                ;;
            *) echo "Not a valid option!";;
        esac
    done
}

#Start game
clear
echo "Welcome to the game!"
echo "$move"
select user_in in "${options[@]}";
do
    case $user_in in
        "Start!")
            echo "You selected $user_in"
            echo
            level1start
            ;;
        "Get me the heck outta here!")
            echo "Goodbye!"
            break
            ;;
        *) echo "Sorry, that's not a valid option";;
    esac
done

