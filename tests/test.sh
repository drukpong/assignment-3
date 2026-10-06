#!/bin/bash

APP="./app/app.sh"
PASSED=0
FAILED=0

pass_test() {
    echo "PASS"
    ((PASSED++))
    echo
}

fail_test() {
    echo "FAIL"
    ((FAILED++))
    echo
}

echo "Running Assignment 3 tests..."
echo

echo "TEST 1: Help command"
if "$APP" help >/dev/null 2>&1; then
    pass_test
else
    fail_test
fi

echo "TEST 2: System information"
if "$APP" system-info >/dev/null 2>&1; then
    pass_test
else
    fail_test
fi

echo "TEST 3: Reachable host"
if "$APP" check-host google.com >/dev/null 2>&1; then
    pass_test
else
    fail_test
fi

echo "TEST 4: Unreachable host"
if ! "$APP" check-host invalid-host-12345.com >/dev/null 2>&1; then
    pass_test
else
    fail_test
fi

echo "TEST 5: Open port"
if "$APP" check-port google.com 443 >/dev/null 2>&1; then
    pass_test
else
    fail_test
fi

echo "TEST 6: Closed port"
if ! "$APP" check-port google.com 12345 >/dev/null 2>&1; then
    pass_test
else
    fail_test
fi

echo "TEST 7: Missing check-host argument"
"$APP" check-host >/dev/null 2>&1
if [ "$?" -eq 2 ]; then
    pass_test
else
    fail_test
fi

echo "TEST 8: Unknown command"
"$APP" unknown-command >/dev/null 2>&1
if [ "$?" -eq 2 ]; then
    pass_test
else
    fail_test
fi

echo "TEST 9: Invalid check-port arguments"
"$APP" check-port google.com >/dev/null 2>&1
if [ "$?" -eq 2 ]; then
    pass_test
else
    fail_test
fi

echo "-----------------------------"
echo "Tests Passed: $PASSED"
echo "Tests Failed: $FAILED"
echo "-----------------------------"

if [ "$FAILED" -eq 0 ]; then
    echo "All tests passed."
    exit 0
else
    echo "Some tests failed."
    exit 1
fi
