#!/bin/bash
if [ -z "$1" ]; then
    echo "Uso: ./restore.sh <timestamp>"
    exit 1
fi

timestamp=$1
backup_dir="/home/paco/tareas/backups/daily"
backup_file="${backup_dir}/tasks_backup_${timestamp}.tar.gz"

if [ ! -f "$backup_file" ]; then
    echo "Backup no encontrado: $backup_file"
    exit 1
fi

# Restaurar
cd "$backup_dir"
tar xzf "$backup_file"
cp -r "data_${timestamp}"/* ../../app/data/
rm -rf "data_${timestamp}"

echo "Restauración completada: ${timestamp}"
