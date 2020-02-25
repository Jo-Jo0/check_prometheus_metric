#!/usr/bin/env bats

PROMETHEUS_SERVER=http://localhost:${PROMETHEUS_PORT}

load test_utils

@test "--- ${BATS_TEST_FILENAME} ---" {
  true
}
# Base-case
@test "Test -q 1 -w 2 -c 3" {
  OUTPUT="$(test_parameters '-q 1 -w 2 -c 3')"
  [ "${OUTPUT}" == "OK - tc is 1" ]
}
@test "Test -q 1 -w 2 -c 3 -O" {
  OUTPUT="$(test_parameters '-q 1 -w 2 -c 3 -O')"
  [ "${OUTPUT}" == "OK - tc is 1" ]
}

# NaN as return
@test "Test -q NaN -w 2 -c 3" {
  OUTPUT="$(test_parameters '-q NaN -w 2 -c 3')"
  [ "${OUTPUT}" == "UNKNOWN - unable to parse prometheus response" ]
}
@test "Test -q NaN -w 2 -c 3 -O" {
  OUTPUT="$(test_parameters '-q NaN -w 2 -c 3 -O')"
  [ "${OUTPUT}" == "OK - tc is NaN" ]
}
