#!/bin/bash

echo "🚀 Ejecutando hook: eas-build-prebuild.sh"

if [ -z "$GOOGLE_SERVICES_JSON_BASE64" ]; then
  echo "❌ ERROR: La variable GOOGLE_SERVICES_JSON_BASE64 no está definida"
  exit 1
fi

mkdir -p android/app
echo "$GOOGLE_SERVICES_JSON_BASE64" | base64 -d > android/app/google-services.json

if [ -f android/app/google-services.json ]; then
  echo "✅ google-services.json creado correctamente en prebuild"
else
  echo "❌ ERROR: No se pudo generar google-services.json"
  exit 1
fi
