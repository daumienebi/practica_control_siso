#!/bin/bash
######################################################################################################################
#						CABECERA
######################################################################################################################
# Nombre: traductor.sh
# 
# Autor: Derick Daumienebi Sakpa
#
# Descripcion: Proyecto de la practica de control de la asignatura : Sistemas Operativos
#              Sirve para estionar las traducciones de los comentarios de encontrados en otros scripts(.sh)
#
# Tutor: José Manuel Saiz Diez
#
# Uso: Ejecuta el script en un directorio que contenga 1 o más subdirectorios, se encargará de generar los ficheros
#      (.txt) para cada script encontrado que contengan las referencias de los comentarios encontrados una vez que 
#      seleccionas en que idioma se encuentra el script original.Una vez generados, puedes gestionar los comentarios 
#      original,del script cambiando el idioma de los comentarios o realizando otra opciones disponibles a través de
#      los menus de opciones.
# 
# Última modificación: 25/05/2024
#
# Versión: 0.1														
#
# Nota : Se requiere una version de bash superior a la 4 para un funcionamiento optimo. 			     
#														     
######################################################################################################################

#Regenerate
#get the number of line
#for loop for the line number
#read the txt file of each language
#extract the comment and form the reference

#Variables de Idiomas por defecto
COD_SP="SP"
COD_EN="EN"
COD_FR="FR"
NUM_ESPANHOL=1;
NUM_INGLES=2;
NUM_FRANCES=3;
#LINEA_INICIO_IDIOMAS=$(($(grep -n '#CLAVE_IDIOMAS' ${BASH_SOURCE} | cut -d':' -f1) + 1))
LINEA_INICIO_IDIOMAS=840  #Ver final del fichero para entender esta variable

echo "LINE NUMBER : $LINEA_INICIO_IDIOMAS"
#Otras variables
FILTRO_FICHEROS="*.sh"
BIN_BASH1="#!/bin/bash"
BIN_BASH2="#!\bin\bash"
INICIO_NUM_LINEAS=10
INCR_LINEAS=10 #Incremento de linea
FICHERO_LOGS_GENERAL="./logGeneral.log"

#Colores
RESET="\e[0m" #Reset para volver al color normal despues de haber aplicado un color anteriormente
ROJO="\e[1;31m"
VERDE="\e[1;32m"
CIAN="\e[1;36m"
AMARILLO="\033[1;33m"

#Muestra las opciones del menu principal al usuario
function mostrarMenuPrincipal {
	#fix this menu to make it an infinite loop of some sort
	#clear
	# Trying to simulate a do-while
	echo -e "${CIAN}Selecciona una opcion de (0-7):${RESET}"
	echo "[1] Cargar un nuevo juego de referencias"
	echo "[2] Regenerar referencias"
	echo "[3] Crear un nuevo fichero de almacenamiento"
	echo "[4] Eliminar ficheros de almacenamiento"
	echo "[5] Visualizar los ficheros de log"
	echo "[6] Cambiar idioma de los scripts"
	echo "[7] Mostrar ayuda"
	echo -e "${ROJO}[0] Salir${RESET}"
	echo -e -n "${AMARILLO}\nOpcion: ${RESET}"
	read opcion
	
	while [[ $opcion -lt 0 || $opcion -gt 7 ]]
	do
		echo -e "${CIAN}Selecciona una opcion de (0-7):${RESET}"
		echo "1. Cargar un nuevo juego de referencias"
		echo "2. Regenerar referencias"
		echo "3. Crear un nuevo fichero de almacenamiento"
		echo "4. Eliminar ficheros de almacenamiento"
		echo "5. Visualizar los ficheros de log"
		echo "6. Cambiar idioma de los scripts"
		echo "7. Mostrar ayuda"
		echo "0. Salir"
		echo -e -n "${AMARILLO}\nOpcion: ${RESET}"
		read opcion
	done
	case $opcion in
		1)
			cargarNuevasReferencias
			;;
		2)
			regenerarReferencias 
			;;
		3)
			crearNuevoFicheroDeAlmacenamiento
			;;
		4)
			eliminarFicherosDeAlmacenamiento
			;;
		5)
			visualizarFicherosLog
			;;
		6)
			cambiarIdiomaEnElScript
			;;
		7)
			echo "Hola"
			#mostrarAyuda
			;;
		0)	
			echo -e "${VERDE}SE HA SALIDO DEL PROGRAMA!${RESET}"
			exit 1
			;;
		*)
			echo -e "${ROJO}Por favor, selecciona una opción válida${RESET}"
			mostrarMenuPrincipal
			;;
	esac	
} #Fin mostrarMenuPrincipal()


