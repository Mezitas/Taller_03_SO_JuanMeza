#!/bin/bash

# CORREGIDO: Espacios después de [ y antes de ]
if [ $# -eq 0 ]; then
    PID=$$
else
    PID=$1
fi

# CORREGIDO: Espacios dentro de los corchetes
if [ ! -d "/proc/$PID" ]; then
    echo "Error, el proceso $PID no existe"
    exit 1
fi

# CORREGIDO: grep busca la línea completa, necesitas extraer solo el valor
NOMBRE=$(grep "^Name:" /proc/$PID/status | cut -d: -f2 | sed 's/^[ \t]*//')
echo "Nombre: $NOMBRE"

echo ""
echo "Cadena de padres:"
ACTUAL=$PID

# CORREGIDO: Espacios en el while
while [ $ACTUAL -ne 1 ]; do
    # CORREGIDO: Extraer solo el valor
    NOMBRE_ACT=$(grep "^Name:" /proc/$ACTUAL/status | cut -d: -f2 | sed 's/^[ \t]*//')
    PPID_ACT=$(grep "^PPid:" /proc/$ACTUAL/status | cut -d: -f2 | sed 's/^[ \t]*//')
    
    echo "$ACTUAL ($NOMBRE_ACT) -> PPID: $PPID_ACT"
    
    # CORREGIDO: Espacios en el if
    if [ ! -d "/proc/$PPID_ACT" ]; then
        echo "Error: El proceso padre $PPID_ACT no existe"
        exit 1
    fi
    ACTUAL=$PPID_ACT
done

# Mostrar el proceso 1
NOMBRE_1=$(grep "^Name:" /proc/1/status | cut -d: -f2 | sed 's/^[ \t]*//')
echo "1 ($NOMBRE_1) - Proceso init"

exit 0