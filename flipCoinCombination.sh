num_flips=1000

# Initialize the dictionaries to store the combinations
declare -A singlets=([H]=0 [T]=0)
declare -A doublets=([HH]=0 [HT]=0 [TH]=0 [TT]=0)
declare -A triplets=([HHH]=0 [HHT]=0 [HTH]=0 [THH]=0 [HTT]=0 [THT]=0 [TTH]=0 [TTT]=0)

# Loop through the flips and count the combinations
for (( i=1; i<=$num_flips; i++ ))
do
    # Generate a random number between 0 and 1 for the singlet
    random_number_singlet=$((RANDOM % 2))

    # Determine the result of the singlet
    if [[ $random_number_singlet -eq 0 ]]; then
        singlet="H"
    else
        singlet="T"
    fi

    # Increment the count of the singlet combination in the dictionary
    ((singlets[$singlet]++))

    # Generate a random number between 0 and 3 for the doublet
    random_number_doublet=$((RANDOM % 4))

    # Determine the result of the doublet based on the random number
    if [[ $random_number_doublet -eq 0 ]]; then
        doublet="HH"
    elif [[ $random_number_doublet -eq 1 ]]; then
        doublet="HT"
    elif [[ $random_number_doublet -eq 2 ]]; then
        doublet="TH"
    else
        doublet="TT"
    fi

    # Increment the count of the doublet combination in the dictionary
    ((doublets[$doublet]++))

    # Generate a random number between 0 and 7 for the triplet
    random_number_triplet=$((RANDOM % 8))

    # Determine the result of the first coin
    if [[ $random_number_triplet -eq 0 || $random_number_triplet -eq 1 || $random_number_triplet -eq 2 ]]; then
        coin1="H"
    else
        coin1="T"
    fi

    # Determine the result of the second coin
    if [[ $random_number_triplet -eq 0 || $random_number_triplet -eq 1 || $random_number_triplet -eq 3 || $random_number_triplet -eq 4 ]]; then
        coin2="H"
    else
        coin2="T"
    fi

    # Determine the result of the third coin based on the results of the first two coins
    if [[ $coin1 == "H" && $coin2 == "H" && ($random_number_triplet -eq 0 || $random_number_triplet -eq 1) ]]; then
        triplet="HHH"
    elif [[ $coin1 == "H" && $coin2 == "H" && ($random_number_triplet -eq 2 || $random_number_triplet -eq 3) ]]; then
        triplet="HHT"
    elif [[ $coin1 == "H" && $coin2 == "T" && ($random_number_triplet -eq 4 || $random_number_triplet -eq 5) ]]; then
        triplet="HTH"
    elif [[ $coin1 == "T" && $coin2 == "H" && ($random_number_triplet -eq 4
