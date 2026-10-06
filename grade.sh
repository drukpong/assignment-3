#!/bin/bash

set -e

echo "================================="
echo " Assignment 3 Grader"
echo "================================="
echo

echo "1. Checking required files..."

FILES=(
    "README.md"
    "app/app.sh"
    "scripts/lint.sh"
    "scripts/build.sh"
    "tests/test.sh"
    ".github/workflows/ci.yml"
    "Dockerfile"
    "compose.yaml"
    ".dockerignore"
    "grade.sh"
)

for file in "${FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "FAIL: Missing $file"
        exit 1
    fi
done

echo "PASS: All required files exist."
echo

echo "2. Running lint checks..."
./scripts/lint.sh
echo

echo "3. Running tests..."
./tests/test.sh
echo

echo "4. Checking Docker image..."
docker image inspect assignment-3-diagnostic >/dev/null
echo "PASS: Docker image exists."
echo

echo "5. Running Docker smoke test..."
docker run --rm assignment-3-diagnostic help >/dev/null
echo "PASS: Docker smoke test passed."
echo

echo "================================="
echo " ALL GRADING CHECKS PASSED"
echo "================================="
