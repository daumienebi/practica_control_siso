#Buscar los scripts de cada subdirectorio debajo de donde se ejecuta el script y genera los ficheros adecuados
#Recibe : el directorio a leer
#Devuelve : el directorio original del los ficheros leidos
function buscarScriptsYGenerarFicheros {
	#for i in $(find "." -name "$filtro_ficheros" -type f -print); #"." buscaria tanto en el directorio actual como subdirectorios
	for i in $(find */ -name "$filtro_ficheros" -type f -print); #*/ para buscar solo en los subdirectorios,
	do
		#Obtenemos el nombre del fichero con 'basename' asi no nos devuelve la ruta relativa del fichero.sh encontrado
		nombre_fichero=$(basename $i) #Nombre del .sh encontrado, prueba.sh por ejemplo
		ruta_fichero_original=$i
		directorio=${ruta_fichero_original%/*} #Extraemos la ruta donde se esta creando cada fichero,cogiendo todo antes de la última "/" porque eso es el directorio
		#Ahora generamos los ficheros
		#Tengo que hacer que esta funcion devuelva un array de las rutas originales, y tras obtener eso,
		#Podré recorrerlo para sacar los directorios y todo lo necesario
	done
}
