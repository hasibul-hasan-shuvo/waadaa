#!/bin/bash

# Array of module directories (Presentation module is ".")
MODULES=("core" "domain" "data" "di" ".")

echo "🚀 Starting build_runner watch for all modules..."

for MODULE in "${MODULES[@]}"
do
  (
    cd $MODULE || exit
    echo "📌 Running in module: $MODULE"
    fvm flutter pub get
    echo "👀 Starting build_runner watch for module: $MODULE"
    fvm dart run build_runner watch --delete-conflicting-outputs &
  )
done

echo "✅  Watching all modules. Press Ctrl+C to stop."
wait
