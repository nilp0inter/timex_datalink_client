#!/usr/bin/env bash
# Generate golden tests for all protocols

# Make all scripts executable
chmod +x generate_protocol1_tests.sh
chmod +x generate_protocol3_tests.sh
chmod +x generate_protocol4_tests.sh
chmod +x generate_protocol6_tests.sh
chmod +x generate_protocol7_tests.sh
chmod +x generate_protocol9_tests.sh

# Create main fixtures directory
mkdir -p fixtures

# Run each script
echo "Generating Protocol 1 (Timex Datalink 50/70) golden tests..."
./generate_protocol1_tests.sh

echo "Generating Protocol 3 (Timex Datalink 150) golden tests..."
./generate_protocol3_tests.sh

echo "Generating Protocol 4 (Timex Datalink 150s) golden tests..."
./generate_protocol4_tests.sh

echo "Generating Protocol 6 (Motorola Beepwear Pro) golden tests..."
./generate_protocol6_tests.sh

echo "Generating Protocol 7 (DSI e-BRAIN) golden tests..."
./generate_protocol7_tests.sh

echo "Generating Protocol 9 (Timex Ironman Triathlon) golden tests..."
./generate_protocol9_tests.sh

echo "All golden tests have been generated in the fixtures/ directory."