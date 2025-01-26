#!/bin/bash

# Array of module directories (Presentation module is ".")
MODULES=("core" "domain" "data" "di" ".")

echo "🚀 Starting build_runner build for all modules..."

for MODULE in "${MODULES[@]}"
do
  (
    cd $MODULE || exit
    echo "⚙️ Running build_runner build in module: $MODULE"
    fvm flutter pub get
    fvm dart run build_runner build --delete-conflicting-outputs &
  )
done

echo "✅  Built all modules!"
wait
