random_number=$((RANDOM % 2))

# Determine if the result is heads or tails
if [[ $random_number -eq 0 ]]; then
    result="heads"
else
    result="tails"
fi

# Display the result
echo "The coin landed on: $result"
