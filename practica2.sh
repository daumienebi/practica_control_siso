#!/bin/bash
#✅❗⏳⌛📁
#Variables de Idiomas por defecto
COD_SP="SP"
COD_EN="EN"
COD_FR="FR"
NUM_ESPANHOL=1;
NUM_INGLES=2;
NUM_FRANCES=3;
#declare -A codigo_idiomas #Array donde se almacenará los códigos de idiomas disponibles por defecto
#LINE_NUMBER=$(grep -n "#Zona_Inicio_Idiomas" "$BASH_SOURCE" | cut -d: -f1)
#LINEA_INICIO_IDIOMAS=$((LINE_NUMBER +1))
LINEA_INICIO_IDIOMAS=678 #Ver final del fichero para entender esta variable

#Otras variables
filtro_ficheros="*.sh"
bin_bash1="#!/bin/bash"
bin_bash2="#!\bin\bash"
inicio_num_lineas=10
incr_lineas=10 #Incremento de linea

#Colores
RESET="\e[0m" #Reset para volver al color normal despues de haber aplicado un color anteriormente
ROJO="\e[1;31m"
VERDE="\e[1;32m"
CIAN="\e[1;36m"
AMARILLO="\033[1;33m"

#Muestra las opciones del menu principal al usuario
function mostrarMenuPrincipal {
	#fix this menu to make it an infinite loop of some sort
	clear
	# Trying to simulate a do-while
	echo "Selecciona una opcion de (0-6)"
	echo "1. Cargar un nuevo juego de referencias"
	echo "2. Regenerar referencias"
	echo "3. Crear un nuevo fichero de almacenamiento"
	echo "4. Eliminar ficheros de almacenamiento"
	echo "5. Visualizar los ficheros de log"
	echo "6. Cambiar idioma de los scripts"
	echo -e "${ROJO}0. Salir${RESET}"
	echo -e -n "${AMARILLO}\nOpcion: ${RESET}"
	read opcion
	
	while [[ $opcion -lt 0 || $opcion -gt 6 ]]
	do
		echo "Selecciona una opcion de (0-6)"
		echo "1. Cargar un nuevo juego de referencias"
		echo "2. Regenerar referencias"
		echo "3. Crear un nuevo fichero de almacenamiento"
		echo "4. Eliminar ficheros de almacenamiento"
		echo "5. Visualizar los ficheros de log"
		echo "6. Cambiar idioma de los scripts"
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
		0)	
			echo -e "${VERDE}SE HA SALIDO DEL PROGRAMA!${RESET}"
			exit 1
			;;
		*)
			echo -e "${ROJO}Por favor, selecciona una opción válida${RESET}"
			;;
	esac
	
	#En vez de mostrar el menu aqui otra vez con un bucle, preguntamos a usuario si quiere volver al menu principal o salir
	#Crear una función para eso
	
} #Fin mostrarMenuPrincipal()


