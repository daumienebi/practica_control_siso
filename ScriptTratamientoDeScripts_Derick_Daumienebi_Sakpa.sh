#!/bin/bash
######################################################################################################################
#						CABECERA
######################################################################################################################
# Nombre: ScriptTratamientoDeScripts_Derick_Daumienebi_Sakpa.sh
# 
# Autor: Derick Daumienebi Sakpa
#
# Descripcion: Práctica de control de la asignatura : Sistemas Operativos
#              Sirve para gestionar la internacionalización de los comentarios encontrados en otros scripts
#
# Tutor: José Manuel Saiz Diez
#
# Uso: Ejecuta el script en un directorio que contenga 1 o más subdirectorios, se encargará de generar los ficheros
#      (.txt) para cada script encontrado que contengan las referencias de los comentarios encontrados una vez que 
#      seleccionas en que idioma se encuentra el script original.Una vez generados, puedes gestionar los comentarios 
#      original,del script cambiando el idioma de los comentarios o realizando otra opciones disponibles a través de
#      los menus de opciones.
# 													
# Nota: Se requiere una version de bash superior a la 4 para un funcionamiento óptimo.
######################################################################################################################

#Variables generales
FILTRO_FICHEROS="*.sh"
BIN_BASH1="#!/bin/bash"
BIN_BASH2="#!\bin\bash"
INICIO_NUM_LINEAS=10 #Inicio del número de lineas (por ejemplo #SP-10-)
INCR_LINEAS=10 #Incremento de linea
FICHERO_LOGS_GENERAL="./logGeneral.log"
DIRECTORIO_LOGS="./logs"
#Variable para obtener los códigos de idiomas que se encuentran al final del fichero, utiliza la '#CLAVE_ZONA_IDIOMAS'
#para encontrar la linea a partir de la cual tiene que leer los códigos de idiomas,luego sumamos 1 para ir a la linea
#siguiente porque a partir de ese se encuentran los códigos
LINEA_INICIO_IDIOMAS=$(($(grep -n '#CLAVE_ZONA_IDIOMAS' "${BASH_SOURCE[0]}" | tail -n 1 | cut -d':' -f1)+1))

#Colores
RESET="\e[0m" #Reset para volver al color normal
ROJO="\e[1;31m"
VERDE="\e[1;32m"
CIAN="\e[1;36m"
AMARILLO_OSCURO="\033[1;33m"

#Opciones para el tipo de mensaje de log
LOG_ERROR=0
LOG_WARNING=1
LOG_SUCCESS=2

#Arrays para las opciones de menus
OPCIONES_MENU_PRINCIPAL=(
"-> Cargar un nuevo juego de referencias" 
"-> Regenerar referencias" 
"-> Crear un nuevo fichero de almacenamiento"
"-> Cambiar idioma de los scripts"
"-> Visualizar los ficheros de log"
"-> Eliminar referencias de los scripts"
"-> Mostrar ayuda"
"-> Mostrar los idiomas disponibles"
"-> Salir"
)
OPCIONES_MENU_VOLVER_O_SALIR=(
"-> Volver al menu principal"
"-> Salir"
)
OPCIONES_MENU_LOGS=(
"-> Fichero de logs general"
"-> Fichero de logs por cada script"
"-> Salir"
)
OPCIONES_MENU_COD_IDIOMA_NUEVO=(
"-> Introducir otro codigo"
"-> Salir"
)
OPCIONES_MENU_SI_NO=(
"-> Si"
"-> No"
)
OPCIONES_MENU_NUEVO_FICHERO_ALMACENAMIENTO=(
"-> Añadir nuevo idioma (Solo añadirá el idioma sin el txt)"
"-> Añadir nuevo idioma y el fichero de almacenammiento"
"-> Salir"
)
OPCIONES_MENU_IDIOMAS_DISPONIBLES=() #Array global para los idiomas encontrados, se declara vacio a proposito

#Muestra las opciones del menu principal al usuario
function mostrarMenuPrincipal {
	echo -e "${AMARILLO_OSCURO}Selecciona una opción : ${RESET}"
	echo -e "${AMARILLO_OSCURO}Mueve con las flechas [arriba,abajo] y selecciona con ENTER${RESET}\n"
	seleccionarOpcion "${OPCIONES_MENU_PRINCIPAL[@]}"
	opcion_seleccionada=$?
	case $opcion_seleccionada in
		0)
			clear
			cargarNuevasReferencias ;;
		1)
			clear
			regenerarReferencias ;;
		2)
			clear
			crearNuevoFicheroDeAlmacenamiento ;;
		3)
			clear
			cambiarIdiomaDeLosScripts ;;
		4)
			clear
			visualizarFicherosLog ;;
		5)
			clear
			borrarReferencias ;;
		6)
			mostrarAyuda ;;
		7)
			clear
			mostrarIdiomasDisponibles
			echo "*Puedes agregar mas idiomas desde la opción del menú o al final del script siguiendo el formato.*"
			volverAlMenuOSalir ;;
		8)
			exit 1 ;;	
	esac	
} #Fin mostrarMenuPrincipal()

#Función que comprueba si los scripts están referenciados antes de crear una nueva referencias
#o antes de cambiar el idioma de los scripts
#Devuelve [1] si ya están referenciados y [0] si aun no lo están
function comprobarSiLosScriptsEstanReferenciados {
	echo -e "${AMARILLO_OSCURO}Comprobando si los scripts están referenciados...${RESET}"
    	local encontrado=0  # Variable para almacenar el estado de referencia encontrada
    	# Buscar en los subdirectorios inmediatos
    	while IFS= read -r -d '' script; do
        	while IFS= read -r linea; do
            		if echo "$linea" | grep -qE '#[A-Z]{2}-[0-9]+-'; then
                		echo "Referencia encontrada en el script: $script"
                		encontrado=1
                		break 2  #Salir de ambos bucles
            		fi
        	done < "$script"
    	done < <(find */ -type f -name "$FILTRO_FICHEROS" -print0)
    	if [[ $encontrado -eq 1 ]]; then
        	return 1  # Ya están referenciados
    	else
        	echo "No se encontraron referencias en los scripts."
        	return 0  # No están referenciados
    	fi
} #Fin comprobarSiLosScriptsEstanReferenciados()

