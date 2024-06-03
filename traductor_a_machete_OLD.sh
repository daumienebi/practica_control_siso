#!/bin/bash
######################################################################################################################
#						CABECERA
######################################################################################################################
# Nombre: traductor.sh
# 
# Autor: Derick Daumienebi Sakpa
#
# Descripcion: Práctica de control de la asignatura : Sistemas Operativos
#              Sirve para gestionar las traducciones de los comentarios de bash encontrados en otros scripts(.sh)
#
# Tutor: José Manuel Saiz Diez
#
# Uso: Ejecuta el script en un directorio que contenga 1 o más subdirectorios, se encargará de generar los ficheros
#      (.txt) para cada script encontrado que contengan las referencias de los comentarios encontrados una vez que 
#      seleccionas en que idioma se encuentra el script original.Una vez generados, puedes gestionar los comentarios 
#      original,del script cambiando el idioma de los comentarios o realizando otra opciones disponibles a través de
#      los menus de opciones.
# 													
# Nota : Se requiere una version de bash superior a la 4 para un funcionamiento óptimo
######################################################################################################################

#Variables de Idiomas por defecto
COD_SP="SP"
COD_EN="EN"
COD_FR="FR"
NUM_ESPANHOL=1;
NUM_INGLES=2;
NUM_FRANCES=3;

#Otras variables
FILTRO_FICHEROS="*.sh"
BIN_BASH1="#!/bin/bash"
BIN_BASH2="#!\bin\bash"
INICIO_NUM_LINEAS=10 #Inicio del número de lineas (por ejemplo #SP-10-)
INCR_LINEAS=10 #Incremento de linea
FICHERO_LOGS_GENERAL="./logGeneral.log"
#Variable para obtener los códigos de idiomas que se encuentran al final del fichero, utiliza la '#CLAVE_ZONA_IDIOMAS'
#para encontrar la linea a partir de la cual tiene que leer los códigos de idiomas,luego sumamos 1 para ir a la linea
#siguiente porque a partir de ese se encuentran los códigos
LINEA_INICIO_IDIOMAS=$(($(grep -n '#CLAVE_ZONA_IDIOMAS' "${BASH_SOURCE[0]}" | tail -n 1 | cut -d':' -f1)+1))

#Colores
RESET="\e[0m" #Reset para volver al color normal despues de haber aplicado un color anteriormente
ROJO="\e[1;31m"
VERDE="\e[1;32m"
CIAN="\e[1;36m"
AMARILLO="\e[93m"
AMARILLO_OSCURO="\033[1;33m"

#Opciones para el tipo de mensaje de log
LOG_ERROR=0
LOG_WARNING=1
LOG_SUCCESS=2

#Opciones de menus
OPCIONES_MENU_PRINCIPAL=(
"-> Cargar un nuevo juego de referencias" 
"-> Regenerar referencias" 
"-> Crear un nuevo fichero de almacenamiento"
"-> Eliminar referencias de los scripts"
"-> Visualizar los ficheros de log"
"-> Cambiar idioma de los scripts"
"-> Mostrar ayuda"
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

#Muestra las opciones del menu principal al usuario
function mostrarMenuPrincipal {
	echo -e "${CIAN}Selecciona una opción : ( Mueve con las flechas [arriba,abajo] )${RESET}"
	seleccionarOpcion "${OPCIONES_MENU_PRINCIPAL[@]}"
	opcion_seleccionada=$?
	case $opcion_seleccionada in
		0)
			cargarNuevasReferencias ;;
		1)
			clear
			regenerarReferencias ;;
		2)
			clear
			crearNuevoFicheroDeAlmacenamiento ;;
		3)
			clear
			borrarReferencias ;;
		4)
			clear
			visualizarFicherosLog ;;
		5)
			clear
			cambiarIdiomaEnElScript ;;
		6)
			mostrarAyuda ;;
		7)
			exit 1 ;;	
	esac	
} #Fin mostrarMenuPrincipal()

#Función que comprueba si los scripts están referenciados antes de crear una nueva referencias
#o antes de cambiar el idioma de los scripts
#Devuelve [1] si ya están referenciados y [0] si aun no lo están
function comprobarSiLosScriptsEstanReferenciados {
    echo -e "${AMARILLO}Comprobando si los scripts están referenciados...${RESET}"
    # Buscar en los subdirectorios inmediatos
    for script in $(find */ -type f -name "$FILTRO_FICHEROS"); do
        while IFS= read -r linea; do
            if echo "$linea" | grep -qE '#[A-Z]{2}-[0-9]+-'; then
                # Con encontrar una línea, sabemos que mínimo hay una referencia
                #echo "Referencia encontrada en el script: $script"
                return 1 #Ya están referenciados
            fi
        done < "$script"
    done
    echo "No se encontraron referencias en los scripts."
    return 0 #No están referenciados
} #Fin comprobarSiLosScriptsEstanReferenciados()

