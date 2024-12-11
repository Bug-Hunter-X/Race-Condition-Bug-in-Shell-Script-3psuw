#!/bin/bash

# This script demonstrates a corrected version of the race condition

# Create a file and write a number to it
create_file() {
echo 0 > /tmp/counter
}

# Increment the counter in the file using a lock
increment_counter() {
  flock -n /tmp/counter.lock || exit 1 # exit if lock is held
  value=$(cat /tmp/counter)
  new_value=$((value + 1))
echo $new_value > /tmp/counter
flock -u /tmp/counter.lock #unlock
}

# Run the increment function concurrently multiple times
run_concurrently() {
  for i in {1..10}; do
    increment_counter &
done
  wait
}

# Main function
main() {
  create_file
  run_concurrently
  value=$(cat /tmp/counter)
echo "Final value: $value"
}

main