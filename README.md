# awk-gradebook
# Awk Gradebook Reports

**Student:** Santiago Yambay
**Course:** Systems Engineering — 2nd Semester
**Parallel:** B

## Project Overview
This repository contains a series of `awk` and `bash` scripts to process a raw gradebook CSV file and generate useful formatted reports. 

## Tasks Description
* **Task 1:** Counts the total number of valid assignment submissions excluding the header.
* **Task 2:** Counts the exact number of unique students using an associative array.
* **Task 3:** Filters the "FINAL" assignment and formats the output into aligned columns.
* **Task 4:** Counts the number of failing submissions (below 60% of the maximum score).
* **Task 5:** Generates a per-assignment report detailing the lowest, highest, and average scores (`task5.awk`).
* **Task 6:** Computes the weighted percentage for each student and assigns a letter grade (`task6.awk`).
* **Task 7:** Uses a Bash wrapper (`run.sh`) to execute the Task 6 script and sort the output alphabetically while preserving the header.
* **Bonus:** Extends Task 6 to include an overall class average at the bottom of the report (`bonus.awk`).