#Opcion del menu principal para crear referencias nuevas
function cargarNuevasReferencias {
	#Antes de nada,comprobamos si los scripts ya están referenciados, para evitar una doble referencia
	comprobarSiLosScriptsEstanReferenciados
	comprobacion=$? #Obtenemos el resultado de la última ejecución
	if [[ $comprobacion -eq 1 ]];
	then
		#Salimos directamente y agregamos el error al log
		mostrarMensajeYAgregarloAlLogGeneral "Se está intentando referenciar algúnos scripts ya referenciados, puedes utilizar la opcion de regenerar referencias o borrar las referencias"\
						     $FUNCNAME $LOG_ERROR
		volverAlMenuOSalir
	fi
	#Identificamos los scripts base con los que vamos a trabajar y avisamos al usuario
	#remember the -exec {} in case i need to run a command on the found files directly
	scripts_encontrados=$(find */ -name "$FILTRO_FICHEROS" -type f -print | grep -c '') #Sustitucion de comandos y contamos cada linea del find con grep
	echo -e "${AMARILLO_OSCURO}\nScripts(.sh) encontrado :${RESET}"
	find */ -name "$FILTRO_FICHEROS" -type f -print #Mostrar los scripts encontrados
	#Si se encuentra 1 o más ficheros, seguimos, si no, es que no se han encontrado scripts en los subdirectorios
	if [[ $scripts_encontrados -lt 1 ]]
	then
		mostrarMensajeYAgregarloAlLogGeneral "No se han encontrado ningún script en los subdirectorios" $FUNCNAME $LOG_WARNING
		volverAlMenuOSalir
	#Later add more options for the case where the files are already created
	else
		#En el caso de no haber salido en la comprobación anterior, se han encontrado scripts, seguimos :
		#Gestionamos el singular/plural de los scripts
		if [[ $scripts_encontrados -eq 1 ]]; then
			echo -e "${CIAN}\nSe ha encontrado $scripts_encontrados script${RESET},¿deseas seguir? [s|n]"
		else
			echo -e "${CIAN}\nSe han encontrado $scripts_encontrados scripts${RESET},¿deseas seguir? [s|n]"
		fi
		echo -e -n "${AMARILLO}Seguir :${RESET}"
		read opcion_seguir
		#TO-DO: Comprobar la existencia de los ficheros antes de volver a crearlos
		while :; do
			case $opcion_seguir in
				's' | 'S')
					#Preguntamos al usuario el idioma en el que quiere realizar las traducciones
					echo -e "\n¿En que idioma se encuentran los scripts? (Selecciona un número)"
					echo "$NUM_ESPANHOL. Español (SP)"
					echo "$NUM_INGLES. Inglés  (EN)"
					echo "$NUM_FRANCES. Francés (FR)"
					echo -e "${AMARILLO}Opcion Idioma :${RESET}"
					read opcion_idioma
					#for script in $(find "." -name "$FILTRO_FICHEROS" -type f -print); #"." buscaria tanto en el directorio actual como subdirectorios
					echo -e "Generando ficheros de idiomas..."
					for script in $(find */ -name "$FILTRO_FICHEROS" -type f); #*/ para buscar solo en los subdirectorios,
					do
						#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado, si devuelve
						#"prueba.sh" por ejemplo, despues obtenemos todo que que haya antes del "." porque ese será el nombre, por ejemplo "prueba"
						nombre_fichero=$(basename ${script%.*}) 
						directorio=$(dirname "$script")
						#Creamos los 3 ficheros txt de idiomas para por cada script en el directorio
						nombre_fichero_sp=$COD_SP"_"$nombre_fichero.txt
						nombre_fichero_en=$COD_EN"_"$nombre_fichero.txt
						nombre_fichero_fr=$COD_FR"_"$nombre_fichero.txt
						touch $directorio/$nombre_fichero_sp
						touch $directorio/$nombre_fichero_en
						touch $directorio/$nombre_fichero_fr
						
						#Creamos los ficheros Español (SP)
						if [ $opcion_idioma -eq $NUM_ESPANHOL ] 
						then
							#Usamos las barras \ para que no se interpreten todos los 7 parametros como 1
							extraerComentariosDelScript $script\
											"$directorio/$nombre_fichero_sp"\
								 			$COD_SP\
								 			"$directorio/$nombre_fichero_en"\
								 			$COD_EN\
											"$directorio/$nombre_fichero_fr"\
								 			$COD_FR
						#Creamos los ficheros Ingles (EN)
						elif [ $opcion_idioma -eq $NUM_INGLES ] 
						then
							#Usamos las barras \ para que no se interpreten todos los 7 parametros como 1
							extraerComentariosDelScript $script\
											"$directorio/$nombre_fichero_en"\
								 			$COD_EN\
								 			"$directorio/$nombre_fichero_sp"\
								 			$COD_SP\
											"$directorio/$nombre_fichero_fr"\
								 			$COD_FR
						#Creamos los ficheros Francés (FR)
						elif [ $opcion_idioma -eq $NUM_FRANCES ]
						then
							#Usamos las barras \ para que no se interpreten todos los 7 parametros como 1
							extraerComentariosDelScript $script\
											"$directorio/$nombre_fichero_fr"\
								 			$COD_FR\
								 			"$directorio/$nombre_fichero_en"\
								 			$COD_EN\
											"$directorio/$nombre_fichero_sp"\
								 			$COD_SP
						else
							echo -e "${ROJO}Opcion invalida${RESET}"
						fi					
					done
					volverAlMenuOSalir ;; #Prompt para que el usuario elija si salir o no de la app
				'n' | 'N')
					echo "Se ha salido del programa"
					exit 1
					;;
				*)		
					echo -e "\n${ROJO}Porfavor selecciona una opcion válida${RESET}"
					echo -e "\n${CIAN}Se han encontrado $scripts_encontrados scripts${RESET},¿deseas seguir? [s|n]"
					echo -e "${AMARILLO}Seguir :${RESET}"
					read opcion_seguir 
					;;
			esac
		done
	fi
} #Fin cargarNuevasReferencias()

