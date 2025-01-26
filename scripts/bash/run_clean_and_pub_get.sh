#!/bin/bash

# Array of module directories (Presentation module is ".")
MODULES=("core" "domain" "data" "di" ".")

echo "🚀 Running clean and pub get for all modules..."

for MODULE in "${MODULES[@]}"
do
  (
    cd $MODULE || exit
    echo "📦 Running in module: $MODULE"
    fvm flutter clean
    fvm flutter pub get
  )
done

echo "✅  Pub get completed for all modules!"
wait
