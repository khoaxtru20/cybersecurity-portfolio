#!/bin/bash

grep -e "`grep -E $1 ../Player_Analysis/Notes_Player_Analysis | awk -F: '{print $2":"$3":"$4}'`" $1_Dealer_schedule
