#!/bin/bash
#Just trying out
function procesarArchivos {

   for i in {1..10000}
   do
   	echo $i
   done

}

function mostrarMensajeDeCarga {
    local mensaje=$1
    local num_puntos=$2
    local pid=$3

    echo -e -n "${CIAN}${mensaje}${RESET}"

    while kill -0 $pid 2>/dev/null; do
        for ((i=1; i<= num_puntos; i++)); do
            echo -n "."
            sleep 1  # Dormir carajo!
        done
        echo -ne "\r${CIAN}${mensaje}${RESET}$(printf '%0.s ' {1..$num_puntos})\r"  # Clear dots
    done

    echo -e ""
}

# Start the file processing in the background
procesarArchivos &

# Get the PID of the background process
pid=$!

# Show the loading message while the background process is running
mostrarMensajeDeCarga "Procesando archivos" 3 $pid

# Wait for the background process to complete
wait $pid

echo "Procesamiento completado."