#Opcion del menu para crear referencias nuevas
function cargarNuevasReferencias {
	#Primero identificamos los scripts base con los que vamos a trabajar y avisamos al usuario
	#remember the -exec {} in case i need to run a command on the found files directly
	scripts_encontrados=$(find */ -name "$FILTRO_FICHEROS" -type f -print | grep -c '') #Sustitucion de comandos y contamos cada linea del find con grep
	find */ -name "$FILTRO_FICHEROS" -type f -print #Mostrar los scripts encontrados
	#Si se encuentra 1 o más ficheros, seguimos, si no, es que no se han encontrado scripts en los subdirectorios
	if [[ $scripts_encontrados -lt 1 ]]
	then
		mostrarErrorYAgregarloAlLogGeneral "No se han encontrado ningún script en los subdirectorios" $FUNCNAME
		#echo -e "${ROJO}No se han encontrado ningún script en los subdirectorios${RESET}"
		volverAlMenuOSalir
	#Later add more options for the case where the files are already created
	else
		#En el caso de no haber salido en la comprobación anterior, se han encontrado scripts, seguimos :
		echo -e "${CIAN}Se han encontrado $scripts_encontrados scripts${RESET},¿deseas seguir? [s|n]"
		echo -e -n "${AMARILLO}Seguir :${RESET}"
		read opcion_seguir
		#TO-DO: Comprobar la existencia de los ficheros antes de volver a crearlos
		while :; do
			case $opcion_seguir in
				's' | 'S')
					#Preguntamos al usuario el idioma en el que quiere realizar las traducciones
					echo -e "\n¿En que idioma deseas crear los ficheros ?"
					echo "$NUM_ESPANHOL. Español (SP)"
					echo "$NUM_INGLES. Inglés  (EN)"
					echo "$NUM_FRANCES. Francés (FR)"
					echo -e "${AMARILLO}Opcion Idioma :${RESET}"
					read opcion_idioma
		
					#for i in $(find "." -name "$FILTRO_FICHEROS" -type f -print); #"." buscaria tanto en el directorio actual como subdirectorios
					for i in $(find */ -name "$FILTRO_FICHEROS" -type f); #*/ para buscar solo en los subdirectorios,
					do
						#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado
						#Obtenemos "prueba.sh" por ejemplo,despues obtenemos todo que que haya antes del "." porque ese será el nombre, por ejemplo "prueba"
						nombre_fichero=$(basename ${i%.*}) 
						ruta_fichero_original=$i
						#Extraemos la ruta donde se esta creando cada fichero,cogiendo todo antes de la última "/" porque eso es la ruta al directorio
						directorio=${ruta_fichero_original%/*}
						#directorio=$(dirname "$ruta_fichero_original") #Otra opción válida
						#Creamos los ficheros Español (SP)
						if [ $opcion_idioma -eq $NUM_ESPANHOL ] 
						then
							#Concatenamos los nombres de los txt's
							nombre_fichero_sp=$COD_SP"_"$nombre_fichero.txt
							nombre_fichero_en=$COD_EN"_"$nombre_fichero.txt
							nombre_fichero_fr=$COD_FR"_"$nombre_fichero.txt
							#Crear los 3 ficheros de idiomas por cada script en el directorio adecuado 
							touch $directorio/$nombre_fichero_sp
							touch $directorio/$nombre_fichero_en
							touch $directorio/$nombre_fichero_fr
							#Extraer los comentarios de los scripts (mirar la cabecera de la funcion para ver sus parametros)
							#Usamos las barras \ para que no se interpreten todos los 7 parametros como 1
							leerFicheroYExtraerComentarios $ruta_fichero_original\
											"$directorio/$nombre_fichero_sp"\
								 			$COD_SP\
								 			"$directorio/$nombre_fichero_en"\
								 			$COD_EN\
											"$directorio/$nombre_fichero_fr"\
								 			$COD_FR
						#Creamos los ficheros Ingles (EN)
						elif [ $opcion_idioma -eq $NUM_INGLES ] 
						then
							#Concatenamos los nombres de los txt's
							nombre_fichero_en=$COD_EN"_"$nombre_fichero.txt
							nombre_fichero_sp=$COD_SP"_"$nombre_fichero.txt
							nombre_fichero_fr=$COD_FR"_"$nombre_fichero.txt
							#Crear los 3 ficheros de idiomas por cada script en el directorio adecuado 
							touch $directorio/$nombre_fichero_en
							touch $directorio/$nombre_fichero_sp
							touch $directorio/$nombre_fichero_fr
							#Extraer los comentarios de los scripts (mirar la cabecera de la funcion para ver sus parametros)
							#Usamos las barras \ para que no se interpreten todos los 7 parametros como 1
							leerFicheroYExtraerComentarios $ruta_fichero_original\
											"$directorio/$nombre_fichero_en"\
								 			$COD_EN\
								 			"$directorio/$nombre_fichero_sp"\
								 			$COD_SP\
											"$directorio/$nombre_fichero_fr"\
								 			$COD_FR
			
						#Creamos los ficheros Francés (FR)
						elif [ $opcion_idioma -eq $NUM_FRANCES ]
						then
							#Concatenamos los nombres de los txt's
							nombre_fichero_fr=$COD_FR"_"$nombre_fichero.txt
							nombre_fichero_en=$COD_EN"_"$nombre_fichero.txt
							nombre_fichero_sp=$COD_SP"_"$nombre_fichero.txt						
							#Crear los 3 ficheros de idiomas por cada script en el directorio adecuado 
							touch $directorio/$nombre_fichero_fr
							touch $directorio/$nombre_fichero_en
							touch $directorio/$nombre_fichero_sp
							#Extraer los comentarios de los scripts (mirar la cabecera de la funcion para ver sus parametros)
							#Usamos las barras \ para que no se interpreten todos los 7 parametros como 1
							leerFicheroYExtraerComentarios $ruta_fichero_original\
											"$directorio/$nombre_fichero_fr"\
								 			$COD_FR\
								 			"$directorio/$nombre_fichero_en"\
								 			$COD_EN\
											"$directorio/$nombre_fichero_sp"\
								 			$COD_SP
						else
							echo -e "${ROJO}Opcion invalida${RESET}"
							break;
						fi					
					done
					volverAlMenuOSalir #Prompt para que el usuario elija si salir o no de la app
					;;
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
function leerFicheroYExtraerComentarios {
	#Useful shit elif [ "$(echo "$linea" | grep -c '#')" -gt 0 ]
  	fichero_origin=$1 #El script original sobre el que se va crear los ficheros relevantes
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
    			#Concatenamos la linea para el script original que contiene la referencia y el texto
    			if [[ "$linea" =~ ^# ]]; then
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
  	done < "$fichero_origin"
  	#Ahora poner las etiquetas en el script original
  	printf "%s\n" "${lineas_script_original[@]}" > "$fichero_origin" #Risky shit :)
} #Fin leerFicheroYExtraerComentarios()

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
                		# Añadimos cada código de idioma obtenido a un array
                		codigo_idiomas+=("$linea_filtrada") # Añadimos cada código encontrado al array
            		done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE}")

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
 	else
 		mostrarErrorYAgregarloAlLogGeneral "No existe ese código de idioma" $FUNCNAME
 		volverAlMenuOSalir
 	fi	
} #Fin regenerarReferencias()

#Function que agrega los errores o aviso a un fichero log en en directorio donde se encuentra el
#script principal
#$1 - mensaje de error
#$2 - Nombre de la función que lanzó el error
function mostrarErrorYAgregarloAlLogGeneral {
	mensaje_error=$1
	nombre_funcion=$2
	fecha_y_hora=$(date)
	#Comprobamos si existe el fichero con la opcion -e
	echo -e "${ROJO}$mensaje_error${RESET}"
	if [[ -e  $FICHERO_LOGS_GENERAL ]];
	then
		echo "$fecha_y_hora : $mensaje_error [Nombre función: $nombre_funcion]" >> $FICHERO_LOGS_GENERAL
	else
		touch $FICHERO_LOGS_GENERAL
		echo "$fecha_y_hora : $mensaje_error [Nombre función: $nombre_funcion]" > $FICHERO_LOGS_GENERAL
	fi
}

#Lo mismo que el leerFicheroYExtraerComentarios, pero esta funcion solo recibe 3 parametros y solo será llamado cuando se agregue un idioma nuevo
function leerFicheroYExtraerComentariosNuevoIdioma {
  	fichero_origin=$1 #El script original sobre el que se va crear los ficheros relevantes
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
  	done < "$fichero_origin"
} #Fin leerFicheroYExtraerComentarios()

function mostrarPresentacion {	
    clear
    echo -e "${CIAN}---------------------------------------${RESET}"
    echo "     PRACTICA DE CONTROL PARTE 2       "
    echo -e "${CIAN}---------------------------------------${RESET}"
    echo -e "Alumno       : Derick Daumienebi Sakpa"
    echo -e "Tutor        : José Manuel Saiz Diez"
    echo -e "Asignatura   : Sistemas Operativos"
    echo -e "Grado        : Ingeniería Informática"
    echo -e "${CIAN}---------------------------------------${RESET}\n"
} #Fin mostrarPresentacion()

#cambioIdiomaScript: SIDE NOTE : Make a function to delete the scripts and leave it like that
#Search for just the number so that it can go to the language files instead of the full reference #XX-YY-
function cambiarIdiomaEnElScript {
	#To change the language to other files, if it already contains codes that are like #SP-10- or something, maybe just
	#get the number to search for it
    	# Volvemos a buscar los ficheros para encontrar cada script y dentro del ese mismo directorio, tenemos los ficheros de traducción
    	find */ -name "$FILTRO_FICHEROS" -type f -print 

    	# Ahora por cada uno de ellos, cogemos su comentario y lo introducimos pero primero preguntamos el idioma

    	# Preguntamos a qué idioma lo quiere traducir el usuario
    	echo -e "\n¿A qué idioma quieres traducir el script? (Indica el código [XY])"
    	mostrarIdiomasDisponibles
    	echo -e -n "${AMARILLO}Código Idioma:${RESET}"
   	 read cod_idioma

    	# Comprobamos si existe el código de idioma, si no existe, la función devuelve 1 si existe y 0 si no
    	existeCodigoIdioma "${cod_idioma}"
    	existe=$? # Obtenemos el resultado del último comando ejecutado

    	if [[ $existe -eq 1 ]]
    	then
        	# Ahora que existe el código, copiamos las referencias del fichero al script
        	echo "Existe el código"
        	IFS=$'\n'
        	# Obtenemos cada script de los subdirectorios
        	for script in $(find */ -name "$FILTRO_FICHEROS" -type f);
        	do
            		nombre_fichero=$(basename ${script%.*})
            		ruta_fichero_original=$script
            		directorio=$(dirname "$ruta_fichero_original")
            		fichero_idioma="$directorio/${cod_idioma^^}_${nombre_fichero}.txt"
            		
            		echo $fichero_idioma
            		echo $ruta_fichero_original

            		# Con la opción -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
            		# Leemos el fichero original y el fichero txt de traducción pero primero miramos si existe el de traducción
            		if [[ -e "$fichero_idioma" ]]; then
                		# Array para guardar las líneas
                		declare -a lineas_referencias=()
                		while IFS= read -r linea_original; do
                    			esLineaValidaComoComentario "$linea_original"
                    			valido=$?
                    			if [[ $valido -eq 1 ]]; then
                        			referencia_a_quitar=$(echo "$linea_original" | grep -o '#[A-Z]\+-[0-9]\+-')
                        			referencia=$(echo "$linea_original" | grep -oP '(?<=-)[0-9]+(?=-)') #numero de referencia
                        			echo "La referencia es: $referencia"
                        			referencia_a_buscar="#"${cod_idioma^^}"-"$referencia"-"
                        			echo $referencia_a_buscar
                        			#Buscamos los que coinciden con la referencia original de la linea y quitamos la parte de la referencia a buscar
                        			#The last part : Toma la salida de grep y utiliza sed para capturar y devolver solo una parte de esa línea.
                        			#working linea_traduccion=$(grep "$referencia_a_buscar" "$fichero_idioma" | sed "s/.*$referencia\(.*\)/\1/")
                        			linea_traduccion=$(grep "$referencia_a_buscar" "$fichero_idioma" | sed -E "s/^.*${referencia}//") #No uncessary language file update
                        			#Eliminar el "-" misterioso que aparece al principio de la linea de traduccion si existe
                        			linea_traduccion=${linea_traduccion#-}
                        			#linea_traduccion=$(grep "$referencia_a_buscar" "$fichero_idioma" | sed -E "s/^.*${referencia_a_buscar}//") #Yes
                        			# Siempre me añade un guion al final por alguna razon asiq a lo guarro...
						#if [ "$linea_traduccion" == "-" ]; then
    						#	linea_traduccion=""
						#fi
                        			#linea_traduccion=$(grep "$referencia" "$fichero_idioma" | sed "s/.*$referencia\(.*\)/\1/")
                        			#linea_traduccion=${linea_pre_traduccion#*-*-} #Cogemos lo que hay depues de los dos guiones #SP-10-
                        			#if [[ -n "$referencia" && -n "$linea_traduccion" ]]; then
                            			if [[ -n "$referencia" ]]; then
                            				#linea_nueva=$(echo "$linea_original" | sed "s/$referencia.*/$referencia$linea_traduccion/")
                            				echo "Good Referencia a buscar : $referencia_a_buscar"
                            				linea_nueva=$(echo "$linea_original" | sed "s/$referencia_a_quitar.*/$referencia_a_buscar$linea_traduccion/")
                            				echo "Línea original: $linea_original"
                            				echo "Línea traducida: $linea_traduccion"
                            				echo "Línea nueva: $linea_nueva"
                        			else
                            				echo "La línea no contiene la referencia esperada: $linea_original"
                            				#echo "$nueva_referencia" >> "$fichero_idioma"
                            				echo "$linea_original" >> "$fichero_idioma" #de momento metemos la linea original y ya
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
                		done < "$ruta_fichero_original"
                		# Escribimos el contenido actualizado de nuevo en el archivo original
                		printf "%s\n" "${lineas_referencias[@]}" > "$ruta_fichero_original" # Risky shit :)
            		else
            			mostrarErrorYAgregarloAlLogGeneral "No se encontraron los ficheros de traducción correspondientes, puede que no estén generados" $FUNCNAME
                		volverAlMenuOSalir
            		fi
        	done
        	volverAlMenuOSalir 
    	else
        	echo -e "${ROJO}No existe ese código de idioma${RESET}"
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
	local num_coincidencias #Contador del número de coincidencias del codigo nuevo con algunos existente, tiene que ser 0 para que sea valido
	local tamanho_codigo #Tamaño del nuevo codigo de idioma
	echo -e "Se procederá a crear las referencias para un idioma nuevo\n"
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
				mostrarErrorYAgregarloAlLogGeneral "Error: Ese codigo de idioma ya existe.\n" $FUNCNAME
				#echo -e "${ROJO}Error: Ese codigo de idioma ya existe.\n${RESET}"
				mostrarIdiomasDisponibles 
			fi
			if [[ $tamanho_codigo -ne 2  ]]
			then
				echo -e "${ROJO}El codigo solo puede contener dos caracteres.\n${RESET}"
			fi
			
        		echo "¿Deseas probar con otro codigo o prefieres salir?"
        		echo "1. Introducir otro codigo"
        		echo "0. Salir"
        		echo -e -n "${AMARILLO}Opcion: ${RESET}"
        		read opcion
        		case $opcion in
            			0)
                			exit 
                			;;
            			1)
                			echo -e "\nIntroduce el Codigo del idioma nuevo,por ejemplo XY (dos caracteres)"
                			echo -e -n "${AMARILLO}Codigo Idioma :${RESET}"
                			read cod_idioma_nuevo
                			tamanho_codigo=${#cod_idioma_nuevo} #volvemos a comprobar el tamaño
                			;;
            			*)
            				mostrarErrorYAgregarloAlLogGeneral "Opcion no valida. Por favor, seleccione 0 o 1" $FUNCNAME
                			;;
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
	for i in $(find */ -name "$FILTRO_FICHEROS" -type f -print); #*/ para buscar solo en los subdirectorios,
	do
		#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado
		nombre_fichero=$(basename ${i%.*}) #Nombre del .sh encontrado, por ejemplo "prueba.sh" devolvería "prueba"
		ruta_fichero_original=$i
		directorio=${ruta_fichero_original%/*} #Extraemos la ruta donde se esta creando cada fichero,cogiendo todo antes de la última "/" porque eso es el directorio
		nombre_fichero_nuevo_idioma=${cod_idioma_nuevo^^}"_"$nombre_fichero.txt #^^ para poner el codigo en mayusculas
		touch $directorio/$nombre_fichero_nuevo_idioma
		#Copiamos el contenido del fichero original a la nueva
		echo "se va copiar el contenido de $ruta_fichero_original a $nombre_fichero_nuevo_idioma"
		#Ahora copiamos las lineas a los ficheros en el idioma
		leerFicheroYExtraerComentariosNuevoIdioma $ruta_fichero_original\
						"$directorio/$nombre_fichero_nuevo_idioma"\
						${cod_idioma_nuevo^^} #^^ para pasar el codigo del idioma en mayusculas
	done
	#Ahora actualizamos el fichero de los idiomas y añadimos el idioma nuevo
	guardarIdiomaNuevo $cod_idioma_nuevo $nombre_idioma_nuevo
} #Fin crearFicheroDeAlmacenamiento()

#Funcion que recible el codigo y nombre de un idioma nuevo y lo añade al final de este mismo script
function guardarIdiomaNuevo {
	cod_idioma_nuevo=$1
	nombre_idioma_nuevo=$2
	echo ""#"$cod_idioma_nuevo"-"$nombre_idioma_nuevo" >> $BASH_SOURCE
} #Fin guardarIdiomaNuevo()

#Lista y añade de recuente al final de todos los idiomas disponibles.
#Nota : Obtiene este dato solo basandose en los que encuentra al final del script, no comprueba los ficheros
function mostrarIdiomasDisponibles {
	contador_idiomas=0
	echo "LINEA_INICIO_IDIOMAS is $LINEA_INICIO_IDIOMAS"
	echo -e "${CIAN}Se han encontrado los siguientes idiomas :${RESET}"
	while IFS= read -r linea;
	do
		linea_filtrada=${linea#*#} #Obtenemos todo lo que venga despues de la # 
		echo -e "\n✅ $linea_filtrada"
		((contador_idiomas++))
		#codigo_idiomas+=("$linea_filtrada") #Añadimos cada código encontrado al array
	done < <(sed -n "${LINEA_INICIO_IDIOMAS},\$p" "${BASH_SOURCE}") #Sustitucion de procesos
	echo -e "${CIAN}$contador_idiomas idiomas disponibles\n${RESET}"	
} #Fin mostrarIdiomasDisponibles()

#Muestra un pequño menu de opciones para que el usuario elija si quiere salir o no 
#(sobre todo despues de realizar una operación)
function volverAlMenuOSalir {
	while : ; 
	do
		echo -e "\nSeleccione una opcion :"
		echo "1. Volver al menu principal"
		echo "0. Salir"
		echo -e -n "${AMARILLO}Opcion :${RESET}"
       	 	read opcion
        	case $opcion in
        		0)
                		exit 
                		;;
            		1)
            			clear
                		mostrarMenuPrincipal
                		;;
            		*)
            			mostrarErrorYAgregarloAlLogGeneral "Opcion no valida. Por favor, seleccione 0 o 1" $FUNCNAME
                		;;
        	esac
	done
} #Fin volverAlMenuOSalir()

#Buscar los ficheros de log de cada directorio y mostrarselo al usuario
function visualizarFicherosLog {
	while : ; 
	do
		echo -e "${CIAN}Selecciona el fichero de log que deseas ver\n${RESET}"
		echo "1. Fichero de logs general"
		echo "2. Fichero de logs por cada idioma"
		echo "0. Salir"
		echo -e -n "${AMARILLO} Opción: ${RESET}"
		read opcion
        	case $opcion in
        		0)
                		exit 
                		;;
            		1)
            			clear
                		cat $FICHERO_LOGS_GENERAL
                		echo -e "${VERDE}FIN DE LOG${RESET}\n"
                		volverAlMenuOSalir
                		break
                		;;
                	2)
            			clear
                		echo "Aun no disponible"
                		;;
            		*)
            			mostrarErrorYAgregarloAlLogGeneral "Por favor, seleccione una opción valida." $FUNCNAME
                		#echo -e "${ROJO}Por favor, seleccione una opción valida.${RESET}" 
                		;;
        	esac
	done
} #Fin visualizarFicherosLog()

#Funcion para simular la carga de una operacion, recibe 2 parametros
#1. El mensaje de carga
#2. El tiempo que deberia quedar cargando


#Eliminar los ficheros de almacenamiento dinamicamente.
#Primero se mostrará un menu de los disponibles al usuario y se borran los ficheros de lenguage elegido
function eliminarFicherosDeAlmacenamiento {
	echo "Borrando mierda ..."
	#Spanish files
	rm ./carpeta1/SP_test.txt
	rm ./hola.sh/SP_3-GestionDeProcesosYMemoria-Paginacion-VirtualYNoVirtual.txt
	rm ./carpeta2/SP_test.txt
	rm ./carpeta2/carpeta3/SP_test.txt
	rm ./carpeta2/carpeta3/carpeta4/SP_test.txt

	#English files
	rm ./carpeta1/EN_test.txt
	rm ./hola.sh/EN_3-GestionDeProcesosYMemoria-Paginacion-VirtualYNoVirtual.txt
	rm ./carpeta2/EN_test.txt
	rm ./carpeta2/carpeta3/EN_test.txt
	rm ./carpeta2/carpeta3/carpeta4/EN_test.txt

	#French files
	rm ./carpeta1/FR_test.txt
	rm ./hola.sh/FR_3-GestionDeProcesosYMemoria-Paginacion-VirtualYNoVirtual.txt
	rm ./carpeta2/FR_test.txt
	rm ./carpeta2/carpeta3/FR_test.txt
	rm ./carpeta2/carpeta3/carpeta4/FR_test.txt
	
	#New files
	rm ./carpeta1/XY_test.txt
	rm ./hola.sh/XY_3-GestionDeProcesosYMemoria-Paginacion-VirtualYNoVirtual.txt
	rm ./carpeta2/XY_test.txt
	rm ./carpeta2/carpeta3/XY_test.txt
	rm ./carpeta2/carpeta3/carpeta4/XY_test.txt
	echo "He borrado todo jefe! :)"
	volverAlMenuOSalir
}

#INICIO DEL PROGRAMA
mostrarPresentacion
mostrarMenuPrincipal

#Zona de idiomas, se obtendrá los idiomas con la linea donde se encuentran,Cuidado con las modificaciones del script,
#si se modifica el script y aumentan / disminuyen las lineas,hay que actualizar el valor de la variable LINEA_ZONA_INICIO_IDIOMAS 
#que se encuentra al principio del fichero. Despues de este comentario se puede ver la primera linea de los códigos de idiomas

#CLAVE_IDIOMAS
#SP-Español
#EN-Ingles
#FR-Frances
#XY-xyz
