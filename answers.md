## Task 1
Command: `awk -F',' 'NR>1 {count++} END {print count}' Lab03-data.csv`
Result: 145
Explanation: Utilizes the '-F' operator to establish the comma as the structural field separator. The 'NR>1' condition isolates the data by systematically excluding the CSV header. The '{count++}' block increments a counter variable in the shell's memory for each valid record. Finally, the 'END' block pipes the accumulated total to Standard Output (STDOUT).
## Task 2
Command: `awk -F',' 'NR>1 {seen[$1]=1} END {for (student in seen) count++; print count}' Lab03-data.csv`
Result: 38
Explanation: Initializes an associative array 'seen' indexed by the first positional field ($1). Because array keys must be unique, this acts as a structural set to enforce data uniqueness. The 'END' block employs a 'for' loop to iterate through the unique keys, accumulating a final count printed to STDOUT, validating the exact number of distinct entities.
## Task 3
Command: `awk -F',' 'NR>1 && $3=="FINAL" {printf "%-10s %3d\n", $1, $4}' Lab03-data.csv`
Result: 
Noah       180
Sam        175
Shane      193
Explanation: Employs a logical AND ('&&') to filter data, requiring the record to bypass the header and exactly match the string literal "FINAL" in the third field ($3). Employs 'printf' for forensic formatting, aligning the string ('%-10s') to the left and the integer ('%3d') to the right for structured terminal output.