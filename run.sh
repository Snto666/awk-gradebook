#!/bin/bash
# ==============================================================================
# Bash Wrapper & Execution Orchestrator 
# Author: Santiago Yambay | Branch: awk_gradebook
# Repository: Codeberg
# Description: Validates positional parameters, manages I/O streams, and pipelines
# data through external AWK processors while maintaining header integrity.
# ==============================================================================

# Terminal Customization: Display Author identity in purple
echo -e "\e[35m[+] Executing System Administration Wrapper by Santiago Yambay...\e[0m"

# ------------------------------------------------------------------------------
# SECTION 1: POSITIONAL PARAMETER CAPTURE & INPUT VALIDATION
# ------------------------------------------------------------------------------

# TARGET_FILE="${1}":
# Captures the first positional parameter passed via CLI.
TARGET_FILE="${1}"

# if [[ -z "${TARGET_FILE}" ]]; then:
# Evaluates if the variable string length is exactly zero. Acts as defensive gatekeeper.
if [[ -z "${TARGET_FILE}" ]]; then 
    echo "[!] ERROR: You must provide a target CSV file as an argument!"
    exit 1 
fi

# if [[ ! -f "${TARGET_FILE}" ]]; then:
# Employs extended test syntax to verify if path maps to an existing regular file.
if [[ ! -f "${TARGET_FILE}" ]]; then
    echo "[!] ERROR: The file '${TARGET_FILE}' does not exist or is not a regular file."
    exit 1
fi

# ------------------------------------------------------------------------------
# SECTION 2: ASYNCHRONOUS PROCESS CONTROL & DATA PIPELINING
# ------------------------------------------------------------------------------

echo "[-] Commencing forensic data pipeline..."

# awk -f task6.awk: Triggers AWK interpreter.
# | (pipe): Redirects output. read -r header: Isolates top line. sort: Alphabetizes remainder.
awk -f task6.awk "${TARGET_FILE}" | (read -r header; echo "$header"; sort)

# ------------------------------------------------------------------------------
# SECTION 3: SAFE TERMINATION
# ------------------------------------------------------------------------------
echo -e "\e[32m[+] Execution Complete. Process buffers flushed and state preserved.\e[0m"
