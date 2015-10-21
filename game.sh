#!/bin/sh
options=("Start!" "Get me the heck outta here!")
move="Select an option to continue."
h1visit=0
h2visit=0
time=0
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
                echo "time "$time
                echo "h1 "$h1visit
                echo "h2 "$h2visit
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
    h2visit=1
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
    h1visit=1
    if [ "$h1visit" -eq 1 -a "$h2visit" -eq 1 ]; then
        time=1
    fi
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
                level1b
                ;;
            *) echo "Not a valid option!";;
        esac
    done
}

#Start game
clear
echo "The Kraken has take the princess!"
echo "..."
echo "Will you help find her?"
echo "$move"
select user_in in "${options[@]}";
do
    case $user_in in
        "Start!")
            echo "You selected $user_in"
            echo
            echo "Great, let's go find her!"
            level1start
            ;;
        "Get me the heck outta here!")
            echo "Goodbye!"
            break
            ;;
        *) echo "Sorry, that's not a valid option";;
    esac
done

