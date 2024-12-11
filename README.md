# Race Condition Bug in Shell Script

This repository demonstrates a race condition bug in a simple shell script. The script attempts to increment a counter in a file concurrently using multiple processes. Due to the lack of proper synchronization mechanisms, the final counter value may not be the expected value.

The `bug.sh` file contains the buggy script, which exhibits the race condition. The `bugSolution.sh` provides a corrected version using a lock file to avoid data corruption.