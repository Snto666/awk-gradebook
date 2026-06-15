# ==============================================================================
# Weighted Percentage Logic Script 
# Author: Santiago Yambay | Branch: awk_gradebook
# Repository: Codeberg
# Description: Computes weighted percentages using parallel arrays and processes
# string variables based on relational test conditions.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: INITIALIZATION
# ------------------------------------------------------------------------------
BEGIN {
    # Establishes field delimiter for proper parsing of input stream.
    FS = ","
    printf "%-10s %-10s %-5s\n", "Student", "Percentage", "Grade"
}

# ------------------------------------------------------------------------------
# SECTION 2: PARALLEL ARRAY POPULATION
# ------------------------------------------------------------------------------
NR > 1 {
    # Maps entity identity to a variable to ensure structural consistency.
    student = $1
    # Accumulates dynamic data sets into two parallel associative arrays.
    earned[student] += $4
    possible[student] += $5
}

# ------------------------------------------------------------------------------
# SECTION 3: CONDITIONAL EVALUATION & LOGIC BRANCHING
# ------------------------------------------------------------------------------
END {
    for (s in earned) {
        # Computes relative percentage based on accumulated arrays.
        pct = (earned[s] / possible[s]) * 100
        
        # Logical branching cascade. Maps computed integer to categorical string.
        if (pct >= 90) letter = "A"
        else if (pct >= 80) letter = "B"
        else if (pct >= 70) letter = "C"
        else if (pct >= 60) letter = "D"
        else letter = "E"
        
        # Formats to 2 decimal places to guarantee metric precision.
        printf "%-10s %6.2f     %-5s\n", s, pct, letter
    }
}