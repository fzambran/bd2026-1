#!/bin/bash

set -e

echo "Creando base de datos pagila..."

PGPASSWORD=postgres psql -h db -U postgres -d postgres -c "DROP DATABASE IF EXISTS pagila;"
PGPASSWORD=postgres psql -h db -U postgres -d postgres -c "CREATE DATABASE pagila;"

echo "Cargando esquema..."
PGPASSWORD=postgres psql -h db -U postgres -d pagila -f sql/pagila/pagila-schema.sql

echo "Cargando datos..."
PGPASSWORD=postgres psql -h db -U postgres -d pagila -f sql/pagila/pagila-data.sql

echo "Base de datos pagila cargada correctamente."