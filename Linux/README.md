# Bash Scripting
In the project, I created some bash scripts using `grep` and `awk` commands, shell variables, and logic controls to analyze some sample data and gather evidence of foul play.

## Goal
Find out if any players were working with dealers to steal money from the _Lucky Duck Casino_.

## Process
| Step | Evidence |
|---|---|
| Find out when the casino lost money. | `Roulette_Losses` |
| Determine if there were any players that were present every time the casino lost money. | `Player_Analysis/Notes_Player_Analysis` |
| Determine if there were any dealers that were present every time the casino lost money. | `Dealer_Analysis/Dealers_working_during_losses` |
| Summarize the evidence and describe the correlation. | `Notes_Player_Dealer_Correlation` |

## Scripts

- `find_dealers_working_during_losses.sh` - takes a date in the form of 'MMDD' as input and searches the dealer schedules from that day to find who was dealing at the time that the casino was losing money. Prints the line with the names of the dealers.
    ```bash
    #!/bin/bash
    grep -e "`grep -E $1 ../Player_Analysis/Notes_Player_Analysis | awk -F: '{print $2":"$3":"$4}'`" $1_Dealer_schedule
    ```

- `roulette_dealer_finder_by_time.sh` - an alternate to the script above that can take an additional time argument (HH:MM:SSAM)
    ```bash
    #!/bin/bash
    ARG=$2
    #Save the time (HH:MM:SS)
    TIME=${ARG:0:8}
    #Save the last two characters (AM/PM)
    MERIDIAN=${ARG: -2}
    #Check the length of the second argument
    if [ ${#ARG} == 10 ]; then 
        if [[ ${MERIDIAN^^} == "AM" || ${MERIDIAN^^} == "PM" ]]; then
            grep -iE "$TIME $MERIDIAN" ../Dealer_Analysis/$1_Dealer_schedule
        else
            echo "Please include AM or PM"
        fi
    else
        echo "The second argument must be in the format XX:XX:XXAM or XX:XX:XXPM"
    fi
    ```
## Summary

Billy Jones and Mylie Schmidt are colluding to scam Lucky Duck.

Evidence:
On March 10, 12, and 15th, Lucky Duck lost revenue 13 times. Each time this happened, Mylie Schmidt was playing in the casino. I cross-referrenced the times with dealer schedules and every time Schmidt played, Billy Jones was dealing at the Roulettes table. Therefore, I am concluding that Jones and Schmidt were working together to scam Lucky Duck.