#Opcion del menu para crear referencias nuevas
function cargarNuevasReferencias {
	#Primero identificamos los scripts base con los que vamos a trabajar y avisamos al usuario
	#remember the -exec {} in case i need to run a command on the found files directly
	scripts_encontrados=$(find */ -name "$filtro_ficheros" -type f -print | grep -c '') #Sustitucion de comandos y contamos cada linea del find con grep
	find */ -name "$filtro_ficheros" -type f -print #Mostrar los scripts encontrados
	echo -e "${CIAN}Se han encontrado $scripts_encontrados scripts${RESET},¿deseas seguir? [s|n]"
	echo -e -n "${AMARILLO}Seguir :${RESET}"
	read opcion_seguir
	#Comprobar la existencia de los ficheros antes de volver a crearlos
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
	
				#for i in $(find "." -name "$filtro_ficheros" -type f -print); #"." buscaria tanto en el directorio actual como subdirectorios
				for i in $(find */ -name "$filtro_ficheros" -type f); #*/ para buscar solo en los subdirectorios,
				do
					#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado
					#Obtenemos "prueba.sh" por ejemplo,despues obtenemos todo que que haya antes del "." porque ese será el nombre, por ejemplo "prueba"
					nombre_fichero=$(basename ${i%.*}) 
					ruta_fichero_original=$i
					#Luego se puede coger el directorio con dirname
					directorio=${ruta_fichero_original%/*} #Extraemos la ruta donde se esta creando cada fichero,cogiendo todo antes de la última "/" porque eso es el directorio
					#Ahora generamos los ficheros
		
					#Creamos los ficheros Español (SP)
					if [ $opcion_idioma -eq $NUM_ESPANHOL ] 
					then
						#Crear los ficheros txt
						nombre_fichero_sp=$COD_SP"_"$nombre_fichero.txt
						nombre_fichero_en=$COD_EN"_"$nombre_fichero.txt
						nombre_fichero_fr=$COD_FR"_"$nombre_fichero.txt
						#Crear los directorios
						touch $directorio/$nombre_fichero_sp
						touch $directorio/$nombre_fichero_en
						touch $directorio/$nombre_fichero_fr
						#Copiamos el contenido del fichero original a la nueva
						echo "se va copiar el contenido de $ruta_fichero_original a $nombre_fichero_sp"
						#Ahora copiamos las lineas a los ficheros en el idioma
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
						#Crear los ficheros txt
						nombre_fichero_en=$COD_EN"_"$nombre_fichero.txt
						nombre_fichero_sp=$COD_SP"_"$nombre_fichero.txt
						nombre_fichero_fr=$COD_FR"_"$nombre_fichero.txt
						#Crear los directorios
						touch $directorio/$nombre_fichero_en
						touch $directorio/$nombre_fichero_sp
						touch $directorio/$nombre_fichero_fr
						#Copiamos el contenido del fichero original a la nueva
						echo "se va copiar el contenido de $ruta_fichero_original a $nombre_fichero_en"
						#Ahora copiamos las lineas a los ficheros en el idioma
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
						#Crear los ficheros txt
						nombre_fichero_fr=$COD_FR"_"$nombre_fichero.txt
						nombre_fichero_en=$COD_EN"_"$nombre_fichero.txt
						nombre_fichero_sp=$COD_SP"_"$nombre_fichero.txt						
						#Crear los directorios
						touch $directorio/$nombre_fichero_fr
						touch $directorio/$nombre_fichero_en
						touch $directorio/$nombre_fichero_sp
						#Copiamos el contenido del fichero original a la nueva
						echo "se va copiar el contenido de $ruta_fichero_original a $nombre_fichero_fr"
						#Ahora copiamos las lineas a los ficheros en el idioma
						leerFicheroYExtraerComentarios $ruta_fichero_original\
										"$directorio/$nombre_fichero_fr"\
							 			$COD_FR\
							 			"$directorio/$nombre_fichero_en"\
							 			$COD_EN\
										"$directorio/$nombre_fichero_sp"\
							 			$COD_SP &
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
				echo -e "\n${CIAN}Se han encontrado $scripts_encontrados scripts${RESET},¿deseas seguir? [s\n]"
				echo -e "${AMARILLO}Seguir :${RESET}"
				read opcion_seguir
				;;
		esac
	done
} #Fin cargarNuevasReferencias()

#Funcion que recibe el fichero origin, destion y el codigo de idioma en el que hay que crear los scripts
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
  	#Descanso de la mierda anterior
  	contador_lineas=$inicio_num_lineas #Numero inicial de cada linea
  	#Ajustamos el Internal field separator
  	IFS=$'\n'
  	#Ahora leemos el fichero de origin (El .sh sobre el que se crearán las referencias)
  	while IFS= read -r linea; #Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
  	do
  		#Filtro1
    		#Saltamos la linea de bin bash en sus diferentes formas
    		if [[ "$linea" == "$bin_bash1" || "$linea" == "$bin_bash2" ]] #[[ ]] Seems to be stronger than [ ]
    		then
    			echo "Saltamos el $bin_bash1 y $bin_bash2"
    			comentario=""
    			continue;
    		fi
    		#Filtro2
    		#Algunas lineas son #     [y espacios], entonces quitamos los espacios a las lineas y si lo que queda al final es solo una #,sabemos que no es un comentario
    		linea_sin_espacios=$(echo "$linea" | tr -d ' ')
		if [[ "$linea_sin_espacios" == "#" ]]; then
    			comentario=""
    			continue;
		fi
		#Filtro3
    		#Contamos el número de almohadillas que hay en la linea
    		num_hashtags=$(echo "$linea" | tr -cd '#' | wc -c)
    		#Si es > 1, sabemos que probablemente se trate de una cabecera
    		if [[ $num_hashtags -gt 1 ]]; then
    			comentario=""
        		continue;
    		fi
    		#Filtro4
    		#Comprobamos si la linea contien un #
    		if [[ "$linea" == *#* ]] #No incluir las "" aqui para el *#*,si no,nos buscará que la linea sea exactamente "*#*"
    		then
    			linea_filtrada=${linea#*#} #Cogemos todo lo que venga despues de la primera # de la linea
    			comentario="#"$cod_idioma1"-"$contador_lineas"-"$linea_filtrada
    			#Escribimos el contenido en el fichero principal
    			echo $comentario >> $fichero_idioma1 # usamos ">>" para adjuntar cada linea a lo que ya hay en el fichero
    			#Escribimos las referencias vacia en ficheros de otros idiomas
    			#Idioma2
    			comentario="#"$cod_idioma2"-"$contador_lineas"-"
    			echo $comentario >> $fichero_idioma2
    			#Idioma3
    			comentario="#"$cod_idioma3"-"$contador_lineas"-"
    			echo $comentario >> $fichero_idioma3
    			contador_lineas=$((contador_lineas + $incr_lineas)) #El número de lineas del documento tiene que ir de 10 en 10
    		fi
  	done < "$fichero_origin"
} #Fin leerFicheroYExtraerComentarios()

#Comprueba si es un comentario valido
#Devuelve 1 si lo es y 0 si no
#Tercera vez que necesito el mismo trozo de código entonces toca refactorizar
#Tiene que recibir la linea en cuestion, y por cada uno que recibe, devuelve si es válida o no
function esComentarioValido {

	linea=$1
	#linea_sin_espacios=$(echo "$linea" | tr -d ' ')
	#num_hashtags=$(echo "$linea" | tr -cd '#' | wc -c)
	#if [[ "$linea" == "$bin_bash1" || "$linea" == "$bin_bash2"  || "$linea_sin_espacios" == "#" || $num_hashtags -gt 1 ]]
	#then
	#	return 0
	#else
	#	return 1
	#fi
	
  	#Filtro1
    	#Saltamos la linea de bin bash en sus diferentes formas
    	if [[ "$linea" == "$bin_bash1" || "$linea" == "$bin_bash2" ]] #[[ ]] Seems to be stronger than [ ]
    	then
    		return 0
    	fi
    	#Filtro2
   	#Algunas lineas son #     [y espacios], entonces quitamos los espacios a las lineas y si lo que queda al final es solo una #,sabemos que no es un comentario
    	linea_sin_espacios=$(echo "$linea" | tr -d ' ')
	if [[ "$linea_sin_espacios" == "#" ]]; then
    		return 0
	fi
	#Filtro3
    	#Contamos el número de almohadillas que hay en la linea
    	num_hashtags=$(echo "$linea" | tr -cd '#' | wc -c)
    	#Si es > 1, sabemos que probablemente se trate de una cabecera
    	if [[ $num_hashtags -gt 1 ]]; then
    		return 0
    	fi
    	#Filtro4
    	#Comprobamos si la linea contien un #
    	if [[ "$linea" == *#* ]] #No incluir las "" aqui para el *#*,si no,nos buscará que la linea sea exactamente "*#*"
    	then
    		return 1
    	fi
}

function regenerarReferencias {
	#Preguntamos al usuario de que idioma quiere regenerar las referencias
	mostrarIdiomasDisponibles
	echo "Introduce el código de idioma para realizar la regeneración de referencias"
	echo -e "${AMARILLO}Codigo Idioma :${RESET}"
	read cod_idioma
	#Comprobamos si existe el codigo de idioma, si no existe , la funcion existeCodigoIdioma devuelve 1 si existe y 0 si no
 	existeCodigoIdioma "$cod_idioma"
 	existe=$? #Obtenemos el resultado del ultimo comando ejecutado
 	if [[ $existe -eq 1 ]]
 	then
 		#Buscamos los scripts otra vez y actualizamos las referencias por si se ha cambiado
 		echo "Existe el codigo"
 		
 		
 		for i in $(find */ -name "$filtro_ficheros" -type f);
 		do
 			echo $i
 		done
 	else
 		volverAlMenuOSalir
 		echo "No existe el codigo"
 	fi	
} #Fin regenerarReferencias()

