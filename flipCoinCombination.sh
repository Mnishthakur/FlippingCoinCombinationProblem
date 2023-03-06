num_flips=100

# Initialize the dictionary to store the doublet combinations
declare -A doublets=([HH]=0 [HT]=0 [TH]=0 [TT]=0)

# Loop through the flips and count the doublet combinations
for (( i=1; i<=$num_flips; i++ ))
do
    # Generate a random number between 0 and 3
    random_number=$((RANDOM % 4))

    # Determine the result of the first coin
    if [[ $random_number -eq 0 || $random_number -eq 1 ]]; then
        coin1="H"
    else
        coin1="T"
    fi

    # Generate another random number between 0 and 1
    random_number=$((RANDOM % 2))

    # Determine the result of the second coin based on the result of the first coin
    if [[ $coin1 == "H" && $random_number -eq 0 ]]; then
        doublet="HH"
    elif [[ $coin1 == "H" && $random_number -eq 1 ]]; then
        doublet="HT"
    elif [[ $coin1 == "T" && $random_number -eq 0 ]]; then
        doublet="TH"
    else
        doublet="TT"
    fi

    # Increment the count of the doublet combination in the dictionary
    ((doublets[$doublet]++))
done

# Calculate the percentage of each doublet combination
for doublet in "${!doublets[@]}"
do
    percentage=$(bc <<< "scale=2; ${doublets[$doublet]} / $num_flips * 100")
    echo "Percentage of $doublet: $percentage%"
done