#La funcion lee un fichero (.sh en este caso) y extrae los comentarios para copiarlos a sus respectivos ficheros txt's
#Recibe 7 parametros:
#$1: El script original (de donde se va extraer los comentarios)
#$2: El fichero de idiomas principal (el idioma en el que esta el script)
#$3: (Código del fichero de idioma principal)
#$4,$5,$6 y $7: El fichero y codigo de idiomas del resto de ficheros que irán con las referencias vacias ($4 y $5 para uno) y ($6 y $7 para el otro)
function extraerComentariosDelScript {
  	script=$1 #El script original sobre el que se va crear los ficheros relevantes
  	#Ficheros del idioma principal
  	fichero_idioma1=$2 #Fichero del idioma principal  (SP,FR o EN)
  	cod_idioma1=$3 #Codigo del idioma principal,el tercer parametro recibido
  	#Ficheros secundarios donde solo irán las referencias del fichero principal
  	#Segundo idioma
  	fichero_idioma2=$4
  	cod_idioma2=$5
  	#Tercer idioma
  	fichero_idioma3=$6
  	cod_idioma3=$7
  	contador_lineas=$INICIO_NUM_LINEAS #Numero inicial de cada linea
  	declare -a lineas_script_original=()
  	#Ajustamos el Internal field separator
  	IFS=$'\n'
	#Borramos los ficheros si ya existe y los volvemos a crear
	for file in "$fichero_idioma1" "$fichero_idioma2" "$fichero_idioma3"; do
    		if [ -f "$file" ]; then
        		rm "$file"
        		touch "$file"
        		echo "Fichero $file existente se ha borrado."
		fi
	done
  	#Ahora leemos el fichero de origin (El .sh sobre el que se crearán las referencias)
  	while IFS= read -r linea; #Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
  	do
  		#Comprobamos si cada linea es válida
  		esLineaValidaComoComentario "$linea"
		linea_valida=$?
		if [[ $linea_valida -eq 1 ]]; 
		then
  			linea_filtrada=${linea#*#} #Cogemos todo lo que venga despues de la primera # de la linea
    			comentario="#"$cod_idioma1"-"$contador_lineas"-"$linea_filtrada
    			#Escribimos el contenido en el fichero principal
    			echo $comentario >> $fichero_idioma1 # usamos ">>" para adjuntar cada linea a lo que ya hay en el fichero
    			#Comprobamos si el inicio (^) de la linea contiene una #
    			if [[ "$linea" =~ ^# ]]; then
    				#Concatenamos la referencia con el contenido de la linea que haya despues de la #
    				comentario_script="#${cod_idioma1}-${contador_lineas}-${linea#\#}"
			else
    				#Separamos la línea en la parte antes del primer # y el comentario después del #
    				parte_antes=${linea%%#*}
    				comentario_despues=${linea#*#}
    				comentario_script="${parte_antes}#${cod_idioma1}-${contador_lineas}-${comentario_despues}"
			fi
    			lineas_script_original+=("$comentario_script") #Tiene que ir aqui porque aqui es donde añadimos el fichero principal
    			#Escribimos las referencias vacia en ficheros de otros idiomas
    			#Idioma2
    			comentario="#"$cod_idioma2"-"$contador_lineas"-"
    			echo $comentario >> $fichero_idioma2
    			#Idioma3
    			comentario="#"$cod_idioma3"-"$contador_lineas"-"
    			echo $comentario >> $fichero_idioma3
    			contador_lineas=$((contador_lineas + $INCR_LINEAS)) #El número de lineas del documento tiene que ir de 10 en 10
  		else
  			#Seguimos a la siguiente linea
  			lineas_script_original+=("$linea")
  			comentario=""
    			continue;
  		fi
  	done < "$script"
  	#Ahora poner las etiquetas en el script original
  	printf "%s\n" "${lineas_script_original[@]}" > "$script" #Risky shit :)
  	mostrarMensajeYAgregarloAlLogGeneral "Las nuevas referencias han sido creadas" $FUNCNAME $LOG_SUCCESS
} #Fin extraerComentariosDelScript()

#Comprueba si es una linea es valida para considerarla un comentario para la traducción
#Recibe : La linea de comentario en cuestion, y por cada uno que recibe, devuelve si es válida o no
#Devuelve [1] si es válido es y [0] si no es
function esLineaValidaComoComentario {
	linea=$1
	#Algunas lineas son #(y espacios), entonces quitamos los espacios a las lineas y si lo que queda al final es solo una #,sabemos que no es un comentario
    	linea_sin_espacios=$(echo "$linea" | tr -d ' ')
    	#linea_sin_espacios=$(echo "$linea" | sed 's/ //g') #espacion y simbolo global para reemplazar todas las ocurencias
	#Contamos el número de almohadillas que hay en la linea porque cuando tiene más de 1,normalmente son las cabeceras
    	num_hashtags=$(echo "$linea" | tr -cd '#' | wc -c)
	#Tambien comprobamos si la linea contiene una # o no con "$linea" != *#*, No incluir las "" aqui para el *#*,si no,nos buscará que la linea sea exactamente "*#*"	
	if [[ "$linea" == "$BIN_BASH1" || "$linea" == "$BIN_BASH2"  || "$linea_sin_espacios" == "#" || $num_hashtags -gt 1 || "$linea" != *#* ]]
	then
		return 0 #No es una linea válida
	else
		return 1 #Es una linea válida
	fi	
} #Fin esLineaValidaComoComentario()

#Funcion para regenerar las referencias dependiendo del idioma en el que estén los scripts
function regenerarReferencias {
	#Preguntamos al usuario en que idioma quiere regenerar las referencias
	mostrarIdiomasDisponibles
	echo "¿En que idioma están los scripts ?"
	echo -e -n "${AMARILLO}Codigo Idioma :${RESET}"
	read cod_idioma
	#Comprobamos si existe el codigo de idioma, si no existe , la funcion existeCodigoIdioma devuelve 1 si existe y 0 si no
 	existeCodigoIdioma "$cod_idioma"
 	existe=$? #Obtenemos el resultado del ultimo comando ejecutado
 	if [[ $existe -eq 1 ]]
 	then
 		#Obtener los comentarios de cada script pero intentando ordenarlos y comprobar si nos han insertado alguno nuevo en medio
 		for script in $(find */ -name "$FILTRO_FICHEROS" -type f);
 		do
 			#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado
			nombre_fichero=$(basename ${script%.*}) 
			directorio=$(dirname "$script")
			fichero_idioma="$directorio/${cod_idioma^^}_${nombre_fichero}.txt"
			echo "codigo idioma :" $cod_idioma
			echo "nombre_fichero:"$nombre_fichero
			echo "fichero idioma :"$fichero_idioma
			declare -a lineas_idiomas=()
			declare -a lineas_actualizada_script=()
			contador_lineas=$INICIO_NUM_LINEAS #Numero inicial de cada linea
 			while IFS= read -r linea; #Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
  			do
		  		#Comprobamos si cada linea es válida
		  		esLineaValidaComoComentario "$linea"
				linea_valida=$?
				if [[ $linea_valida -eq 1 ]]; 
				then
					echo "Linea valida: $linea"
					#q for silence and E to enable regular expresions
					if echo "$linea" | grep -qE '#[A-Z]+-[0-9]+-';
					then
						#cogemos todo lo que venga despues del ultimo -
						linea_filtrada=$(echo "$linea" | cut -d'-' -f3-) #Desde field 3
						#linea_filtrada=${linea##*-} Este puede fallar si hay mas de 2 guiones
						echo "Patron Me quedé con : $linea_filtrada"
					else
						linea_filtrada=${linea#*#} #Cogemos todo lo que venga despues de la primera # de la linea
						echo "Me quedé con : $linea_filtrada"
					fi
		    			comentario="#"${cod_idioma^^}"-"$contador_lineas"-"$linea_filtrada
		    			lineas_idiomas+=("$comentario")
		    			#Escribimos el contenido en el fichero principal
		    			if [[ "$linea" =~ ^# ]]; then
                    				#comentario_script="#${cod_idioma}-${contador_lineas}-${linea#\#}"
                    				comentario_script="#"${cod_idioma^^}-${contador_lineas}-${linea_filtrada}
                			else
                    				# Separamos la línea en la parte antes del primer # y el comentario después del #
                    				parte_antes=${linea%%#*}
                    				#comentario_despues=${linea#*#}
                    				#comentario_script="${parte_antes}#${cod_idioma}-${contador_lineas}-${comentario_despues}"
                    				comentario_despues=$(echo "$linea" | sed 's/^[A-Z]\+-[0-9]\+-//')
                    				#Makes sense now : Cogemos la parte antes que no tiene  # y luego la linea filtrada
                    				comentario_script=${parte_antes}#${cod_idioma^^}-${contador_lineas}-${linea_filtrada}
               		 		fi
               		 		#comentario_script="#"${cod_idioma^^}"-"$contador_lineas"-"$linea_filtrada
		    			lineas_actualizada_script+=("$comentario_script")
		    			contador_lineas=$((contador_lineas + $INCR_LINEAS))
		    			#Now make it substitute something like for loop #Comment correctly,the line doesnt start with an # but it has an # later on
  				else
		  			#Seguimos a la siguiente linea
		  			echo "Linea no valida: $linea"
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
  			# Obtener el resto de los códigos de idiomas y actualizar sus ficheros con las nuevas referencias vacías
            		local codigo_idiomas=() # Array para meter los códigos de idiomas
            		while IFS= read -r linea; do
                		linea_filtrada=${linea:1:2} # Obtenemos los valores del índice 1 y 2 de la línea, si la línea es #SP-Español, el índice 1:2 = SP
                		codigo_idiomas+=("$linea_filtrada") # Añadimos cada código encontrado al array
            		done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE}")
			
			#Crear las referencias en el los otros idiomas que no sean el mismo que estamos re-referenciando
            		for cod in ${codigo_idiomas[@]}; do
                		if [[ "${cod,,}" != "${cod_idioma,,}" ]]; then
                    			fichero_otro_idioma="$directorio/${cod}_${nombre_fichero}.txt"
                    			# Leer el contenido existente del fichero
                    			if [[ -f "$fichero_otro_idioma" ]]; then
                        			mapfile -t lineas_otro_idioma < "$fichero_otro_idioma"
                    			else
                        			lineas_otro_idioma=()
                    			fi
                    			# Generar nuevas referencias manteniendo los comentarios existentes
                    			nuevo_contador_lineas=$INICIO_NUM_LINEAS
                    			for i in "${!lineas_otro_idioma[@]}"; do
                        			if echo "${lineas_otro_idioma[$i]}" | grep -qE '#[A-Z]+-[0-9]+-'; then
                            				comentario=$(echo "${lineas_otro_idioma[$i]}" | cut -d'-' -f3-)
                            				lineas_otro_idioma[$i]="#${cod^^}-${nuevo_contador_lineas}-${comentario}"
                        			fi
                        			nuevo_contador_lineas=$((nuevo_contador_lineas + $INCR_LINEAS))
                    			done
                    			# Si el archivo de idioma es más corto que el archivo principal
                    			while [[ $nuevo_contador_lineas -lt $contador_lineas ]]; do
                        			lineas_otro_idioma+=("#${cod^^}-${nuevo_contador_lineas}-")
                        			nuevo_contador_lineas=$((nuevo_contador_lineas + $INCR_LINEAS))
                    			done
                    			# Escribir el contenido actualizado en el fichero de otro idioma
                    			printf "%s\n" "${lineas_otro_idioma[@]}" > "$fichero_otro_idioma"
                		fi
           		done
 		done
 		mostrarMensajeYAgregarloAlLogGeneral "Referencias regeneradas correctamente tanto en ${cod_idioma^^} como en los demás idiomas" $FUNCNAME $LOG_SUCCESS
 		volverAlMenuOSalir	
 	else
 		mostrarMensajeYAgregarloAlLogGeneral "No existe el código de idioma ${cod_idioma^^}" $FUNCNAME $LOG_ERROR
 		volverAlMenuOSalir
 	fi	
} #Fin regenerarReferencias()

#Function que agrega los errores, avisos o operaciones realizadas correctamente  a un fichero log principal
#$1 - mensaje de error
#$2 - Nombre de la función que lanzó el error
#$3 - Tipo de mensaje de log [LOG_ERROR,LOG_WARNING o LOG_SUCCESS]
function mostrarMensajeYAgregarloAlLogGeneral {
	mensaje=$1
	nombre_funcion=$2
	tipo_log=$3
	fecha_y_hora=$(date)
	#Creamos el fichero de logs si no existe
	if [ ! -e  $FICHERO_LOGS_GENERAL ];
	then
		touch $FICHERO_LOGS_GENERAL
	fi
	
	case $tipo_log in
		$LOG_ERROR)
			echo -e "${ROJO}$mensaje${RESET}"
			echo -e "${ROJO}ERROR:${RESET} $fecha_y_hora -> $mensaje [Nombre función: $nombre_funcion]" >> $FICHERO_LOGS_GENERAL
			;;
		$LOG_WARNING)
			echo -e "${AMARILLO_OSCURO}$mensaje${RESET}"
			echo -e "${AMARILLO}WARNING:${RESET} $fecha_y_hora -> $mensaje [Nombre función: $nombre_funcion]" >> $FICHERO_LOGS_GENERAL
			;;
		$LOG_SUCCESS)
			echo -e "${VERDE}$mensaje${RESET}"
			echo -e "${VERDE}SUCCESS:${RESET} $fecha_y_hora -> $mensaje [Nombre función: $nombre_funcion]" >> $FICHERO_LOGS_GENERAL
			;;
	esac
} #Fin mostrarMensajeYAgregarloAlLogGeneral()

#Lo mismo que el extraerComentariosDelScript, pero esta funcion solo recibe 3 parametros y solo será llamado cuando se agregue un idioma nuevo
function extraerComentariosDelScriptNuevoIdioma {
  	script=$1 #El script original sobre el que se va crear los ficheros relevantes
  	#Ficheros del idioma nuevo
  	fichero_idioma_nuevo=$2 #Fichero del idioma nuevo (COD)
  	cod_idioma_nuevo=$3 #Codigo del idioma nuevo
  	contador_lineas=$INICIO_NUM_LINEAS #Numero inicial de cada linea
  	#Ajustamos el Internal field separator(IFS)
  	IFS=$'\n'
  	#Ahora leemos el fichero de origin (El .sh sobre el que se crearán las referencias)
  	while IFS= read -r linea; #Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
  	do
  		#Comprobamos si cada linea es válida
  		esLineaValidaComoComentario "$linea"
		linea_valida=$?
		if [[ $linea_valida -eq 1 ]];
		then
			comentario="#"$cod_idioma_nuevo"-"$contador_lineas"-"
    			#Escribimos el contenido en el fichero principal
    			echo $comentario >> $fichero_idioma_nuevo # usamos ">>" para adjuntar cada linea a lo que ya hay en el fichero
    			contador_lineas=$((contador_lineas + $INCR_LINEAS)) #El número de lineas del documento tiene que ir de 10 en 10
		else
			comentario=""
    			continue;
		fi
  	done < "$script"
} #Fin extraerComentariosDelScriptNuevoIdioma()

function mostrarPresentacion {	
    clear
    echo -e "${CIAN}---------------------------------------${RESET}"
    echo "         PRÁCTICA DE CONTROL       "
    echo " INTERNACIONALIZACIÓN DE DOCUMENTACIÓN"
    echo -e "${CIAN}---------------------------------------${RESET}"
    echo -e "Autor        : Derick Daumienebi Sakpa"
    echo -e "Tutor        : José Manuel Saiz Diez"
    echo -e "Asignatura   : Sistemas Operativos"
    echo -e "Grado        : Ingeniería Informática"
    echo -e "${CIAN}---------------------------------------${RESET}\n"
} #Fin mostrarPresentacion()

#cambioIdiomaScript: SIDE NOTE : Make a function to delete the scripts and leave it like that
#Search for just the number so that it can go to the language files instead of the full reference #XX-YY-
function cambiarIdiomaEnElScript {
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
	num_traducciones_restantes=0 #Recuento de cuantas traducciones faltan
    	#Buscar los ficheros para encontrar cada script y dentro del ese mismo directorio, tenemos los ficheros de traducción
    	find */ -name "$FILTRO_FICHEROS" -type f -print 
    	# Preguntamos a qué idioma lo quiere traducir el usuario
    	mostrarIdiomasDisponibles
    	echo -e "¿A qué idioma quieres traducir los scripts? (Indica el código [XY])"
    	echo -e -n "${AMARILLO}Código idioma a traducir :${RESET}"
   	read cod_idioma
   	#Preguntar en que idioma se encuentran los scripts
   	echo -e "\n¿En que idioma se encuentran los scripts? (Indica el código [XY])"
    	echo -e -n "${AMARILLO}Código idioma de los scripts :${RESET}"
   	read cod_idioma_script
    	# Comprobamos si existen los códigos de idiomas del script y el idioma a la que va traducir el usuario, si no existe, la función devuelve 1 si existe y 0 si no
    	existeCodigoIdioma "${cod_idioma}"
    	existe_cod_a_traducir=$? # Obtenemos el resultado del último comando ejecutado
    	existeCodigoIdioma "${cod_idioma_script}"
    	existe_cod_script=$? # Obtenemos el resultado del último comando ejecutado
    	if [[ $existe_cod_a_traducir -eq 1 && $existe_cod_script -eq 1 ]]
    	then
        	# Ahora que existen los códigos,copiamos las referencias del fichero al script
        	echo "Existe el código"
        	IFS=$'\n'
        	# Obtenemos cada script de los subdirectorios
        	for script in $(find */ -name "$FILTRO_FICHEROS" -type f);
        	do
            		nombre_fichero=$(basename ${script%.*})
            		directorio=$(dirname "$script")
            		fichero_idioma_a_traducir="$directorio/${cod_idioma^^}_${nombre_fichero}.txt"
            		echo $fichero_idioma_a_traducir
            		echo $script
            		# Con la opción -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
            		# Leemos el fichero original y el fichero txt de traducción pero primero miramos si existe el de traducción
            		if [[ -e "$fichero_idioma_a_traducir" ]]; then
                		# Array para guardar las líneas
                		declare -a lineas_referencias=()
                		while IFS= read -r linea_original; do
                		echo ${linea_original:1:3} "es igual a" "${cod_idioma_script^^}-"
                    			esLineaValidaComoComentario "$linea_original"
                    			linea_valida=$?
                    			if [[ $linea_valida -eq 1 ]]; then
                        			referencia_a_quitar=$(echo "$linea_original" | grep -o '#[A-Z]\+-[0-9]\+-')
                        			referencia=$(echo "$linea_original" | grep -oP '(?<=-)[0-9]+(?=-)') #utilizamos el número de referencia,de "#SP-10-", extraemos "10"
                        			echo "La referencia es: $referencia"
                        			referencia_a_buscar="#"${cod_idioma^^}"-"$referencia"-"
                        			echo $referencia_a_buscar
                        			#Buscamos los que coinciden con la referencia a buscar(del idioma a la que vamos a cambiar) linea y quitamos la parte de la referencia a buscar
                        			#Con el sed, -E para expresiones y extraemos solo el texto de la traduccion en vez de toda la linea
                        			linea_traduccion=$(grep "$referencia_a_buscar" "$fichero_idioma_a_traducir" | sed -E "s/^.*${referencia}//") #No uncessary language file update
                        			fichero_idioma_actual="$directorio/${cod_idioma_script^^}_${nombre_fichero}.txt"
                        			echo $fichero_idioma_actual
                        			#Eliminar el "-" misterioso que aparece al principio de la linea de traduccion si existe
                        			linea_traduccion=${linea_traduccion#-}
                        			if [[ -z $linea_traduccion ]]; then
                        				((num_traducciones_restantes++))
                        			fi
                        			#if [[ -n "$referencia" && -n "$linea_traduccion" ]]; then
                            			if [[ -n "$referencia" ]]; then
                            				#linea_nueva=$(echo "$linea_original" | sed "s/$referencia.*/$referencia$linea_traduccion/")
                            				echo "Good Referencia a buscar : $referencia_a_buscar"
                            				linea_nueva=$(echo "$linea_original" | sed "s/$referencia_a_quitar.*/$referencia_a_buscar$linea_traduccion/")
                            				echo "Línea original: $linea_original"
                            				echo "Línea traducida: $linea_traduccion"
                            				echo "Línea nueva: $linea_nueva"
                            				#Ya que en las referencias normales van de 10 en 10, comprobamos si la referencia no es multiplo de 10 para saber
                            				#que es uno nuevo que puede ser XX-11-,XX-125-,XX-1212-, y agregamos esas "nuevas" a los ficheros de idiomas.
                            				#Tambien comprobamos que la referencia no esté en el idioma
                            				if (( referencia % 10 != 0 )) && ! grep -qF "#${cod_idioma_script^^}-$referencia-" "$fichero_idioma_actual"; then
                            					local codigo_idiomas=()
                            					fichero_idioma_actual="$directorio/${cod_idioma_script^^}_${nombre_fichero}.txt"
                            					echo "$linea_original" >> "$fichero_idioma_actual" #Escribimos en los demás idiomas
                            					while IFS= read -r linea; do
                            						#Obtenemos los valores del índice 1 y 2 de la línea, si la línea es #SP-Español, el índice 1:2 = SP
                							linea_filtrada=${linea:1:2}
                							codigo_idiomas+=("$linea_filtrada")
            							done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE}")
            							#Ahora tenemos que agregar estos mismos comentarios a los demás ficheros de idiomas
            							for cod in ${codigo_idiomas[@]}; do
    									if [[ "${cod,,}" != "${cod_idioma_script,,}" ]]; then
        									fichero_otro_idioma="$directorio/${cod^^}_${nombre_fichero}.txt"
        									#Verificamos si la referencia no está ya en el archivo
        									if ! grep -qF "#${cod^^}-$referencia-" "$fichero_otro_idioma"; then
        										echo "#${cod^^}-$referencia-" >> $fichero_otro_idioma
       	 									fi
    									fi
								done
                            				fi
                        			else
                            				echo "La línea no contiene la referencia esperada: $linea_original"
                            				#echo "$linea_original" >> "$fichero_idioma_a_traducir" #Ni de coña, no podemos meterlo aqui porque esta sin referencia
                            				linea_nueva="$linea_original"
                            				echo "Bad Referencia a buscar : $referencia_a_buscar"
                        			fi
                			else
                        			linea_nueva="$linea_original"
                        			echo "Línea original: $linea_original"
                        			echo "Línea nueva: $linea_nueva"
                			fi
                			# Añadimos la nueva línea al array
                			lineas_referencias+=("$linea_nueva")
                		done < "$script"
                		# Escribimos el contenido actualizado de nuevo en el archivo original
                		printf "%s\n" "${lineas_referencias[@]}" > "$script" # Risky shit i guess but it works :)
            		else
            			mostrarMensajeYAgregarloAlLogGeneral "No se encontraron los ficheros de traducción para el codigo de idioma ${cod_idioma^^}, puede que no estén generados"\
            			                                     $FUNCNAME $LOG_ERROR
                		volverAlMenuOSalir
            		fi
        	done
        	mostrarMensajeYAgregarloAlLogGeneral "Se ha cambiado el idioma del script a ${cod_idioma^^}" $FUNCNAME $LOG_SUCCESS
        	#Mostrar las referencias restantes por traducir del nuevo idioma al que se ha cambiado el script
        	if [[ $num_traducciones_restantes -gt 0 ]]; then
        		mostrarMensajeYAgregarloAlLogGeneral "Faltan $num_traducciones_restantes referencias por traducir para el código de idioma : ${cod_idioma^^}"\
        						      $FUNCNAME $LOG_WARNING
        	fi
        	volverAlMenuOSalir 
    	else
        	echo -e "${ROJO}Alguno de los códigos de idiomas no existe${RESET}"
        	volverAlMenuOSalir
    	fi
} # Fin cambiarIdiomaEnElScript()

#Recibe un codigo de idioma como parametro y comprueba si existe
#Devuelve [1] si existe y [0] si no
function existeCodigoIdioma {
	cod_idioma_nuevo=$1
	local codigo_idiomas=() #Array para meter los codigos de idiomas
	while IFS= read -r linea;
	do
		#Tambien se puede utilizar el awk, pero he estado utilizando este metodo para filtrar
		linea_filtrada=${linea:1:2} #Obtenemos los valores del indice 1 y 2 de la linea, si la linea es #SP-Español, el indice 1:2 = SP
		#Añadimos cada código de idioma obtenido a un array
		codigo_idiomas+=("$linea_filtrada") #Añadimos cada código encontrado al array
	done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE}")
	for cod in ${codigo_idiomas[@]}; do
		if [[ "${cod_idioma_nuevo,,}" == "${cod,,}" ]]
		then
			return 1 #El codigo de idioma existe
			break;
		fi
	done
	return 0 #El codigo de idioma no existe
} #Fin existeCodigoIdioma()

#Crear nuevas referencias para un idioma nuevo que elegirá el usuario
function crearNuevoFicheroDeAlmacenamiento {
	mostrarIdiomasDisponibles #Mostrar los idiomas disponibles antes que nada
	local num_coincidencias #Contador del número de coincidencias del codigo nuevo con algunos existente, tiene que ser 0 para que sea valido
	local tamanho_codigo #Tamaño del nuevo codigo de idioma
	echo "Introduce el Codigo del idioma nuevo (Por ejemplo XY)"
	echo -e -n "${AMARILLO}Codigo Idioma :${RESET}"
	read cod_idioma_nuevo
	tamanho_codigo=${#cod_idioma_nuevo}  #Obtenemos el tamaño del codigo introducido
	local codigo_idiomas=() #Array para meter los codigos de idiomas
 	local existe_cod_idioma
	while : ; do
		#Comprobamos si existe el codigo de idioma, si no existe , la funcion devuelve 1 si existe y 0 si no
 		existeCodigoIdioma "${cod_idioma_nuevo}"
		existe_cod_idioma=$? #Obtenemos el resultado del ultimo comando ejecutado
		if [[ $existe_cod_idioma -eq 1 || $tamanho_codigo -ne 2 ]]
		then
			#Mostrar distintos mensajes dependiendo del error
			if [[ $existe_cod_idioma -eq 1 ]]
			then
				mostrarMensajeYAgregarloAlLogGeneral "Ese codigo de idioma ya existe.\n" $FUNCNAME $LOG_SUCCESS
				mostrarIdiomasDisponibles 
			fi
			if [[ $tamanho_codigo -ne 2  ]]
			then
				echo -e "${ROJO}El codigo solo puede contener dos caracteres.\n${RESET}"
			fi
			echo -e "${CIAN}¿Deseas probar con otro codigo o prefieres salir?${RESET}"
			seleccionarOpcion "${OPCIONES_MENU_COD_IDIOMA_NUEVO[@]}"
			opcion_seleccionada=$?
			#Switch-case para las opciones :
			case $opcion_seleccionada in
				0)
					echo -e "\nIntroduce el Codigo del idioma nuevo,por ejemplo XY (dos caracteres)"
                			echo -e -n "${AMARILLO}Codigo Idioma :${RESET}"
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
	echo -e -n "${AMARILLO}Nombre Idioma :${RESET}"
	read nombre_idioma_nuevo
	#mostrarMensajeDeCarga "Creando las referencias nuevas" 4
	#Ahora creamos los nuevos ficheros de referencia generamos los comentarios
	for script in $(find */ -name "$FILTRO_FICHEROS" -type f -print); #*/ para buscar solo en los subdirectorios,
	do
		#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado
		nombre_fichero=$(basename ${script%.*}) #Nombre del .sh encontrado, por ejemplo "prueba.sh" devolvería "prueba"
		directorio=${script%/*} #Extraemos la ruta donde se esta creando cada fichero,cogiendo todo antes de la última "/" porque eso es el directorio
		nombre_fichero_nuevo_idioma=${cod_idioma_nuevo^^}"_"$nombre_fichero.txt #^^ para poner el codigo en mayusculas
		touch $directorio/$nombre_fichero_nuevo_idioma
		#Copiamos el contenido del fichero original a la nueva
		echo "se va copiar el contenido de $script a $nombre_fichero_nuevo_idioma"
		#Ahora copiamos las lineas a los ficheros en el idioma
		extraerComentariosDelScriptNuevoIdioma $script\
						"$directorio/$nombre_fichero_nuevo_idioma"\
						${cod_idioma_nuevo^^} #^^ para pasar el codigo del idioma en mayusculas
	done
	mostrarMensajeYAgregarloAlLogGeneral "Nuevo fichero de almacenamiento de $nombre_idioma_nuevo creado" $FUNCNAME $LOG_SUCCESS
	#Ahora actualizamos el fichero de los idiomas y añadimos el idioma nuevo
	guardarIdiomaNuevo $cod_idioma_nuevo $nombre_idioma_nuevo
	volverAlMenuOSalir
} #Fin crearFicheroDeAlmacenamiento()

#Funcion que recible el codigo y nombre de un idioma nuevo y lo añade al final de este mismo script
function guardarIdiomaNuevo {
	cod_idioma_nuevo=$1
	nombre_idioma_nuevo=$2
	echo ""#"$cod_idioma_nuevo"-"$nombre_idioma_nuevo" >> $BASH_SOURCE
	mostrarMensajeYAgregarloAlLogGeneral "Se ha guardado el idioma $nombre_idioma_nuevo con código ${cod_idioma_nuevo^^}" $FUNCNAME $LOG_SUCCESS
} #Fin guardarIdiomaNuevo()

#Lista los idiomas disponibles y añade un recuento al final.
#Nota : Obtiene este dato solo basandose en los que encuentra al final del script, no comprueba los ficheros
function mostrarIdiomasDisponibles {
	contador_idiomas=0
	echo -e "${CIAN}\nSe han encontrado los siguientes idiomas :${RESET}"
	while IFS= read -r linea;
	do
		linea_filtrada=${linea#*#} #Obtenemos todo lo que venga despues de la # 
		echo -e "$linea_filtrada"
		((contador_idiomas++))
		#codigo_idiomas+=("$linea_filtrada") #Añadimos cada código encontrado al array
	done < <(sed -n "${LINEA_INICIO_IDIOMAS},\$p" "${BASH_SOURCE}") #Sustitucion de procesos
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
		0)
			clear
                	cat $FICHERO_LOGS_GENERAL
                	echo -e "\n${VERDE}FIN DE LOG${RESET}\n" ;;
		1)
			echo "No disponible" ;;
		2)
			exit 1 ;;	
	esac
	while true; do
        echo -e "\n${AMARILLO}Pulsa 0 para salir y 1 para volver al menú principal${RESET}"
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

#Mostrar ayuda, maybe scrap it out
function mostrarAyuda {
	echo -e "\n\t\t\t\t${VERDE}AYUDA DEL SCRIPT${RESET}"
	echo -e "${AMARILLO}*IMPORTANTE* :${RESET} Antes de empezar con los demás opciones, es recomendable crear las referencias primero"
    	echo -e "${VERDE}Cargar un nuevo juego de referencias:${RESET}\nEsta opción te permite cargar un nuevo conjunto de referencias para tu juego.\n"
    	echo -e "${VERDE}Regenerar referencias:${RESET}\nEsta opción te permite volver a regenerar las referencias de todos los scripts para cuadra los números en caso de haber agregado referencias nuevas a los scripts originales\n"
    	echo -e "${VERDE}Crear un nuevo fichero de almacenamiento:${RESET}\nCon esta opción puedes crear un nuevo fichero de que se corresponde a un idioma nuevo no se puede crear un nuevo fichero de almacenamiento de un idioma que ya existe.\n"
    	echo -e "${VERDE}Eliminar ficheros de almacenamiento:${RESET}\nUtiliza esta opción para eliminar los ficheros de almacenamiento y borrar todas las referencias de los scripts originales.\n"
    	echo -e "${VERDE}Visualizar los ficheros de log:${RESET}\nCon esta opción puedes ver los ficheros de registro (Tanto el general como el de cada script).\n"
    	echo -e "${VERDE}Cambiar idioma de los scripts:${RESET}\nUtiliza esta opción para cambiar el idioma de los scripts, puedes intercambiar entre un idioma u otro, siempre que exista el fichero de almacenamiento. Al cambiar de idioma, el script se queda con los valores actualizados de los ficheros de almacenamiento."
    	while true; do
        echo -e "\n${AMARILLO}Pulsa 0 para salir y 1 para volver al menú principal${RESET}"
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

#Quitar las referencias (XX-YY-) de todos los scripts y los deja como estaban antes de referenciarlos 
function borrarReferencias {
    echo -e "${AMARILLO_OSCURO}IMPORTANTE :${RESET} ASEGURATE DE LOS SCRIPTS SE ENCUENTRAN EN UN IDIOMA CON TODOS LOS COMENTARIOS!"
    echo -e "${ROJO}Seguro que quieres borrar las referencias (#XX-YY-) de cada script ? [s|n] ${RESET}\n"
    echo -e -n "${AMARILLO}Opcion:${RESET}"
    read opcion
    case $opcion in
    	's'|'S')
    		for script in $(find */ -type f -name "*.sh"); do
        		# Usamos sed para eliminar las referencias y convertirlas en comentarios
        		sed -i 's/#\([A-Z]\+\)-[0-9]\+-/#/g' "$script"
        		mostrarMensajeYAgregarloAlLogGeneral "Referencias eliminadas y convertidas en comentarios en el script: $script" $FUNCNAME $LOG_SUCCESS
    		done
    		volverAlMenuOSalir ;;
    	'n'|'N')
    		mostrarMenuPrincipal ;;
    	*)
    		echo "Opcion no válida"
    		volverAlMenuOSalir ;;	
    esac   
}

# Renders a text based list of options that can be selected by the
# user using up, down and enter keys and returns the chosen option.
#
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
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
    local lastrow=`get_cursor_row`
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