#Lo mismo que el leerFicheroYExtraerComentarios, pero esta funcion solo recibe 3 parametros y solo será llamado cuando se agregue un idioma nuevo
function leerFicheroYExtraerComentariosNuevoIdioma {
  	echo "Leyendo ficheros y extrayendo comentarios..."
  	fichero_origin=$1 #El script original sobre el que se va crear los ficheros relevantes
  	#Ficheros del idioma nuevo
  	fichero_idioma_nuevo=$2 #Fichero del idioma nuevo (COD)
  	cod_idioma_nuevo=$3 #Codigo del idioma nuevo
  	#Descanso de la mierda anterior
  	contador_lineas=$inicio_num_lineas #Numero inicial de cada linea
  	#Ajustamos el Internal field separator(IFS)
  	IFS=$'\n'
  	#Ahora leemos el fichero de origin (El .sh sobre el que se crearán las referencias)
  	while IFS= read -r linea;#Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
  	do
  		#Filtro1
    		#Saltamos la linea de bin bash en sus diferentes formas
    		if [[ "$linea" == "$bin_bash1" || "$linea" == "$bin_bash2" ]] #[[ ]] Seems to be stronger than [ ]
    		then
    			echo "Saltamos el $bin_bash1 y $bin_bash2"
    			comentario=""
    			continue;
    		fi
    		#Filtro2
    		#Algunas lineas son #     [y espacios], entonces quitamos los espacios a las lineas y si lo que queda al final es solo una #,sabemos que no es un comentario
    		linea_sin_espacios=$(echo "$linea" | tr -d ' ')
		if [[ "$linea_sin_espacios" == "#" ]]; then
    			comentario=""
    			continue;
		fi
		#Filtro3
    		#Contamos el número de almohadillas que hay en la linea
    		num_hashtags=$(echo "$linea" | tr -cd '#' | wc -c)
    		#Si es > 1, sabemos que probablemente se trate de una cabecera
    		if [[ $num_hashtags -gt 1 ]]; then
    			comentario=""
        		continue;
    		fi
    		#Filtro4
    		#Comprobamos si la linea contien un #
    		if [[ "$linea" == *#* ]] #No incluir las "" aqui para el *#*,si no,nos buscará que la linea sea exactamente "*#*"
    		then
    			comentario="#"$cod_idioma_nuevo"-"$contador_lineas"-"
    			#Escribimos el contenido en el fichero principal
    			echo $comentario >> $fichero_idioma_nuevo # usamos ">>" para adjuntar cada linea a lo que ya hay en el fichero
    			contador_lineas=$((contador_lineas + $incr_lineas)) #El número de lineas del documento tiene que ir de 10 en 10
    		fi
  	done < "$fichero_origin"
} #Fin leerFicheroYExtraerComentarios()


#Cambiar el idioma en el script original 
function cambiarIdiomaEnElScript {
	#Volvemos a buscar los ficheros para encontrar cada script y dentro del ese mismo directorio, tenemos los ficheros de traducción
	find */ -name "$filtro_ficheros" -type f -print 
 	#Ahora por cada uno de ellos, cogemos su comentario y lo introducimos pero primero preguntamos el idioma
 	#Es necesario preguntar en que idioma se encuentran los ficheros?
 	#Preguntamos a que idioma lo quiere traducir el usuario
 	echo -e "\n¿A que idioma quieres traducir el script? (Indica el código [XY])"
 	mostrarIdiomasDisponibles
 	echo -e -n "${AMARILLO}Código Idioma:${RESET}"
 	read cod_idioma
 	#Comprobamos si existe el codigo de idioma, si no existe , la funcion devuelve 1 si existe y 0 si no
 	existeCodigoIdioma "$cod_idioma"
 	existe=$? #Obtenemos el resultado del ultimo comando ejecutado
 	if [[ $existe -eq 1 ]]
 	then
 		#Ahora que existe el código, copiamos el las referencias del fichero al script
 		echo "Existe el codigo"
 		IFS=$'\n'
 		#Obtenemos cada sh de los subdirectorios
 		for script in $(find */ -name "$filtro_ficheros" -type f);
 		do
 			nombre_fichero=$(basename ${script%.*})
			ruta_fichero_original=$script
			directorio=$(dirname "$ruta_fichero_original")
			fichero_idioma="$directorio/${cod_idioma}_${nombre_fichero}.txt"
			#fichero_idioma=$cod_idioma"_"$nombre_fichero.txt
			echo $fichero_idioma
			echo $ruta_fichero_original
			#Con la opcion -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
			#Leemos el fichero original y el fichero txt de traduccion pero primero miramos si existe el de traduccion
		 	if [[ -e "$fichero_idioma" ]]; then
		 	#Array para guardar las lineas
		 	lineas_referencias=()
		 	contenido_depues_de_guion=""
				while IFS= read -r linea_original; do
					esComentarioValido "$linea_original"
					valido=$?
					if [[ $valido -eq 1 ]]; then
				    		#solo leemos si la linea es valida, para no perder lineas de traduccion
				    		IFS= read -r linea_traduccion <&3
				    		linea_nueva="$linea_traduccion"
				    		echo "Linea original: $linea_original"
				   		echo "Linea traducida: $linea_traduccion"
				   		echo "Linea nueva: $linea_nueva"
				   		contenido_depues_de_guion=${linea_traduccion##*-}
				   		if [[ -n $contenido_depues_de_guion ]]
				   		then
				   			echo "Despues : $contenido_depues_de_guion"
				   			#Probamos un filtrado aqui por aqui por si hay lineas sin comentarios
				   			linea_nueva=#${contenido_depues_de_guion}
				   		fi
					else
				    		linea_nueva="$linea_original"
				    		echo "Linea original: $linea_original"
				    		echo "Linea nueva: $linea_nueva"
					fi	
					# Añadimos la nueva línea al array
                    			lineas_referencias+=("$linea_nueva")
			    	done < "$ruta_fichero_original" 3< "$fichero_idioma"
			    	# Escribimos el contenido actualizado de nuevo en el archivo original
                		printf "%s\n" "${lineas_referencias[@]}" > "$ruta_fichero_original"
			else
			    echo -e "${ROJO}No se encontraron los ficheros de traducción correspondientes, puede que no estén generados${RESET}"
			    volverAlMenuOSalir
			fi
 		done
 	else
 		echo -e "${ROJO}No existe ese código de idioma${RESET}"
 		volverAlMenuOSalir
 	fi
}

#Recibe un codigo de idioma como parametro y comprueba si existe
#Devuelve 1 si existe y 0 si no
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
}

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
	#sed -n "$LINEA_INICIO_IDIOMAS,\$p" ${BASH_SOURCE}
	#Obtenemos los códigos de idiomas disponibles al final del propio script, utilizamos $BASH_SOURCE en vez del nombre del script por si se modifica el nombre
	while IFS= read -r linea;
	do
		#Tambien se puede utilizar el awk, pero he estado utilizando este metodo para filtrar
		linea_filtrada=${linea:1:2} #Obtenemos los valores del indice 1 y 2 de la linea, si la linea es #SP-Español, el indice 1:2 = SP
		#Añadimos cada código de idioma obtenido a un array
		codigo_idiomas+=("$linea_filtrada") #Añadimos cada código encontrado al array
	done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE}") #wasnt working without the <<
	
	while : ; do
		num_coincidencias=0 #inicializamos el contador a 0 para resetearlo IMPORTANTE
		#Comprobamos si alguno de los codigos que tenemos coincide con el nuevo
		for cod in ${codigo_idiomas[@]}; do
		if [[ "${cod_idioma_nuevo,,}" == "${cod,,}" ]]
		then
			((num_coincidencias++))
			break;
		fi
		done
		if [[ $num_coincidencias -gt 0 || $tamanho_codigo -ne 2 ]]
		then
			#Mostrar distintos mensajes dependiendo del error
			if [[ $num_coincidencias -gt 0 ]]
			then
				echo -e "${ROJO}Error: Ese codigo de idioma ya existe.\n${RESET}"
				mostrarIdiomasDisponibles 
			fi
			#echo "tamaño : $tamanho_codigo"
			if [[ $tamanho_codigo -ne 2  ]]
			then
				echo -e "${ROJO}El codigo solo puede contener dos caracteres.\n${RESET}"
			fi
			#Comprobar si hay unos ficheros creado con el prefijo del nuevo idioma
			
			
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
                			echo -e "${ROJO}Opcion no valida. Por favor, seleccione 0 o 1.${RESET}" 
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
	mostrarMensajeDeCarga "Creando las referencias nuevas" 4
	#Ahora creamos los nuevos ficheros de referencia generamos los comentarios
	for i in $(find */ -name "$filtro_ficheros" -type f -print); #*/ para buscar solo en los subdirectorios,
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

#Funcion que recible el codigo y nombre de un idioma nuevo y lo almacena en el fichero "idiomas.txt"
function guardarIdiomaNuevo {
	cod_idioma_nuevo=$1
	nombre_idioma_nuevo=$2
	echo ""#"$cod_idioma_nuevo"-"$nombre_idioma_nuevo" >> $BASH_SOURCE
}

function mostrarIdiomasDisponibles {
	contador_idiomas=0
	echo -e "${CIAN}Se han encontrado los siguientes idiomas :${RESET}"
	while IFS= read -r linea;
	do
		linea_filtrada=${linea#*#} #Obtenemos todo lo que venga despues de la # 
		echo -e "\n✅ $linea_filtrada"
		((contador_idiomas++))
		#codigo_idiomas+=("$linea_filtrada") #Añadimos cada código encontrado al array
	done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE}") #Sustitucion de procesos
	echo -e "${CIAN}$contador_idiomas idiomas disponibles\n${RESET}"	
}

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
                		mostrarMenuPrincipal
                		;;
            		*)
                		echo -e "${ROJO}Opcion no valida. Por favor, seleccione 0 o 1.${RESET}" 
                		;;
        	esac
	done
}

#Buscar los ficheros de log de cada directorio y mostrarselo al usuario
function visualizarFicherosLog {
	#Obtenemos los ficheros de logs existentes
	echo -e "${CIAN}Mostrando ficheros de log${RESET}"
} #Fin crearFicheroDeAlmacenamiento()


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
mostrarMenuPrincipal

#Zona de idiomas, se obtendrá los idiomas con la linea donde se encuentra, cuidado con las modificaciones del script, si se modifica el script y aumentan / disminuyen las lineas,
#hay que actualizar el valor de la variable LINEA_ZONA_INICIO_IDIOMAS al principio del fichero.
#Aviso : *explicar el funcionamiento

#ZONA DE IDIOMAS ### NO TOCAR ###
#SP-Español
#EN-Ingles
#FR-Frances
#XY-xyz
