## Task 1
Command: `awk -F',' 'NR>1 {count++} END {print count}' Lab03-data.csv`
Result: 322
Explanation: Utilizes the '-F' operator to establish the comma as the structural field separator. The 'NR>1' condition isolates the data by systematically excluding the CSV header. The '{count++}' block increments a counter variable in the shell's memory for each valid record. Finally, the 'END' block pipes the accumulated total to Standard Output (STDOUT).
## Task 2
Command: `awk -F',' 'NR>1 {seen[$1]=1} END {for (student in seen) count++; print count}' Lab03-data.csv`
Result: 14
Explanation: Initializes an associative array 'seen' indexed by the first positional field ($1). Because array keys must be unique, this acts as a structural set to enforce data uniqueness. The 'END' block employs a 'for' loop to iterate through the unique keys, accumulating a final count printed to STDOUT, validating the exact number of distinct entities.
## Task 3
Command: `awk -F',' 'NR>1 && $3=="FINAL" {printf "%-10s %3d\n", $1, $4}' Lab03-data.csv`
Result: 
Jackson    169
Kenji      162
Shane      193
Noah       116
Lucia      200
Priya      159
Andrew     123
Diana      152
Maria      152
Eliza      141
Tomas      163
Sam        152
Ava        172
Chelsey    142
Explanation: Employs a logical AND ('&&') to filter data, requiring the record to bypass the header and exactly match the string literal "FINAL" in the third field ($3). Employs 'printf' for forensic formatting, aligning the string ('%-10s') to the left and the integer ('%3d') to the right for structured terminal output.
## Task 4
Command: `awk -F',' 'NR>1 && $4 < (0.6 * $5) {count++} END {print count+0}' Lab03-data.csv`
Result: 50
Explanation: Executes a dynamic mathematical evaluation. Compares the earned points parameter ($4) against a dynamically computed threshold (60% of the maximum points, $5). If the conditional evaluates to true, the failure counter increments. The '+0' forces AWK to output integer 0 to STDOUT if the variable remains uninitialized.
## Task 5
Command: `awk -f task5.awk Lab03-data.csv`
Result:
Name       Low   High  Average   
Q06        8     20    14.71
L05        17    50    38.21
WS         2     5     4.21
L06        27    50    40.07
Q07        12    20    15.36
L07        21    50    38.43
H01        46    100   82.71
H02        55    100   77.57
H03        62    100   82.43
H04        32    97    72.93
H05        51    100   74.00
H06        37    98    74.21
H07        40    100   72.93
Q01        9     20    14.29
L01        27    50    40.21
Q02        9     20    14.86
L02        23    50    39.21
Q03        8     20    15.07
L03        19    50    36.57
Q04        13    20    16.43
FINAL      116   200   156.86
Q05        8     18    15.07
L04        25    50    40.36
Outputs per-assignment report with dynamic min, max, and float-precision averages.
Explanation: The script utilizes multidimensional arrays indexed by assignment. It actively evaluates absolute minimums and maximums via relational conditional blocks. The 'END' block computes the mathematical average and pipes it to STDOUT with 'printf' formatting. Script: task5.awk.
## Task 6
Command: `awk -f task6.awk Lab03-data.csv`
Result:
Student    Percentage Grade
Tomas       82.22     B    
Diana       62.08     D    
Andrew      73.69     C    
Lucia       89.53     B    
Kenji       86.45     B    
Chelsey     62.65     D    
Eliza       84.16     B    
Shane       93.12     A    
Noah        63.08     D    
Ava         81.43     B    
Maria       79.57     C    
Priya       71.04     C    
Jackson     78.64     C    
Sam         72.90     C    
Outputs individual student percentages and assigned letter grades.
Explanation: Implements parallel associative arrays to aggregate 'earned' and 'possible' metrics mapped to individual student entities. The 'END' block extracts these metrics, computes the percentage, and utilizes a cascading 'if/else if' branching logic structure to assign alphabetical grading before outputting to STDOUT. Script: task6.awk.
## Task 7
Command: `./run.sh Lab03-data.csv`
Result:
[+] Executing System Administration Wrapper by Santiago Yambay...
[-] Commencing forensic data pipeline...
Student    Percentage Grade
Andrew      73.69     C    
Ava         81.43     B    
Chelsey     62.65     D    
Diana       62.08     D    
Eliza       84.16     B    
Jackson     78.64     C    
Kenji       86.45     B    
Lucia       89.53     B    
Maria       79.57     C    
Noah        63.08     D    
Priya       71.04     C    
Sam         72.90     C    
Shane       93.12     A    
Tomas       82.22     B    
[+] Execution Complete. Process buffers flushed and state preserved.
Formatted Task 6 output, strictly sorted alphabetically with static headers.
Explanation: The Bash wrapper implements rigorous CLI argument validation utilizing extended test evaluations ('-z', '-f'). It orchestrates data flow by calling the external AWK processor, piping STDOUT into a subshell sequence that isolates the header row, and routes the remainder through standard 'sort' utilities. Script: run.sh.
## Bonus
Command: `awk -f bonus.awk Lab03-data.csv`
Result: 
Student    Percentage Grade
Tomas       82.22     B    
Diana       62.08     D    
Andrew      73.69     C    
Lucia       89.53     B    
Kenji       86.45     B    
Chelsey     62.65     D    
Eliza       84.16     B    
Shane       93.12     A    
Noah        63.08     D    
Ava         81.43     B    
Maria       79.57     C    
Priya       71.04     C    
Jackson     78.64     C    
Sam         72.90     C    
CLASS       77.18
Appends dynamic "CLASS" average to the bottom of the student report.
Explanation: Integrates global tracking variables initialized in the 'END' block. Iterates through the stored associative arrays to accumulate system-wide totals, effectively computing the mathematical class average before outputting it. Incorporates defensive logic to prevent division-by-zero panics. Script: bonus.awk.