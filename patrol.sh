#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: No environment specified"
    echo "Usage: $0 [development|staging|production]"
    exit 1
fi

cache_cleanup() {
    echo "Initiating cache cleanup..."

    DK=("./build" "$HOME/Library/Developer/Xcode/DerivedData")
    DV=("ios_results_*" "Runner-*")

    for i in "${!DK[@]}"; do
        K="${DK[$i]}"
        V="${DV[$i]}"
        if [ -d "$K" ]; then
            find "$K" -type d -name "$V" -exec rm -rf {} +
        fi
    done
}

ENV=$1
case $ENV in
    development|staging|production)
        cache_cleanup
        echo "Starting patrol integration test on $ENV environment..."
        patrol test --flavor $ENV -t integration_test/example_test.dart
        ;;
    *)
        echo "Error: Invalid environment '$ENV'"
        echo "Valid environments: development, staging, production"
        exit 1
        ;;
esac

echo "Completed patrol integration test on $ENV environment"