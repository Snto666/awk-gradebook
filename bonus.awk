# ==============================================================================
# Global Metric Resolution Script 
# Author: Santiago Yambay | Branch: awk_gradebook
# Repository: Codeberg
# Description: Analyzes systemic load by computing both individual performance 
# logic and a global class average utilizing aggregate data structures.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1 & 2: INITIALIZATION AND DATA CAPTURE
# ------------------------------------------------------------------------------
BEGIN {
    FS = ","
    printf "%-10s %-10s %-5s\n", "Student", "Percentage", "Grade"
}

NR > 1 {
    student = $1
    earned[student] += $4
    possible[student] += $5
}

# ------------------------------------------------------------------------------
# SECTION 3: SYSTEM-WIDE EVALUATION & MEMORY MANAGEMENT
# ------------------------------------------------------------------------------
END {
    # Variable initialization to prevent null value arithmetic errors.
    total_earned = 0
    total_possible = 0
    
    for (s in earned) {
        pct = (earned[s] / possible[s]) * 100
        
        # Populating global system tracking variables.
        total_earned += earned[s]
        total_possible += possible[s]
        
        if (pct >= 90) letter = "A"
        else if (pct >= 80) letter = "B"
        else if (pct >= 70) letter = "C"
        else if (pct >= 60) letter = "D"
        else letter = "E"
        
        printf "%-10s %6.2f     %-5s\n", s, pct, letter
    }
    
    # Conditional gate: Prevents "Division by Zero" kernel panic.
    if (total_possible > 0) {
        class_avg = (total_earned / total_possible) * 100
        printf "CLASS      %6.2f\n", class_avg
    }
}
