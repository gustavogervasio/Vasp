#!/bin/bash

# Tells the shell script to exit if it encounters an error
set -e

echo "Executing CocoaPods"
pod repo update
pod install