#Opcion del menu principal para crear referencias nuevas
function cargarNuevasReferencias {
	#Antes de nada,comprobamos si los scripts ya están referenciados, para evitar una doble referencia
	comprobarSiLosScriptsEstanReferenciados
	comprobacion=$? #Obtenemos el resultado de la última ejecución
	if [[ $comprobacion -eq 1 ]]; then
		#Salimos directamente y agregamos el error al log
		mostrarMensajeYAgregarloAlLogGeneral "Intentas referenciar algúnos scripts ya referenciados, puedes quitar los scripts ya referenciados del subdirectorio, utilizar la opcion de regenerar referencias para volver a sincronizar las referencias o utilizar la opción del menú de eliminar las referencias de los scripts."\
						     $FUNCNAME $LOG_ERROR
		volverAlMenuOSalir
	fi
	#Identificamos los scripts base con los que vamos a trabajar y avisamos al usuario
	scripts_encontrados=$(find */ -name "$FILTRO_FICHEROS" -type f -print | grep -c '') #Sustitucion de comandos y contamos cada linea del find con grep
	echo -e "${AMARILLO_OSCURO}\nScripts(.sh) encontrados :${RESET}"
	find */ -name "$FILTRO_FICHEROS" -type f -print #Mostrar los scripts encontrados
	#Si se encuentra 1 o más ficheros, seguimos, si no, es que no se han encontrado scripts en los subdirectorios
	if [[ $scripts_encontrados -lt 1 ]]
	then
		mostrarMensajeYAgregarloAlLogGeneral "No se ha encontrado ningún script en los subdirectorios" $FUNCNAME $LOG_WARNING
		volverAlMenuOSalir
	#Later add more options for the case where the files are already created
	else
		if [[ $scripts_encontrados -eq 1 ]]; then
			echo -e "${CIAN}\nSe ha encontrado $scripts_encontrados script${RESET},¿deseas seguir?"
		else
			echo -e "${CIAN}\nSe han encontrado $scripts_encontrados scripts${RESET},¿deseas seguir?"
		fi
		seleccionarOpcion "${OPCIONES_MENU_SI_NO[@]}"
		opcion_seguir=$?
		while :; do
			case $opcion_seguir in
				0)
					#Preguntamos al usuario el idioma en el que quiere realizar las traducciones
					echo -e "${CIAN}¿En que idioma se encuentran los scripts? (Introduce el código)${RESET}"
					seleccionarIdioma
   					idioma_seleccionado=$?
   					codigo_idioma_script=${OPCIONES_MENU_IDIOMAS_DISPONIBLES[$idioma_seleccionado]:1:2}
   					echo -e "Generando los ficheros de almacenamiento..."
					find */ -type f -name "$FILTRO_FICHEROS" -print0 | while IFS= read -r -d '' script; do
						echo "Creando ficheros de almacenamiento para $script"
						extraerComentariosDelScript "$script" $codigo_idioma_script
					done
					mostrarMensajeYAgregarloAlLogGeneral "Las nuevas referencias han sido creadas para todos los scripts" $FUNCNAME $LOG_SUCCESS
					volverAlMenuOSalir #Prompt para que el usuario elija si salir o no de la app, truqito para salir del while o yo que se :)
					;;	
				1)
					echo "Se ha salido del programa"
					exit 1
					;;
			esac
		done
	fi
} #Fin cargarNuevasReferencias()

