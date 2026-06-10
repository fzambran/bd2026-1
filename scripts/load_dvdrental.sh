#!/bin/bash

set -e

echo "Creando base de datos dvdrental..."

PGPASSWORD=postgres psql -h db -U postgres -d postgres -c "DROP DATABASE IF EXISTS dvdrental;"
PGPASSWORD=postgres psql -h db -U postgres -d postgres -c "CREATE DATABASE dvdrental;"

echo "Restaurando esquema y datos de DVD Rental..."

PGPASSWORD=postgres pg_restore \
    -h db \
    -U postgres \
    -d dvdrental \
    --no-owner \
    --no-privileges \
    sql/dvdrental

echo "Base de datos dvdrental cargada correctamente."

echo "Verificando tablas..."

PGPASSWORD=postgres psql -h db -U postgres -d dvdrental -c "\dt"