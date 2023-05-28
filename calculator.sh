#!/bin/zsh

# Color variables
CYBERPUNK_BLUE='\033[38;5;39m'
SYNTHWAVE_PINK='\033[38;5;198m'
RETROWAVE_PURPLE='\033[38;5;129m'
GLOWING_GREEN='\033[38;5;118m'
BRIGHT_MAGENTA='\033[95m'
FALLBACK_MAGENTA='\033[38;5;165m'

# Function to ask if the user wants to perform another calculation
perform_another_calculation() {
    echo "${SYNTHWAVE_PINK}Would you like to perform another calculation?${RETROWAVE_PURPLE}"
    echo "1. Perform another calculation"
    echo "2. Exit"
    read -r choice

    case $choice in
        1)
            echo "${SYNTHWAVE_PINK}You chose to perform another calculation.${RETROWAVE_PURPLE}"
            main_calculation
            ;;
        2)
            echo "${SYNTHWAVE_PINK}You chose to exit. Goodbye!${RETROWAVE_PURPLE}"
            exit
            ;;
        *)
            echo "${SYNTHWAVE_PINK}Invalid choice. Please enter a valid option.${RETROWAVE_PURPLE}"
            perform_another_calculation
            ;;
    esac
}

# Function for the main calculation
main_calculation() {
    # Prompt for entering numbers
    echo "${SYNTHWAVE_PINK}Welcome to the Calculator!${RETROWAVE_PURPLE}"
    echo "${SYNTHWAVE_PINK}You will now perform a calculation using two numbers.${RETROWAVE_PURPLE}"
    echo "${SYNTHWAVE_PINK}Please enter the first number and press enter:${RETROWAVE_PURPLE}"
    read -r a
    echo "${SYNTHWAVE_PINK}Great! Now enter the second number and press enter:${RETROWAVE_PURPLE}"
    read -r b

    # Input type of operation
    echo "${SYNTHWAVE_PINK}Please select the operation:${RETROWAVE_PURPLE}"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    read -r ch

    # Acting on the user input
    case $ch in
        1) res=$((a + b))
            ;;
        2) res=$((a - b))
            ;;
        3) res=$((a * b))
            ;;
        4) res=$(awk "BEGIN{printf \"%.2f\", $a / $b}")
            ;;
        *)
            echo "${SYNTHWAVE_PINK}Invalid choice. Please enter a valid option.${RETROWAVE_PURPLE}"
            main_calculation
            ;;
    esac

    # Printing result
    echo "${SYNTHWAVE_PINK}The result of the calculation is:${GLOWING_GREEN} $res${RETROWAVE_PURPLE}"

    # Ask if the user wants to perform another calculation
    perform_another_calculation
}

# Call the main calculation function
main_calculation
