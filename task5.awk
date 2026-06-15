# ==============================================================================
# Per-Assignment Report Script (Advanced Documentation)
# Author: Santiago Yambay | Branch: awk_gradebook
# Repository: Codeberg
# Description: Aggregates assignment data into associative arrays to compute
# operational minimums, maximums, and overall averages.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: INITIALIZATION & METADATA FORMATTING
# ------------------------------------------------------------------------------
BEGIN {
    # FS = ",": Establishes the structural field separator to parse CSV input.
    FS = ","
    # printf: Outputs the standardized columnar header to Standard Output (STDOUT).
    printf "%-10s %-5s %-5s %-10s\n", "Name", "Low", "High", "Average"
}

# ------------------------------------------------------------------------------
# SECTION 2: DATA PIPELINING & METRIC ACCUMULATION
# ------------------------------------------------------------------------------
# NR > 1: Condition ensures the structural header line is bypassed during execution.
NR > 1 {
    # Variable assignment mapping positional parameters to logical identifiers.
    assign = $3
    score = $4
    
    # sum / count: Accumulates total metrics in shell memory for later division.
 
   sum[assign] += score
    count[assign]++
    
    # conditional evaluation to track the absolute minimum value per assignment.
    if (!(assign in min) || score < min[assign]) {
        min[assign] = score
    }
    # conditional evaluation to track the absolute maximum value per assignment.
    if (!(assign in max) || score > max[assign]) {
        max[assign] = score
    }
}

# ------------------------------------------------------------------------------
# SECTION 3: RESOLUTION & TERMINAL OUTPUT
# ------------------------------------------------------------------------------
END {
    # Iterates over the captured array keys to compute the final state.
    for (a in sum) {
        # Dynamically computes the average.
        avg = sum[a] / count[a]
        # Streams the final formatted forensic audit string to STDOUT.
        printf "%-10s %-5d %-5d %.2f\n", a, min[a], max[a], avg
    }
}

