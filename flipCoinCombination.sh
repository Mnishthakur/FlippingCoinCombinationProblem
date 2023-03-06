num_flips=100

# Initialize the dictionary to store the triplet combinations
declare -A triplets=([HHH]=0 [HHT]=0 [HTH]=0 [THH]=0 [HTT]=0 [THT]=0 [TTH]=0 [TTT]=0)

# Loop through the flips and count the triplet combinations
for (( i=1; i<=$num_flips; i++ ))
do
    # Generate a random number between 0 and 7
    random_number=$((RANDOM % 8))

    # Determine the result of the first coin
    if [[ $random_number -eq 0 || $random_number -eq 1 || $random_number -eq 2 ]]; then
        coin1="H"
    else
        coin1="T"
    fi

    # Determine the result of the second coin
    if [[ $random_number -eq 0 || $random_number -eq 1 || $random_number -eq 3 || $random_number -eq 4 ]]; then
        coin2="H"
    else
        coin2="T"
    fi

    # Determine the result of the third coin based on the results of the first two coins
    if [[ $coin1 == "H" && $coin2 == "H" ]]; then
        triplet="HHH"
    elif [[ $coin1 == "H" && $coin2 == "T" ]]; then
        triplet="HHT"
    elif [[ $coin1 == "T" && $coin2 == "H" ]]; then
        triplet="THH"
    elif [[ $coin1 == "H" && $coin2 == "T" ]]; then
        triplet="HTH"
    elif [[ $coin1 == "T" && $coin2 == "T" ]]; then
        triplet="TTT"
    elif [[ $coin1 == "H" && $coin2 == "T" ]]; then
        triplet="HTT"
    elif [[ $coin1 == "T" && $coin2 == "H" ]]; then
        triplet="THT"
    else
        triplet="TTH"
    fi

    # Increment the count of the triplet combination in the dictionary
    ((triplets[$triplet]++))
done

# Calculate the percentage of each triplet combination
for triplet in "${!triplets[@]}"
do
    percentage=$(bc <<< "scale=2; ${triplets[$triplet]} / $num_flips * 100")
    echo "Percentage of $triplet: $percentage%"
done
