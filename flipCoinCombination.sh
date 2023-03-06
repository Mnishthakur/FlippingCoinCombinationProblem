num_flips=100

# Initialize the dictionary to store the singlet combinations
declare -A singlets=([heads]=0 [tails]=0)

# Loop through the flips and count the singlet combinations
for (( i=1; i<=$num_flips; i++ ))
do
    # Generate a random number between 0 and 1
    random_number=$((RANDOM % 2))

    # Determine if the result is heads or tails
    if [[ $random_number -eq 0 ]]; then
        singlet="heads"
    else
        singlet="tails"
    fi

    # Increment the count of the singlet combination in the dictionary
    ((singlets[$singlet]++))
done

# Calculate the percentage of each singlet combination
for singlet in "${!singlets[@]}"
do
    percentage=$(bc <<< "scale=2; ${singlets[$singlet]} / $num_flips * 100")
    echo "Percentage of $singlet: $percentage%"
done
