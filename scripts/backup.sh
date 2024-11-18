#!/bin/bash
timestamp=$(date +%Y%m%d_%H%M%S)
backup_dir="/home/paco/tareas/backups/daily"

# Backup de datos
mkdir -p "$backup_dir"
cp -r ../app/data/* "$backup_dir/data_${timestamp}"

# Comprimir
cd "$backup_dir"
tar czf "tasks_backup_${timestamp}.tar.gz" "data_${timestamp}"
rm -rf "data_${timestamp}"

# Limpieza de backups antiguos (7 días)
find "$backup_dir" -name "tasks_backup_*.tar.gz" -mtime +7 -delete

echo "Backup completado: ${timestamp}"
