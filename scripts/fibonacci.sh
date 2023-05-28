#!/usr/bin/env bash

# Check if the shell is Zsh and the operating system is macOS
if [[ $SHELL == */zsh && $(uname) == "Darwin" ]]; then
    # Zsh and macOS detected
    echo "Running Zsh script with celebratory animation..."
    zsh_script=$(cat <<'EOF'
x=0; y=1; i=2
while true; do
    ((i++))
    z=$((x + y))
    echo -n "$z "
    x=$y
    y=$z

    # Check if the number is a Fibonacci number
    if is_fibonacci "$z"; then
        celebrate_animation
    fi

    sleep 0.5
done

# Function to check if a number is a Fibonacci number
is_fibonacci() {
    local num=$1
    local a=0
    local b=1
    while [[ $b -lt $num ]]; do
        local temp=$b
        b=$((a + b))
        a=$temp
    done
    [[ $b -eq $num ]]
}

# Function to display a celebratory animation
celebrate_animation() {
    local frames=("Yay!" "Woohoo!" "🎉" "🎊")
    local duration=0.2
    local repeat=5

    for ((i = 1; i <= repeat; i++)); do
        for frame in "${frames[@]}"; do
            echo -n "$frame "
            sleep $duration
        done
    done
    echo -n "🎉 "
    echo "Fibonacci!"
}
EOF
)
    zsh -c "$zsh_script"
else
    # Non-Zsh Bourne shell or shell other than Zsh
    echo "Running Bash script..."
    x=0; y=1; i=2
    while true; do
        ((i++))
        z=$((x + y))
        echo -n "$z "
        x=$y
        y=$z
        sleep 0.5
    done
fi
