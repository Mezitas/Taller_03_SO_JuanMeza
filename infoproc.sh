#!/bin/bash

# Este script muestra información sobre un proceso y su cadena de padres.

#Verifica si se proporcionó un PID como argumento, si no, usa el PID del script actual
if [ $# -eq 0 ]; then
    PID=$$
else
    PID=$1
fi

# Revisa si el proceso existe
if [ ! -d "/proc/$PID" ]; then
    echo "Error, el proceso $PID no existe"
    exit 1
fi

# Extrae el nombre del proceso desde /proc/[PID]/status
NOMBRE=$(grep "^Name:" /proc/$PID/status | cut -d: -f2 | sed 's/^[ \t]*//')
echo "Nombre: $NOMBRE"

echo ""
echo "Cadena de padres:"
ACTUAL=$PID

# Recorrer la cadena de padres hasta llegar al proceso 1
while [ $ACTUAL -ne 1 ]; do
    # Extrae el nombre y el PPID del proceso actual
    NOMBRE_ACT=$(grep "^Name:" /proc/$ACTUAL/status | cut -d: -f2 | sed 's/^[ \t]*//')
    PPID_ACT=$(grep "^PPid:" /proc/$ACTUAL/status | cut -d: -f2 | sed 's/^[ \t]*//')
    
    echo "$ACTUAL ($NOMBRE_ACT) -> PPID: $PPID_ACT"
    
    # Verifica si el proceso padre existe
    if [ ! -d "/proc/$PPID_ACT" ]; then
        echo "Error: El proceso padre $PPID_ACT no existe"
        exit 1
    fi
    ACTUAL=$PPID_ACT
done

# Mostrar el proceso 1 (ultimo systemd o init)
NOMBRE_1=$(grep "^Name:" /proc/1/status | cut -d: -f2 | sed 's/^[ \t]*//')
echo "1 ($NOMBRE_1) - Proceso init"

exit 0