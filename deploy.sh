#!/usr/bin/env bash
set -Eeuo pipefail

SERVICE="${1:-}"

case "$SERVICE" in
  frontend)
    SERVICE="serys-frontend"
    ;;
  backend)
    SERVICE="serys-backend"
    ;;
  *)
    echo "Usage: $0 frontend|backend" >&2
    exit 2
    ;;
esac

cd /opt/serys/infra

COMPOSE=(
  docker compose
  -f docker-compose-server.yml
  -p infra
)

echo "Deploiement de $SERVICE"

"${COMPOSE[@]}" pull "$SERVICE"

"${COMPOSE[@]}" up \
  -d \
  --no-deps \
  --wait \
  --wait-timeout 120 \
  "$SERVICE"

echo "Etat du service :"
"${COMPOSE[@]}" ps "$SERVICE"

echo "Deploiement termine"