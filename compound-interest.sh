#!/bin/bash
# This script calculates compound interest given principal,
   # annual rate of interest and time period in years.
   # Do not use this in production. Sample purpose only.
   # Author: Upkar Lidder (IBM)
   # Additional Authors:
   # himanshu2002004
# Compound Interest Calculator

# Function to calculate compound interest
calculate_compound_interest() {
    principal=$1
    rate=$2
    time=$3
    compounds=$4

    # Compound interest formula: A = P(1 + r/n)^(nt)
    amount=$(echo "scale=2; $principal * (1 + $rate/(100 * $compounds))^($compounds * $time)" | bc -l)
    interest=$(echo "scale=2; $amount - $principal" | bc -l)

    echo "Principal Amount: \$$principal"
    echo "Annual Rate: $rate%"
    echo "Time Period: $time years"
    echo "Compounds Per Year: $compounds"
    echo "-----------------------------"
    echo "Final Amount: \$$amount"
    echo "Compound Interest Earned: \$$interest"
}

# Main script
echo "Compound Interest Calculator"
echo "-----------------------------"

# Read user input with validation
read -p "Enter the principal amount: " principal
while ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ $(echo "$principal <= 0" | bc -l) -eq 1 ]]; do
    echo "Please enter a valid positive number."
    read -p "Enter the principal amount: " principal
done

read -p "Enter the annual interest rate (in %): " rate
while ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ $(echo "$rate <= 0" | bc -l) -eq 1 ]]; do
    echo "Please enter a valid positive number."
    read -p "Enter the annual interest rate (in %): " rate
done

read -p "Enter the time period (in years): " time
while ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ $(echo "$time <= 0" | bc -l) -eq 1 ]]; do
    echo "Please enter a valid positive number."
    read -p "Enter the time period (in years): " time
done

read -p "Enter the number of times interest is compounded per year: " compounds
while ! [[ "$compounds" =~ ^[0-9]+$ ]] || [[ $compounds -le 0 ]]; do
    echo "Please enter a valid positive integer."
    read -p "Enter the number of times interest is compounded per year: " compounds
done

# Call the calculation function
calculate_compound_interest $principal $rate $time $compounds
