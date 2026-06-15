## Task 1
Command: `awk -F',' 'NR>1 {count++} END {print count}' Lab03-data.csv`
Result: 145
Explanation: Utilizes the '-F' operator to establish the comma as the structural field separator. The 'NR>1' condition isolates the data by systematically excluding the CSV header. The '{count++}' block increments a counter variable in the shell's memory for each valid record. Finally, the 'END' block pipes the accumulated total to Standard Output (STDOUT).