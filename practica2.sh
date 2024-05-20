#!/bin/bash

#Variables de Idiomas por defecto
COD_SP="SP"
COD_EN="EN"
COD_FR="FR"
NUM_ESPANHOL=1;
NUM_INGLES=2;
NUM_FRANCES=3;
declare -A codigo_idiomas #Array donde se almacenará los códigos de idiomas disponibles por defecto

#Otras variables
filtro_ficheros="*.sh"
bin_bash1="#!/bin/bash"
bin_bash2="#!\bin\bash"
inicio_num_lineas=10 
incr_lineas=10 #Incremento de linea
fichero_idiomas="./idiomas.txt" #Fichero de idiomas del mismo directorio

#Colores
RESET="\e[0m" #Reset para volver al color normal despues de haber aplicado un color anteriormente
ROJO="\e[1;31m"
VERDE="\e[1;32m"
CIAN="\e[1;36m"
AMARILLO="\033[1;33m"


#Muestra las opciones del menu principal al usuario
function mostrarMenuPrincipal {
	clear
	# Trying to simulate a do-while
	echo "Selecciona una opcion de (0-5)"
	echo "1. Cargar un nuevo juego de referencias"
	echo "2. Regenerar referencias"
	echo "3. Crear un nuevo fichero de almacenamiento"
	echo "4. Eliminar ficheros de almacenamiento"
	echo "5. Visualizar los ficheros de log"
	echo "6. Cambiar idioma de los scripts"
	echo "0. Salir"
	echo -e -n "${AMARILLO}Opcion: ${RESET}"
	read opcion
	
	while [[ $opcion -lt 0 || $opcion -gt 6 ]]
	do
		echo "Selecciona una opcion de (0-5)"
		echo "1. Cargar un nuevo juego de referencias"
		echo "2. Regenerar referencias"
		echo "3. Crear un nuevo fichero de almacenamiento"
		echo "4. Eliminar ficheros de almacenamiento"
		echo "5. Visualizar los ficheros de log"
		echo "6. Cambiar idioma de los scripts"
		echo "0. Salir"
		echo -e -n "${AMARILLO}Opcion: ${RESET}"
		read opcion
	done
	case $opcion in
		1)
			crearFicheroDeIdiomas
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
	#Preguntamos al usuario el idioma en el que quiere realizar las traducciones
	echo "¿En que idioma deseas crear los ficheros ?"
	echo "$NUM_ESPANHOL. Español (SP)"
	echo "$NUM_INGLES. Inglés  (EN)"
	echo "$NUM_FRANCES. Francés (FR)"
	read opcion_idioma
	#for i in $(find "." -name "$filtro_ficheros" -type f -print); #"." buscaria tanto en el directorio actual como subdirectorios
	for i in $(find */ -name "$filtro_ficheros" -type f -print); #*/ para buscar solo en los subdirectorios,
	do
		#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado
		nombre_fichero=$(basename ${i%.*}) #Obtenemos "prueba.sh" por ejemplo,despues obtenemos todo que que haya anates del "." porque ese será el nombre, por ejemplo "prueba"
		ruta_fichero_original=$i
		directorio=${ruta_fichero_original%/*} #Extraemos la ruta donde se esta creando cada fichero,cogiendo todo antes de la última "/" porque eso es el directorio
		#Ahora generamos los ficheros
		
		#Creamos los ficheros Español (SP)
		if [ $opcion_idioma -eq $NUM_ESPANHOL ] 
		then
			nombre_fichero_sp=$COD_SP"_"$nombre_fichero.txt
			nombre_fichero_en=$COD_EN"_"$nombre_fichero.txt
			nombre_fichero_fr=$COD_FR"_"$nombre_fichero.txt
			#echo "Creando fichero $nombre_fichero..."
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
							 $COD_FR\
		#Creamos los ficheros Ingles (EN)
		elif [ $opcion_idioma -eq $NUM_INGLES ] 
		then
			echo "Creando fichero $nombre_fichero en ingles..."
			
		#Creamos los ficheros Francés (FR)
		elif [ $opcion_idioma -eq $NUM_FRANCES ]
		then
			echo "Creando fichero $nombre_fichero en frances..."
		else
			echo -e "${ROJO}Opcion invalida${RESET}"
			break;
		fi
	done
	volverAlMenuOSalir
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
    		#Saltamos la linea de bin bash en sus diferentes formas
    		if [[ "$linea" == "$bin_bash1" || "$linea" == "$bin_bash2" ]] #[[ ]] Seems to be stronger than [ ]
    		then
    			echo "Saltamos el $bin_bash1 y $bin_bash2"
    			comentario=""
    			continue;
    		#Comprobamos si la linea contien un #
    		elif [[ "$linea" == *#* ]] #No incluir las "" aqui para el *#*,si no,nos buscará que la linea sea exactamente "*#*"
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

function regenerarReferencias {
	#Preguntamos al usuario de que idioma quiere regenerar las referencias
	leerFicheroDeIdiomas
	echo "Introduce el código de idioma para realizar la regeneración de referencias"
	echo -e "${AMARILLO}Codigo Idioma :${RESET}"
	read cod_idioma
	
	#Buscamos los scripts otra vez y actualizamos las referencias por si se ha cambiado
		
} #Fin regenerarReferencias()

function buscarFicherosDeUnIdioma {
	echo "Buscando ficheros"
}

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
  		#Saltamos la linea de bin bash en sus diferentes formas
    		if [[ "$linea" == "$bin_bash1" || "$linea" == "$bin_bash2" ]] #[[ ]] Seems to be stronger than [ ]
    		then
    			#echo "Saltamos el $bin_bash1 y $bin_bash2"
    			comentario=""
    			continue;
    		#Comprobamos si la linea contien un #
    		elif [[ "$linea" == *#* ]] #No incluir las "" aqui para el *#*,si no,nos buscará que la linea sea exactamente "*#*"
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
 	echo "Cambiando idioma del script"
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
	local codigo_idiomas
	#echo "$tamanho_codigo"
	#Obtenemos los códigos de idiomas disponibles del fichero idiomas.txt
	while IFS= read -r linea;
	do
		#Tambien se puede utilizar el awk, pero he estado utilizando este metodo para filtrar
		linea_filtrada=${linea%-*} #Cogemos todo lo que venga antes del "-", con el %, indicamos que se tiene que empezar a mirar por el final
		#Añadimos cada código de idioma obtenido a un array
		codigo_idiomas+=($linea_filtrada) #Añadimos cada código encontrado al array
	done < $fichero_idiomas
	#Comprobamos si el codigo de idioma ya existe
	while : ; do
		num_coincidencias=0 #inicializamos el contador a 0 para resetearlo IMPORTANTE
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
				leerFicheroDeIdiomas	
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
                			echo "Introduce el Codigo del idioma nuevo,por ejemplo XY (dos caracteres)"
                			echo -n "${AMARILLO}Codigo Idioma :${RESET}"
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
	mostrarMensajeDeCarga "Creando las referencias nuevas" 5
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
	echo $cod_idioma_nuevo"-"$nombre_idioma_nuevo >> $fichero_idiomas
}

function leerFicheroDeIdiomas {
	contador_idiomas=0
	echo -e "${CIAN}Se ha encontrado los siguientes idiomas :${RESET}"
	while IFS= read -r linea;
	do
		#Tambien se puede utilizar awk, pero he estado utilizando este metodo para filtrar
		echo $linea
		((contador_idiomas++))
		
	done < $fichero_idiomas
	echo -e "${CIAN}Hay $contador_idiomas idiomas disponibles\n${RESET}"
}

#Crear el fichero de idiomas si no existe, para poder mantener los valores de los códigos de idiomas
function crearFicheroDeIdiomas {
    # Comprobamos si existe el fichero de idiomas antes de crearlo
    if [ -e $fichero_idiomas ]; then
        mostrarMensajeDeCarga "Comprobando fichero de idiomas" 4
    else
        # En este caso no existe, lo creamos e introducimos los valores por defectos de los idiomas
        touch idiomas.txt
        echo "SP-Español" >> idiomas.txt
        echo "EN-Ingles" >> idiomas.txt
        echo "FR-Frances" >> idiomas.txt
    fi
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
                		echo -e "${ROJO}Opcion no valida. Por favor, seleccione 0 o 1.$RESET" 
                		;;
        	esac
	done
}

#Another work around : Get the new code and search for the existence of files that starts with the suffix XY_
#Just incase the external file method is not valid
function comprobarSiExisteCodigoDeIdioma {
	echo "Comprobando"
}

#Buscar los ficheros de log de cada directorio y mostrarselo al usuario
function visualizarFicherosLog {
	#Obtenemos los ficheros de logs existentes
	echo -e "${CIAN}Mostrando ficheros de log${RESET}"
} #Fin crearFicheroDeAlmacenamiento()


#Funcion para simular la carga de una operacion, recibe 2 parametros
#1. El mensaje de carga
#2. El tiempo que deberia quedar cargando
function mostrarMensajeDeCarga {
	local mensaje=$1
	local num_puntos=$2
	echo -e -n "${CIAN}${mensaje}${RESET}"
	for ((i=1; i<= num_puntos;i++))
	do
		echo -n "."
    		sleep 1  # Dormir carajo!
	done
	echo -e ""
}

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
}

#INICIO DEL PROGRAMA
mostrarMenuPrincipal

