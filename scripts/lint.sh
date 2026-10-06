#!/bin/bash

set -e

echo "Running Bash lint checks..."

FILES=(
    "app/app.sh"
    "scripts/lint.sh"
    "scripts/build.sh"
    "tests/test.sh"
)

for file in "${FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "ERROR: Missing file: $file"
        exit 1
    fi

    echo "Checking: $file"
    bash -n "$file"
done

echo "Lint checks passed."