#La funcion procesa un script y extrae los comentarios para crear los respectivos ficheros de almacenamiento
#$1: El script original (de donde se va extraer los comentarios)
#$2: El codigo de idioma en el que se encuentra el script
function extraerComentariosDelScript {
  	script=$1
  	codigo_idioma_script=$2
  	contador_lineas=$INICIO_NUM_LINEAS #Numero inicial de cada linea
  	declare -a lineas_script_original=()
  	declare -a lineas_referencias_vacias=()
  	local num_lineas=0
  	#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado, si devuelve
	#"prueba.sh" por ejemplo, despues obtenemos todo que que haya antes del "." porque ese será el nombre, por ejemplo "prueba"
	nombre_script=$(basename "${script%.*}")
	directorio=$(dirname "$script")
	#Creamos el fichero de idiomas principal
	nombre_fichero_idioma_principal=${codigo_idioma_script^^}"_"$nombre_script.txt
	#Borro el fichero si existe
	if [[ -e "$directorio"/$nombre_fichero_idioma_principal ]]; then
		rm "$directorio"/$nombre_fichero_idioma_principal
	fi
	touch "$directorio"/$nombre_fichero_idioma_principal
	#Obtengo los códigos de idiomas disponibles
	local codigo_idiomas=()
    	while IFS= read -r linea; do
        #Obtenemos los valores del índice 1 y 2 de la línea, si la línea es #SP-Español, el índice 1:2 = SP
        	linea_filtrada=${linea:1:2}
                codigo_idiomas+=("$linea_filtrada")
        done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE[0]}")
  	IFS=$'\n' #Ajustar el Internal field separator
  	#Ahora leemos el script sobre el que se crearán las referencias
  	while IFS= read -r linea; do #Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
  		#Comprobamos si cada linea es válida
  		esLineaValidaComoComentario "$linea"
		linea_valida=$?
		if [[ $linea_valida -eq 1 ]]; then
  			linea_filtrada=${linea#*#} #Cogemos todo lo que venga despues de la primera # de la linea
    			comentario="#"${codigo_idioma_script^^}"-"$contador_lineas"-"$linea_filtrada
    			#Escribimos el contenido en el fichero principal (El fichero del idioma en el que se encuentra el script)
    			echo $comentario >> $directorio/$nombre_fichero_idioma_principal
    			#Comprobamos si el inicio (^) de la linea contiene una #
    			if [[ "$linea" =~ ^# ]]; then
    				#Concatenamos la referencia con el contenido de la linea que haya despues de la #
    				comentario_script="#${codigo_idioma_script^^}-${contador_lineas}-${linea#\#}"
			else
    				#Separamos la línea en la parte antes del primer # y el comentario después del #
    				parte_antes=${linea%%#*}
    				comentario_despues=${linea#*#}
    				comentario_script="${parte_antes}#${codigo_idioma_script^^}-${contador_lineas}-${comentario_despues}"
			fi
    			lineas_script_original+=("$comentario_script")
    			contador_lineas=$((contador_lineas + $INCR_LINEAS))
    			((num_lineas++)) #Llevar un contador de las lineas para saber cuantas hay,servirá para iterar(como he iterado poco...) posteriormente
  		else
  			#Seguimos a la siguiente linea
  			lineas_script_original+=("$linea")
  			comentario=""
    			continue;
  		fi
  	done < "$script"
  	#Escribir las referencias vacias en los otros ficheros de almacenamiento
  	for cod in ${codigo_idiomas[@]}; do
  	nuevo_contador_lineas=10
    		if [[ "${cod,,}" != "${codigo_idioma_script,,}" ]]; then
    			nombre_fichero_otro_idioma=${cod^^}"_"$nombre_script.txt
    			fichero_otro_idioma="$directorio"/$nombre_fichero_otro_idioma
    			lineas_referencias_vacias=()
    			for ((i = 1; i <= num_lineas; i++)); do
    				comentario="#"${cod^^}"-"$nuevo_contador_lineas"-"
    				lineas_referencias_vacias+=("$comentario")
    				nuevo_contador_lineas=$((nuevo_contador_lineas + $INCR_LINEAS))
    			done
    			printf "%s\n" "${lineas_referencias_vacias[@]}" > "$fichero_otro_idioma"		
    		fi
	done
  	#Añadir las referencias y contenido que habia previamente al script original
  	printf "%s\n" "${lineas_script_original[@]}" > "$script" #Risky shit :)
} #Fin extraerComentariosDelScript()

#Comprueba si es una linea es valida para considerarla un comentario para la traducción
#Recibe : La linea de comentario en cuestion, y por cada uno que recibe, devuelve si es válida o no
#Devuelve [1] si es válido es y [0] si no es
function esLineaValidaComoComentario {
	linea=$1
	#Algunas lineas son #(y espacios), entonces quitamos los espacios a las lineas y si lo que queda al final es solo una #,sabemos que no es un comentario
    	linea_sin_espacios=$(echo "$linea" | tr -d ' ')
	#Contamos el número de almohadillas que hay en la linea porque cuando tiene más de 1,normalmente son las cabeceras
    	num_hashtags=$(echo "$linea" | tr -cd '#' | wc -c)
    	#Comprobar si la linea contiene una # pero de utilizado de esta forma ${#variable} o ${#variable[@]} etc....
    	contiene_comentario=$(echo "$linea" | grep -oP '#(?![{A-Za-z_][A-Za-z0-9_]*[@[]).*' | tr -d '[:space:]')
    	#Otra conprobación aparentemente redundante pero es la única forma con que he conseguido que funcione correctamente
    	#no se toca
	if echo "$linea" | grep -qP '\$\{#[A-Za-z_][A-Za-z0-9_]*\}'; then
		return 0
	fi
	#Tambien comprobamos si la linea contiene una # o no con "$linea" != *#*, No incluir las "" aqui para el *#*,si no,nos buscará que la linea sea exactamente "*#*"
	if [[ "$linea" == "$BIN_BASH1" || "$linea" == "$BIN_BASH2"  || "$linea_sin_espacios" == "#" || $num_hashtags -gt 1 || "$linea" != *#* 
		|| -z "$contiene_comentario" ]]; then
		return 0 #No es una linea válida
	else
		return 1 #Es una linea válida
	fi	
} #Fin esLineaValidaComoComentario()

#Funcion para regenerar las referencias dependiendo del idioma en el que estén los scripts
function regenerarReferencias {
	#Preguntamos al usuario en que idioma quiere regenerar las referencias
	echo "* ctrl + c para salir"
	echo -e "${CIAN}¿En que idioma se encuentran los scripts ? (Regenear referencias)${RESET}"
	seleccionarIdioma
   	idioma_seleccionado=$?
   	cod_idioma=${OPCIONES_MENU_IDIOMAS_DISPONIBLES[$idioma_seleccionado]:1:2}
 	#Obtenemos todos los códigos de idiomas
 	local codigo_idiomas=() # Array para meter los códigos de idiomas
        while IFS= read -r linea; do
        	linea_filtrada=${linea:1:2} # Obtenemos los valores del índice 1 y 2 de la línea, si la línea es #SP-Español, el índice 1:2 = SP
                codigo_idiomas+=("$linea_filtrada") # Añadimos cada código encontrado al array
        done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE[0]}")
 	#Obtener los comentarios de cada script pero intentando ordenarlos y comprobar si nos han insertado alguno nuevo en medio
 	#find */ -type f -name "$FILTRO_FICHEROS" -print0 | while IFS= read -r -d '' script; do
 	readarray -d '' scripts < <(find */ -type f -name "$FILTRO_FICHEROS" -print0)
   	for script in "${scripts[@]}"; do
 		echo "Regenerando las referencias para $script"
 		#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado
		nombre_fichero=$(basename "${script%.*}") 
		directorio=$(dirname "$script")
		fichero_idioma="$directorio"/${cod_idioma^^}_${nombre_fichero}.txt
		declare -a lineas_idiomas=()
		declare -a lineas_actualizada_script=()
		declare -a num_referencias_script=()
		contador_lineas=$INICIO_NUM_LINEAS #Numero inicial de cada linea
 		while IFS= read -r linea; do #Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
		  	#Comprobamos si cada linea es válida
		  	esLineaValidaComoComentario "$linea"
			linea_valida=$?
			if [[ $linea_valida -eq 1 ]]; then
				if echo "$linea" | grep -qE '#[A-Z]+-[0-9]+-'; then #q for silence and E to enable regular expresions
					#cogemos todo lo que venga despues del ultimo -
					linea_filtrada=$(echo "$linea" | cut -d'-' -f3-) #Desde field 3
					#linea_filtrada=${linea##*-} Este puede fallar si hay mas de 2 guiones
				else
					linea_filtrada=${linea#*#} #Cogemos todo lo que venga despues de la primera # de la linea
				fi
		    		#Escribimos el contenido en el fichero principal
		    		#if [[ "$linea" =~ ^# ]]; then
                    		#	comentario_script="#"${cod_idioma^^}-${contador_lineas}-${linea_filtrada}
                		#else
                    			# Separamos la línea en la parte antes del primer # y el comentario después del #
                    		#	parte_antes=${linea%%#*}
                    		#	comentario_despues=$(echo "$linea" | sed 's/^[A-Z]\+-[0-9]\+-//')
                    			#Makes sense now : Cogemos la parte antes que no tiene  # y luego la linea filtrada
                    		#	comentario_script=${parte_antes}#${cod_idioma^^}-${contador_lineas}-${linea_filtrada}
               		 	#fi
               		 	if [[ "$linea" =~ ^# ]]; then
			    		#el contenido de la linea que haya despues de la #
			    		comentario_script="#"${cod_idioma^^}-${contador_lineas}-${linea_filtrada}
			    		comentario="#"${cod_idioma^^}"-"$contador_lineas"-"$linea_filtrada
			    		#comentario_script=$(echo "$linea" | cut -d'-' -f3-) #Desde field 3
				else
			    		#Separamos la línea en la parte antes del primer # y el comentario después del #
			    		parte_antes=${linea%%#*}
			    		parte_despues=${linea#*#}
			    		comentario_despues=$(echo "$parte_despues" | cut -d'-' -f3-) #Desde field 3
			    		comentario_script=${parte_antes}#${cod_idioma^^}-${contador_lineas}-${comentario_despues}
			    		comentario="#"${cod_idioma^^}"-"$contador_lineas"-"$comentario_despues
				fi
		    		lineas_idiomas+=("$comentario")
		    		lineas_actualizada_script+=("$comentario_script")
		    		#utilizamos el número de referencia,de "#XY-10-", extraemos "10", utilizamos head -n 1 para pillar solo un patron
                        	num_referencia=$(echo "$linea" | grep -oP '(?<=-)[0-9]+(?=-)' | head -n 1)
		    		#num_referencia=$(echo "$linea" | grep -oP '(?<=-)[0-9]+(?=-)') #utilizamos el número de referencia,de "#XY-10-", extraemos "10"
		    		num_referencias_script+=("$num_referencia")
		    		contador_lineas=$((contador_lineas + $INCR_LINEAS))
  			else
		  		#Seguimos a la siguiente linea
		  		comentario_script="$linea"
		  		lineas_actualizada_script+=("$comentario_script")
		  		comentario=""
		    		continue;
  			fi
  		done < "$script"
  		#Escribir en el fichero de idiomas y actualizar el script llamando a la funcion cambiaIdioma
  		printf "%s\n" "${lineas_idiomas[@]}" > "$fichero_idioma" #Risky shit :)
  		#Despues de escribir en el de idiomas, ahora cambiamos el idioma de vuelta
  		printf "%s\n" "${lineas_actualizada_script[@]}" > "$script" #Risky shit :)			
		#Crear las referencias en el los otros idiomas que no sean el mismo que estamos re-referenciando
            	for cod_otro_idioma in ${codigo_idiomas[@]}; do
            		nuevas_lineas_otro_idioma=()
                	if [[ "${cod_otro_idioma,,}" != "${cod_idioma,,}" ]]; then
                    		fichero_otro_idioma="$directorio/${cod_otro_idioma}_${nombre_fichero}.txt"
                    		# Leer el contenido existente del fichero
                    		if [[ -f "$fichero_otro_idioma" ]]; then
                        		mapfile -t lineas_otro_idioma < "$fichero_otro_idioma"
                    		else
                    			touch "$fichero_otro_idioma"
                        		lineas_otro_idioma=()
                    		fi
                    		# Generar nuevas referencias manteniendo los comentarios existentes
                    		nuevo_contador_lineas=$INICIO_NUM_LINEAS
                    		for ((i = 0; i < ${#num_referencias_script[@]}; i++)); do
                    			referencia_encontrada=0
    					# Obtener la referencia del otro idioma
					referencia_otro_idioma=$(echo "${lineas_otro_idioma[$i]}" | grep -o '#[A-Z]\+-[0-9]\+-')
					# Construir la referencia a buscar basada en el idioma y el número de referencia del script
					referencia_a_buscar="#"${cod_otro_idioma^^}"-"${num_referencias_script[$i]}"-"
					# Buscar si la referencia está en el fichero del otro idioma
					if grep -q "$referencia_a_buscar" "$fichero_otro_idioma"; then
						comentario=$(grep "$referencia_a_buscar" "$fichero_otro_idioma" | sed -E "s/^.*${referencia_a_buscar}//")
						referencia_encontrada=1
					fi
    					if [[ $referencia_encontrada -gt 0 ]]; then
        					nuevas_lineas_otro_idioma[$i]="#${cod_otro_idioma^^}-${nuevo_contador_lineas}-${comentario}"
    					else
    						nuevas_lineas_otro_idioma[$i]="#${cod_otro_idioma^^}-${nuevo_contador_lineas}-"
    					fi
					nuevo_contador_lineas=$((nuevo_contador_lineas + $INCR_LINEAS))
				done
				#Proud of myself btw :)
                    		# Escribir el contenido actualizado en el fichero de otro idioma
                    		printf "%s\n" "${nuevas_lineas_otro_idioma[@]}" > "$fichero_otro_idioma"
                	fi
           	done
 	done
 	mostrarMensajeYAgregarloAlLogGeneral "Referencias regeneradas correctamente tanto en ${cod_idioma^^} como en los demás idiomas" $FUNCNAME $LOG_SUCCESS
 	volverAlMenuOSalir		
} #Fin regenerarReferencias()

#Function que agrega un mensaje al log principal dependiendo del tipo de mensaje.
#$1 - mensaje
#$2 - Nombre de la función que lanzó el error
#$3 - Tipo de mensaje de log [LOG_ERROR,LOG_WARNING o LOG_SUCCESS]
function mostrarMensajeYAgregarloAlLogGeneral {
	mensaje=$1
	nombre_funcion=$2
	tipo_log=$3
	fecha_y_hora=$(date)
	#Creamos el fichero de logs si no existe
	if [ ! -e  $FICHERO_LOGS_GENERAL ]; then
		touch $FICHERO_LOGS_GENERAL
	fi
	#Muestro el mensaje dependiendo del tipo y lo agrego al log general
	case $tipo_log in
		$LOG_ERROR)
			echo -e "${ROJO}$mensaje${RESET}"
			echo -e "${ROJO}ERROR:${RESET} $fecha_y_hora -> $mensaje [Nombre función: $nombre_funcion]" >> $FICHERO_LOGS_GENERAL
			;;
		$LOG_WARNING)
			echo -e "${AMARILLO_OSCURO}$mensaje${RESET}"
			echo -e "${AMARILLO_OSCURO}WARNING:${RESET} $fecha_y_hora -> $mensaje [Nombre función: $nombre_funcion]" >> $FICHERO_LOGS_GENERAL
			;;
		$LOG_SUCCESS)
			echo -e "${VERDE}$mensaje${RESET}"
			echo -e "${VERDE}SUCCESS:${RESET} $fecha_y_hora -> $mensaje [Nombre función: $nombre_funcion]" >> $FICHERO_LOGS_GENERAL
			;;
	esac
} #Fin mostrarMensajeYAgregarloAlLogGeneral()

#Función para agregar las referencias necesarias cuando se crear un nuevo fichero de almacenamiento
#$1 - El script sobre el que se va crear las referencias para el nuevo idioma
#$2 - Código del idioma nuevo
function extraerComentariosDelScriptNuevoIdioma {
  	script=$1 #El script original sobre el que se va crear los ficheros relevantes
  	cod_idioma_nuevo=$2
  	nombre_script=$(basename "${script%.*}")
	directorio=$(dirname "$script")
	#Creamos el fichero de idiomas principal
	fichero_idioma_nuevo=${cod_idioma_nuevo^^}"_"$nombre_script.txt
	#Borro el fichero si existe
	if [[ -e "$directorio"/$fichero_idioma_nuevo ]]; then
		rm "$directorio"/$fichero_idioma_nuevo
	fi
	touch "$directorio"/$fichero_idioma_nuevo
  	contador_lineas=$INICIO_NUM_LINEAS #10
    	comentarios=() # Array para escribir los comentarios de golpe
  	#Ajustamos el Internal field separator(IFS)
  	IFS=$'\n'
  	#Ahora leemos el script sobre el que se crearán las referencias
  	while IFS= read -r linea; do #Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
  		#Comprobamos si cada linea es válida
  		esLineaValidaComoComentario "$linea"
		linea_valida=$?
		if [[ $linea_valida -eq 1 ]]; then
			comentario="#"$cod_idioma_nuevo"-"$contador_lineas"-"
    			comentarios+=("$comentario")
    			contador_lineas=$((contador_lineas + $INCR_LINEAS)) #El número de lineas del documento tiene que ir de 10 en 10
		else
			comentario=""
    			continue;
		fi
  	done < "$script"
  	printf "%s\n" "${comentarios[@]}" >> "$directorio"/$fichero_idioma_nuevo #Escribimos todo de golpe al final
} #Fin extraerComentariosDelScriptNuevoIdioma()

#Función para mostrar la presentación del programa en la primera ejecución.
function mostrarPresentacion {	
    clear
    echo -e "${CIAN}------------------------------------------------------------${RESET}"
    echo "         PRÁCTICA DE CONTROL       "
    echo " INTERNACIONALIZACIÓN DE DOCUMENTACIÓN"
    echo -e "${CIAN}------------------------------------------------------------${RESET}"
    echo -e "Autor        : Derick Daumienebi Sakpa"
    echo -e "Tutor        : José Manuel Saiz Diez"
    echo -e "Asignatura   : Sistemas Operativos"
    echo -e "Grado        : Ingeniería Informática"
    echo -e "${CIAN}------------------------------------------------------------${RESET}\n"
} #Fin mostrarPresentacion()

#Opcion para cambiar el idioma del script siempre que los scripts estén referenciados
#Solicita el idioma al que se quiere cambiar los scripts y tambien pide introducir en que idioma se encuentra
#en el momento de traducirlos para asegurar una traducción óptima
function cambiarIdiomaDeLosScripts {
	#Antes de nada,comprobamos si los scripts ya están referenciados, para evitar una doble referencia
	comprobarSiLosScriptsEstanReferenciados
	comprobacion=$? #Obtenemos el resultado de la última ejecución
	if [[ $comprobacion -eq 0 ]];
	then
		#Salimos directamente y agregamos el error al log
		mostrarMensajeYAgregarloAlLogGeneral "Para poder cambiar de idioma, los scripts tienen que estar referenciados"\
						     $FUNCNAME $LOG_ERROR
		volverAlMenuOSalir
	fi
	local traduccion_completa=0
	echo -e "${CIAN}\n¿A qué idioma quieres traducir los scripts? (Indica el código [XY])${RESET}"
   	seleccionarIdioma
   	idioma_seleccionado=$?
   	cod_idioma=${OPCIONES_MENU_IDIOMAS_DISPONIBLES[$idioma_seleccionado]:1:2}
   	echo -e "${CIAN}¿En que idioma se encuentran los scripts? (Indica el código [XY])${RESET}"
   	seleccionarIdioma
   	idioma_seleccionado=$?
   	cod_idioma_script=${OPCIONES_MENU_IDIOMAS_DISPONIBLES[$idioma_seleccionado]:1:2}
        IFS=$'\n'
        # Obtenemos cada script de los subdirectorios
        #find */ -type f -name "$FILTRO_FICHEROS" -print0 | while IFS= read -r -d '' script; do esto crea un subshell y trae sus desventajas
        readarray -d '' scripts < <(find */ -type f -name "$FILTRO_FICHEROS" -print0)
   	for script in "${scripts[@]}"; do
          	nombre_fichero=$(basename "${script%.*}")
            	directorio=$(dirname "$script")
            	fichero_idioma_a_traducir="$directorio"/${cod_idioma^^}_${nombre_fichero}.txt
            	fichero_idioma_actual="$directorio/${cod_idioma_script^^}_${nombre_fichero}.txt"
            	echo -e "Cambiando el idioma de "$script" de ${cod_idioma_script^^} a ${cod_idioma^^}"
            	
            	if [[ -e "$fichero_idioma_a_traducir" ]]; then
                	# Array para guardar las línea
                	declare -a lineas_referencias=()
                	declare -a txt_idioma_viejo=()
                	declare -a referencias_sin_traduccion=()
                	declare -a referencias_txt=()
                	while IFS= read -r linea_original; do
                    		esLineaValidaComoComentario "$linea_original"
                    		linea_valida=$?
                    		if [[ $linea_valida -eq 1 ]]; then
                        		referencia_a_quitar=$(echo "$linea_original" | grep -o '#[A-Z]\+-[0-9]\+-')
                        		#utilizamos el número de referencia,de "#XY-10-", extraemos "10", utilizamos head -n 1 para pillar solo un patron
                        		referencia=$(echo "$linea_original" | grep -oP '(?<=-)[0-9]+(?=-)' | head -n 1)
                        		referencia_a_buscar="#"${cod_idioma^^}"-"$referencia"-"
                            		if [[ -n "$referencia" ]]; then
		                    		#Buscamos los que coinciden con la referencia a buscar(del idioma a la que vamos a cambiar) linea y quitamos la parte de la referencia a buscar
		                		#Con el sed, -E para expresiones y extraemos solo el texto de la traduccion en vez de toda la linea
		                		linea_sin_escapar=$(grep "$referencia_a_buscar" "$fichero_idioma_a_traducir" | sed -E "s/^.*${referencia}//" | head -n 1)
		                		linea_traduccion=$(printf '%s\n' "$linea_sin_escapar" | sed 's/[][\\/.^$*]/\\&/g')
		                		#Eliminar el "-" misterioso que aparece al principio de la linea de traduccion si existe
		                		linea_traduccion=${linea_traduccion#-} #Importantisimo
		                		if [[ -z $linea_traduccion ]]; then
		                			referencias_sin_traduccion+=("Referencia ${ROJO}$referencia_a_buscar${RESET} sin resolver -> $script\n")
		                		fi
		                		#idioma viejo
		                		if [[ "$linea_original" =~ ^# ]]; then
			    				#el contenido de la linea que haya despues de la #
			    				traduccion_viejo=$(echo "$linea_original" | cut -d'-' -f3-) #Desde field 3
						else
			    				#Separamos la línea en la parte antes del primer # y el comentario después del #
			    				parte_antes=${linea_original%%#*}
			    				comentario_despues=${linea_original#*#}
			    				traduccion_viejo=$(echo "$comentario_despues" | cut -d'-' -f3-) #Desde field 3
						fi
		                		linea_vieja="$referencia_a_quitar$traduccion_viejo"
                            			linea_nueva=$(echo "$linea_original" | sed "s/$referencia_a_quitar.*/$referencia_a_buscar$linea_traduccion/")
                            			referencias_txt+=("$referencia") #keeping track of the order
                        		else
                            			linea_vieja=""
                            			linea_nueva="$linea_original"
                        		fi
                		else		
                			linea_vieja="" #Lol...no se quita
                        		linea_nueva="$linea_original"
                		fi
                		# Añadimos la nueva línea al array
                		lineas_referencias+=("$linea_nueva")
                		if [[ -n "$linea_vieja" ]]; then
       	 				txt_idioma_viejo+=("$linea_vieja")
    				fi
                	done < "$script"
                	if [ ! -d "$DIRECTORIO_LOGS" ]; then
    				mkdir "$DIRECTORIO_LOGS"
			fi
            		echo -e "${referencias_sin_traduccion[@]}" > "$DIRECTORIO_LOGS/$nombre_fichero.log"
            		referencias_sin_traduccion=() #Reinicio?
                	# Escribimos los contenidos actualizados
                	printf "%s\n" "${lineas_referencias[@]}" > "$script" # Risky shit i guess but it works :)
                	printf "%s\n" "${txt_idioma_viejo[@]}" > "$fichero_idioma_actual" # Risky af
                	traduccion_completa=1;
            	else
            		mostrarMensajeYAgregarloAlLogGeneral "No se ha encontrado el fichero de traducción en ${cod_idioma^^} para el script : $script puede que no esté creado"\
            			                             $FUNCNAME $LOG_ERROR
            		traduccion_completa=0
                	#volverAlMenuOSalir - This breaks everything, uncomment at your risk :)
            	fi
            	#Actualizar los ficheros de almacenamiento de los otros idiomas
            	actualizarFicherosOtrosIdiomas "$cod_idioma_script" "$script" "${referencias_txt[@]}"
        done
        if [[ $traduccion_completa -eq 1 ]]; then
        	mostrarMensajeYAgregarloAlLogGeneral "Se ha cambiado el idioma de los scripts a ${cod_idioma^^}" $FUNCNAME $LOG_SUCCESS
        	volverAlMenuOSalir
        else
        	mostrarMensajeYAgregarloAlLogGeneral "Se ha cambiado el idioma de los scripts a ${cod_idioma^^} para los scripts que tenian ficheros de traduccion"\
        						$FUNCNAME $LOG_SUCCESS
        	volverAlMenuOSalir
        fi	 
} # Fin cambiarIdiomaDeLosScripts()

#Recibe una array y agrega actualiza los ficheros de los otros idiomas
#cuando se realiza un cambio de idioma
function actualizarFicherosOtrosIdiomas {
	local codigo_idiomas=()
	local lineas_nuevas=()
	local lineas_viejas=()
	cod_idioma_script=$1
	script=$2
	shift 2  # Shift the first two arguments, so "$@" now contains only the array elements
    	local num_referencias_script=("$@")  # Store the remaining arguments as an array
	nombre_fichero=$(basename "${script%.*}")
        directorio=$(dirname "$script")
        
        while IFS= read -r linea; do
        	#Obtenemos los valores del índice 1 y 2 de la línea, si la línea es #SP-Español, el índice 1:2 = SP
        	linea_filtrada=${linea:1:2}
        	codigo_idiomas+=("$linea_filtrada")
        done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE[0]}")
	
	#Escribimos en los ficheros que no sea el del idioma viejo
	for cod in ${codigo_idiomas[@]}; do
    		if [[ "${cod,,}" != "${cod_idioma_script,,}" ]]; then
        		fichero_otro_idioma="$directorio/${cod^^}_${nombre_fichero}.txt"
        		if [[ -e "$fichero_otro_idioma" ]]; then
            			mapfile -t lineas_viejas < "$fichero_otro_idioma"
            		else
            			lineas_viejas=()
            		fi
            		if [[ -e "$fichero_otro_idioma" ]]; then
            			for ((i=0; i<${#num_referencias_script[@]}; i++)); do
					referencia_encontrada=0
	    				# Obtener la referencia del otro idioma
					#referencia_otro_idioma=$(echo "${lineas_viejas[$i]}" | grep -o '#[A-Z]\+-[0-9]\+-')
					referencia_otro_idioma=${lineas_viejas[$i]:0:7}
					# Construir la referencia a buscar basada en el idioma y el número de referencia del script
					referencia_a_buscar="#"${cod^^}"-"${num_referencias_script[$i]}"-"
					# Buscar si la referencia está en el fichero del otro idioma
					if grep -q "$referencia_a_buscar" "$fichero_otro_idioma"; then
						comentario=$(grep "$referencia_a_buscar" "$fichero_otro_idioma" | sed -E "s/^.*${referencia_a_buscar}//")
						referencia_encontrada=1
					fi
					if [[ $referencia_encontrada -gt 0 ]]; then
						lineas_nuevas+=("#${cod^^}-${num_referencias_script[$i]}-${comentario}")
	    				else
	    					lineas_nuevas+=("#${cod^^}-${num_referencias_script[$i]}-")
	    				fi
        			done
        			printf "%s\n" "${lineas_nuevas[@]}" > "$fichero_otro_idioma"
        			lineas_nuevas=()
            		else
            			mostrarMensajeYAgregarloAlLogGeneral "No se ha encontrado el fichero de traducción en ${cod^^} para el script : $script puede que no esté creado"\
            			                             	      $FUNCNAME $LOG_ERROR
            		fi
    		fi
	done
} # Fin actualizarFicherosOtrosIdiomas()

#Lista los idiomas disponibles para que el usuario seleccione uno
#Nota : Obtiene este dato solo basandose en los que encuentra al final de este mismo script, no comprueba los ficheros de almacenamiento
function seleccionarIdioma {
	local idioma_seleccionado
	OPCIONES_MENU_IDIOMAS_DISPONIBLES=()
	#echo -e "${CIAN}Selecciona un idioma :${RESET}"
	while IFS= read -r linea; do
		linea_filtrada=${linea#*#} #Obtenemos todo lo que venga despues de la #
		OPCIONES_MENU_IDIOMAS_DISPONIBLES+=("$linea")
	done < <(sed -n "${LINEA_INICIO_IDIOMAS},\$p" "${BASH_SOURCE[0]}") #Sustitucion de procesos
	seleccionarOpcion "${OPCIONES_MENU_IDIOMAS_DISPONIBLES[@]}"
	idioma_seleccionado=$?
	#return $codigo_idioma aparentemente,el return tiene que ser con valores númericos	
	return $idioma_seleccionado
} #Fin seleccionarIdioma()

#Recibe un codigo de idioma como parametro y comprueba si existe
#Devuelve [1] si existe y [0] si no existe.
function existeCodigoIdioma {
	cod_idioma_nuevo=$1
	local codigo_idiomas=() #Array para meter los codigos de idiomas
	while IFS= read -r linea;
	do
		#Tambien se puede utilizar el awk, pero he estado utilizando este metodo para filtrar
		linea_filtrada=${linea:1:2} #Obtenemos los valores del indice 1 y 2 de la linea, si la linea es #SP-Español, el indice 1:2 = SP
		#Añadimos cada código de idioma obtenido a un array
		codigo_idiomas+=("$linea_filtrada") #Añadimos cada código encontrado al array
	done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE[0]}")
	for cod in ${codigo_idiomas[@]}; do
		if [[ "${cod_idioma_nuevo,,}" == "${cod,,}" ]]; then
			return 1 #El codigo de idioma existe
			break;
		fi
	done
	return 0 #El codigo de idioma no existe
} #Fin existeCodigoIdioma()

#Crear nuevas referencias en los scripts y generar los ficheros de almacenamiento por cada script encontrado.
#El usuario tendrá que seleccionar en que idioma se encuentran los scripts.
function crearNuevoFicheroDeAlmacenamiento {
	#Antes de nada,comprobamos si los scripts ya están referenciados, para evitar una doble referencia
	comprobarSiLosScriptsEstanReferenciados
	comprobacion=$? #Obtenemos el resultado de la última ejecución
	if [[ $comprobacion -eq 0 ]]; then
		#Salimos directamente y agregamos el error al log
		mostrarMensajeYAgregarloAlLogGeneral "Antes de crear un nuevo fichero de almacenamiento, los scripts tienen que estar referenciados"\
						     $FUNCNAME $LOG_ERROR
		volverAlMenuOSalir
	fi
	mostrarIdiomasDisponibles #Mostrar los idiomas disponibles antes que nada
	local num_coincidencias #Contador del número de coincidencias del codigo nuevo con algunos existente, tiene que ser 0 para que sea valido
	local tamanho_codigo #Tamaño del nuevo codigo de idioma
	echo "Introduce el Codigo del idioma nuevo (Por ejemplo XY)"
	echo -e -n "${AMARILLO_OSCURO}Codigo Idioma :${RESET}"
	read cod_idioma_nuevo
	tamanho_codigo=${#cod_idioma_nuevo}  #Obtenemos el tamaño del codigo introducido
	local codigo_idiomas=() #Array para meter los codigos de idiomas
 	local existe_cod_idioma
	while : ; do
		#Comprobamos si existe el codigo de idioma, si no existe , la funcion devuelve 1 si existe y 0 si no
 		existeCodigoIdioma "${cod_idioma_nuevo}"
		existe_cod_idioma=$? #Obtenemos el resultado del ultimo comando ejecutado
		if [[ $existe_cod_idioma -eq 1 || $tamanho_codigo -ne 2 ]]; then
			#Mostrar distintos mensajes dependiendo del error
			if [[ $existe_cod_idioma -eq 1 ]]; then
				mostrarMensajeYAgregarloAlLogGeneral "El código de idioma $cod_idioma_nuevo ya existe.\n" $FUNCNAME $LOG_ERROR
				mostrarIdiomasDisponibles 
			fi
			if [[ $tamanho_codigo -ne 2  ]]; then
				echo -e "${ROJO}El codigo solo puede contener dos caracteres.\n${RESET}"
			fi
			echo -e "${CIAN}¿Deseas probar con otro codigo o prefieres salir?${RESET}"
			seleccionarOpcion "${OPCIONES_MENU_COD_IDIOMA_NUEVO[@]}"
			opcion_seleccionada=$?
			#Switch-case para las opciones :
			case $opcion_seleccionada in
				0)
					echo -e "\nIntroduce el Codigo del idioma nuevo,por ejemplo XY (dos caracteres)"
                			echo -e -n "${AMARILLO_OSCURO}Codigo Idioma :${RESET}"
                			read cod_idioma_nuevo
                			tamanho_codigo=${#cod_idioma_nuevo} #volvemos a comprobar el tamaño
                			;;
				1)
					exit 1 ;;	
			esac	
    		else
       	 		break; #Salimos del bucle si no se encontraron coincidencias
		fi
	done
	#Continuamos con los otros datos
	echo "Introduce el nombre del idioma"
	echo -e -n "${AMARILLO_OSCURO}Nombre Idioma :${RESET}"
	read nombre_idioma_nuevo
	#Preguntamos que quiere hacer el usuario
	echo -e "${CIAN}¿Que acción deseas realizar?${RESET}"
	seleccionarOpcion "${OPCIONES_MENU_NUEVO_FICHERO_ALMACENAMIENTO[@]}"
	opcion_menu=$?
	case $opcion_menu in
		0)
			guardarIdiomaNuevo $cod_idioma_nuevo "$nombre_idioma_nuevo"
			mostrarMensajeYAgregarloAlLogGeneral "Nuevo idioma $nombre_idioma_nuevo creado" $FUNCNAME $LOG_SUCCESS
			;;
		1)
			#Ahora creamos los nuevos ficheros de referencia generamos los comentarios
			find */ -type f -name "$FILTRO_FICHEROS" -print0 | while IFS= read -r -d '' script; do
				echo "Creando el fichero de almacenamiento para $script"
				extraerComentariosDelScriptNuevoIdioma "$script" ${cod_idioma_nuevo^^}
			done
			guardarIdiomaNuevo $cod_idioma_nuevo "$nombre_idioma_nuevo"
			mostrarMensajeYAgregarloAlLogGeneral "Nuevo fichero de almacenamiento de $nombre_idioma_nuevo creado" $FUNCNAME $LOG_SUCCESS
			;;
		2)
			exit 1 ;;	
	esac
	volverAlMenuOSalir
} #Fin crearFicheroDeAlmacenamiento()

#Funcion que recible el codigo y nombre de un idioma nuevo y lo añade al final de este mismo script.
function guardarIdiomaNuevo {
	cod_idioma_nuevo=$1
	nombre_idioma_nuevo=$2
	echo ""#"${cod_idioma_nuevo^^}"-"$nombre_idioma_nuevo" >> ${BASH_SOURCE[0]}
	mostrarMensajeYAgregarloAlLogGeneral "Se ha guardado el idioma $nombre_idioma_nuevo con código ${cod_idioma_nuevo^^}" $FUNCNAME $LOG_SUCCESS
} #Fin guardarIdiomaNuevo()

#Lista los idiomas disponibles y añade un recuento al final.
#Nota : Obtiene este dato solo basandose en los que encuentra al final del script, no comprueba los ficheros
function mostrarIdiomasDisponibles {
	contador_idiomas=0
	echo -e "${CIAN}\nSe han encontrado los siguientes idiomas :${RESET}"
	while IFS= read -r linea; do
		linea_filtrada=${linea#*#} #Obtenemos todo lo que venga despues de la # 
		echo -e "$linea_filtrada"
		((contador_idiomas++))
		#codigo_idiomas+=("$linea_filtrada") #Añadimos cada código encontrado al array
	done < <(sed -n "${LINEA_INICIO_IDIOMAS},\$p" "${BASH_SOURCE[0]}") #Sustitucion de procesos
	echo -e "${CIAN}$contador_idiomas idiomas disponibles\n${RESET}"	
} #Fin mostrarIdiomasDisponibles()

#Muestra un menu de opciones para que el usuario elija si quiere salir o no 
function volverAlMenuOSalir {
	echo -e "\n\n${CIAN}Selecciona una opción${RESET}"
	seleccionarOpcion "${OPCIONES_MENU_VOLVER_O_SALIR[@]}"
	opcion_seleccionada=$?
	#Switch-case para las opciones :
	case $opcion_seleccionada in
		0)
			clear
			mostrarMenuPrincipal ;;
		1)
			exit 1 ;;	
	esac	
} #Fin volverAlMenuOSalir()

#Opcion para que el usuario visualice los ficheros de log disponibles
function visualizarFicherosLog {
	echo -e "${CIAN}Selecciona el fichero de log que deseas ver\n${RESET}"
	seleccionarOpcion "${OPCIONES_MENU_LOGS[@]}"
	opcion_seleccionada=$?
	#Switch-case para las opciones :
	case $opcion_seleccionada in
		0) #Fichero de logs general
			if [[ -e $FICHERO_LOGS_GENERAL ]]; then
				clear
                		cat $FICHERO_LOGS_GENERAL
                		echo -e "\n${VERDE}FIN DEL FICHERO LOG${RESET}\n"
			else
				echo "De momento no hay ningún fichero de log"
			fi ;;
		1) #Fichero de logs por cada script
			local ficheros_logs=()
			mapfile -d '' ficheros_logs < <(find */ -type f -name "*.log" -print0)
			if [ ${#ficheros_logs[@]} -eq 0 ]; then
				echo "De momento no hay ningún fichero de log"
			else
				echo -e "${AMARILLO_OSCURO} Ficheros de logs encontrados :${RESET}"
				echo -e "Selecciona uno para visualizarlo \n"
				seleccionarOpcion "${ficheros_logs[@]}"
				opcion_seleccionada=$?
				archivo_seleccionado=${ficheros_logs["$opcion_seleccionada"]}
				cat "$archivo_seleccionado"
			fi	
			;;
		2)
			exit 1 ;;	
	esac
	while true; do
        echo -e "\n${AMARILLO_OSCURO}Pulsa 0 para salir y 1 para volver al menú principal${RESET}"
        read -r opcion
        	case $opcion in
            		0)
                		exit 0 ;;
            		1)
            			clear
                		mostrarMenuPrincipal ;;
            		*)
               	 		echo -e "${ROJO}Opción no válida, por favor introduce 0 o 1.${RESET}" ;;
        	esac
    	done
} #Fin visualizarFicherosLog()

#Función que muestra una pequeña ayuda al usuario
function mostrarAyuda {
	clear
	echo -e "${CIAN}\t\t\t------------------------------------------${RESET}"
	echo -e "\t\t\t\t${CIAN}FUNCIONAMIENTO DEL PROGRAMA${RESET}"
	echo -e "${CIAN}\t\t\t------------------------------------------${RESET}"
	echo -e "${AMARILLO_OSCURO}*IMPORTANTE* (1):${RESET} \nAntes de empezar con los demás opciones, es recomendable referenciar los scripts.\n"
	echo -e "${AMARILLO_OSCURO}*IMPORTANTE* (2):${RESET} \nCuando se agrega una referencia manualmente en un script, es recomendable que el número de referencia nuevo esté entre el número de la referencia anterior y el siguiente y no ser multiplo de $INCR_LINEAS(Las referencias generadas automaticamente utilizan el intervalo de $INCR_LINEAS en $INCR_LINEAS).\nSi se introduce una referencia existente manualmente, se traduce automaticamente con la traducción adecuada si se realiza un cambio de idioma y tras eso, se pueden regenerar las referencias pero si se introduce uno existente y se seleciona la opción de regenerar referencias, el programa regenera esa referencia como uno mas.\n"
	echo -e "${AMARILLO_OSCURO}*IMPORTANTE* (3):${RESET} \nAl realzar un cambio en los comentarios de los script, es obligatorio ${VERDE}REGENERAR LAS REFERENCIAS${RESET} antes de cambiar el idioma del script para efectuar los cambios de traducción para no perderlos. Otra forma de modificar un comentario si no deseas regenerar los comentarios es a traves de los ficheros de almacenamiento(.txt) de cada idioma del script.\n"
    	echo -e "${CIAN}CARGAR UN NUEVO JUEGO DE REFERENCIAS:${RESET}\nEsta opción te permite cargar un nuevo conjunto de referencias para tu juego.\n"
    	echo -e "${CIAN}REGENERAR REFERENCIAS:${RESET}\nEsta opción te permite volver a regenerar las referencias de todos los scripts para cuadra los números en caso de haber agregado referencias nuevas a los scripts originales.\n"
    	echo -e "${CIAN}CREAR UN NUEVO FICHERO DE ALMACENAMIENTO:${RESET}\nCon esta opción puedes crear un nuevo fichero de que se corresponde a un idioma nuevo no se puede crear un nuevo fichero de almacenamiento de un idioma que ya existe.\n"
    	echo -e "${CIAN}ELIMINAR FICHEROS DE ALMACENAMIENTO:${RESET}\nUtiliza esta opción para eliminar los ficheros de almacenamiento y borrar todas las referencias de los scripts originales.\n"
    	echo -e "${CIAN}VISUALIZAR LOS FICHEROS DE LOG:${RESET}\nCon esta opción puedes ver los ficheros de registro (Tanto el general como el de cada script).\n"
    	echo -e "${CIAN}CAMBIAR IDIOMA DE LOS SCRIPTS:${RESET}\nUtiliza esta opción para cambiar el idioma de los scripts, puedes intercambiar entre un idioma u otro, siempre que exista el fichero de almacenamiento. Al cambiar de idioma, el script se queda con los valores actualizados de los ficheros de almacenamiento."
    	while true; do
        echo -e "\n${AMARILLO_OSCURO}Pulsa 0 para salir y 1 para volver al menú principal${RESET}"
        read -r opcion
        	case $opcion in
            		0)
                		exit 0 ;;
            		1)
            			clear
                		mostrarMenuPrincipal ;;
            		*)
               	 		echo -e "${ROJO}Opción no válida, por favor introduce 0 o 1.${RESET}" ;;
        	esac
    	done
}

#Quitar las referencias (#XX-YY-) de todos los scripts y los dejarlos como estaban antes de referenciarlos.
function borrarReferencias {
    echo -e "${AMARILLO_OSCURO}IMPORTANTE :${RESET} ASEGURATE DE LOS SCRIPTS SE ENCUENTRAN EN UN IDIOMA CON TODOS LOS COMENTARIOS ANTES DE BORRAR LAS REFERENCIAS!"
    echo -e "${ROJO}Seguro que quieres borrar las referencias (#XX-YY-) de cada script ? [s|n] ${RESET}\n"
    seleccionarOpcion "${OPCIONES_MENU_SI_NO[@]}"
    opcion=$?
    case $opcion in
    	0)
    		find */ -type f -name "$FILTRO_FICHEROS" -print0 | while IFS= read -r -d '' script; do
        		# Usamos sed para eliminar las referencias y convertirlas en comentarios
        		sed -i 's/#\([A-Z]\+\)-[0-9]\+-/#/g' "$script"
        		echo -e "Referencias eliminadas y convertidas en comentarios en el script: $script\n"
    		done
    		mostrarMensajeYAgregarloAlLogGeneral "Referencias eliminadas y convertidas en comentarios en todos los scripts" $FUNCNAME $LOG_SUCCESS
    		volverAlMenuOSalir ;;
    	1)
    		mostrarMenuPrincipal ;;
    esac   
}

#Muestra una lista de opciones para el usuario y permite navegar por ellos utilizando las 
#flechas (arriba, abajo) y el ENTER para seleccionar una opción
#Argumentos: Lista de opciones, máximo de 256 opciones "opt1" "opt2" ...
#Devuelve: El indice seleccionado del menu (0 for opt1, 1 for opt2 ...)
#Credit : StackOverFlow :)
function seleccionarOpcion {
    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "   $1 "; }
    print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { read -s -n3 key 2>/dev/null >&2
                         if [[ $key = $ESC[A ]]; then echo up;    fi
                         if [[ $key = $ESC[B ]]; then echo down;  fi
                         if [[ $key = ""     ]]; then echo enter; fi; }

    # initially print empty new lines (scroll down if at bottom of screen)
    for opt; do printf "\n"; done
    # determine current screen position for overwriting the options
    #local lastrow=`get_cursor_row`
    local lastrow=$(get_cursor_row)
    local startrow=$(($lastrow - $#))
    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off
    local selected=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ $idx -eq $selected ]; then
                print_selected "$opt"
            else
                print_option "$opt"
            fi
            ((idx++))
        done
        # user key control
        case `key_input` in
            enter) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done
    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on
    return $selected
}

#Inicio del programa
mostrarPresentacion
mostrarMenuPrincipal

#CLAVE_ZONA_IDIOMAS !!!! No borrar esta linea,a partir de aqui, se utiliza para localizar los codigos de idiomas !!!
#SP-Español
#EN-Ingles
#FR-Frances
