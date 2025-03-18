#!/bin/bash

flutter test --coverage --test-randomize-ordering-seed random

if [ -f .lcovignore ]; then
  exclude_patterns=()
  while IFS= read -r pattern || [ -n "$pattern" ]; do
    if [[ -n "$pattern" && ! "$pattern" =~ ^# ]]; then
      if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        pattern=$(echo "$pattern" | sed 's#/#\\#g')
      fi
      exclude_patterns+=("$pattern")
    fi
  done < <(tr -d '\r' < .lcovignore)

  if [ ${#exclude_patterns[@]} -gt 0 ]; then
    lcov --remove coverage/lcov.info "${exclude_patterns[@]}" -o coverage/lcov.info
  else
    echo "No valid patterns found in .lcovignore. Skipping exclusion."
  fi
else
  echo ".lcovignore file not found. Skipping exclusion."
fi

genhtml coverage/lcov.info -o coverage/html

echo "Coverage report generated at coverage/html/index.html"

open coverage/html/index.html