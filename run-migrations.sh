#!/bin/bash
# Скрипт для применения миграций Supabase
# ЗАМЕНИ "YOUR_DB_PASSWORD" на свой пароль от базы, затем запусти: ./run-migrations.sh

export SUPABASE_ACCESS_TOKEN=sbp_8a13cb4d5cf4949a592ee810968bb7529d76a02e
export SUPABASE_DB_PASSWORD="9M/$3cGygFRhEmi"

echo "Applying migrations..."
echo "Y" | npx supabase db push

echo "Done."
