# Check if LEVEL is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <LEVEL>"
    exit 1
fi

LEVEL=$1
CDIR="."

# Loop to construct the path
for ((i = 0; i < LEVEL; i++)); do
    echo "Level $i"
    CDIR="../$CDIR"
done

# Change to the constructed directory
cd "$CDIR" || { echo "Failed to change directory"; exit 1; }

# Print the current directory
echo "You are in: $PWD"

# Start a new shell session
$SHELL
