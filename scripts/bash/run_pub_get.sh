#!/bin/bash

# Array of module directories (Presentation module is ".")
MODULES=("core" "domain" "data" "di" ".")

echo "🚀 Running pub get for all modules..."

for MODULE in "${MODULES[@]}"
do
  (
    cd $MODULE || exit
    echo "📦 Running pub get in module: $MODULE"
    fvm flutter pub get
  )
done

echo "✅  Pub get completed for all modules!"
wait
