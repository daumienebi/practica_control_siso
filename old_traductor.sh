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

#✅❗⏳⌛📁🌐
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
LINEA_INICIO_IDIOMAS=730 #Ver final del fichero para entender esta variable

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
	echo -e "${ROJO}0. Salir${RESET}"
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
	scripts_encontrados=$(find */ -name "$filtro_ficheros" -type f -print | grep -c '') #Sustitucion de comandos y contamos cada linea del find con grep
	find */ -name "$filtro_ficheros" -type f -print #Mostrar los scripts encontrados
	#Si se encuentra 1 o más ficheros, seguimos, si no, es que no se han encontrado scripts en los subdirectorios
	if [[ $scripts_encontrados -lt 1 ]]
	then
		echo -e "${ROJO}No se han encontrado ningún script en los subdirectorios${RESET}"
		volverAlMenuOSalir
	#Later add more options for the case where the files are already created
	else
		#En el caso de no haber salido en la comprobación anterior, se han encontrado scripts, seguimos :
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
    		#linea_sin_espacios=$(echo "$linea" | tr -d ' ')
    		linea_sin_espacios=$(echo "$linea" | sed 's/ //g') #espacio y simbolo global para reemplazar todas las ocurencias
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
#Recibe : La linea de comentario en cuestion, y por cada uno que recibe, devuelve si es válida o no
#Devuelve [1] si es válido es y [0] si no es
function esComentarioValido {
	linea=$1
	#Algunas lineas son #(y espacios), entonces quitamos los espacios a las lineas y si lo que queda al final es solo una #,sabemos que no es un comentario
    	linea_sin_espacios=$(echo "$linea" | tr -d ' ')
    	#linea_sin_espacios=$(echo "$linea" | sed 's/ //g') #espacion y simbolo global para reemplazar todas las ocurencias
	#Contamos el número de almohadillas que hay en la linea porque cuando tiene más de 1,normalmente son las cabeceras
    	num_hashtags=$(echo "$linea" | tr -cd '#' | wc -c)
	
	#Saltamos la linea de bin bash en sus diferentes formas y aplicamos los demás filtros
	if [[ "$linea" == "$bin_bash1" || "$linea" == "$bin_bash2"  || "$linea_sin_espacios" == "#" || $num_hashtags -gt 1 || "$linea" != *#* ]]
	then
		return 0 #No es una linea válida
	else
		return 1 #Es una linea válida
	fi
	
	#Comprobamos si la linea contiene un #
    	#if [[ "$linea" == *#* ]] #No incluir las "" aqui para el *#*,si no,nos buscará que la linea sea exactamente "*#*"	
} #Fin esComentarioValido()

function regenerarReferencias {
	#Preguntamos al usuario en que idioma quiere regenerar las referencias
	mostrarIdiomasDisponibles
	echo "Introduce el código de idioma para realizar la regeneración de referencias"
	echo -e -n "${AMARILLO}Codigo Idioma :${RESET}"
	read cod_idioma
	#Comprobamos si existe el codigo de idioma, si no existe , la funcion existeCodigoIdioma devuelve 1 si existe y 0 si no
 	existeCodigoIdioma "$cod_idioma"
 	existe=$? #Obtenemos el resultado del ultimo comando ejecutado
 	if [[ $existe -eq 1 ]]
 	then
 		#Buscamos los scripts otra vez y actualizamos las referencias por si se ha cambiado
 		echo "Existe el codigo"
 		#Obtener los comentarios de cada script pero intentando ordenarlos y comprobar si nos han insertado alguno nuevo en medio
 		for script in $(find */ -name "$filtro_ficheros" -type f);
 		do
 			echo $script
 		done
 	else
 		volverAlMenuOSalir
 		echo "No existe el codigo"
 	fi	
} #Fin regenerarReferencias()

#Lo mismo que el leerFicheroYExtraerComentarios, pero esta funcion solo recibe 3 parametros y solo será llamado cuando se agregue un idioma nuevo
#
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
    		#linea_sin_espacios=$(echo "$linea" | tr -d ' ')
    		linea_sin_espacios=$(echo "$linea" | sed 's/ //g') #espacion y simbolo global para reemplazar todas las ocurencias
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


function mostrarPresentacion {	
    clear
    echo -e "${CIAN}---------------------------------------${RESET}"
    echo "     PRACTICA DE CONTROL PARTE 2       "
    echo -e "${CIAN}---------------------------------------${RESET}"
    echo "Alumno       : Derick Daumienebi Sakpa"
    echo "Tutor        : José Manuel Saiz Diez"
    echo "Asignatura   : Sistemas Operativos"
    echo "Grado        : Ingeniería Informática"
    echo -e "${CIAN}---------------------------------------${RESET}\n"
} #Fin mostrarPresentacion()

function cambiarIdiomaEnElScript {

    # Volvemos a buscar los ficheros para encontrar cada script y dentro del ese mismo directorio, tenemos los ficheros de traducción
    find */ -name "$filtro_ficheros" -type f -print 

    # Ahora por cada uno de ellos, cogemos su comentario y lo introducimos pero primero preguntamos el idioma
    # Es necesario preguntar en que idioma se encuentran los ficheros?
    # Preguntamos a que idioma lo quiere traducir el usuario
    echo -e "\n¿A qué idioma quieres traducir el script? (Indica el código [XY])"
    mostrarIdiomasDisponibles
    echo -e -n "${AMARILLO}Código Idioma:${RESET}"
    read cod_idioma

    # Comprobamos si existe el código de idioma, si no existe , la función devuelve 1 si existe y 0 si no
    existeCodigoIdioma "${cod_idioma}"
    existe=$? # Obtenemos el resultado del último comando ejecutado

    if [[ $existe -eq 1 ]]; then
        # Ahora que existe el código, copiamos el las referencias del fichero al script
        echo "Existe el código"
        IFS=$'\n'

        # Obtenemos cada sh de los subdirectorios
        for script in $(find */ -name "$filtro_ficheros" -type f); do
            nombre_fichero=$(basename ${script%.*})
            ruta_fichero_original=$script
            directorio=$(dirname "$ruta_fichero_original")
            fichero_idioma="$directorio/${cod_idioma^^}_${nombre_fichero}.txt"

            # Con la opción -r, nos aseguramos de que se lee todo tal cual aparece en el fichero y no se interprete de otra forma, por ejemplo el (\n o \t)
            # Leemos el fichero original y el fichero txt de traducción pero primero miramos si existe el de traducción
            if [[ -e "$fichero_idioma" ]]; then
                # Array para guardar las líneas
                declare -a lineas_referencias=()
                contenido_despues_de_guion=""
                contador_lineas=0
                
                while IFS= read -r linea_original; do
                    contador_lineas=$((contador_lineas+1))
                    esComentarioValido "$linea_original"
                    valido=$?

                    if [[ $valido -eq 1 ]]; then
                        # Comprobamos si la línea contiene la referencia esperada
                        if [[ "${linea_original}" == "#${cod_idioma^^}\-${contador_lineas}\-"* ]]; then
                            # Solo leemos si la línea es válida, para no perder líneas de traducción del txt
                            IFS= read -r linea_traduccion <&3
                            linea_nueva="$linea_traduccion"
                            echo "Línea original: $linea_original"
                            echo "Línea traducida: $linea_traduccion"
                            echo "Línea nueva: $linea_nueva"
                        else
                            # La línea no contiene la referencia esperada
                            # Aquí puedes agregar la línea al archivo de traducción con la referencia correcta
                            echo "La línea no contiene la referencia esperada: $linea_original"
                            # Suponiendo que la referencia correcta se construye aquí:
                            # referencia_correcta="#${cod_idioma^^}-${contador_lineas}-${comentario}"
                            # Agregar la línea al archivo de traducción con la referencia correcta
                        fi
                    else
                        linea_nueva="$linea_original"
                        echo "Línea original: $linea_original"
                        echo "Línea nueva: $linea_nueva"
                    fi

                    # Añadimos la nueva línea al array
                    lineas_referencias+=("$linea_nueva")
                done < "$ruta_fichero_original" 3< "$fichero_idioma"

                # Escribimos el contenido actualizado de nuevo en el archivo original
                printf "%s\n" "${lineas_referencias[@]}" > "$ruta_fichero_original" # Risky shit :)
            else
                echo -e "${ROJO}No se encontraron los ficheros de traducción correspondientes, puede que no estén generados${RESET}"
                volverAlMenuOSalir
            fi
        done

        volverAlMenuOSalir
    else
        echo -e "${ROJO}No existe ese código de idioma${RESET}"
        volverAlMenuOSalir
    fi
}

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
	echo -e "${CIAN}Se han encontrado los siguientes idiomas :${RESET}"
	while IFS= read -r linea;
	do
		linea_filtrada=${linea#*#} #Obtenemos todo lo que venga despues de la # 
		echo -e "\n✅ $linea_filtrada"
		((contador_idiomas++))
		#codigo_idiomas+=("$linea_filtrada") #Añadimos cada código encontrado al array
	done < <(sed -n "$LINEA_INICIO_IDIOMAS,\$p" "${BASH_SOURCE}") #Sustitucion de procesos
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
                		echo -e "${ROJO}Opcion no valida. Por favor, seleccione 0 o 1.${RESET}" 
                		;;
        	esac
	done
} #Fin volverAlMenuOSalir()

#Buscar los ficheros de log de cada directorio y mostrarselo al usuario
function visualizarFicherosLog {
	echo -e "${CIAN}Selecciona el fichero de log que deseas ver${RESET}"
	#Obtenemos los ficheros de logs existentes
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
mostrarPresentacion
mostrarMenuPrincipal

#Zona de idiomas, se obtendrá los idiomas con la linea donde se encuentran, solo sera necesario indicar donde se encuentra la primera linea del codigo de un idioma.
#Cuidado con las modificaciones del script, si se modifica el script y aumentan / disminuyen las lineas,hay que actualizar 
# el valor de la variable LINEA_ZONA_INICIO_IDIOMAS al principio del fichero, y tiene que ser igual al numero de la

##ZONA DE IDIOMAS ### NO MODIFICAR NI AGREGAR CODIGOS DE IDIOMAS A MANO ###
#SP-Español
#EN-Ingles
#FR-Frances
#XY-xyz
