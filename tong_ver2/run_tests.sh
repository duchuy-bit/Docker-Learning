#!/bin/bash

# Build Docker image
docker build -t cpp-app .

# Run tests
for i in {1..2}; do
    echo "Running test $i"
    
    # Run Docker container, feed input file and capture output
    output=$(docker run -i cpp-app < testcases/input$i.txt)

    # Read expected output
    expected_output=$(cat testcases/expected_output$i.txt)

    # Compare output
    if [ "$output" == "$expected_output" ]; then
        echo "Test $i passed!"
    else
        echo "Test $i failed."
        echo "Expected: $expected_output"
        echo "Got: $output"
    fi
done
