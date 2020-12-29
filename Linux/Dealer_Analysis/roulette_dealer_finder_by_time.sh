#!/bin/bash
ARG=$2
TIME=${ARG:0:8}
MERIDIAN=${ARG: -2}
if [ ${#ARG} == 10 ]; then 
    if [[ ${MERIDIAN^^} == "AM" || ${MERIDIAN^^} == "PM" ]]; then
        grep -iE "$TIME $MERIDIAN" ../Dealer_Analysis/$1_Dealer_schedule
    else
        echo "Please include AM or PM"
    fi
else
    echo "The second argument must be in the format XX:XX:XXAM or XX:XX:XXPM"
fi
