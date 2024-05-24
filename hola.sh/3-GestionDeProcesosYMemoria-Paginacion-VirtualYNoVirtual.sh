#!/bin/bash
####################################################################################
#                       
#EN-10-
#EN-20-
#  
####################################################################################
#EN-30-
#EN-40-
#EN-50-
#EN-60-

####################################################################################
#EN-70-
####################################################################################
#EN-80-
#EN-90-
#EN-100-
#EN-110-
#EN-120-
#EN-130-
#EN-140-
#EN-150-
#EN-160-
#EN-170-
#EN-180-
#EN-190-
#EN-200-
#EN-210-
#EN-220-
#EN-230-
#EN-240-
#EN-250-
#EN-260-
#EN-270-
#EN-280-
#EN-290-
#EN-300-
#EN-310-
#EN-320-
#EN-330-
####################################################################################
#EN-340-
####################################################################################
#EN-350-
#EN-360-
#EN-370-
#EN-380-
#EN-390-
#EN-400-
#EN-410-
#EN-420-
#EN-430-
varhuecos="                                                                                     "
varguiones="------------------------------------------------------------------------------------"
varasteriscos="*********************************************************************************"
varfondos="█████████████████████████████████████████████████████████████████████████████████████"
esc=$(echo -en "\033")
RESET=$esc"[0m"

####################################################################################
#EN-440-
####################################################################################
#EN-450-
#EN-460-
#EN-470-
#EN-480-
#EN-490-
#EN-500-
#EN-510-
#EN-520-
amarillo="\033[1;33m";
verde='\e[1;32m';
morado='\e[1;35m';
rojo='\e[1;31m';
cian='\e[1;36m';
gris='\e[1;30m';
azul='\e[1;34m';
blanco='\e[1bold;37m';
NC='\e[0m'; #default	#reset
#EN-530-
coloress=();
#coloress[0]='\e[0;36m' #cian	 		#
coloress[0]='\e[1;36m' 	#cian res		#
coloress[1]='\e[1;32m' 	#verde res    	#
coloress[2]='\e[1;35m' 	#morad res    	#FMAG="\033[0;35m" # foreground magenta
coloress[3]='\e[1;33m' 	#amarillo res  	#
coloress[4]='\e[1;31m' 	#rojo res    	#
#coloress[5]='\e[0;34m' 	#azul 			#FBLE="\033[0;34m" # foreground blue
coloress[5]='\e[1;34m' 	#azul res		#FBLE="\033[1;34m" # foreground blue
coloress[6]='\e[0;33m' 	#amarillo		#FYEL="\033[0;33m" # foreground yellow
coloress[7]='\e[1;36m' 	#cian res		#
coloress[8]='\e[0;31m' 	#rojo			#FRED="\033[0;31m" # foreground red
coloress[9]='\e[1;34m' 	#azul re		#
coloress[10]='\e[0;35m' #morado			#
coloress[11]='\e[1;33m' #amarillo res	#
coloress[12]='\e[1;32m' #verde res		#
coloress[13]='\e[0;36m' #cian			#FCYN="\033[0;36m" # foreground cyan
coloress[14]='\e[1;35m' #morad res		#
coloress[15]='\e[0;32m' #verde			#FGRN="\033[0;32m" # foreground green
coloress[16]='\e[1;31m' #rojo res		#
coloress[97]='\e[1;m' 	#default		#
coloress[98]='\e[0;97m' #blanco			#
#EN-540-

colores[0]='\e[1;36m' 	#cian res		#
colores[1]='\e[1;32m' 	#verde res    	#
colores[2]='\e[1;35m' 	#morad res    	#FMAG="\033[0;35m" # foreground magenta
colores[3]='\e[1;33m' 	#amarillo res  	#
colores[4]='\e[1;31m' 	#rojo res    	#
colores[5]='\e[1;34m' 	#azul res		#FBLE="\033[1;34m" # foreground blue
colorfondo[0]='\e[1;97;46m' 	#colorfondos[0]='\e[0;36;46m' 		#cian			#BCYN="\033[0;46m" # background cyan
colorfondo[1]='\e[1;97;1;42m' 	#colorfondos[1]='\e[1;32;1;42m' 	#verde_res		#
colorfondo[2]='\e[1;97;1;45m' 	#colorfondos[2]='\e[1;35;1;45m' 	#morado_res		#
colorfondo[3]='\e[1;97;1;43m' 	#colorfondos[3]='\e[1;33;1;43m' 	#amarillo_res	#
colorfondo[4]='\e[1;97;1;41m' 	#colorfondos[4]='\e[1;31;1;41m' 	#rojo_res		#
colorfondo[5]='\e[1;97;44m' 	#colorfondos[5]='\e[0;34;44m' 		#azul			#BBLE="\033[0;44m" # background blue


#EN-550-
colorfondo=(); 
colorfondos[0]='\e[1;97;46m' 	#colorfondos[0]='\e[0;36;46m' 		#cian			#BCYN="\033[0;46m" # background cyan
colorfondos[1]='\e[1;97;1;42m' 	#colorfondos[1]='\e[1;32;1;42m' 	#verde_res		#
colorfondos[2]='\e[1;97;1;45m' 	#colorfondos[2]='\e[1;35;1;45m' 	#morado_res		#
colorfondos[3]='\e[1;97;1;43m' 	#colorfondos[3]='\e[1;33;1;43m' 	#amarillo_res	#
colorfondos[4]='\e[1;97;1;41m' 	#colorfondos[4]='\e[1;31;1;41m' 	#rojo_res		#
colorfondos[5]='\e[1;97;44m' 	#colorfondos[5]='\e[0;34;44m' 		#azul			#BBLE="\033[0;44m" # background blue
colorfondos[6]='\e[1;97;43m' 	#colorfondos[6]='\e[0;33;43m' 		#amarillo		#BYEL="\033[0;43m" # background yellow
colorfondos[7]='\e[1;97;1;46m' 	#colorfondos[7]='\e[1;36;1;46m' 	#cian_res		#
colorfondos[8]='\e[1;97;41m' 	#colorfondos[8]='\e[0;31;41m' 		#rojo			#BRED="\033[0;41m" # background red
colorfondos[9]='\e[1;97;1;44m' 	#colorfondos[9]='\e[1;34;1;44m' 	#azul_res		#
colorfondos[10]='\e[1;97;45m' 	#colorfondos[10]='\e[0;35;45m' 		#morado			#BMAG="\033[0;45m" # background magenta
colorfondos[15]='\e[1;97;42m' 	#colorfondos[15]='\e[0;32;42m' 		#verde			#BGRN="\033[0;42m" # background green
colorfondos[98]='\e[97;47m' 	#colorfondos[98]='\e[97;47m' 		#blanco			#BWHT="\033[0;47m" # background white
#EN-560-
#EN-570-
#EN-580-
#EN-590-
#EN-600-
#EN-610-
#EN-620-

#################################################################################
#EN-630-
#################################################################################
#EN-640-
#EN-650-
#EN-660-
#EN-670-
#EN-680-
#EN-690-
#EN-700-
#EN-710-
#EN-720-
#EN-730-
#EN-740-
#EN-750-
#EN-760-
#EN-770-
#EN-780-

#EN-790-
#EN-800-
#EN-810-
#EN-820-
#EN-830-
#EN-840-
#EN-850-
#EN-860-
#EN-870-
#EN-880-
#EN-890-
#EN-900-
#EN-910-
#EN-920-
#EN-930-
#EN-940-
#EN-950-
#EN-960-
#EN-970-
#EN-980-
#EN-990-
#EN-1000-
#EN-1010-
#EN-1020-
#EN-1030-
#EN-1040-
#EN-1050-
#EN-1060-
#EN-1070-
#EN-1080-
#EN-1090-
#EN-1100-
#EN-1110-
#EN-1120-
#EN-1130-
#EN-1140-
#EN-1150-
#EN-1160-
#EN-1170-
#EN-1180-
#EN-1190-
#EN-1200-
#EN-1210-
#EN-1220-
#EN-1230-
#EN-1240-
#EN-1250-
#EN-1260-
#EN-1270-
#EN-1280-
#EN-1290-
#EN-1300-
#EN-1310-
#EN-1320-
#EN-1330-
#EN-1340-
#EN-1350-
#EN-1360-

#EN-1370-
#EN-1380-
#EN-1390-
#EN-1400-
#EN-1410-
#EN-1420-
#EN-1430-
#EN-1440-
#EN-1450-
#EN-1460-
#EN-1470-
#EN-1480-
#EN-1490-
#EN-1500-
#EN-1510-
#EN-1520-
#EN-1530-
#EN-1540-
#EN-1550-
#EN-1560-
#EN-1570-
#EN-1580-
#EN-1590-
#EN-1600-
#EN-1610-
#EN-1620-
#EN-1630-
#EN-1640-
#EN-1650-
declare -A ResuTiempoUltimoCambioClase #NO SE USA AUNQUE SE LE ASIGNAN ALGUNOS DATOS#Resumen - Índices: (proceso). Dato: Ordinal del tiempo de ejecución en el que se hizo el último cambio de clase máxima.
#EN-1660-
#EN-1670-
#EN-1680-
#EN-1690-
#EN-1700-
#EN-1710-
#EN-1720-
#EN-1730-
#EN-1740-

#EN-1750-
#EN-1760-
#EN-1770-
#EN-1780-
#EN-1790-
#EN-1800-
#EN-1810-
#EN-1820-
#EN-1830-
#EN-1840-
#EN-1850-
#EN-1860-
#EN-1870-
#EN-1880-
#EN-1890-

####################################################################################
#EN-1900-
####################################################################################
#EN-1910-
#EN-1920-
#EN-1930-
#EN-1940-
#EN-1950-
#EN-1960-
#EN-1970-

#EN-1980-
#EN-1990-

#EN-2000-
#EN-2010-

#EN-2020-
#EN-2030-

#EN-2040-
#EN-2050-
#EN-2060-

####################################################################################
####################################################################################
#EN-2070-
####################################################################################
#EN-2080-
####################################################################################
function presentacionPantallaInforme {
	clear
	echo -e "$CYAN ################################################################$NC\n"\
	"$CYAN#$NC          Licencia: Creative Commons (CC BY-NC-SA)            $CYAN#$NC\n"\
	"$CYAN#$NC                                                              $CYAN#$NC\n"\
	"$CYAN#$NC          BY - Atribución (BY)                                $CYAN#$NC\n"\
	"$CYAN#$NC          NC - No uso Comercial (NC)                          $CYAN#$NC\n"\
	"$CYAN#$NC          SA - Compartir Igual (SA)                           $CYAN#$NC\n"\
	"$CYAN################################################################$NC\n"\
	"$CYAN################################################################$NC\n"\
	"$CYAN#$NC                        Créditos:                             $CYAN#$NC\n"\
	"$CYAN#$NC                                                              $CYAN#$NC\n"\
	"$CYAN#$NC$ROJO     Algoritmo de Gestión de Procesos:                        $NC$CYAN#$NC\n"\
	"$CYAN#$NC$ROJO           FCFS/SJF/SRPT/Prioridad Mayor y Menor,             $NC$CYAN#$NC\n"\
	"$CYAN#$NC$ROJO           Apropiativo y No Apropiativo                       $NC$CYAN#$NC\n"\
	"$CYAN#$NC$ROJO     Algoritmo de Gestión de Memoria:                         $NC$CYAN#$NC\n"\
	"$CYAN#$NC$ROJO           Memoria Paginada (Continua y No Continua           $NC$CYAN#$NC\n"\
	"$CYAN#$NC$ROJO           Reubicable y No Reubicable)                        $NC$CYAN#$NC\n"\
	"$CYAN#$NC$ROJO     Algoritmo de Paginación:                                 $NC$CYAN#$NC\n"\
	"$CYAN#$NC$ROJO           FIFO + Reloj + Segunda Oportunidad +               $NC$CYAN#$NC\n"\
	"$CYAN#$NC$ROJO           Óptimo + MFU+LFU+NFU + MRU+LRU+NRU                 $NC$CYAN#$NC\n"\
	"$CYAN#$NC                                                              $CYAN#$NC\n"\
	"$CYAN#$NC            Autores: Los alumnos de la asignatura             $CYAN#$NC\n"\
	"$CYAN#$NC                   Sistemas Operativos del                    $CYAN#$NC\n"\
	"$CYAN#$NC         Grado en ingeniería informática (2014-2024)          $CYAN#$NC\n"\
	"$CYAN#$NC                    Universidad de Burgos                     $CYAN#$NC\n"\
	"$CYAN#$NC                                                              $CYAN#$NC\n"\
	"$CYAN#$NC                Tutor: José Manuel Sáiz Diez                  $CYAN#$NC\n"\
	"$CYAN#$NC                                                              $CYAN#$NC\n"\
	"$CYAN################################################################$NC\n" | tee -a $informeConColorTotal #La opción -a lo crea inicialmente
	DIA=$(date +"%d/%m/%Y")
	HORA=$(date +"%H:%M")
	echo -e $NORMAL" ÚLTIMA EJECUCIÓN: $DIA - $HORA\n" | tee -a $informeConColorTotal

	echo -e " ###############################################################\n"\
	"#           Licencia: Creative Commons (CC BY-NC-SA)          #\n"\
	"#                                                             #\n"\
	"#           BY - Atribución (BY)                              #\n"\
	"#           NC - No uso Comercial (NC)                        #\n"\
	"#           SA - Compartir Igual (SA)                         #\n"\
	"###############################################################\n"\
	"###############################################################\n"\
	"#                        Créditos:                            #\n"\
	"#                                                             #\n"\
	"#      Algoritmo de Gestión de Procesos:                      #\n"\
	"#            FCFS/SJF/SRPT/Prioridad Mayor y Menor,           #\n"\
	"#            Apropiativo y No Apropiativo                     #\n"\
	"#      Algoritmo de Gestión de Memoria:                       #\n"\
	"#            Memoria Paginada (Continua y No Continua         #\n"\
	"#            Reubicable y No Reubicable)                      #\n"\
	"#      Algoritmo de Paginación:                               #\n"\
	"#            FIFO + Reloj + Segunda Oportunidad +             #\n"\
	"#            Óptimo + MFU+LFU+NFU + MRU+LRU+NRU               #\n"\
	"#                                                             #\n"\
	"#           Autores: Los alumnos de la asignatura             #\n"\
	"#                  Sistemas Operativos del                    #\n"\
	"#        Grado en ingeniería informática (2014-2024)          #\n"\
	"#                   Universidad de Burgos                     #\n"\
	"#                                                             #\n"\
	"#              Tutor: José Manuel Sáiz Diez                   #\n"\
	"#                                                             #\n"\
	"###############################################################\n" > $informeSinColorTotal #La opción > lo crea inicialmente
	DIA=$(date +"%d/%m/%Y")
	HORA=$(date +"%H:%M")
	echo -e " ÚLTIMA EJECUCIÓN: $DIA - $HORA\n" >> $informeSinColorTotal

	echo -ne $ROJO"\n\n Pulsa ENTER para continuar "$NORMAL
	read enter
}

####################################################################################
#EN-2090-
####################################################################################
function cabecerainicio {
	echo -e "\n$CYAN ############################################################################$NC\n"\
	"$CYAN#$NC                                                                          $CYAN#$NC\n"\
	"$CYAN#$NC$AZUL  GESTIÓN DE PROCESOS: FCFS/SJF/SRPT/Prioridad Mayor y Menor/Round-Robin $NC $CYAN#$NC\n"\
	"$CYAN#$NC$AZUL  GESTIÓN DE MEMORIA: MEMORIA PAGINADA $NC                                   $CYAN#$NC\n"\
	"$CYAN#$NC                                                                          $CYAN#$NC\n"\
	"$CYAN############################################################################$NC\n" | tee -a $informeConColorTotal
	echo -e "\n ##############################################################################\n"\
	"#                                                                            #\n"\
	"#   GESTIÓN DE PROCESOS: FCFS/SJF/SRPT/Prioridad Mayor y Menor/Round-Robin   #\n"\
	"#   GESTIÓN DE MEMORIA: MEMORIA PAGINADA                                     #\n"\
	"#                                                                            #\n"\
	"##############################################################################\n" >> $informeSinColorTotal
#EN-2100-

####################################################################################
#EN-2110-
####################################################################################
function menuInicio {
#EN-2120-
	cabecerainicio
	echo -ne "\n MENÚ INICIO\n"\
	"\n  1. Ejecutar el algoritmo - Memoria NO Virtual - Paginación Simple\n"\
	"\n  2. Ejecutar el algoritmo - Memoria Virtual - Paginación - Algoritmos de Reemplazo de Páginas\n"\
	"\n  3. Menú de ayuda (requiere 'evince' para los ficheros PDF, o 'mplayer' para los ficheros de vídeo)\n"\
	"\n  4. Crear informe de código mediante zshelldoc\n"\
	"\n  5. Salir\n\n  --> " | tee -a $informeConColorTotal $informeSinColorTotal
	read seleccionMenuInicio
	until ([[ $seleccionMenuInicio > 0 && $seleccionMenuInicio < 6 ]]) || [[ $seleccionMenuInicio = 33 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuInicio
		echo -e "$seleccionMenuInicio\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuInicio\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuInicio" in
		'1')
#EN-2130-
#EN-2140-
#EN-2150-
			seleccionAlgoritmoPaginacion=0
#EN-2160-
			;;
		'2')
#EN-2170-
#EN-2180-
#EN-2190-
#EN-2200-
#EN-2210-
			;;
		'3')
#EN-2220-
			;;
		'4')
			echo $0
			echo " El informe resultante es ./zsdoc/$0.adc junto con el subdirectorio ./zsdoc/data." | tee -a $informeConColorTotal
			echo " El informe resultante es ./zsdoc/$0.adc junto con el subdirectorio ./zsdoc/data." >> $informeSinColorTotal
			echo " Si el formato no es el adecuado o para estandarizar ese formato, se puede imprimir o transformar el documento a fichero pdf." | tee -a $informeConColorTotal
			echo " Si el formato no es el adecuado o para estandarizar ese formato, se puede imprimir o transformar el documento a fichero pdf." >> $informeSinColorTotal
#EN-2230-
			exit 0
			;;
		'5')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
		'33')
#EN-2240-
			;;
#EN-2250-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal ;;
	esac
#EN-2260-

####################################################################################
#EN-2270-
####################################################################################
function menuAyuda {
#EN-2280-
	cabecerainicio
	echo -ne "\n MENÚ DE AYUDA\n"\
	"\n  1. Ver documentos de ayuda del en formato PDF desde el listado de problemas (requiere 'evince')\n"\
	"\n  2. Ver documentos de ayuda en formato PDF desde el listado de ficheros (requiere 'evince')\n"\
	"\n  3. Ver documentos de ayuda en formato Vídeo desde el listado de problemas (requiere 'mplayer')\n"\
	"\n  4. Ver documentos de ayuda en formato Vídeo desde el listado de ficheros (requiere 'mplayer')\n"\
	"\n  5. Salir\n\n  --> " | tee -a $informeConColorTotal $informeSinColorTotal
	read seleccionMenuAyuda
	until [[ $seleccionMenuAyuda > 0 && $seleccionMenuAyuda < 6 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuAyuda
		echo -e "$seleccionMenuAyuda\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuAyuda\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuAyuda" in
		'1')
			menuDOCPDF
			;;
#EN-2290-
			echo -e "\n\nFicheros de ayuda existentes en formato PDF:\n$NORMAL" | tee -a $informeConColorTotal
			echo -e "\n\nFicheros de ayuda existentes en formato PDF:\n" >> $informeSinColorTotal 
			files=("./DOCPDF"/*)
#EN-2300-
				echo -e "$i) ${files[$i]}" | tee -a $informeConColorTotal
				echo -e "$i) ${files[$i]}" >> $informeSinColorTotal 
			done
			echo -ne "\n$AMARILLO\n\nIntroduce el número correspondiente al fichero elegido: $NORMAL" | tee -a $informeConColorTotal
			echo -ne "\n\n\nIntroduce el número correspondiente al fichero elegido: " >> $informeSinColorTotal 
			read -r numeroFicheroPDF
#EN-2310-
				echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
				echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
				read -r numeroFicheroPDF
				echo -e "$numeroFicheroPDF\n\n" >> $informeConColorTotal
				echo -e "$numeroFicheroPDF\n\n" >> $informeSinColorTotal
			done
			echo "$numeroFicheroPDF" >> $informeConColorTotal
			echo "$numeroFicheroPDF" >> $informeSinColorTotal
			ficheroParaLecturaPDF="${files[$numeroFicheroPDF]}"
			evince $ficheroParaLecturaPDF
			menuInicio
			;;
		'3')
			menuDOCVideo
			;;
		'4')
			echo -e "\n\nFicheros de ayuda existentes en formato de Vídeo:\n$NORMAL" | tee -a $informeConColorTotal
			echo -e "\n\nFicheros de ayuda existentes en formato de Vídeo:\n" >> $informeSinColorTotal 
			files=("./DOCVideo"/*)
#EN-2320-
				echo -e "$i) ${files[$i]}" | tee -a $informeConColorTotal
				echo -e "$i) ${files[$i]}" >> $informeSinColorTotal 
			done
			echo -ne "\n$AMARILLO\n\nIntroduce el número correspondiente al fichero elegido: $NORMAL" | tee -a $informeConColorTotal
			echo -ne "\n\n\nIntroduce el número correspondiente al fichero elegido: " >> $informeSinColorTotal 
			read -r numeroFicheroVideo
#EN-2330-
				echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
				echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
				read -r numeroFicheroVideo
				echo -e "$numeroFicheroVideo\n\n" >> $informeConColorTotal
				echo -e "$numeroFicheroVideo\n\n" >> $informeSinColorTotal
			done
			echo "$numeroFicheroVideo" >> $informeConColorTotal
			echo "$numeroFicheroVideo" >> $informeSinColorTotal
			ficheroParaLecturaVideo="${files[$numeroFicheroVideo]}"
			mplayer $ficheroParaLecturaVideo
			menuInicio
			;;
		'5')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
#EN-2340-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal ;;
	esac
#EN-2350-

####################################################################################
#EN-2360-
####################################################################################
function menuDOCPDF { 
#EN-2370-
	cabecerainicio
	echo -ne $AMARILLO"\n MENÚ DE ELECCIÓN DE DOCUMENTOS DE AYUDA (Texto en formato PDF - Necesita 'evince')\n"$NORMAL | tee -a $informeConColorTotal
	echo -ne "\n MENÚ DE ELECCIÓN DE DOCUMENTOS DE AYUDA (Texto en formato PDF - Necesita 'evince')\n" >> $informeSinColorTotal
	echo -e "\n  1. FCFS-Paginación-FIFO-Continua-Reubicable (Pendiente)"\
	"\n  2. FCFS-Paginación-FIFO-Continua-No Reubicable"\
	"\n  3. FCFS-Paginación-FIFO-No Continua-Reubicable"\
	"\n  4. FCFS-Paginación-FIFO-No Continua-No Reubicable (Pendiente)"\
	"\n  5. FCFS-Paginación-Reloj-Continua-Reubicable"\
	"\n  6. FCFS-Paginación-Reloj-Continua-No Reubicable"\
	"\n  7. FCFS-Paginación-Reloj-No Continua-Reubicable (Pendiente)"\
	"\n  8. FCFS-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  9. FCFS-Paginación-Segunda Oportunidad-Continua-Reubicable (Pendiente)"\
	"\n  10. FCFS-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  11. FCFS-Paginación-Segunda Oportunidad-No Continua-Reubicable (Pendiente)"\
	"\n  12. FCFS-Paginación-Segunda Oportunidad-No Continua-No Reubicable (Pendiente)"\
	"\n  13. FCFS-Paginación-Óptimo-Continua-Reubicable"\
	"\n  14. FCFS-Paginación-Óptimo-Continua-No Reubicable (Pendiente)"\
	"\n  15. FCFS-Paginación-Óptimo-No Continua-Reubicable (Pendiente)"\
	"\n  16. FCFS-Paginación-Óptimo-No Continua-No Reubicable (Pendiente)"\
	"\n  17. FCFS-Paginación-MFU-Continua-Reubicable (Pendiente)"\
	"\n  18. FCFS-Paginación-MFU-Continua-No Reubicable"\
	"\n  19. FCFS-Paginación-MFU-No Continua-Reubicable"\
	"\n  20. FCFS-Paginación-MFU-No Continua-No Reubicable"\
	"\n  21. FCFS-Paginación-LFU-Continua-Reubicable (Pendiente)"\
	"\n  22. FCFS-Paginación-LFU-Continua-No Reubicable"\
	"\n  23. FCFS-Paginación-LFU-No Continua-Reubicable (Pendiente)"\
	"\n  24. FCFS-Paginación-LFU-No Continua-No Reubicable"\
	"\n  25. FCFS-Paginación-NFU-Continua-Reubicable (Pendiente)"\
	"\n  26. FCFS-Paginación-NFU-Continua-No Reubicable (Pendiente)"\
	"\n  27. FCFS-Paginación-NFU-No Continua-Reubicable (Pendiente)"\
	"\n  28. FCFS-Paginación-NFU-No Continua-No Reubicable"\
	"\n  29. FCFS-Paginación-MRU-Continua-Reubicable (Pendiente)"\
	"\n  30. FCFS-Paginación-MRU-Continua-No Reubicable (Pendiente)"\
	"\n  31. FCFS-Paginación-MRU-No Continua-Reubicable (Pendiente)"\
	"\n  32. FCFS-Paginación-MRU-No Continua-No Reubicable (Pendiente)"\
	"\n  33. FCFS-Paginación-LRU-Continua-Reubicable (Pendiente)"\
	"\n  34. FCFS-Paginación-LRU-Continua-No Reubicable (Pendiente)"\
	"\n  35. FCFS-Paginación-LRU-No Continua-Reubicable (Pendiente)"\
	"\n  36. FCFS-Paginación-LRU-No Continua-No Reubicable"\
	"\n  37. FCFS-Paginación-NRU-Continua-Reubicable (Pendiente)"\
	"\n  38. FCFS-Paginación-NRU-Continua-No Reubicable (Pendiente)"\
	"\n  39. FCFS-Paginación-NRU-No Continua-Reubicable (Pendiente)"\
	"\n  40. FCFS-Paginación-NRU-No Continua-No Reubicable (Pendiente)"\
	"\n  41. SJF-Paginación-FIFO-Continua-Reubicable (Pendiente)"\
	"\n  42. SJF-Paginación-FIFO-Continua-No Reubicable"\
	"\n  43. SJF-Paginación-FIFO-No Continua-Reubicable"\
	"\n  44. SJF-Paginación-FIFO-No Continua-No Reubicable (Pendiente)"\
	"\n  45. SJF-Paginación-Reloj-Continua-Reubicable (Pendiente)"\
	"\n  46. SJF-Paginación-Reloj-Continua-No Reubicable (Pendiente)"\
	"\n  47. SJF-Paginación-Reloj-No Continua-Reubicable (Pendiente)"\
	"\n  48. SJF-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  49. SJF-Paginación-Segunda Oportunidad-Continua-Reubicable (Pendiente)"\
	"\n  50. SJF-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  51. SJF-Paginación-Segunda Oportunidad-No Continua-Reubicable (Pendiente)"\
	"\n  52. SJF-Paginación-Segunda Oportunidad-No Continua-No Reubicable (Pendiente)"\
	"\n  53. SJF-Paginación-Óptimo-Continua-Reubicable"\
	"\n  54. SJF-Paginación-Óptimo-Continua-No Reubicable (Pendiente)"\
	"\n  55. SJF-Paginación-Óptimo-No Continua-Reubicable (Pendiente)"\
	"\n  56. SJF-Paginación-Óptimo-No Continua-No Reubicable (Pendiente)"\
	"\n  57. SJF-Paginación-MFU-Continua-Reubicable (Pendiente)"\
	"\n  58. SJF-Paginación-MFU-Continua-No Reubicable"\
	"\n  59. SJF-Paginación-MFU-No Continua-Reubicable"\
	"\n  60. SJF-Paginación-MFU-No Continua-No Reubicable"\
	"\n  61. SJF-Paginación-LFU-Continua-Reubicable (Pendiente)"\
	"\n  62. SJF-Paginación-LFU-Continua-No Reubicable"\
	"\n  63. SJF-Paginación-LFU-No Continua-Reubicable (Pendiente)"\
	"\n  64. SJF-Paginación-LFU-No Continua-No Reubicable"\
	"\n  65. SJF-Paginación-NFU-Continua-Reubicable (Pendiente)"\
	"\n  66. SJF-Paginación-NFU-Continua-No Reubicable (Pendiente)"\
	"\n  67. SJF-Paginación-NFU-No Continua-Reubicable (Pendiente)"\
	"\n  68. SJF-Paginación-NFU-No Continua-No Reubicable"\
	"\n  69. SJF-Paginación-MRU-Continua-Reubicable (Pendiente)"\
	"\n  70. SJF-Paginación-MRU-Continua-No Reubicable (Pendiente)"\
	"\n  71. SJF-Paginación-MRU-No Continua-Reubicable (Pendiente)"\
	"\n  72. SJF-Paginación-MRU-No Continua-No Reubicable (Pendiente)"\
	"\n  73. SJF-Paginación-LRU-Continua-Reubicable (Pendiente)"\
	"\n  74. SJF-Paginación-LRU-Continua-No Reubicable (Pendiente)"\
	"\n  75. SJF-Paginación-LRU-No Continua-Reubicable (Pendiente)"\
	"\n  76. SJF-Paginación-LRU-No Continua-No Reubicable"\
	"\n  77. SJF-Paginación-NRU-Continua-Reubicable (Pendiente)"\
	"\n  78. SJF-Paginación-NRU-Continua-No Reubicable (Pendiente)"\
	"\n  79. SJF-Paginación-NRU-No Continua-Reubicable (Pendiente)"\
	"\n  80. SJF-Paginación-NRU-No Continua-No Reubicable (Pendiente)"\
	"\n  81. SRPT-Paginación-FIFO-Continua-Reubicable (Pendiente)"\
	"\n  82. SRPT-Paginación-FIFO-Continua-No Reubicable (Pendiente)"\
	"\n  83. SRPT-Paginación-FIFO-No Continua-Reubicable"\
	"\n  84. SRPT-Paginación-FIFO-No Continua-No Reubicable (Pendiente)"\
	"\n  85. SRPT-Paginación-Reloj-Continua-Reubicable (Pendiente)"\
	"\n  86. SRPT-Paginación-Reloj-Continua-No Reubicable (Pendiente)"\
	"\n  87. SRPT-Paginación-Reloj-No Continua-Reubicable (Pendiente)"\
	"\n  88. SRPT-Paginación-Reloj-No Continua-No Reubicable (Pendiente)"\
	"\n  89. SRPT-Paginación-Segunda Oportunidad-Continua-Reubicable (Pendiente)"\
	"\n  90. SRPT-Paginación-Segunda Oportunidad-Continua-No Reubicable (Pendiente)"\
	"\n  91. SRPT-Paginación-Segunda Oportunidad-No Continua-Reubicable"\
	"\n  92. SRPT-Paginación-Segunda Oportunidad-No Continua-No Reubicable"\
	"\n  93. SRPT-Paginación-Óptimo-Continua-Reubicable"\
	"\n  94. SRPT-Paginación-Óptimo-Continua-No Reubicable"\
	"\n  95. SRPT-Paginación-Óptimo-No Continua-Reubicable"\
	"\n  96. SRPT-Paginación-Óptimo-No Continua-No Reubicable"\
	"\n  97. SRPT-Paginación-MFU-Continua-Reubicable"\
	"\n  98. SRPT-Paginación-MFU-Continua-No Reubicable"\
	"\n  99. SRPT-Paginación-MFU-No Continua-Reubicable"\
	"\n  100. SRPT-Paginación-MFU-No Continua-No Reubicable"\
	"\n  101. SRPT-Paginación-LFU-Continua-Reubicable"\
	"\n  102. SRPT-Paginación-LFU-Continua-No Reubicable"\
	"\n  103. SRPT-Paginación-LFU-No Continua-Reubicable"\
	"\n  104. SRPT-Paginación-LFU-No Continua-No Reubicable"\
	"\n  105. SRPT-Paginación-NFU-Continua-Reubicable"\
	"\n  106. SRPT-Paginación-NFU-Continua-No Reubicable"\
	"\n  107. SRPT-Paginación-NFU-No Continua-Reubicable"\
	"\n  108. SRPT-Paginación-NFU-No Continua-No Reubicable"\
	"\n  109. SRPT-Paginación-MRU-Continua-Reubicable"\
	"\n  110. SRPT-Paginación-MRU-Continua-No Reubicable"\
	"\n  111. SRPT-Paginación-MRU-No Continua-Reubicable"\
	"\n  112. SRPT-Paginación-MRU-No Continua-No Reubicable"\
	"\n  113. SRPT-Paginación-LRU-Continua-Reubicable"\
	"\n  114. SRPT-Paginación-LRU-Continua-No Reubicable"\
	"\n  115. SRPT-Paginación-LRU-No Continua-Reubicable"\
	"\n  116. SRPT-Paginación-LRU-No Continua-No Reubicable"\
	"\n  117. SRPT-Paginación-NRU-Continua-Reubicable"\
	"\n  118. SRPT-Paginación-NRU-Continua-No Reubicable"\
	"\n  119. SRPT-Paginación-NRU-No Continua-Reubicable"\
	"\n  120. SRPT-Paginación-NRU-No Continua-No Reubicable"\
	"\n  121. PrioridadMayorMenor-Paginación-FIFO-Continua-Reubicable"\
	"\n  122. PrioridadMayorMenor-Paginación-FIFO-Continua-No Reubicable"\
	"\n  123. PrioridadMayorMenor-Paginación-FIFO-No Continua-Reubicable"\
	"\n  124. PrioridadMayorMenor-Paginación-FIFO-No Continua-No Reubicable"\
	"\n  125. PrioridadMayorMenor-Paginación-Reloj-Continua-Reubicable"\
	"\n  126. PrioridadMayorMenor-Paginación-Reloj-Continua-No Reubicable"\
	"\n  127. PrioridadMayorMenor-Paginación-Reloj-No Continua-Reubicable"\
	"\n  128. PrioridadMayorMenor-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  129. PrioridadMayorMenor-Paginación-Segunda Oportunidad-Continua-Reubicable"\
	"\n  130. PrioridadMayorMenor-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  131. PrioridadMayorMenor-Paginación-Segunda Oportunidad-No Continua-Reubicable"\
	"\n  132. PrioridadMayorMenor-Paginación-Segunda Oportunidad-No Continua-No Reubicable"\
	"\n  133. PrioridadMayorMenor-Paginación-Óptimo-Continua-Reubicable"\
	"\n  134. PrioridadMayorMenor-Paginación-Óptimo-Continua-No Reubicable"\
	"\n  135. PrioridadMayorMenor-Paginación-Óptimo-No Continua-Reubicable"\
	"\n  136. PrioridadMayorMenor-Paginación-Óptimo-No Continua-No Reubicable"\
	"\n  137. PrioridadMayorMenor-Paginación-MFU-Continua-Reubicable"\
	"\n  138. PrioridadMayorMenor-Paginación-MFU-Continua-No Reubicable"\
	"\n  139. PrioridadMayorMenor-Paginación-MFU-No Continua-Reubicable"\
	"\n  140. PrioridadMayorMenor-Paginación-MFU-No Continua-No Reubicable"\
	"\n  141. PrioridadMayorMenor-Paginación-LFU-Continua-Reubicable"\
	"\n  142. PrioridadMayorMenor-Paginación-LFU-Continua-No Reubicable"\
	"\n  143. PrioridadMayorMenor-Paginación-LFU-No Continua-Reubicable"\
	"\n  144. PrioridadMayorMenor-Paginación-LFU-No Continua-No Reubicable"\
	"\n  145. PrioridadMayorMenor-Paginación-NFU-Continua-Reubicable"\
	"\n  146. PrioridadMayorMenor-Paginación-NFU-Continua-No Reubicable"\
	"\n  147. PrioridadMayorMenor-Paginación-NFU-No Continua-Reubicable"\
	"\n  148. PrioridadMayorMenor-Paginación-NFU-No Continua-No Reubicable"\
	"\n  149. PrioridadMayorMenor-Paginación-MRU-Continua-Reubicable"\
	"\n  150. PrioridadMayorMenor-Paginación-MRU-Continua-No Reubicable"\
	"\n  151. PrioridadMayorMenor-Paginación-MRU-No Continua-Reubicable"\
	"\n  152. PrioridadMayorMenor-Paginación-MRU-No Continua-No Reubicable"\
	"\n  153. PrioridadMayorMenor-Paginación-LRU-Continua-Reubicable"\
	"\n  154. PrioridadMayorMenor-Paginación-LRU-Continua-No Reubicable"\
	"\n  155. PrioridadMayorMenor-Paginación-LRU-No Continua-Reubicable"\
	"\n  156. PrioridadMayorMenor-Paginación-LRU-No Continua-No Reubicable"\
	"\n  157. PrioridadMayorMenor-Paginación-NRU-Continua-Reubicable"\
	"\n  158. PrioridadMayorMenor-Paginación-NRU-Continua-No Reubicable"\
	"\n  159. PrioridadMayorMenor-Paginación-NRU-No Continua-Reubicable"\
	"\n  160. PrioridadMayorMenor-Paginación-NRU-No Continua-No Reubicable"\
	"\n  161. Round-Robin(RR)-Paginación-FIFO-Continua-Reubicable"\
	"\n  162. Round-Robin(RR)-Paginación-FIFO-Continua-No Reubicable"\
	"\n  163. Round-Robin(RR)-Paginación-FIFO-No Continua-Reubicable"\
	"\n  164. Round-Robin(RR)-Paginación-FIFO-No Continua-No Reubicable"\
	"\n  165. Round-Robin(RR)-Paginación-Reloj-Continua-Reubicable"\
	"\n  166. Round-Robin(RR)-Paginación-Reloj-Continua-No Reubicable"\
	"\n  167. Round-Robin(RR)-Paginación-Reloj-No Continua-Reubicable"\
	"\n  168. Round-Robin(RR)-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  169. Round-Robin(RR)-Paginación-Segunda Oportunidad-Continua-Reubicable"\
	"\n  170. Round-Robin(RR)-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  171. Round-Robin(RR)-Paginación-Segunda Oportunidad-No Continua-Reubicable"\
	"\n  172. Round-Robin(RR)-Paginación-Segunda Oportunidad-No Continua-No Reubicable"\
	"\n  173. Round-Robin(RR)-Paginación-Óptimo-Continua-Reubicable"\
	"\n  174. Round-Robin(RR)-Paginación-Óptimo-Continua-No Reubicable"\
	"\n  175. Round-Robin(RR)-Paginación-Óptimo-No Continua-Reubicable"\
	"\n  176. Round-Robin(RR)-Paginación-Óptimo-No Continua-No Reubicable"\
	"\n  177. Round-Robin(RR)-Paginación-MFU-Continua-Reubicable"\
	"\n  178. Round-Robin(RR)-Paginación-MFU-Continua-No Reubicable"\
	"\n  179. Round-Robin(RR)-Paginación-MFU-No Continua-Reubicable"\
	"\n  180. Round-Robin(RR)-Paginación-MFU-No Continua-No Reubicable"\
	"\n  181. Round-Robin(RR)-Paginación-LFU-Continua-Reubicable"\
	"\n  182. Round-Robin(RR)-Paginación-LFU-Continua-No Reubicable"\
	"\n  183. Round-Robin(RR)-Paginación-LFU-No Continua-Reubicable"\
	"\n  184. Round-Robin(RR)-Paginación-LFU-No Continua-No Reubicable"\
	"\n  185. Round-Robin(RR)-Paginación-NFU-Continua-Reubicable"\
	"\n  186. Round-Robin(RR)-Paginación-NFU-Continua-No Reubicable"\
	"\n  187. Round-Robin(RR)-Paginación-NFU-No Continua-Reubicable"\
	"\n  188. Round-Robin(RR)-Paginación-NFU-No Continua-No Reubicable"\
	"\n  189. Round-Robin(RR)-Paginación-MRU-Continua-Reubicable"\
	"\n  190. Round-Robin(RR)-Paginación-MRU-Continua-No Reubicable"\
	"\n  191. Round-Robin(RR)-Paginación-MRU-No Continua-Reubicable"\
	"\n  192. Round-Robin(RR)-Paginación-MRU-No Continua-No Reubicable"\
	"\n  193. Round-Robin(RR)-Paginación-LRU-Continua-Reubicable"\
	"\n  194. Round-Robin(RR)-Paginación-LRU-Continua-No Reubicable"\
	"\n  195. Round-Robin(RR)-Paginación-LRU-No Continua-Reubicable"\
	"\n  196. Round-Robin(RR)-Paginación-LRU-No Continua-No Reubicable"\
	"\n  197. Round-Robin(RR)-Paginación-NRU-Continua-Reubicable"\
	"\n  198. Round-Robin(RR)-Paginación-NRU-Continua-No Reubicable"\
	"\n  199. Round-Robin(RR)-Paginación-NRU-No Continua-Reubicable"\
	"\n  200. Round-Robin(RR)-Paginación-NRU-No Continua-No Reubicable"\
	"\n  201. Salir\n  --> " | tee -a $informeConColorTotal $informeSinColorTotal
	read seleccionMenuDOCPDF
	echo -n -e "$seleccionMenuDOCPDF\n\n" >> $informeConColorTotal
	echo -n -e "$seleccionMenuDOCPDF\n\n" >> $informeSinColorTotal

#EN-2380-
	until [[ "0" -lt $seleccionMenuDOCPDF && $seleccionMenuDOCPDF -lt "202" ]];	do
		echo -ne "\n Error en la elección de una opción válida  --> " | tee -a $informeConColorTotal
		echo -ne " Error en la elección de una opción válida  --> " >> $informeSinColorTotal
		read seleccionMenuDOCPDF
		echo -e "$seleccionMenuDOCPDF\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuDOCPDF\n\n" >> $informeSinColorTotal
	done

	if [[ $seleccionMenuDOCPDF -ge 1 && $seleccionMenuDOCPDF -le 200 ]]; then
		if [[ $seleccionMenuDOCPDF -eq 1 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 2 ]]; then evince ./DOCPDF/002-FCFS-SJF-Pag-FIFO-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 3 ]]; then evince ./DOCPDF/003-FCFS-SJF-Pag-FIFO-NC-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 4 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 5 ]]; then evince ./DOCPDF/005-FCFS-SJF-Pag-Reloj-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 6 ]]; then 
			evince ./DOCPDF/006-FCFS-SJF-Pag-Reloj-C-NR-1.pdf
			evince ./DOCPDF/006-FCFS-SJF-Pag-Reloj-C-NR-2.pdf
		elif [[ $seleccionMenuDOCPDF -eq 7 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 8 ]]; then evince ./DOCPDF/008-FCFS-SJF-Pag-Reloj-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 9 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 10 ]]; then evince ./DOCPDF/010-FCFS-SJF-Pag-SegOp-C-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 11 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 12 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 13 ]]; then evince ./DOCPDF/013-FCFS-SJF-Pag-Optimo-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 14 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 15 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 16 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 17 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 18 ]]; then evince ./DOCPDF/018-FCFS-SJF-Pag-MFU-LFU-C-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 19 ]]; then evince ./DOCPDF/019-FCFS-SJF-Pag-MFU-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 20 ]]; then evince ./DOCPDF/018-FCFS-SJF-Pag-MFU-LFU-C-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 21 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 22 ]]; then evince ./DOCPDF/018-FCFS-SJF-Pag-MFU-LFU-C-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 23 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 24 ]]; then 
			evince ./DOCPDF/024-FCFS-SJF-Pag-LFU-NRU-C-NC-NR-1.pdf
			evince ./DOCPDF/024-FCFS-SJF-Pag-LFU-C-NC-NR-2.pdf
			evince ./DOCPDF/018-FCFS-SJF-Pag-MFU-LFU-C-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 25 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 26 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 27 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 28 ]]; then evince ./DOCPDF/028-FCFS-SJF-Pag-NFU-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 29 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 30 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 31 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 32 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 33 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 34 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 35 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 36 ]]; then evince ./DOCPDF/036-FCFS-SJF-Pag-LRU-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 37 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 38 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 39 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 40 ]]; then evince ./DOCPDF/024-FCFS-SJF-Pag-LFU-NRU-C-NC-NR-1.pdf
		elif [[ $seleccionMenuDOCPDF -eq 41 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 42 ]]; then evince ./DOCPDF/002-FCFS-SJF-Pag-FIFO-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 43 ]]; then evince ./DOCPDF/003-FCFS-SJF-Pag-FIFO-NC-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 44 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 45 ]]; then evince ./DOCPDF/005-FCFS-SJF-Pag-Reloj-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 46 ]]; then 
			evince ./DOCPDF/006-FCFS-SJF-Pag-Reloj-C-NR-1.pdf
			evince ./DOCPDF/006-FCFS-SJF-Pag-Reloj-C-NR-2.pdf
		elif [[ $seleccionMenuDOCPDF -eq 47 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 48 ]]; then evince ./DOCPDF/008-FCFS-SJF-Pag-Reloj-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 49 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 50 ]]; then evince ./DOCPDF/010-FCFS-SJF-Pag-SegOp-C-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 51 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 52 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 53 ]]; then evince ./DOCPDF/013-FCFS-SJF-Pag-Optimo-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 54 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 55 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 56 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 57 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 58 ]]; then evince ./DOCPDF/018-FCFS-SJF-Pag-LRU-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 59 ]]; then evince ./DOCPDF/019-FCFS-SJF-Pag-MFU-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 60 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 61 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 62 ]]; then evince ./DOCPDF/022-FCFS-SJF-Pag-LFU-C-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 63 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 64 ]]; then 
			evince ./DOCPDF/024-FCFS-SJF-Pag-LFU-NRU-C-NC-NR-1.pdf
			evince ./DOCPDF/024-FCFS-SJF-Pag-LFU-C-NC-NR-2.pdf
		elif [[ $seleccionMenuDOCPDF -eq 65 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 66 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 67 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 68 ]]; then evince ./DOCPDF/028-FCFS-SJF-Pag-NFU-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 69 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 70 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 71 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 72 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 73 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 74 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 75 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 76 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 77 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 78 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 79 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 80 ]]; then evince ./DOCPDF/024-FCFS-SJF-Pag-LFU-NRU-C-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 81 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 82 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 83 ]]; then evince ./DOCPDF/083-SRPT-Pag-FIFO-NC-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 84 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 85 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 86 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 87 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 88 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 89 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 90 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 91 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 92 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 93 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 94 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 95 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 96 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 97 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 98 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 99 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 100 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 101 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 102 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 103 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 104 ]]; then evince ./DOCPDF/104-SRPT-Pag-LRU-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 105 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 106 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 107 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 108 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 109 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 110 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 111 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 112 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 113 ]]; then evince ./DOCPDF/113-SRPT-Pag-LRU-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 114 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 115 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 116 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 117 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 118 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 119 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 120 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 121 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 122 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 123 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 124 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 125 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 126 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 127 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 128 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 129 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 130 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 131 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 132 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 133 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 134 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 135 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 136 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 137 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 138 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 139 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 140 ]]; then evince ./DOCPDF/140-PRIMayorMenor-Pag-MFU-NC-NR.pdf
		elif [[ $seleccionMenuDOCPDF -eq 141 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 142 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 143 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 144 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 145 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 146 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 147 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 148 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 149 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 150 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 151 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 152 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 153 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 154 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 155 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 156 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 157 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 158 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 159 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 160 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 161 ]]; then evince ./DOCPDF/161-RR-Pag-FIFO-C-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 162 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 163 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 164 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 165 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 166 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 167 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 168 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 169 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 170 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 171 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 172 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 173 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 174 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 175 ]]; then evince ./DOCPDF/175-RR-Pag-Optimo-NC-R.pdf
		elif [[ $seleccionMenuDOCPDF -eq 176 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 177 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 178 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 179 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 180 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 181 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 182 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 183 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 184 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 185 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 186 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 187 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 188 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 189 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 190 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 191 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 192 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 193 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 194 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 195 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 196 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 197 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 198 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 199 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCPDF -eq 200 ]]; then evince ./DOCPDF/ManualDeUsuario.pdf
		fi    
		menuInicio
	elif [[ $seleccionMenuDOCPDF -eq 201 ]]; then
		echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
	else
		echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
		echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
	fi
#EN-2390-

####################################################################################
#EN-2400-
####################################################################################
function menuDOCVideo { 
#EN-2410-
	cabecerainicio
	echo -ne $AMARILLO"\n MENÚ DE ELECCIÓN DE DOCUMENTOS DE AYUDA (Vídeos - Necesita 'mplayer')"$NORMAL | tee -a $informeConColorTotal
	echo -ne "\n MENÚ DE ELECCIÓN DE DOCUMENTOS DE AYUDA (Vídeos - Necesita 'mplayer')" >> $informeSinColorTotal
	echo -e "\n  1. FCFS-Paginación-FIFO-Continua-Reubicable"\
	"\n  2. FCFS-Paginación-FIFO-Continua-No Reubicable"\
	"\n  3. FCFS-Paginación-FIFO-No Continua-Reubicable"\
	"\n  4. FCFS-Paginación-FIFO-No Continua-No Reubicable"\
	"\n  5. FCFS-Paginación-Reloj-Continua-Reubicable"\
	"\n  6. FCFS-Paginación-Reloj-Continua-No Reubicable"\
	"\n  7. FCFS-Paginación-Reloj-No Continua-Reubicable"\
	"\n  8. FCFS-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  9. FCFS-Paginación-Segunda Oportunidad-Continua-Reubicable"\
	"\n  10. FCFS-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  11. FCFS-Paginación-Segunda Oportunidad-No Continua-Reubicable"\
	"\n  12. FCFS-Paginación-Segunda Oportunidad-No Continua-No Reubicable"\
	"\n  13. FCFS-Paginación-Óptimo-Continua-Reubicable"\
	"\n  14. FCFS-Paginación-Óptimo-Continua-No Reubicable"\
	"\n  15. FCFS-Paginación-Óptimo-No Continua-Reubicable"\
	"\n  16. FCFS-Paginación-Óptimo-No Continua-No Reubicable"\
	"\n  17. FCFS-Paginación-MFU-Continua-Reubicable"\
	"\n  18. FCFS-Paginación-MFU-Continua-No Reubicable"\
	"\n  19. FCFS-Paginación-MFU-No Continua-Reubicable"\
	"\n  20. FCFS-Paginación-MFU-No Continua-No Reubicable"\
	"\n  21. FCFS-Paginación-LFU-Continua-Reubicable"\
	"\n  22. FCFS-Paginación-LFU-Continua-No Reubicable"\
	"\n  23. FCFS-Paginación-LFU-No Continua-Reubicable"\
	"\n  24. FCFS-Paginación-LFU-No Continua-No Reubicable"\
	"\n  25. FCFS-Paginación-NFU-Continua-Reubicable"\
	"\n  26. FCFS-Paginación-NFU-Continua-No Reubicable"\
	"\n  27. FCFS-Paginación-NFU-No Continua-Reubicable"\
	"\n  28. FCFS-Paginación-NFU-No Continua-No Reubicable"\
	"\n  29. FCFS-Paginación-MRU-Continua-Reubicable"\
	"\n  30. FCFS-Paginación-MRU-Continua-No Reubicable"\
	"\n  31. FCFS-Paginación-MRU-No Continua-Reubicable"\
	"\n  32. FCFS-Paginación-MRU-No Continua-No Reubicable"\
	"\n  33. FCFS-Paginación-LRU-Continua-Reubicable"\
	"\n  34. FCFS-Paginación-LRU-Continua-No Reubicable"\
	"\n  35. FCFS-Paginación-LRU-No Continua-Reubicable"\
	"\n  36. FCFS-Paginación-LRU-No Continua-No Reubicable"\
	"\n  37. FCFS-Paginación-NRU-Continua-Reubicable"\
	"\n  38. FCFS-Paginación-NRU-Continua-No Reubicable"\
	"\n  39. FCFS-Paginación-NRU-No Continua-Reubicable"\
	"\n  40. FCFS-Paginación-NRU-No Continua-No Reubicable"\
	"\n  41. SJF-Paginación-FIFO-Continua-Reubicable"\
	"\n  42. SJF-Paginación-FIFO-Continua-No Reubicable"\
	"\n  43. SJF-Paginación-FIFO-No Continua-Reubicable"\
	"\n  44. SJF-Paginación-FIFO-No Continua-No Reubicable"\
	"\n  45. SJF-Paginación-Reloj-Continua-Reubicable"\
	"\n  46. SJF-Paginación-Reloj-Continua-No Reubicable"\
	"\n  47. SJF-Paginación-Reloj-No Continua-Reubicable"\
	"\n  48. SJF-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  49. SJF-Paginación-Segunda Oportunidad-Continua-Reubicable"\
	"\n  50. SJF-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  51. SJF-Paginación-Segunda Oportunidad-No Continua-Reubicable"\
	"\n  52. SJF-Paginación-Segunda Oportunidad-No Continua-No Reubicable"\
	"\n  53. SJF-Paginación-Óptimo-Continua-Reubicable"\
	"\n  54. SJF-Paginación-Óptimo-Continua-No Reubicable"\
	"\n  55. SJF-Paginación-Óptimo-No Continua-Reubicable"\
	"\n  56. SJF-Paginación-Óptimo-No Continua-No Reubicable"\
	"\n  57. SJF-Paginación-MFU-Continua-Reubicable"\
	"\n  58. SJF-Paginación-MFU-Continua-No Reubicable"\
	"\n  59. SJF-Paginación-MFU-No Continua-Reubicable"\
	"\n  60. SJF-Paginación-MFU-No Continua-No Reubicable"\
	"\n  61. SJF-Paginación-LFU-Continua-Reubicable"\
	"\n  62. SJF-Paginación-LFU-Continua-No Reubicable"\
	"\n  63. SJF-Paginación-LFU-No Continua-Reubicable"\
	"\n  64. SJF-Paginación-LFU-No Continua-No Reubicable"\
	"\n  65. SJF-Paginación-NFU-Continua-Reubicable"\
	"\n  66. SJF-Paginación-NFU-Continua-No Reubicable"\
	"\n  67. SJF-Paginación-NFU-No Continua-Reubicable"\
	"\n  68. SJF-Paginación-NFU-No Continua-No Reubicable"\
	"\n  69. SJF-Paginación-MRU-Continua-Reubicable"\
	"\n  70. SJF-Paginación-MRU-Continua-No Reubicable"\
	"\n  71. SJF-Paginación-MRU-No Continua-Reubicable"\
	"\n  72. SJF-Paginación-MRU-No Continua-No Reubicable"\
	"\n  73. SJF-Paginación-LRU-Continua-Reubicable"\
	"\n  74. SJF-Paginación-LRU-Continua-No Reubicable"\
	"\n  75. SJF-Paginación-LRU-No Continua-Reubicable"\
	"\n  76. SJF-Paginación-LRU-No Continua-No Reubicable"\
	"\n  77. SJF-Paginación-NRU-Continua-Reubicable"\
	"\n  78. SJF-Paginación-NRU-Continua-No Reubicable"\
	"\n  79. SJF-Paginación-NRU-No Continua-Reubicable"\
	"\n  80. SJF-Paginación-NRU-No Continua-No Reubicable"\
	"\n  81. SRPT-Paginación-FIFO-Continua-Reubicable"\
	"\n  82. SRPT-Paginación-FIFO-Continua-No Reubicable"\
	"\n  83. SRPT-Paginación-FIFO-No Continua-Reubicable"\
	"\n  84. SRPT-Paginación-FIFO-No Continua-No Reubicable"\
	"\n  85. SRPT-Paginación-Reloj-Continua-Reubicable"\
	"\n  86. SRPT-Paginación-Reloj-Continua-No Reubicable"\
	"\n  87. SRPT-Paginación-Reloj-No Continua-Reubicable"\
	"\n  88. SRPT-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  89. SRPT-Paginación-Segunda Oportunidad-Continua-Reubicable"\
	"\n  90. SRPT-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  91. SRPT-Paginación-Segunda Oportunidad-No Continua-Reubicable"\
	"\n  92. SRPT-Paginación-Segunda Oportunidad-No Continua-No Reubicable"\
	"\n  93. SRPT-Paginación-Óptimo-Continua-Reubicable"\
	"\n  94. SRPT-Paginación-Óptimo-Continua-No Reubicable"\
	"\n  95. SRPT-Paginación-Óptimo-No Continua-Reubicable"\
	"\n  96. SRPT-Paginación-Óptimo-No Continua-No Reubicable"\
	"\n  97. SRPT-Paginación-MFU-Continua-Reubicable"\
	"\n  98. SRPT-Paginación-MFU-Continua-No Reubicable"\
	"\n  99. SRPT-Paginación-MFU-No Continua-Reubicable"\
	"\n  100. SRPT-Paginación-MFU-No Continua-No Reubicable"\
	"\n  101. SRPT-Paginación-LFU-Continua-Reubicable"\
	"\n  102. SRPT-Paginación-LFU-Continua-No Reubicable"\
	"\n  103. SRPT-Paginación-LFU-No Continua-Reubicable"\
	"\n  104. SRPT-Paginación-LFU-No Continua-No Reubicable"\
	"\n  105. SRPT-Paginación-NFU-Continua-Reubicable"\
	"\n  106. SRPT-Paginación-NFU-Continua-No Reubicable"\
	"\n  107. SRPT-Paginación-NFU-No Continua-Reubicable"\
	"\n  108. SRPT-Paginación-NFU-No Continua-No Reubicable"\
	"\n  109. SRPT-Paginación-MRU-Continua-Reubicable"\
	"\n  110. SRPT-Paginación-MRU-Continua-No Reubicable"\
	"\n  111. SRPT-Paginación-MRU-No Continua-Reubicable"\
	"\n  112. SRPT-Paginación-MRU-No Continua-No Reubicable"\
	"\n  113. SRPT-Paginación-LRU-Continua-Reubicable"\
	"\n  114. SRPT-Paginación-LRU-Continua-No Reubicable"\
	"\n  115. SRPT-Paginación-LRU-No Continua-Reubicable"\
	"\n  116. SRPT-Paginación-LRU-No Continua-No Reubicable"\
	"\n  117. SRPT-Paginación-NRU-Continua-Reubicable"\
	"\n  118. SRPT-Paginación-NRU-Continua-No Reubicable"\
	"\n  119. SRPT-Paginación-NRU-No Continua-Reubicable"\
	"\n  120. SRPT-Paginación-NRU-No Continua-No Reubicable"\
	"\n  121. PrioridadMayorMenor-Paginación-FIFO-Continua-Reubicable"\
	"\n  122. PrioridadMayorMenor-Paginación-FIFO-Continua-No Reubicable"\
	"\n  123. PrioridadMayorMenor-Paginación-FIFO-No Continua-Reubicable"\
	"\n  124. PrioridadMayorMenor-Paginación-FIFO-No Continua-No Reubicable"\
	"\n  125. PrioridadMayorMenor-Paginación-Reloj-Continua-Reubicable"\
	"\n  126. PrioridadMayorMenor-Paginación-Reloj-Continua-No Reubicable"\
	"\n  127. PrioridadMayorMenor-Paginación-Reloj-No Continua-Reubicable"\
	"\n  128. PrioridadMayorMenor-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  129. PrioridadMayorMenor-Paginación-Segunda Oportunidad-Continua-Reubicable"\
	"\n  130. PrioridadMayorMenor-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  131. PrioridadMayorMenor-Paginación-Segunda Oportunidad-No Continua-Reubicable"\
	"\n  132. PrioridadMayorMenor-Paginación-Segunda Oportunidad-No Continua-No Reubicable"\
	"\n  133. PrioridadMayorMenor-Paginación-Óptimo-Continua-Reubicable"\
	"\n  134. PrioridadMayorMenor-Paginación-Óptimo-Continua-No Reubicable"\
	"\n  135. PrioridadMayorMenor-Paginación-Óptimo-No Continua-Reubicable"\
	"\n  136. PrioridadMayorMenor-Paginación-Óptimo-No Continua-No Reubicable"\
	"\n  137. PrioridadMayorMenor-Paginación-MFU-Continua-Reubicable"\
	"\n  138. PrioridadMayorMenor-Paginación-MFU-Continua-No Reubicable"\
	"\n  139. PrioridadMayorMenor-Paginación-MFU-No Continua-Reubicable"\
	"\n  140. PrioridadMayorMenor-Paginación-MFU-No Continua-No Reubicable"\
	"\n  141. PrioridadMayorMenor-Paginación-LFU-Continua-Reubicable"\
	"\n  142. PrioridadMayorMenor-Paginación-LFU-Continua-No Reubicable"\
	"\n  143. PrioridadMayorMenor-Paginación-LFU-No Continua-Reubicable"\
	"\n  144. PrioridadMayorMenor-Paginación-LFU-No Continua-No Reubicable"\
	"\n  145. PrioridadMayorMenor-Paginación-NFU-Continua-Reubicable"\
	"\n  146. PrioridadMayorMenor-Paginación-NFU-Continua-No Reubicable"\
	"\n  147. PrioridadMayorMenor-Paginación-NFU-No Continua-Reubicable"\
	"\n  148. PrioridadMayorMenor-Paginación-NFU-No Continua-No Reubicable"\
	"\n  149. PrioridadMayorMenor-Paginación-MRU-Continua-Reubicable"\
	"\n  150. PrioridadMayorMenor-Paginación-MRU-Continua-No Reubicable"\
	"\n  151. PrioridadMayorMenor-Paginación-MRU-No Continua-Reubicable"\
	"\n  152. PrioridadMayorMenor-Paginación-MRU-No Continua-No Reubicable"\
	"\n  153. PrioridadMayorMenor-Paginación-LRU-Continua-Reubicable"\
	"\n  154. PrioridadMayorMenor-Paginación-LRU-Continua-No Reubicable"\
	"\n  155. PrioridadMayorMenor-Paginación-LRU-No Continua-Reubicable"\
	"\n  156. PrioridadMayorMenor-Paginación-LRU-No Continua-No Reubicable"\
	"\n  157. PrioridadMayorMenor-Paginación-NRU-Continua-Reubicable"\
	"\n  158. PrioridadMayorMenor-Paginación-NRU-Continua-No Reubicable"\
	"\n  159. PrioridadMayorMenor-Paginación-NRU-No Continua-Reubicable"\
	"\n  160. PrioridadMayorMenor-Paginación-NRU-No Continua-No Reubicable"\
	"\n  161. Round-Robin(RR)-Paginación-FIFO-Continua-Reubicable"\
	"\n  162. Round-Robin(RR)-Paginación-FIFO-Continua-No Reubicable"\
	"\n  163. Round-Robin(RR)-Paginación-FIFO-No Continua-Reubicable"\
	"\n  164. Round-Robin(RR)-Paginación-FIFO-No Continua-No Reubicable"\
	"\n  165. Round-Robin(RR)-Paginación-Reloj-Continua-Reubicable"\
	"\n  166. Round-Robin(RR)-Paginación-Reloj-Continua-No Reubicable"\
	"\n  167. Round-Robin(RR)-Paginación-Reloj-No Continua-Reubicable"\
	"\n  168. Round-Robin(RR)-Paginación-Reloj-No Continua-No Reubicable"\
	"\n  169. Round-Robin(RR)-Paginación-Segunda Oportunidad-Continua-Reubicable"\
	"\n  170. Round-Robin(RR)-Paginación-Segunda Oportunidad-Continua-No Reubicable"\
	"\n  171. Round-Robin(RR)-Paginación-Segunda Oportunidad-No Continua-Reubicable"\
	"\n  172. Round-Robin(RR)-Paginación-Segunda Oportunidad-No Continua-No Reubicable"\
	"\n  173. Round-Robin(RR)-Paginación-Óptimo-Continua-Reubicable"\
	"\n  174. Round-Robin(RR)-Paginación-Óptimo-Continua-No Reubicable"\
	"\n  175. Round-Robin(RR)-Paginación-Óptimo-No Continua-Reubicable"\
	"\n  176. Round-Robin(RR)-Paginación-Óptimo-No Continua-No Reubicable"\
	"\n  177. Round-Robin(RR)-Paginación-MFU-Continua-Reubicable"\
	"\n  178. Round-Robin(RR)-Paginación-MFU-Continua-No Reubicable"\
	"\n  179. Round-Robin(RR)-Paginación-MFU-No Continua-Reubicable"\
	"\n  180. Round-Robin(RR)-Paginación-MFU-No Continua-No Reubicable"\
	"\n  181. Round-Robin(RR)-Paginación-LFU-Continua-Reubicable"\
	"\n  182. Round-Robin(RR)-Paginación-LFU-Continua-No Reubicable"\
	"\n  183. Round-Robin(RR)-Paginación-LFU-No Continua-Reubicable"\
	"\n  184. Round-Robin(RR)-Paginación-LFU-No Continua-No Reubicable"\
	"\n  185. Round-Robin(RR)-Paginación-NFU-Continua-Reubicable"\
	"\n  186. Round-Robin(RR)-Paginación-NFU-Continua-No Reubicable"\
	"\n  187. Round-Robin(RR)-Paginación-NFU-No Continua-Reubicable"\
	"\n  188. Round-Robin(RR)-Paginación-NFU-No Continua-No Reubicable"\
	"\n  189. Round-Robin(RR)-Paginación-MRU-Continua-Reubicable"\
	"\n  190. Round-Robin(RR)-Paginación-MRU-Continua-No Reubicable"\
	"\n  191. Round-Robin(RR)-Paginación-MRU-No Continua-Reubicable"\
	"\n  192. Round-Robin(RR)-Paginación-MRU-No Continua-No Reubicable"\
	"\n  193. Round-Robin(RR)-Paginación-LRU-Continua-Reubicable"\
	"\n  194. Round-Robin(RR)-Paginación-LRU-Continua-No Reubicable"\
	"\n  195. Round-Robin(RR)-Paginación-LRU-No Continua-Reubicable"\
	"\n  196. Round-Robin(RR)-Paginación-LRU-No Continua-No Reubicable"\
	"\n  197. Round-Robin(RR)-Paginación-NRU-Continua-Reubicable"\
	"\n  198. Round-Robin(RR)-Paginación-NRU-Continua-No Reubicable"\
	"\n  199. Round-Robin(RR)-Paginación-NRU-No Continua-Reubicable"\
	"\n  200. Round-Robin(RR)-Paginación-NRU-No Continua-No Reubicable"\
	"\n  201. Salir\n  --> " | tee -a $informeConColorTotal $informeSinColorTotal
	read seleccionMenuDOCVideo
	echo -n -e "$seleccionMenuDOCVideo\n\n" >> $informeConColorTotal
	echo -n -e "$seleccionMenuDOCVideo\n\n" >> $informeSinColorTotal

#EN-2420-
	until [[ "0" -lt $seleccionMenuDOCVideo && $seleccionMenuDOCVideo -lt "202" ]];	do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuDOCVideo
		echo -e "$seleccionMenuDOCVideo\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuDOCVideo\n\n" >> $informeSinColorTotal
	done

	if [[ $seleccionMenuDOCVideo -ge 1 && $seleccionMenuDOCVideo -le 200 ]]; then
		if [[ $seleccionMenuDOCVideo -eq 1 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 2 ]]; then mplayer ./DOCVideo/002-FCFS-SJF-Pag-FIFO-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 3 ]]; then mplayer ./DOCVideo/003-FCFS-SJF-Pag-FIFO-NC-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 4 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 5 ]]; then mplayer ./DOCVideo/005-FCFS-SJF-Pag-Reloj-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 6 ]]; then 
			mplayer ./DOCVideo/006-FCFS-SJF-Pag-Reloj-C-NR-1.mkv
			mplayer ./DOCVideo/006-FCFS-SJF-Pag-Reloj-C-NR-2.mp4
		elif [[ $seleccionMenuDOCVideo -eq 7 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 8 ]]; then mplayer ./DOCVideo/048-FCFS-SJF-Pag-Reloj-NC-NR.mkv
		elif [[ $seleccionMenuDOCVideo -eq 9 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 10 ]]; then mplayer ./DOCVideo/010-FCFS-SJF-Pag-SegOp-C-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 11 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 12 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 13 ]]; then mplayer ./DOCVideo/013-FCFS-SJF-Pag-Optimo-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 14 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 15 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 16 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 17 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 18 ]]; then mplayer ./DOCVideo/018-FCFS-SJF-Pag-MFU-LFU-C-NC-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 19 ]]; then mplayer ./DOCVideo/019-FCFS-SJF-Pag-MFU-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 20 ]]; then mplayer ./DOCVideo/018-FCFS-SJF-Pag-MFU-LFU-C-NC-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 21 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 22 ]]; then mplayer ./DOCVideo/018-FCFS-SJF-Pag-MFU-LFU-C-NC-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 23 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 24 ]]; then 
			mplayer ./DOCVideo/024-FCFS-SJF-Pag-LFU-NRU-C-NC-NR-1.mp4
			mplayer ./DOCVideo/024-FCFS-SJF-Pag-LFU-C-NC-NR-2.mp4
			mplayer ./DOCVideo/018-FCFS-SJF-Pag-MFU-LFU-C-NC-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 25 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 26 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 27 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 28 ]]; then mplayer ./DOCVideo/028-FCFS-SJF-Pag-NFU-NC-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 29 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 30 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 31 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 32 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 33 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 34 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 35 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 36 ]]; then mplayer ./DOCVideo/036-FCFS-SJF-Pag-LRU-NC-NR.mkv
		elif [[ $seleccionMenuDOCVideo -eq 37 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 38 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 39 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 40 ]]; then
			mplayer ./DOCVideo/006-FCFS-SJF-Pag-Reloj-C-NR-1.mkv
			mplayer ./DOCVideo/006-FCFS-SJF-Pag-Reloj-C-NR-2.mp4
		elif [[ $seleccionMenuDOCVideo -eq 41 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 42 ]]; then mplayer ./DOCVideo/002-FCFS-SJF-Pag-FIFO-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 43 ]]; then mplayer ./DOCVideo/003-FCFS-SJF-Pag-FIFO-NC-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 44 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 45 ]]; then mplayer ./DOCVideo/005-FCFS-SJF-Pag-Reloj-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 46 ]]; then mplayer ./DOCVideo/006-FCFS-SJF-Pag-Reloj-C-NR.mkv
		elif [[ $seleccionMenuDOCVideo -eq 47 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 48 ]]; then mplayer ./DOCVideo/048-FCFS-SJF-Pag-Reloj-NC-NR.mkv
		elif [[ $seleccionMenuDOCVideo -eq 49 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 50 ]]; then mplayer ./DOCVideo/010-FCFS-SJF-Pag-SegOp-C-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 51 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 52 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 53 ]]; then mplayer ./DOCVideo/013-FCFS-SJF-Pag-Optimo-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 54 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 55 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 56 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 57 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 58 ]]; then mplayer ./DOCVideo/018-FCFS-SJF-Pag-LRU-NC-NR.mkv
		elif [[ $seleccionMenuDOCVideo -eq 59 ]]; then mplayer ./DOCVideo/019-FCFS-SJF-Pag-MFU-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 60 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 61 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 62 ]]; then mplayer ./DOCVideo/022-FCFS-SJF-Pag-LFU-C-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 63 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 64 ]]; then 
			mplayer ./DOCVideo/024-FCFS-SJF-Pag-LFU-NRU-C-NC-NR-1.mp4
			mplayer ./DOCVideo/024-FCFS-SJF-Pag-LFU-C-NC-NR-2.mp4
		elif [[ $seleccionMenuDOCVideo -eq 65 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 66 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 67 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 68 ]]; then mplayer ./DOCVideo/028-FCFS-SJF-Pag-NFU-NC-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 69 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 70 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 71 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 72 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 73 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 74 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 75 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 76 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 77 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 78 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 79 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 80 ]]; then mplayer ./DOCVideo/024-FCFS-SJF-Pag-LFU-NRU-C-NC-NR-1.mp4
		elif [[ $seleccionMenuDOCVideo -eq 81 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 82 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 83 ]]; then mplayer ./DOCVideo/083-SRPT-Pag-FIFO-NC-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 84 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 85 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 86 ]]; then mplayer ./DOCVideo/086-FCFS-SJF-Pag-Reloj-C-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 87 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 88 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 89 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 90 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 91 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 92 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 93 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 94 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 95 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 96 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 97 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 98 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 99 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 100 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 101 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 102 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 103 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 104 ]]; then 
			mplayer ./DOCVideo/104-SRPT-Pag-LRU-NC-NR-1.mov
			mplayer ./DOCVideo/104-SRPT-Pag-LRU-NC-NR-2.mov
		elif [[ $seleccionMenuDOCVideo -eq 105 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 106 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 107 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 108 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 109 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 110 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 111 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 112 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 113 ]]; then mplayer ./DOCVideo/113-SRPT-Pag-LRU-C-R.mkv
		elif [[ $seleccionMenuDOCVideo -eq 114 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 115 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 116 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 117 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 118 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 119 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 120 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 121 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 122 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 123 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 124 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 125 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 126 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 127 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 128 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 129 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 130 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 131 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 132 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 133 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 134 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 135 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 136 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 137 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 138 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 139 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 140 ]]; then mplayer ./DOCVideo/140-PRIMayorMenor-Pag-MFU-NC-NR.mp4
		elif [[ $seleccionMenuDOCVideo -eq 141 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 142 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 143 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 144 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 145 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 146 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 147 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 148 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 149 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 150 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 151 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 152 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 153 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 154 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 155 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 156 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 157 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 158 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 159 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 160 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 161 ]]; then mplayer ./DOCVideo/161-RR-Pag-FIFO-C-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 162 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 163 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 164 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 165 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 166 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 167 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 168 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 169 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 170 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 171 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 172 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 173 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 174 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 175 ]]; then mplayer ./DOCVideo/175-RR-Pag-Optimo-NC-R.mp4
		elif [[ $seleccionMenuDOCVideo -eq 176 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 177 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 178 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 179 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 180 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 181 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 182 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 183 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 184 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 185 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 186 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 187 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 188 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 189 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 190 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 191 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 192 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 193 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 194 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 195 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 196 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 197 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 198 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 199 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		elif [[ $seleccionMenuDOCVideo -eq 200 ]]; then evince ./DOCVideo/ManualDeUsuario.pdf
		fi    
		menuInicio
	elif [[ $seleccionMenuDOCVideo -eq 201 ]]; then
		echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
	else
		echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
		echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
	fi
#EN-2430-

####################################################################################
#EN-2440-
####################################################################################
function menuAlgoritmoGestionProcesos {
#EN-2450-
	cabecerainicio
	echo -ne $AMARILLO"\n MENÚ DE ELECCIÓN DE ALGORITMO"$NORMAL\
	"\n\n  1. FCFS"\
	"\n\n  2. SJF"\
	"\n\n  3. SRPT"\
	"\n\n  4. Prioridades"\
	"\n\n  5. Round-Robin"\
	"\n\n  6. Salir\n\n  --> " | tee -a $informeConColorTotal
	echo -ne "\n MENÚ DE ELECCIÓN DE ALGORITMO"\
	"\n\n  1. FCFS"\
	"\n\n  2. SJF"\
	"\n\n  3. SRPT"\
	"\n\n  4. Prioridades"\
	"\n\n  5. Round-Robin"\
	"\n\n  6. Salir\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuAlgoritmoGestionProcesos
	echo -ne "$seleccionMenuAlgoritmoGestionProcesos\n\n" >> $informeConColorTotal
	echo -ne "$seleccionMenuAlgoritmoGestionProcesos\n\n" >> $informeSinColorTotal
#EN-2460-
	until [[ 0 -lt $seleccionMenuAlgoritmoGestionProcesos && $seleccionMenuAlgoritmoGestionProcesos -lt 7 ]];   do
		echo -ne "\nError en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\nError en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuAlgoritmoGestionProcesos
		echo -e "$seleccionMenuAlgoritmoGestionProcesos\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuAlgoritmoGestionProcesos\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuAlgoritmoGestionProcesos" in
		'4')
#EN-2470-
#EN-2480-
			;;
	esac
#EN-2490-

####################################################################################
#EN-2500-
####################################################################################
function menuTipoPrioridad { 
#EN-2510-
	cabecerainicio
	echo -ne $AMARILLO"\n MENÚ DE ELECCIÓN DEL TIPO DE PRIORIDAD"$NORMAL\
	"\n\n  1. Prioridad Mayor"\
	"\n\n  2. Prioridad Menor"\
	"\n\n  3. Salir\n\n  --> " | tee -a $informeConColorTotal
	echo -ne "\n MENÚ DE ELECCIÓN DEL TIPO DE PRIORIDAD"\
	"\n\n  1. Prioridad Mayor"\
	"\n\n  2. Prioridad Menor"\
	"\n\n  3. Salir\n\n  --> " >> $informeSinColorTotal
	read seleccionTipoPrioridad
	echo -ne "$seleccionTipoPrioridad\n\n" >> $informeConColorTotal
	echo -ne "$seleccionTipoPrioridad\n\n" >> $informeSinColorTotal
	until [[ 0 -lt $seleccionTipoPrioridad && $seleccionTipoPrioridad -lt 4 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionTipoPrioridad
		echo -e "$seleccionTipoPrioridad\n\n" >> $informeConColorTotal
		echo -e "$seleccionTipoPrioridad\n\n" >> $informeSinColorTotal
	done
	
	if [[ $seleccionTipoPrioridad -eq 1 ]]; then
		PrioR="M"
	elif [[ $seleccionTipoPrioridad -eq 2 ]]; then
		PrioR="m"
	else
		exit 0
	fi
#EN-2520-

####################################################################################
#EN-2530-
#################################################################################### 
function menuApropiatividad { 
#EN-2540-
	cabecerainicio
	echo -ne $AMARILLO"\n MENÚ DE ELECCIÓN DE APROPIATIVIDAD"$NORMAL\
	"\n\n  1. No apropiativo"\
	"\n\n  2. Apropiativo"\
	"\n\n  3. Salir\n\n  --> " | tee -a $informeConColorTotal
	echo -ne "\n MENÚ DE ELECCIÓN DE APROPIATIVIDAD"\
	"\n\n  1. No apropiativo"\
	"\n\n  2. Apropiativo"\
	"\n\n  3. Salir\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuApropiatividad
	echo -ne "$seleccionMenuApropiatividad\n\n" >> $informeConColorTotal
	echo -ne "$seleccionMenuApropiatividad\n\n" >> $informeSinColorTotal
	until [[ 0 -lt $seleccionMenuApropiatividad && $seleccionMenuApropiatividad -lt 4 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuApropiatividad
		echo -e "$seleccionMenuApropiatividad\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuApropiatividad\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuApropiatividad" in
		'1')
			apropiatividadNo0Si1=0 ;;
		'2')
			apropiatividadNo0Si1=1 ;;
		'3')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
#EN-2550-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal ;;
	esac
#EN-2560-

####################################################################################
#EN-2570-
####################################################################################
#EN-2580-
#EN-2590-
	cabecerainicio
	echo -ne $AMARILLO"\n MENÚ DE ELECCIÓN DE REUBICABILIDAD"$NORMAL\
	$AMARILLO"\n\n La elección será aplicable sólo en caso de introducción de datos de forma manual."$NORMAL\
	$AMARILLO"\n\n En caso de introducción de datos a través de fichero se ejecutará tal y como allí esté definido."$NORMAL\
	"\n\n  1. Memoria No Reubicable"\
	"\n\n  2. Memoria Reubicable"\
	"\n\n  3. Salir\n\n  --> " | tee -a $informeConColorTotal
	echo -ne "\n MENÚ DE ELECCIÓN DE REUBICABILIDAD"\
	"\n\n La elección será aplicable sólo en caso de introducción de datos de forma manual."\
	"\n\n En caso de introducción de datos a través de fichero se ejecutará tal y como allí esté definido."\
	"\n\n  1. Memoria No Reubicable"\
	"\n\n  2. Memoria Reubicable"\
	"\n\n  3. Salir\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuReubicabilidad
	echo -ne "$seleccionMenuReubicabilidad\n\n" >> $informeConColorTotal
	echo -ne "$seleccionMenuReubicabilidad\n\n" >> $informeSinColorTotal
#EN-2600-
	until [[ "0" -lt $seleccionMenuReubicabilidad && $seleccionMenuReubicabilidad -lt 4 ]];   do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuReubicabilidad
		echo -e "$seleccionMenuReubicabilidad\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuReubicabilidad\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuReubicabilidad" in
		'1')
			reubicabilidadNo0Si1=0 ;;
		'2')
			reubicabilidadNo0Si1=1 ;;
		'3')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
#EN-2610-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#EN-2620-

####################################################################################
#EN-2630-
####################################################################################
#EN-2640-
#EN-2650-
	cabecerainicio
	echo -ne $AMARILLO"\n\n MENÚ DE ELECCIÓN DE CONTINUIDAD"$NORMAL\
	$AMARILLO"\n\n La elección será aplicable sólo en caso de introducción de datos de forma manual."$NORMAL\
	$AMARILLO"\n\n En caso de introducción de datos a través de fichero se ejecutará tal y como allí esté definido."$NORMAL\
	"\n\n  1. Memoria No Continua"\
	"\n\n  2. Memoria Continua"\
	"\n\n  3. Salir\n\n  --> " | tee -a $informeConColorTotal
	echo -ne "\n\n MENÚ DE ELECCIÓN DE CONTINUIDAD"\
	"\n\n La elección será aplicable sólo en caso de introducción de datos de forma manual."\
	"\n\n En caso de introducción de datos a través de fichero se ejecutará tal y como allí esté definido."\
	"\n\n  1. Memoria No Continua"\
	"\n\n  2. Memoria Continua"\
	"\n\n  3. Salir\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuContinuidad
	echo -ne "$seleccionMenuContinuidad\n\n" >> $informeConColorTotal
	echo -ne "$seleccionMenuContinuidad\n\n" >> $informeSinColorTotal
#EN-2660-
	until [[ 0 -lt $seleccionMenuContinuidad && $seleccionMenuContinuidad -lt 4 ]];   do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuContinuidad
		echo -e "$seleccionMenuContinuidad\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuContinuidad\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuContinuidad" in
		'1')
			continuidadNo0Si1=0 ;;
		'2')
			continuidadNo0Si1=1 ;;
		'3')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
#EN-2670-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#EN-2680-

####################################################################################
#EN-2690-
####################################################################################
function menuAlgoritmoPaginacion { 
#EN-2700-
	cabecerainicio
	echo -ne $AMARILLO"\n\n MENÚ DE ELECCIÓN DEL ALGORITMO DE PAGINACIÓN"$NORMAL\
	$AMARILLO"\n\n La elección será aplicable sólo en caso de introducción de datos de forma manual."$NORMAL\
	$AMARILLO"\n En caso de introducción de datos a través de fichero se ejecutará tal y como allí esté definido."$NORMAL\
	"\n  1. First In First Out (FIFO)"\
	"\n  2. FIFO - Segunda Oportunidad"\
	"\n  3. Reloj"\
	"\n  4. Reloj - Segunda Oportunidad"\
	"\n  5. Óptimo"\
	"\n  6. More Frequently Used (MFU)"\
	"\n  7. Lest Frequently Used (LFU)"\
	"\n  8. No Frequently Used (NFU) sobre MFU"\
	"\n  9. No Frequently Used (NFU) sobre LFU"\
	"\n  10. No Frequently Used (NFU) con clases sobre MFU"\
	"\n  11. No Frequently Used (NFU) con clases sobre LFU"\
	"\n  12. More Recently Used (MRU)"\
	"\n  13. Lest Recently Used (LRU)"\
	"\n  14. No Recently Used (NRU) sobre MRU"\
	"\n  15. No Recently Used (NRU) sobre LRU"\
	"\n  16. No Recently Used (NRU) con clases sobre MRU"\
	"\n  17. No Recently Used (NRU) con clases sobre LRU"\
	"\n  18. Salir\n\n  --> " | tee -a $informeConColorTotal 
	echo -ne "\n\n MENÚ DE ELECCIÓN DEL ALGORITMO DE PAGINACIÓN"\
	"\n La elección será aplicable sólo en caso de introducción de datos de forma manual."\
	"\n En caso de introducción de datos a través de fichero se ejecutará tal y como allí esté definido."\
	"\n  1. First In First Out (FIFO)"\
	"\n  2. FIFO - Segunda Oportunidad"\
	"\n  3. Reloj"\
	"\n  4. Reloj - Segunda Oportunidad"\
	"\n  5. Óptimo"\
	"\n  6. More Frequently Used (MFU)"\
	"\n  7. Lest Frequently Used (LFU)"\
	"\n  8. No Frequently Used (NFU) sobre MFU con límite de frecuencia"\
	"\n  9. No Frequently Used (NFU) sobre LFU con límite de frecuencia"\
	"\n  10. No Frequently Used (NFU) con clases sobre MFU con límite de frecuencia"\
	"\n  11. No Frequently Used (NFU) con clases sobre LFU con límite de frecuencia"\
	"\n  12. More Recently Used (MRU)"\
	"\n  13. Lest Recently Used (LRU)"\
	"\n  14. No Recently Used (NRU) sobre MRU con límite de tiempo de uso"\
	"\n  15. No Recently Used (NRU) sobre LRU con límite de tiempo de uso"\
	"\n  16. No Recently Used (NRU) con clases sobre MRU con límite de tiempo de uso"\
	"\n  17. No Recently Used (NRU) con clases sobre LRU con límite de tiempo de uso"\
	"\n  18. Salir\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuAlgoritmoPaginacion
	echo -ne "$seleccionMenuAlgoritmoPaginacion\n\n" >> $informeConColorTotal
	echo -ne "$seleccionMenuAlgoritmoPaginacion\n\n" >> $informeSinColorTotal
	until [[ 0 -lt $seleccionMenuAlgoritmoPaginacion && $seleccionMenuAlgoritmoPaginacion -lt 19 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuAlgoritmoPaginacion
		echo -e "$seleccionMenuAlgoritmoPaginacion\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuAlgoritmoPaginacion\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuAlgoritmoPaginacion" in
		'1')
#EN-2710-
		'2')
#EN-2720-
		'3')
#EN-2730-
		'4')
#EN-2740-
		'5')
#EN-2750-
		'6')
#EN-2760-
		'7')
#EN-2770-
		'8')
#EN-2780-
#EN-2790-
			;;
		'9')
#EN-2800-
#EN-2810-
			;;
		'10')
#EN-2820-
#EN-2830-
#EN-2840-
#EN-2850-
			;;
		'11')
#EN-2860-
#EN-2870-
#EN-2880-
#EN-2890-
			;;
		'12')
#EN-2900-
		'13')
#EN-2910-
		'14')
#EN-2920-
#EN-2930-
			;;
		'15')
#EN-2940-
#EN-2950-
			;;
		'16')
#EN-2960-
#EN-2970-
#EN-2980-
#EN-2990-
			;;
		'17')
#EN-3000-
#EN-3010-
#EN-3020-
#EN-3030-
			;;
		'18')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
#EN-3040-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal $informeSinColorTotal ;;
	esac
#EN-3050-

####################################################################################
#EN-3060-
####################################################################################
function menuAlgoritmoPaginacion_frecuencia { 
	seleccionAlgoritmoPaginacion_frecuencia_valor=0
	echo -ne $AMARILLO"\n\n Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" >> $informeSinColorTotal
	read seleccionAlgoritmoPaginacion_frecuencia_valor
	echo -ne "$seleccionAlgoritmoPaginacion_frecuencia_valor\n\n" >> $informeConColorTotal
	echo -ne "$seleccionAlgoritmoPaginacion_frecuencia_valor\n\n" >> $informeSinColorTotal
	until [[ seleccionAlgoritmoPaginacion_frecuencia_valor -gt 0 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionAlgoritmoPaginacion_frecuencia_valor
		echo -e "$seleccionAlgoritmoPaginacion_frecuencia_valor\n\n" >> $informeConColorTotal
		echo -e "$seleccionAlgoritmoPaginacion_frecuencia_valor\n\n" >> $informeSinColorTotal
	done
#EN-3070-

####################################################################################
#EN-3080-
####################################################################################
function menuAlgoritmoPaginacion_clases_frecuencia { 
	seleccionAlgoritmoPaginacion_clases_frecuencia_valor=0
	echo -ne $AMARILLO"\n\n Introduce el valor máximo de la frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n Introduce el valor máximo de la frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.: \n$NORMAL" >> $informeSinColorTotal
	read seleccionAlgoritmoPaginacion_clases_frecuencia_valor
	echo -ne "$seleccionAlgoritmoPaginacion_clases_frecuencia_valor\n\n" >> $informeConColorTotal
	echo -ne "$seleccionAlgoritmoPaginacion_clases_frecuencia_valor\n\n" >> $informeSinColorTotal
	until [[ seleccionAlgoritmoPaginacion_clases_frecuencia_valor -gt 0 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionAlgoritmoPaginacion_clases_frecuencia_valor
		echo -e "$seleccionAlgoritmoPaginacion_clases_frecuencia_valor\n\n" >> $informeConColorTotal
		echo -e "$seleccionAlgoritmoPaginacion_clases_frecuencia_valor\n\n" >> $informeSinColorTotal
	done
#EN-3090-

####################################################################################
#EN-3100-
####################################################################################
function menuAlgoritmoPaginacion_uso_rec { 
	seleccionAlgoritmoPaginacion_uso_rec_valor=0
	echo -ne $AMARILLO"\n\n Introduce el valor máximo de la antigüedad, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n Introduce el valor máximo de la antigüedad, a partir de la cual, no será considerada.: \n$NORMAL" >> $informeSinColorTotal
	read seleccionAlgoritmoPaginacion_uso_rec_valor
	echo -ne "$seleccionAlgoritmoPaginacion_uso_rec_valor\n\n" >> $informeConColorTotal
	echo -ne "$seleccionAlgoritmoPaginacion_uso_rec_valor\n\n" >> $informeSinColorTotal
	until [[ seleccionAlgoritmoPaginacion_uso_rec_valor -gt 0 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionAlgoritmoPaginacion_uso_rec_valor
		echo -e "$seleccionAlgoritmoPaginacion_uso_rec_valor\n\n" >> $informeConColorTotal
		echo -e "$seleccionAlgoritmoPaginacion_uso_rec_valor\n\n" >> $informeSinColorTotal
	done
#EN-3110-

####################################################################################
#EN-3120-
####################################################################################
function menuAlgoritmoPaginacion_clases_uso_rec { 
	seleccionAlgoritmoPaginacion_clases_uso_rec_valor=0
	echo -ne $AMARILLO"\n\n Introduce el valor máximo de la antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n Introduce el valor máximo de la antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.: \n$NORMAL" >> $informeSinColorTotal
	read seleccionAlgoritmoPaginacion_clases_uso_rec_valor
	echo -ne "$seleccionAlgoritmoPaginacion_clases_uso_rec_valor\n\n" >> $informeConColorTotal
	echo -ne "$seleccionAlgoritmoPaginacion_clases_uso_rec_valor\n\n" >> $informeSinColorTotal
	until [[ seleccionAlgoritmoPaginacion_clases_uso_rec_valor -gt 0 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionAlgoritmoPaginacion_clases_uso_rec_valor
		echo -e "$seleccionAlgoritmoPaginacion_clases_uso_rec_valor\n\n" >> $informeConColorTotal
		echo -e "$seleccionAlgoritmoPaginacion_clases_uso_rec_valor\n\n" >> $informeSinColorTotal
	done
#EN-3130-

####################################################################################
#EN-3140-
####################################################################################
function menuAlgoritmoPaginacion_clases_valor { 
	seleccionAlgoritmoPaginacion_clases_valor=0
	echo -ne $AMARILLO"\n\n Introduce el valor máximo de unidades de tiempo de antigüedad de ejecución de un proceso, a partir de la cual, una página será considerada como NO referenciada: \n$NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n Introduce el valor máximo de unidades de tiempo de antigüedad de ejecución de un proceso, a partir de la cual, una página será considerada como NO referenciada: \n$NORMAL" >> $informeSinColorTotal
	read seleccionAlgoritmoPaginacion_clases_valor
	echo -ne "$seleccionAlgoritmoPaginacion_clases_valor\n\n" >> $informeConColorTotal
	echo -ne "$seleccionAlgoritmoPaginacion_clases_valor\n\n" >> $informeSinColorTotal
	until [[ seleccionAlgoritmoPaginacion_clases_valor -gt 0 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionAlgoritmoPaginacion_clases_valor
		echo -e "$seleccionAlgoritmoPaginacion_clases_valor\n\n" >> $informeConColorTotal
		echo -e "$seleccionAlgoritmoPaginacion_clases_valor\n\n" >> $informeSinColorTotal
	done
#EN-3150-

####################################################################################
#EN-3160-
####################################################################################
function menuAlgoritmoPaginacion_TiempoConsiderado_valor { 
	seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=0
	echo -ne $AMARILLO"\n\n Introduce el número de unidades de tiempo de ejecución de un proceso, a partir del cual, serán consideradas la frecuencia/tiempo de uso de una página y su clase: \n$NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n Introduce el número de unidades de tiempo de ejecución de un proceso, a partir del cual, serán consideradas la frecuencia/tiempo de uso de una página y su clase: \n$NORMAL" >> $informeSinColorTotal
	read seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado
	echo -ne "$seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado\n\n" >> $informeConColorTotal
	echo -ne "$seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado\n\n" >> $informeSinColorTotal
	until [[ seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado -gt 0 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado
		echo -e "$seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado\n\n" >> $informeConColorTotal
		echo -e "$seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado\n\n" >> $informeSinColorTotal
	done
#EN-3170-

####################################################################################
#EN-3180-
#EN-3190-
####################################################################################
function menuEleccionEntradaDatos {
#EN-3200-
	cabecerainicio
	echo -ne $AMARILLO"\n MENÚ INICIO"$NORMAL\
	"\n\n  1. Introducción de datos manual"\
	"\n\n  2. Fichero de datos de última ejecución (./FLast/DatosLast.txt)"\
	"\n\n  3. Otros ficheros de datos"\
	"\n\n  4. Introducción de rangos manual (modo aleatorio)"\
	"\n\n  5. Fichero de rangos de última ejecución (./FLast/RangosLast.txt)"\
	"\n\n  6. Otros ficheros de rangos"\
	"\n\n  7. Introducción de rangos amplios manual (modo aleatorio total)"\
	"\n\n  8. Fichero de rangos amplios de última ejecución (./FLast/RangosAleTotalLast.txt)"\
	"\n\n  9. Otros ficheros de rangos amplios"\
	"\n\n  10. Salir\n\n  --> "| tee -a $informeConColorTotal
	echo -ne "\n MENÚ INICIO"\
	"\n\n  1. Introducción de datos manual"\
	"\n\n  2. Fichero de datos de última ejecución (./FLast/DatosLast.txt)"\
	"\n\n  3. Otros ficheros de datos"\
	"\n\n  4. Introducción de rangos manual (modo aleatorio)"\
	"\n\n  5. Fichero de rangos de última ejecución (./FLast/RangosLast.txt)"\
	"\n\n  6. Otros ficheros de rangos"\
	"\n\n  7. Introducción de rangos amplios manual (modo aleatorio total)"\
	"\n\n  8. Fichero de rangos amplios de última ejecución (./FLast/RangosAleTotalLast.txt)"\
	"\n\n  9. Otros ficheros de rangos amplios"\
	"\n\n  10. Salir\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuEleccionEntradaDatos
	echo -ne "$seleccionMenuEleccionEntradaDatos\n\n" >> $informeConColorTotal
	echo -ne "$seleccionMenuEleccionEntradaDatos\n\n" >> $informeSinColorTotal

#EN-3210-
	until [[ 0 -lt $seleccionMenuEleccionEntradaDatos && $seleccionMenuEleccionEntradaDatos -lt 11 ]];  do
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read seleccionMenuEleccionEntradaDatos
		echo -ne "$seleccionMenuEleccionEntradaDatos\n\n" >> $informeConColorTotal
		echo -ne "$seleccionMenuEleccionEntradaDatos\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuEleccionEntradaDatos" in
#EN-3220-
			nuevaEjecucion
			preguntaDondeGuardarDatosManuales
			entradaMemoriaTeclado
			entradaProcesosTeclado
			menuModoTiempoEjecucionAlgormitmo
			;;
#EN-3230-
#EN-3240-
			leer_datos_desde_fichero $ficheroDatosAnteriorEjecucion
#EN-3250-
			;;
#EN-3260-
#EN-3270-
#EN-3280-
#EN-3290-
#EN-3300-
			;;
#EN-3310-
#EN-3320-
#EN-3330-
			nuevaEjecucion 
			entradaMemoriaRangosFichero_op_cuatro
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
#EN-3340-
			entradaMemoriaRangosFichero_op_cinco_Previo
#EN-3350-
			entradaMemoriaRangosFichero_op_cinco_seis
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
#EN-3360-
			nuevaEjecucion 
			entradaMemoriaRangosFichero_op_seis_Previo 
#EN-3370-
			entradaMemoriaRangosFichero_op_cinco_seis
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
#EN-3380-
			nuevaEjecucion 
			entradaMemoriaRangosFichero_op_siete_Previo
			entradaMemoriaRangosFichero_op_siete_ocho_nueve
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
#EN-3390-
#EN-3400-
#EN-3410-
			entradaMemoriaRangosFichero_op_siete_ocho_nueve
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
#EN-3420-
			nuevaEjecucion 
			entradaMemoriaRangosFichero_op_nueve_Previo
#EN-3430-
			entradaMemoriaRangosFichero_op_siete_ocho_nueve
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
#EN-3440-
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
#EN-3450-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#EN-3460-

####################################################################################
#EN-3470-
####################################################################################
function menuModoTiempoEjecucionAlgormitmo {
#EN-3480-
	cabecerainicio
	echo -ne $AMARILLO"\n\n Introduce una opción: \n$NORMAL"\
	"\n\n  1. Ejecución por eventos (Presionando Enter en cada evento)."\
	"\n\n  2. Ejecución automática (Por eventos y sin pausas)."\
	"\n\n  3. Ejecución completa (Por eventos con pausas de cierto número de segundos)."\
	"\n\n  4. Ejecución por unidad de tiempo (Con un volcado en cada unidad de tiempo)."\
	"\n\n  5. Ejecución completa (Sin representación de resultados intermedios).\n\n\n  --> $NC" | tee -a $informeConColorTotal
	echo -ne $NC$NORMAL
	echo -ne "\n\n Introduce una opción: \n"\
	"\n\n  1. Ejecución por eventos (Presionando Enter en cada evento)."\
	"\n\n  2. Ejecución automática (Por eventos y sin pausas)."\
	"\n\n  3. Ejecución completa (Por eventos con pausas de cierto número de segundos)."\
	"\n\n  4. Ejecución por unidad de tiempo (Con un volcado en cada unidad de tiempo)."\
	"\n\n  5. Ejecución completa (Sin representación de resultados intermedios).\n\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuModoTiempoEjecucionAlgormitmo
	echo -e "$seleccionMenuModoTiempoEjecucionAlgormitmo" >> $informeConColorTotal
	echo -e "$seleccionMenuModoTiempoEjecucionAlgormitmo" >> $informeSinColorTotal
#EN-3490-
	until [[ "0" -lt $seleccionMenuModoTiempoEjecucionAlgormitmo && $seleccionMenuModoTiempoEjecucionAlgormitmo -lt "6" ]]; do
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne " Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read seleccionMenuModoTiempoEjecucionAlgormitmo
		echo -e "$seleccionMenuModoTiempoEjecucionAlgormitmo\n" >> $informeConColorTotal
		echo -e "$seleccionMenuModoTiempoEjecucionAlgormitmo\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuModoTiempoEjecucionAlgormitmo" in
#EN-3500-
			optejecucion=1
			;;
#EN-3510-
			tiempoejecucion=0
			optejecucion=2
			;;
#EN-3520-
			echo -ne " Introduce el tiempo entre actualizaciones de datos (segundos): " | tee -a $informeConColorTotal
			echo -ne " Introduce el tiempo entre actualizaciones de datos (segundos): " >> $informeSinColorTotal
			read tiempoejecucion
			until [[ "0" -le $tiempoejecucion ]];   do
				echo -ne "\n Error en la elección de una opción válida. Debe ser mayor o igual a 0.\n\n  --> " | tee -a $informeConColorTotal
				echo -ne " Error en la elección de una opción válida. Debe ser mayor o igual a 0.\n\n  --> " >> $informeSinColorTotal
				read tiempoejecucion
				echo -e "$tiempoejecucion\n" >> $informeConColorTotal
				echo -e "$tiempoejecucion\n" >> $informeSinColorTotal
			done
			optejecucion=3
			;;
#EN-3530-
			optejecucion=4
			;;
#EN-3540-
			optejecucion=5
			;;
#EN-3550-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#EN-3560-
#EN-3570-

####################################################################################
#EN-3580-
####################################################################################
#EN-3590-
#EN-3600-
#EN-3610-
	if [[ ! -d $dirFLast ]]; then
		mkdir $dirFLast   
	fi
	if [[ ! -d $dirFDatos ]]; then
		mkdir $dirFDatos   
	fi
	if [[ ! -d $dirFRangos ]]; then
		mkdir $dirFRangos   
	fi
	if [[ ! -d $dirFRangos ]]; then
		mkdir $dirFRangos   
	fi
	if [[ ! -d $dirInformes ]]; then
		mkdir $dirInformes   
	fi
#EN-3620-
	if [[ -f $informeConColorTotal ]]; then
#EN-3630-
	fi
	if [[ -f $informeSinColorTotal ]]; then
#EN-3640-
	fi
#EN-3650-

####################################################################################
#EN-3660-
#EN-3670-
#EN-3680-
####################################################################################
function preguntaDondeGuardarDatosManuales {
#EN-3690-
	echo -e $AMARILLO"\n¿Dónde quiere guardar los datos resultantes?\n"$NORMAL | tee -a $informeConColorTotal
	echo -e " 1- En el fichero estándar ($ficheroDatosDefault)" | tee -a $informeConColorTotal
	echo -ne " 2- En otro fichero\n\n\n  --> " | tee -a $informeConColorTotal
	echo -e "¿Dónde quiere guardar los datos resultantes?\n\n" >> $informeSinColorTotal
	echo -e " 1- En el fichero estándar ($ficheroDatosDefault)" >> $informeSinColorTotal
	echo -ne " 2- En otro fichero\n\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuPreguntaDondeGuardarDatosManuales
	echo -e " $seleccionMenuPreguntaDondeGuardarDatosManuales\n\n" >> $informeConColorTotal
	echo -e " $seleccionMenuPreguntaDondeGuardarDatosManuales\n\n" >> $informeSinColorTotal
#EN-3700-
	until [[ "0" -lt $seleccionMenuPreguntaDondeGuardarDatosManuales && $seleccionMenuPreguntaDondeGuardarDatosManuales -lt "3" ]]; do
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read seleccionMenuPreguntaDondeGuardarDatosManuales
		echo -e " $seleccionMenuPreguntaDondeGuardarDatosManuales\n\n" >> $informeConColorTotal
		echo -e " $seleccionMenuPreguntaDondeGuardarDatosManuales\n\n" >> $informeSinColorTotal
	done
	case "${seleccionMenuPreguntaDondeGuardarDatosManuales}" in
#EN-3710-
#EN-3720-
			nomFicheroDatos="$ficheroDatosDefault"
			;;
#EN-3730-
			echo -e $ROJO"\n Ficheros de datos ya existentes en './FDatos/': "$NORMAL | tee -a $informeConColorTotal
			echo -e "\n Ficheros de datos ya existentes en './FDatos/': " >> $informeSinColorTotal
			files=($(ls -l ./FDatos/ | awk '{print $9}'))
#EN-3740-
				echo -e "   ${files[$i]}"
			done
			echo -e $AMARILLO" Introduce el nombre que le quieres dar al fichero de datos (sin '.txt'):\n"$NORMAL | tee -a $informeConColorTotal
			echo -e " Introduce el nombre que le quieres dar al fichero de datos (sin '.txt'):\n" >> $informeSinColorTotal
			read seleccionNombreFicheroDatos
			nomFicheroDatos="./FDatos/$seleccionNombreFicheroDatos.txt"
			echo -e " $seleccionNombreFicheroDatos" >> $informeConColorTotal
			echo -e " $seleccionNombreFicheroDatos" >> $informeSinColorTotal
			echo -e " $nomFicheroDatos\n\n" >> $informeConColorTotal
			echo -e " $nomFicheroDatos\n\n" >> $informeSinColorTotal
			until [[ ! -z "$seleccionNombreFicheroDatos" && ! -f "$nomFicheroDatos" && "$seleccionNombreFicheroDatos" != "" ]];do  
				echo -e " Ya existe un archivo con el nombre introducido, o es nulo." | tee -a $informeConColorTotal
				echo -e " Ya existe un archivo con el nombre introducido, o es nulo."  >> $informeSinColorTotal
				echo -e " ¿Sobreescribirlo (S/N)?" | tee -a $informeConColorTotal  
				echo -e " ¿Sobreescribirlo (S/N)?" >> $informeSinColorTotal
				read sobrescri
				echo $sobrescri >> $informeConColorTotal
				echo $sobrescri >> $informeSinColorTotal
				until [[ "$sobrescri" == "S" || "$sobrescri" == "s" || "$sobrescri" == "N" || "$sobrescri" == "n" ]]; do
					echo -e " Respuesta no válida, debe ser una de las opciones." | tee -a $informeConColorTotal  
					echo -e " ¿Sobreescribirlo (S/N)?" | tee -a $informeConColorTotal  
					echo -e " Respuesta no válida, debe ser S o N." >> $informeSinColorTotal
					echo -e " ¿Sobreescribirlo (S/N)?" >> $informeSinColorTotal
					read sobrescri
					echo $sobrescri >> $informeConColorTotal
					echo $sobrescri >> $informeSinColorTotal
				done
				if [[ $sobrescri == "S" || $sobrescri == "s" ]]; then
					echo -e " Los datos se guardaran en el archivo $nomFicheroDatos" | tee -a $informeConColorTotal  
					echo -e " Los datos se guardaran en el archivo $nomFicheroDatos" >> $informeSinColorTotal
					rm $nomFicheroDatos 
				fi
				if [[ $sobrescri == "N" || $sobrescri == "n" ]]; then
					echo -e " Introduzca un nombre correcto: \n" | tee -a $informeConColorTotal
					echo -e " Introduzca un nombre correcto: \n" >> $informeSinColorTotal
					read seleccionNombreFicheroDatos
					nomFicheroDatos="./FDatos/""$seleccionNombreFicheroDatos.txt"
					echo -e " $seleccionNombreFicheroDatos" >> $informeConColorTotal
					echo -e " $seleccionNombreFicheroDatos" >> $informeSinColorTotal
					echo -e " $nomFicheroDatos\n" >> $informeConColorTotal
					echo -e " $nomFicheroDatos\n" >> $informeSinColorTotal
#EN-3750-
			done
			;;
#EN-3760-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#EN-3770-
#EN-3780-
		
####################################################################################
#EN-3790-
#EN-3800-
#EN-3810-
####################################################################################
function preguntaDondeGuardarRangosManuales {
	echo -e $AMARILLO"¿Dónde quiere guardar los rangos?"$NORMAL | tee -a  $informeConColorTotal
	echo -e "\n 1- En el fichero de rangos estándar ($ficheroRangosDefault)" | tee -a  $informeConColorTotal
	echo -e " 2- En otro fichero\n" | tee -a  $informeConColorTotal
	echo -ne "\n  --> " | tee -a  $informeConColorTotal
	echo -e "¿Dónde quiere guardar los rangos?" >> $informeSinColorTotal
	echo -e "\n 1- En el fichero de rangos estándar ($ficheroRangosDefault)" >> $informeSinColorTotal
	echo -e " 2- En otro fichero\n" >> $informeSinColorTotal
	echo -ne "\n  --> " >> $informeSinColorTotal
	read seleccionMenuPreguntaDondeGuardarRangosManuales
	echo -e "$seleccionMenuPreguntaDondeGuardarRangosManuales\n\n" >> $informeConColorTotal
	echo -e "$seleccionMenuPreguntaDondeGuardarRangosManuales\n\n" >> $informeSinColorTotal

#EN-3820-
	until [[ "0" -lt $seleccionMenuPreguntaDondeGuardarRangosManuales && $seleccionMenuPreguntaDondeGuardarRangosManuales -lt "3" ]];   do
		echo -e "\nError en la elección de una opción válida" | tee -a $informeConColorTotal
		echo -e "\nError en la elección de una opción válida" >> $informeSinColorTotal
		echo -ne "\n  --> " | tee -a  $informeConColorTotal
		echo -ne "\n  --> " >> $informeSinColorTotal
		read seleccionMenuPreguntaDondeGuardarRangosManuales
		echo -e "$seleccionMenuPreguntaDondeGuardarRangosManuales\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuPreguntaDondeGuardarRangosManuales\n\n" >> $informeSinColorTotal
	done
	case "${seleccionMenuPreguntaDondeGuardarRangosManuales}" in
#EN-3830-
#EN-3840-
			nomFicheroRangos="$ficheroRangosDefault"
			;;
#EN-3850-
			echo -e $AMARILLO"Introduce el nombre que le quieres dar al fichero de datos (sin '.txt'):\n"$NORMAL | tee -a $informeConColorTotal
			echo -e "Introduce el nombre que le quieres dar al fichero de datos (sin '.txt'):\n" >> $informeSinColorTotal
			read seleccionNombreFicheroRangos
			nomFicheroRangos="./FRangos/""$seleccionNombreFicheroRangos.txt"
			echo -e "$seleccionNombreFicheroRangos" >> $informeConColorTotal
			echo -e "$seleccionNombreFicheroRangos" >> $informeSinColorTotal
			echo -e "$nomFicheroRangos\n" >> $informeConColorTotal
			echo -e "$nomFicheroRangos\n" >> $informeSinColorTotal
			until [[ ! -z "$seleccionNombreFicheroRangos" && ! -f "$nomFicheroRangos" && "$seleccionNombreFicheroRangos" != "" ]];do  
				echo -e " Ya existe un archivo con el nombre introducido, o es nulo." | tee -a $informeConColorTotal
				echo -e " Ya existe un archivo con el nombre introducido, o es nulo."  >> $informeSinColorTotal
				echo -e " ¿Sobreescribirlo (S/N)?" | tee -a $informeConColorTotal  
				echo -e " ¿Sobreescribirlo (S/N)?" >> $informeSinColorTotal
				read sobrescri
				echo $sobrescri >> $informeConColorTotal
				echo $sobrescri >> $informeSinColorTotal
				until [[ "$sobrescri" == "S" || "$sobrescri" == "s" || "$sobrescri" == "N" || "$sobrescri" == "n" ]]; do
					echo -e " Respuesta no válida, debe ser una de las opciones." | tee -a $informeConColorTotal  
					echo -e " ¿Sobreescribirlo (S/N)?" | tee -a $informeConColorTotal  
					echo -e " Respuesta no válida, debe ser S o N." >> $informeSinColorTotal
					echo -e " ¿Sobreescribirlo (S/N)?" >> $informeSinColorTotal
					read sobrescri
					echo $sobrescri >> $informeConColorTotal
					echo $sobrescri >> $informeSinColorTotal
				done
				if [[ $sobrescri == "S" || $sobrescri == "s" ]]; then
					echo -e " Los datos se guardaran en el archivo $nomFicheroRangos" | tee -a $informeConColorTotal  
					echo -e " Los datos se guardaran en el archivo $nomFicheroRangos" >> $informeSinColorTotal
					rm $nomFicheroRangos 
				fi
				if [[ $sobrescri == "N" || $sobrescri == "n" ]]; then
					echo -e " Introduzca un nombre correcto: \n" | tee -a $informeConColorTotal
					echo -e " Introduzca un nombre correcto: \n" >> $informeSinColorTotal
					read seleccionNombreFicheroRangos
					nomFicheroRangos="./FRangos/""$seleccionNombreFicheroRangos.txt"
					echo -e " $seleccionNombreFicheroRangos" >> $informeConColorTotal
					echo -e " $seleccionNombreFicheroRangos" >> $informeSinColorTotal
					echo -e " $nomFicheroRangos\n" >> $informeConColorTotal
					echo -e " $nomFicheroRangos\n" >> $informeSinColorTotal
#EN-3860-
			done
			;;
#EN-3870-
			echo -e "Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e "Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#EN-3880-

####################################################################################
#EN-3890-
#EN-3900-
#EN-3910-
####################################################################################
function preguntaDondeGuardarRangosAleTManuales {
	echo -e $AMARILLO"¿Dónde quiere guardar los mínimos y máximos de los rangos amplios?"$NORMAL | tee -a  $informeConColorTotal
	echo -e "\n 1- En el fichero de rangos amplios estándar ($ficheroRangosAleTotalDefault)" | tee -a  $informeConColorTotal
	echo -e " 2- En otro fichero\n" | tee -a  $informeConColorTotal
	echo -ne "\n  --> " | tee -a  $informeConColorTotal
	echo -e "¿Dónde quiere guardar los mínimos y máximos de los rangos amplios?" >> $informeSinColorTotal
	echo -e "\n 1- En el fichero de rangos amplios estándar ($ficheroRangosAleTotalDefault)" >> $informeSinColorTotal
	echo -e " 2- En otro fichero\n" >> $informeSinColorTotal
	echo -ne "\n  --> " >> $informeSinColorTotal
	read seleccionMenuPreguntaDondeGuardarRangosAleTManuales
	echo -e "$seleccionMenuPreguntaDondeGuardarRangosAleTManuales\n\n" >> $informeConColorTotal
	echo -e "$seleccionMenuPreguntaDondeGuardarRangosAleTManuales\n\n" >> $informeSinColorTotal
#EN-3920-
	until [[ "0" -lt $seleccionMenuPreguntaDondeGuardarRangosAleTManuales && $seleccionMenuPreguntaDondeGuardarRangosAleTManuales -lt "3" ]];   do
		echo -e "\nError en la elección de una opción válida" | tee -a $informeConColorTotal
		echo -e "\nError en la elección de una opción válida" >> $informeSinColorTotal
		echo -ne "\n  --> " | tee -a  $informeConColorTotal
		echo -ne "\n  --> " >> $informeSinColorTotal
		read seleccionMenuPreguntaDondeGuardarRangosAleTManuales
		echo -e "$seleccionMenuPreguntaDondeGuardarRangosAleTManuales\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuPreguntaDondeGuardarRangosAleTManuales\n\n" >> $informeSinColorTotal
	done
	case "${seleccionMenuPreguntaDondeGuardarRangosAleTManuales}" in
#EN-3930-
#EN-3940-
			nomFicheroRangosAleT="$ficheroRangosAleTotalDefault"
			;;
#EN-3950-
			echo -e $AMARILLO"Introduce el nombre que le quieres dar al fichero de rangos amplios (sin '.txt'):\n"$NORMAL | tee -a $informeConColorTotal
			echo -e "Introduce el nombre que le quieres dar al fichero de rangos amplios (sin '.txt'):\n" >> $informeSinColorTotal
			read seleccionNombreFicheroRangosAleT
			nomFicheroRangosAleT="./FRangosAleT/""$seleccionNombreFicheroRangosAleT.txt"
			echo -e "$seleccionNombreFicheroRangosAleT" >> $informeConColorTotal
			echo -e "$seleccionNombreFicheroRangosAleT" >> $informeSinColorTotal
			echo -e "$nomFicheroRangosAleT\n\n" >> $informeConColorTotal
			echo -e "$nomFicheroRangosAleT\n\n" >> $informeSinColorTotal
			until [[ ! -z "$seleccionNombreFicheroRangosAleT" && ! -f "$nomFicheroRangosAleT" && "$seleccionNombreFicheroRangosAleT" != "" ]];do  
				echo -e " Ya existe un archivo con el nombre introducido, o es nulo." | tee -a $informeConColorTotal
				echo -e " Ya existe un archivo con el nombre introducido, o es nulo."  >> $informeSinColorTotal
				echo -e " ¿Sobreescribirlo (S/N)?" | tee -a $informeConColorTotal  
				echo -e " ¿Sobreescribirlo (S/N)?" >> $informeSinColorTotal
				read sobrescri
				echo $sobrescri >> $informeConColorTotal
				echo $sobrescri >> $informeSinColorTotal
				until [[ "$sobrescri" == "S" || "$sobrescri" == "s" || "$sobrescri" == "N" || "$sobrescri" == "n" ]]; do
					echo -e " Respuesta no válida, debe ser una de las opciones." | tee -a $informeConColorTotal  
					echo -e " ¿Sobreescribirlo (S/N)?" | tee -a $informeConColorTotal  
					echo -e " Respuesta no válida, debe ser S o N." >> $informeSinColorTotal
					echo -e " ¿Sobreescribirlo (S/N)?" >> $informeSinColorTotal
					read sobrescri
					echo $sobrescri >> $informeConColorTotal
					echo $sobrescri >> $informeSinColorTotal
				done
				if [[ $sobrescri == "S" || $sobrescri == "s" ]]; then
					echo -e " Los datos se guardaran en el archivo $nomFicheroRangosAleT" | tee -a $informeConColorTotal  
					echo -e " Los datos se guardaran en el archivo $nomFicheroRangosAleT" >> $informeSinColorTotal
					rm $nomFicheroRangosAleT 
				fi
				if [[ $sobrescri == "N" || $sobrescri == "n" ]]; then
					echo -e " Introduzca un nombre correcto: \n" | tee -a $informeConColorTotal
					echo -e " Introduzca un nombre correcto: \n" >> $informeSinColorTotal
					read seleccionNombreFicheroRangosAleT
					nomFicheroRangosAleT="./FRangosAleT/""$seleccionNombreFicheroRangosAleT.txt"
					echo -e " $seleccionNombreFicheroRangosAleT" >> $informeConColorTotal
					echo -e " $seleccionNombreFicheroRangosAleT" >> $informeSinColorTotal
					echo -e " $nomFicheroRangosAleT\n" >> $informeConColorTotal
					echo -e " $nomFicheroRangosAleT\n" >> $informeSinColorTotal
#EN-3960-
			done
			;;
#EN-3970-
			echo -e "Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e "Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#EN-3980-

#######################################################################
#######################################################################
#EN-3990-
#######################################################################
#######################################################################
####################################################################################
#EN-4000-
####################################################################################
function menuEnsayos {
#EN-4010-
	cabecerainicio
	echo -ne "\n ¿Quieres leer el fichero de ayuda, o ejecutar el algoritmo?\n"\
	"\n  1. Ejecución automática de los distintos algoritmos de paginación sobre diferentes conjuntos de datos, para localizar errores en el código\n"\
	"\n  2. Ejecución automática de los distintos algoritmos de paginación sobre iguales conjuntos de datos, para el análisis de resultados\n"\
	"\n  3. Ejecución automática de los distintos algoritmos de paginación sobre iguales conjuntos de datos ya definidos anteriormente, para el análisis de resultados\n"\
	"\n  4. Ejecución automática de los distintos algoritmos de gestión de procesos sobre los distintos algoritmos de paginación sobre iguales conjuntos de datos ya definidos anteriormente, para el análisis de resultados\n"\
	"\n  5. Salir\n\n  --> " | tee -a $informeConColorTotal $informeSinColorTotal
	read seleccionMenuEnsayos
	until [[ $seleccionMenuEnsayos > 0 && $seleccionMenuEnsayos < 6 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuEnsayos
		echo -e "$seleccionMenuEnsayos\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuEnsayos\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuEnsayos" in
		'1')
#EN-4020-
#EN-4030-
#EN-4040-
#EN-4050-
#EN-4060-
			;;
		'2')
#EN-4070-
#EN-4080-
#EN-4090-
#EN-4100-
#EN-4110-
			;;
		'3')
#EN-4120-
#EN-4130-
#EN-4140-
#EN-4150-
#EN-4160-
			;;
		'4') 
#EN-4170-
#EN-4180-
#EN-4190-
			;;
		'5')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
#EN-4200-
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal ;;
	esac
#EN-4210-

####################################################################################
#EN-4220-
####################################################################################
function menuNumEnsayos { 
	seleccionNumEnsayos=0
	echo -ne $AMARILLO"\n\n Introduce el número de Ensayos a realizar de forma continua: \n$NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n Introduce el número de Ensayos a realizar de forma continua: \n$NORMAL" >> $informeSinColorTotal
	read seleccionNumEnsayos
	echo -ne "$seleccionNumEnsayos\n\n" >> $informeConColorTotal
	echo -ne "$seleccionNumEnsayos\n\n" >> $informeSinColorTotal
	until [[ seleccionNumEnsayos -gt 0 ]]; do
		echo -ne "\n Error en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionNumEnsayos
		echo -e "$seleccionNumEnsayos\n\n" >> $informeConColorTotal
		echo -e "$seleccionNumEnsayos\n\n" >> $informeSinColorTotal
	done
#EN-4230-

####################################################################################
# Sinopsis: #Se definen y ejecutan los ensayos automáticos y se recogen los datos en ficheros secuenciales. Se usan datos diferentes en cada aloritmo de paginación y ensayo para buscar errores.
####################################################################################
function ejecutarEnsayosDatosDiferentes { 
#	numAlgoritmosPaginacion=17 #Número de algoritmos de paginación que se probarán con cada conjunto de datos sacados de los subrangos, previamente calculados desde el fichero de rangos amplios.
#EN-4240-
#EN-4250-
#EN-4260-
#EN-4270-
	dirInformes="./Informes/RecogerDatosAutomDiferentes"
	if [[ ! -d $dirInformes ]]; then
		mkdir $dirInformes   
	fi
#EN-4280-
	if [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then
#EN-4290-
	fi
#EN-4300-
	for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
		for (( indEnsayos = 1; indEnsayos <= $seleccionNumEnsayos; indEnsayos++ )); do 
#EN-4310-
			if [[ -f $ficheroRangosAleTotalDefault ]]; then
#EN-4320-
			fi
#EN-4330-
			if [[ -f $nomFicheroRangos ]]; then
#EN-4340-
			fi
#EN-4350-
			if [[ -f $nomFicheroDatos ]]; then
#EN-4360-
			fi
#EN-4370-
			if [[ -f $informeSinColorTotal ]]; then
#EN-4380-
			fi
#EN-4390-
			if [[ -f $informeConColorTotal ]]; then
#EN-4400-
			fi
#EN-4410-
#EN-4420-
#EN-4430-
			echo -e "Algoritmo de paginación: $seleccionAlgoritmoPaginacion\n" >> $informeConColorTotal
			echo -e "Número de Ensayo: $indEnsayos\n" >> $informeConColorTotal
#EN-4440-
#EN-4450-
			echo -e "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado AlgPag $seleccionAlgoritmoPaginacion NumEnsayo $indEnsayos Tesperamedio $promedio_espera T.retornomedio $promedio_retorno TotalFallosPagina $suma_contadorAlgPagFallosProcesoAcumulado TotalExpulsionesForzadasRR $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
		done
	done
#EN-4460-

####################################################################################
# Sinopsis: #Se definen y ejecutan los ensayos automáticos y se recogen los datos en ficheros secuenciales. Se usa el mismo conjunto de datos para el ensayo de todos y cada uno de los algoritmos.
####################################################################################
function ejecutarEnsayosDatosIguales { 
#EN-4470-
#EN-4480-
#EN-4490-
#EN-4500-
	dirInformes="./Informes/RecogerDatosAutomIguales"
#EN-4510-
#EN-4520-
	if [[ ! -d $dirInformes ]]; then
		mkdir $dirInformes   
	fi
#EN-4530-
	if [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then
#EN-4540-
	fi
			echo -ne "Título AlgPag NumEnsayo T.esperamedio T.retornomedio TotalFallosPagina TotalExpulsionesForzadasRR" >> $nomFicheroDatosEjecucionAutomatica
			echo -ne " MáxFrec TiempoConsiderado FrecValor Clase" >> $nomFicheroDatosEjecucionAutomatica
			echo -e " MáxUsoRec TiempoConsiderado UsoRecValor Clase" >> $nomFicheroDatosEjecucionAutomatica
#EN-4550-
#EN-4560-
#EN-4570-
		if [[ -f $ficheroRangosAleTotalDefault ]]; then
#EN-4580-
		fi
#EN-4590-
		if [[ -f $nomFicheroRangos ]]; then
#EN-4600-
		fi
#EN-4610-
		if [[ -f $nomFicheroDatos ]]; then
#EN-4620-
		fi
#EN-4630-
#EN-4640-
	done
#EN-4650-
#EN-4660-
		maxDatoCierre=0
		leer_datos_desde_fichero $nomFicheroDatos
#EN-4670-
			maxDato=0
			maxDatoCierre=1
#EN-4680-
				if [[ ${ejecucion[$i]} -gt $maxDato ]]; then 
					maxDato=${ejecucion[$i]} 
				fi
			done
		fi
		for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
#EN-4690-
			if [[ -f $informeSinColorTotal ]]; then
#EN-4700-
			fi
#EN-4710-
			if [[ -f $informeConColorTotal ]]; then
#EN-4720-
			fi
#EN-4730-
#EN-4740-
#EN-4750-
				seleccionAlgoritmoPaginacion_frecuencia_valor=$datoAleatorioGeneral
			fi
#EN-4760-
#EN-4770-
#EN-4780-
				seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
#EN-4790-
#EN-4800-
				seleccionAlgoritmoPaginacion_clases_frecuencia_valor=$datoAleatorioGeneral
#EN-4810-
#EN-4820-
				seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
			fi
#EN-4830-
#EN-4840-
#EN-4850-
				seleccionAlgoritmoPaginacion_uso_rec_valor=$datoAleatorioGeneral
			fi
#EN-4860-
#EN-4870-
#EN-4880-
				seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
#EN-4890-
#EN-4900-
				seleccionAlgoritmoPaginacion_clases_uso_rec_valor=$datoAleatorioGeneral
#EN-4910-
#EN-4920-
				seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
			fi
#EN-4930-
			echo -ne "$NORMAL\nAlgoritmo de paginación:$seleccionAlgoritmoPaginacion" | tee -a $informeConColorTotal
			echo -ne "$NORMAL\nNúmero de Ensayo:$indEnsayos\n" | tee -a $informeConColorTotal
			echo -e "Algoritmo de paginación: $seleccionAlgoritmoPaginacion" >> $informeSinColorTotal
			echo -e "Número de Ensayo: $indEnsayos" >> $informeSinColorTotal
#EN-4940-
#EN-4950-
			echo -ne "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado $seleccionAlgoritmoPaginacion $indEnsayos $promedio_espera $promedio_retorno $suma_contadorAlgPagFallosProcesoAcumulado $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
			echo -ne " $seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
			echo -e " $seleccionAlgoritmoPaginacion_uso_rec_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
		done
	done	
#EN-4960-

####################################################################################
# Sinopsis: #Se usan los conjuntos de datos ya definidos anteriormente para ejecutar los ensayos automáticos y se recoger los datos en ficheros secuenciales. Se usa el mismo conjunto de datos para el ensayo de todos y cada uno de los algoritmos.
####################################################################################
function ejecutarEnsayosDatosIgualesAnteriores { 
#EN-4970-
#EN-4980-
#EN-4990-
#EN-5000-
	dirInformes="./Informes/RecogerDatosAutomIguales"
	dirInformesAnteriores="./Informes/RecogerDatosAutomIgualesAnteriores"
#EN-5010-
#EN-5020-
	if [[ ! -d $dirInformesAnteriores ]]; then
		mkdir $dirInformesAnteriores   
	fi
#EN-5030-
#EN-5040-
		if [[ -f $nomFicheroDatos ]]; then
#EN-5050-
		fi
	done
	files=($dirInformes"/DatosDefault"*".txt")
	echo -e "\n\nFicheros existentes:\n$NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\nFicheros existentes:\n" >> $informeSinColorTotal 
#EN-5060-
		echo -e ${files[$i]} 
		cp ${files[$i]} "$dirInformesAnteriores/"
	done
#EN-5070-
	if [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then
#EN-5080-
	fi
	echo -ne "Título AlgPag NumEnsayo T.esperamedio T.retornomedio TotalFallosPagina TotalExpulsionesForzadasRR" >> $nomFicheroDatosEjecucionAutomatica
	echo -ne " MáxFrec TiempoConsiderado FrecValor Clase" >> $nomFicheroDatosEjecucionAutomatica
	echo -e " MáxUsoRec TiempoConsiderado UsoRecValor Clase" >> $nomFicheroDatosEjecucionAutomatica
#EN-5090-
#EN-5100-
		maxDatoCierre=0
		leer_datos_desde_fichero $nomFicheroDatos
#EN-5110-
			maxDato=0
			maxDatoCierre=1
#EN-5120-
				if [[ ${ejecucion[$i]} -gt $maxDato ]]; then 
					maxDato=${ejecucion[$i]} 
				fi
			done
		fi
		for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
#EN-5130-
			if [[ -f $informeSinColorTotal ]]; then
#EN-5140-
			fi
#EN-5150-
			if [[ -f $informeConColorTotal ]]; then
#EN-5160-
			fi
#EN-5170-
#EN-5180-
#EN-5190-
				seleccionAlgoritmoPaginacion_frecuencia_valor=$datoAleatorioGeneral
			fi
#EN-5200-
#EN-5210-
#EN-5220-
				seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
#EN-5230-
#EN-5240-
				seleccionAlgoritmoPaginacion_clases_frecuencia_valor=$datoAleatorioGeneral
#EN-5250-
#EN-5260-
				seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
			fi
#EN-5270-
#EN-5280-
#EN-5290-
				seleccionAlgoritmoPaginacion_uso_rec_valor=$datoAleatorioGeneral
			fi
#EN-5300-
#EN-5310-
#EN-5320-
				seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
#EN-5330-
#EN-5340-
				seleccionAlgoritmoPaginacion_clases_uso_rec_valor=$datoAleatorioGeneral
#EN-5350-
#EN-5360-
				seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
			fi
#EN-5370-
			echo -ne "$NORMAL\nAlgoritmo de paginación:$seleccionAlgoritmoPaginacion" | tee -a $informeConColorTotal
			echo -ne "$NORMAL\nNúmero de Ensayo:$indEnsayos\n" | tee -a $informeConColorTotal
			echo -e "Algoritmo de paginación: $seleccionAlgoritmoPaginacion" >> $informeSinColorTotal
			echo -e "Número de Ensayo: $indEnsayos" >> $informeSinColorTotal
#EN-5380-
#EN-5390-
			echo -ne "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado $seleccionAlgoritmoPaginacion $indEnsayos $promedio_espera $promedio_retorno $suma_contadorAlgPagFallosProcesoAcumulado $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
			echo -ne " $seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
			echo -e " $seleccionAlgoritmoPaginacion_uso_rec_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
		done
	done	
#EN-5400-

####################################################################################
# Sinopsis: #Se usan los conjuntos de datos ya definidos anteriormente para ejecutar los ensayos automáticos y se recoger los datos en ficheros secuenciales. Se usa el mismo conjunto de datos para el ensayo de todos y cada uno de los algoritmos.
####################################################################################
function ejecutarEnsayosDatosIgualesAnterioresCompleto { 	
#EN-5410-
#EN-5420-
#EN-5430-
#EN-5440-
#EN-5450-
	dirInformes="./Informes/RecogerDatosAutomIguales"
	dirInformesAnterioresCompleto="./Informes/RecogerDatosAutomIgualesAnterioresCompleto"
#EN-5460-
#EN-5470-
#EN-5480-
#EN-5490-
#EN-5500-
#EN-5510-
#EN-5520-
#EN-5530-
#EN-5540-
#EN-5550-
#EN-5560-
#EN-5570-
#EN-5580-
#EN-5590-
#EN-5600-
#EN-5610-
#EN-5620-
#EN-5630-
#EN-5640-
#EN-5650-
#EN-5660-
#EN-5670-
#EN-5680-
#EN-5690-
	
	if [[ ! -d $dirInformesAnterioresCompleto ]]; then
		mkdir $dirInformesAnterioresCompleto   
	fi
#EN-5700-
#EN-5710-
		if [[ -f $nomFicheroDatos ]]; then
#EN-5720-
		fi
	done
	files=($dirInformes"/DatosDefault"*".txt")
	echo -e "\n\nFicheros existentes:\n$NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\nFicheros existentes:\n" >> $informeSinColorTotal 
#EN-5730-
		echo -e ${files[$i]} 
		cp ${files[$i]} "$dirInformesAnterioresCompleto/"
	done
#EN-5740-
	if [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then
#EN-5750-
	fi
	echo -ne "Título NumEnsayo AlgGestProc Contin Reubic AlgPag TipoPrio Apropia Quantum" >> $nomFicheroDatosEjecucionAutomatica
	echo -ne " T.esperamedio T.retornomedio TotalFallosPagina TotalExpulsionesForzadasRR" >> $nomFicheroDatosEjecucionAutomatica
	echo -ne " MáxFrec TiempoConsiderado FrecValor FrecClase" >> $nomFicheroDatosEjecucionAutomatica
	echo -e " MáxUsoRec TiempoConsiderado UsoRecValor UsoRecClase" >> $nomFicheroDatosEjecucionAutomatica
#EN-5760-
#EN-5770-
#EN-5780-
		echo -ne "Error: No se encuentra el fichero de datos "$nomFicheroDatos | tee -a $informeConColorTotal
		echo -ne "Error: No se encuentra el fichero de datos "$nomFicheroDatos >> $informeSinColorTotal 
		break
	fi		
		maxDatoCierre=0
		leer_datos_desde_fichero $nomFicheroDatos
#EN-5790-
#EN-5800-
#EN-5810-
#EN-5820-
#EN-5830-
#EN-5840-
#EN-5850-
			maxDato=0
			maxDatoCierre=1
#EN-5860-
				if [[ ${ejecucion[$i]} -gt $maxDato ]]; then 
					maxDato=${ejecucion[$i]} 
				fi
			done
		fi
		for (( seleccionMenuAlgoritmoGestionProcesos=1 ; seleccionMenuAlgoritmoGestionProcesos<=$numAlgoritmosGestionProcesos ; seleccionMenuAlgoritmoGestionProcesos++ )); do
			if ([[ $seleccionMenuAlgoritmoGestionProcesos -ge 1 && $seleccionMenuAlgoritmoGestionProcesos -le 3 ]]) || [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then
#EN-5870-
#EN-5880-
				fi
#EN-5890-
				for (( seleccionMenuContinuidad=1 ; seleccionMenuContinuidad<=$numAlgoritmosContinuidad ; seleccionMenuContinuidad++ )); do
#EN-5900-
					for (( seleccionMenuReubicabilidad=1 ; seleccionMenuReubicabilidad<=$numAlgoritmosReubicabilidad ; seleccionMenuReubicabilidad++ )); do		
						for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
#EN-5910-
							if [[ -f $informeSinColorTotal ]]; then
#EN-5920-
							fi
#EN-5930-
							if [[ -f $informeConColorTotal ]]; then
#EN-5940-
							fi
#EN-5950-
#EN-5960-
#EN-5970-
								seleccionAlgoritmoPaginacion_frecuencia_valor=$datoAleatorioGeneral
							fi
#EN-5980-
#EN-5990-
#EN-6000-
								seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
#EN-6010-
#EN-6020-
								seleccionAlgoritmoPaginacion_clases_frecuencia_valor=$datoAleatorioGeneral
#EN-6030-
#EN-6040-
								seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
							fi
#EN-6050-
#EN-6060-
#EN-6070-
								seleccionAlgoritmoPaginacion_uso_rec_valor=$datoAleatorioGeneral
							fi
#EN-6080-
#EN-6090-
#EN-6100-
								seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
#EN-6110-
#EN-6120-
								seleccionAlgoritmoPaginacion_clases_uso_rec_valor=$datoAleatorioGeneral
#EN-6130-
#EN-6140-
								seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
							fi
#EN-6150-
#EN-6160-
#EN-6170-
							echo -e "$NORMAL\n Número de Ensayo:$indEnsayos" | tee -a $informeConColorTotal
							echo -e "$NORMAL Algoritmo:$algoritmoPaginacionContinuidadReubicabilidadSeleccionado" | tee -a $informeConColorTotal
							echo -e " Número de Ensayo: $indEnsayos" >> $informeSinColorTotal
							echo -e " Algoritmo: $algoritmoPaginacionContinuidadReubicabilidadSeleccionado" >> $informeSinColorTotal
							echo -ne "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado $indEnsayos $seleccionMenuAlgoritmoGestionProcesos $seleccionMenuContinuidad $seleccionMenuReubicabilidad $seleccionAlgoritmoPaginacion" >> $nomFicheroDatosEjecucionAutomatica
							echo -ne " $seleccionTipoPrioridad $seleccionMenuApropiatividad $quantum $promedio_espera $promedio_retorno $suma_contadorAlgPagFallosProcesoAcumulado $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
							echo -ne " $seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
							echo -e " $seleccionAlgoritmoPaginacion_uso_rec_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
							
#EN-6180-
							seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=""
							seleccionAlgoritmoPaginacion_clases_frecuencia_valor=""
							seleccionAlgoritmoPaginacion_clases_valor=""
							seleccionAlgoritmoPaginacion_uso_rec_valor=""
							seleccionAlgoritmoPaginacion_clases_uso_rec_valor=""

#EN-6190-
					done
				done
#EN-6200-
			fi
			if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 4 ]]; then
#EN-6210-
				for (( seleccionTipoPrioridad=1 ; seleccionTipoPrioridad<=$numAlgoritmosTipoPrioridad ; seleccionTipoPrioridad++ )); do
#EN-6220-
					for (( seleccionMenuApropiatividad=1 ; seleccionMenuApropiatividad<=numAlgoritmosApropiatividad ; seleccionMenuApropiatividad++ )); do
#EN-6230-
						for (( seleccionMenuContinuidad=1 ; seleccionMenuContinuidad<=$numAlgoritmosContinuidad ; seleccionMenuContinuidad++ )); do
#EN-6240-
							for (( seleccionMenuReubicabilidad=1 ; seleccionMenuReubicabilidad<=$numAlgoritmosReubicabilidad ; seleccionMenuReubicabilidad++ )); do		
								for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
#EN-6250-
									if [[ -f $informeSinColorTotal ]]; then
#EN-6260-
									fi
#EN-6270-
									if [[ -f $informeConColorTotal ]]; then
#EN-6280-
									fi
#EN-6290-
#EN-6300-
#EN-6310-
										seleccionAlgoritmoPaginacion_frecuencia_valor=$datoAleatorioGeneral
									fi
#EN-6320-
#EN-6330-
#EN-6340-
										seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
#EN-6350-
#EN-6360-
										seleccionAlgoritmoPaginacion_clases_frecuencia_valor=$datoAleatorioGeneral
#EN-6370-
#EN-6380-
										seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
									fi
#EN-6390-
#EN-6400-
#EN-6410-
										seleccionAlgoritmoPaginacion_uso_rec_valor=$datoAleatorioGeneral
									fi
#EN-6420-
#EN-6430-
#EN-6440-
										seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
#EN-6450-
#EN-6460-
										seleccionAlgoritmoPaginacion_clases_uso_rec_valor=$datoAleatorioGeneral
#EN-6470-
#EN-6480-
										seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
									fi
#EN-6490-
#EN-6500-
#EN-6510-
									echo -e "$NORMAL\n Número de Ensayo: $indEnsayos" | tee -a $informeConColorTotal
									echo -e "$NORMAL Algoritmo: $algoritmoPaginacionContinuidadReubicabilidadSeleccionado" | tee -a $informeConColorTotal
									echo -e " Número de Ensayo: $indEnsayos" >> $informeSinColorTotal
									echo -e " Algoritmo: $algoritmoPaginacionContinuidadReubicabilidadSeleccionado" >> $informeSinColorTotal
									echo -ne "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado $indEnsayos $seleccionMenuAlgoritmoGestionProcesos $seleccionMenuContinuidad $seleccionMenuReubicabilidad $seleccionAlgoritmoPaginacion" >> $nomFicheroDatosEjecucionAutomatica
									echo -ne " $seleccionTipoPrioridad $seleccionMenuApropiatividad $quantum $promedio_espera $promedio_retorno $suma_contadorAlgPagFallosProcesoAcumulado $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
									echo -ne " $seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
									echo -e " $seleccionAlgoritmoPaginacion_uso_rec_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
								
#EN-6520-
									seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=""
									seleccionAlgoritmoPaginacion_clases_frecuencia_valor=""
									seleccionAlgoritmoPaginacion_clases_valor=""
									seleccionAlgoritmoPaginacion_uso_rec_valor=""
									seleccionAlgoritmoPaginacion_clases_uso_rec_valor=""
#EN-6530-
							done
						done
					done
#EN-6540-
				done
#EN-6550-
			fi
		done
	done	
	
#EN-6560-

#######################################################################
#######################################################################
#EN-6570-
#######################################################################
#######################################################################
#######################################################################
#EN-6580-
#######################################################################
function cecho {
	local default_msg="No message passed."                     
	message=${1:-$default_msg}   
	color=${2:-$FWHT}           
	echo -en "$color"
	echo "$message"
	tput sgr0                    
	return
#EN-6590-

####################################################################################
#EN-6600-
####################################################################################
function transformapag {
	let pagTransformadas[$2]=`expr $1/$mem_direcciones`
#EN-6610-

####################################################################################
#EN-6620-
####################################################################################
function vermaxpagsfichero {
#EN-6630-
	for (( npagp = 0; npagp <= $p; npagp++ )); do
		npagprocesos[$p]=`awk "NR==$i" $1 | wc -w `
		(( i++ ))	
	done
#EN-6640-
#EN-6650-
		if (( $verlas > $maxpags )); then
			maxpags=$verlas
		fi
	done
#EN-6660-

####################################################################################
#EN-6670-
####################################################################################
#EN-6680-
#EN-6690-
#EN-6700-
	numDireccionesTotales=$(($mem_num_marcos * $mem_direcciones))
#EN-6710-
#EN-6720-
#EN-6730-
#EN-6740-
#EN-6750-
#EN-6760-
	maxfilas=`wc -l < $1`
#EN-6770-
#EN-6780-
#EN-6790-
#EN-6800-
#EN-6810-
#EN-6820-
#EN-6830-
#EN-6840-
		llegada[$p]=`awk "NR==$fila" $1 |  cut -d ' ' -f 1`
		memoria[$p]=`awk "NR==$fila" $1 |  cut -d ' ' -f 2`
		prioProc[$p]=`awk "NR==$fila" $1 |  cut -d ' ' -f 3`
#EN-6850-
		ejecucion[$p]=$(expr $[npagprocesos[$p]] - 3)
#EN-6860-
#EN-6870-
#EN-6880-
		numOrdinalPagTeclado=0
#EN-6890-
			directionsYModificado=`awk "NR==$fila" $1 | cut -d ' ' -f $i` 
			directions[$p,$numOrdinalPagTeclado]=`echo $directionsYModificado | cut -d '-' -f 1`
			directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numOrdinalPagTeclado,0]=`echo $directionsYModificado | cut -d '-' -f 2`
#EN-6900-
			paginasDefinidasTotal[$p,$numOrdinalPagTeclado]=${pagTransformadas[$numOrdinalPagTeclado]} 
#EN-6910-
				controlDatosNoVirtualFichero 
			fi
#EN-6920-
			((one++))
		done
#EN-6930-
		p=$((p+1))
	done 
#EN-6940-
#EN-6950-

#######################################################################
#EN-6960-
#######################################################################
function controlDatosNoVirtualFichero {
#EN-6970-
		echo -e "\n***Error en la lectura de datos. La dirección de memoria utilizada está fuera del rango definido por el número de marcos de página.\n"
		echo -e "\n***Dirección definida: ${directions[$p,$numOrdinalPagTeclado]} \n"
		echo -e "\n***Número de direcciones totales: $numDireccionesTotales \n"
		exit 1
	fi
#EN-6980-
		echo -e "\n***Error en la lectura de datos. La dirección de memoria utilizada está fuera del rango definido por el número de marcos de página y el número de direcciones por marco."
		echo -ne "\n***Número de marcos: ${memoria[$p]}"
		echo -e "\n***Número de páginas del proceso: ${pagTransformadas[$numOrdinalPagTeclado]}"
		exit 1
	fi
	
#EN-6990-

#######################################################################
#EN-7000-
#######################################################################
#EN-7010-
	memoria_min=($(cat $1 | grep "RangoMarcosMemoria" | cut -f 2 -d " "))
	memoria_max=($(cat $1 | grep "RangoMarcosMemoria" | cut -f 3 -d " "))
	direcciones_min=($(cat $1 | grep "RangoDireccionesMarco" | cut -f 2 -d " "))
	direcciones_max=($(cat $1 | grep "RangoDireccionesMarco" | cut -f 3 -d " "))
	prio_menor_min=($(cat $1 | grep "RangoPrioMenor" | cut -f 2 -d " "))
	prio_menor_max=($(cat $1 | grep "RangoPrioMenor" | cut -f 3 -d " "))
	prio_mayor_min=($(cat $1 | grep "RangoPrioMayor" | cut -f 2 -d " "))
	prio_mayor_max=($(cat $1 | grep "RangoPrioMayor" | cut -f 3 -d " "))
	programas_min=($(cat $1 | grep "RangoNumProc" | cut -f 2 -d " "))
	programas_max=($(cat $1 | grep "RangoNumProc" | cut -f 3 -d " "))
	reubicacion_min=($(cat $1 | grep "RangoReubicar" | cut -f 2 -d " "))
	reubicacion_max=($(cat $1 | grep "RangoReubicar" | cut -f 3 -d " "))
	llegada_min=($(cat $1 | grep "RangoLlegada" | cut -f 2 -d " "))
	llegada_max=($(cat $1 | grep "RangoLlegada" | cut -f 3 -d " "))
	tiempo_ejec_min=($(cat $1 | grep "RangoTEjecucion" | cut -f 2 -d " "))
	tiempo_ejec_max=($(cat $1 | grep "RangoTEjecucion" | cut -f 3 -d " "))
	tamano_marcos_proc_min=($(cat $1 | grep "RangoTamanoMarcosProc" | cut -f 2 -d " "))
	tamano_marcos_proc_max=($(cat $1 | grep "RangoTamanoMarcosProc" | cut -f 3 -d " "))
	prio_proc_min=($(cat $1 | grep "RangoPrioProc" | cut -f 2 -d " "))
	prio_proc_max=($(cat $1 | grep "RangoPrioProc" | cut -f 3 -d " "))
	quantum_min=($(cat $1 | grep "RangoQuantum" | cut -f 2 -d " "))
	quantum_max=($(cat $1 | grep "RangoQuantum" | cut -f 3 -d " "))
	tamano_direcciones_proc_min=($(cat $1 | grep "RangoTamanoDireccionesProc" | cut -f 2 -d " "))
	tamano_direcciones_proc_max=($(cat $1 | grep "RangoTamanoDireccionesProc" | cut -f 3 -d " "))
	memoria_minInicial=$memoria_min
	memoria_maxInicial=$memoria_max
	direcciones_minInicial=$direcciones_min
	direcciones_maxInicial=$direcciones_max
	prio_menor_minInicial=$prio_menor_min #*Inicial - Datos a representar #Se invierten los rangos para calcular el mínimo, pero no para su representación, en la que se verán los datos originales *Inicial.
#EN-7020-
#EN-7030-
	prio_menor_min=$PriomFinal
	prio_menor_max=$PrioMFinal
	prio_mayor_minInicial=$prio_mayor_min #*Inicial - Datos a representar #Se invierten los rangos para calcular el mínimo, pero no para su representación, en la que se verán los datos originales *Inicial.
#EN-7040-
#EN-7050-
	prio_mayor_min=$PriomFinal
	prio_mayor_max=$PrioMFinal
	programas_minInicial=$programas_min
	programas_maxInicial=$programas_max
	reubicacion_minInicial=$reubicacion_min
	reubicacion_maxInicial=$reubicacion_max
	llegada_minInicial=$llegada_min
	llegada_maxInicial=$llegada_max
	tiempo_ejec_minInicial=$tiempo_ejec_min
	tiempo_ejec_maxInicial=$tiempo_ejec_max
	tamano_marcos_proc_minInicial=$tamano_marcos_proc_min
	tamano_marcos_proc_maxInicial=$tamano_marcos_proc_max
	prio_proc_minInicial=$prio_proc_min
	prio_proc_maxInicial=$prio_proc_max
	quantum_minInicial=$quantum_min
	quantum_maxInicial=$quantum_max
	tamano_direcciones_proc_minInicial=$tamano_direcciones_proc_min
	tamano_direcciones_proc_maxInicial=$tamano_direcciones_proc_max
#EN-7060-
		invertirRangos $memoria_min $memoria_max
		memoria_min=$min
		memoria_max=$max
	fi 
#EN-7070-
		desplazarRangos $memoria_min $memoria_max
		memoria_min=$min
		memoria_max=$max
	fi 
	if [[ $direcciones_min -gt $direcciones_max ]]; then 
		invertirRangos $direcciones_min $direcciones_max
		direcciones_min=$min
		direcciones_max=$max
	fi 
	if [[ $direcciones_min -lt 0 ]]; then 
		desplazarRangos $direcciones_min $direcciones_max
		direcciones_min=$min
		direcciones_max=$max
	fi 
	if [[ $programas_min -gt $programas_max ]]; then
		invertirRangos $programas_min $programas_max
		programas_min=$min
		programas_max=$max
	fi
	if [[ $programas_min -lt 0 ]]; then 
		desplazarRangos $programas_min $programas_max
		programas_min=$min
		programas_max=$max
	fi 
	if [[ $reubicacion_min -gt $reubicacion_max ]]; then
		invertirRangos $reubicacion_min $reubicacion_max
		reubicacion_min=$min
		reubicacion_max=$max
	fi
	if [[ $reubicacion_min -lt 0 ]]; then 
		desplazarRangos $reubicacion_min $reubicacion_max
		reubicacion_min=$min
		reubicacion_max=$max
	fi 
	if [[ $llegada_min -gt $llegada_max ]]; then
		invertirRangos $llegada_min $llegada_max
		llegada_min=$min
		llegada_max=$max
	fi
	if [[ $llegada_min -lt 0 ]]; then 
		desplazarRangos $llegada_min $llegada_max
#EN-7080-
		llegada_max=$(($max - 1))
	fi 
	if [[ $tiempo_ejec_min -gt $tiempo_ejec_max ]]; then
		invertirRangos $tiempo_ejec_min $tiempo_ejec_max
		tiempo_ejec_min=$min
		tiempo_ejec_max=$max
	fi
	if [[ $tiempo_ejec_min -lt 0 ]]; then 
		desplazarRangos $tiempo_ejec_min $tiempo_ejec_max
#EN-7090-
		tiempo_ejec_max=$(($max - 1))
	fi 
	if [[ $tamano_marcos_proc_min -gt $tamano_marcos_proc_max ]]; then
		invertirRangos $tamano_marcos_proc_min $tamano_marcos_proc_max
		tamano_marcos_proc_min=$min
		tamano_marcos_proc_max=$max
	fi
	if [[ $tamano_marcos_proc_min -lt 0 ]]; then 
		desplazarRangos $tamano_marcos_proc_min $tamano_marcos_proc_max
		tamano_marcos_proc_min=$min
		tamano_marcos_proc_max=$max
	fi 
	if [[ $prio_proc_min -gt $prio_proc_max ]]; then 
		invertirRangos $prio_proc_min $prio_proc_max
#EN-7100-
		prio_proc_max=$max
	fi
	if [[ $prio_proc_min -lt 0 ]]; then 
		desplazarRangos $prio_proc_min $prio_proc_max
		prio_proc_min=$min
		prio_proc_max=$max
	fi 
	if [[ $tamano_direcciones_proc_min -gt $tamano_direcciones_proc_max ]]; then
		invertirRangos $tamano_direcciones_proc_min $tamano_direcciones_proc_max
		tamano_direcciones_proc_min=$min
		tamano_direcciones_proc_max=$max
	fi
	if [[ $tamano_direcciones_proc_min -lt 0 ]]; then 
		desplazarRangos $tamano_direcciones_proc_min $tamano_direcciones_proc_max
		tamano_direcciones_proc_min=$min
		tamano_direcciones_proc_max=$max
	fi 
	if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then
#EN-7110-
	fi
	
	if [[ $quantum_min -gt $quantum_max ]]; then
		invertirRangos $quantum_min $quantum_max
		quantum_min=$min
		quantum_max=$max
	fi
	if [[ $quantum_min -lt 0 ]]; then 
		desplazarRangos $quantum_min $quantum_max
		quantum_min=$min
		quantum_max=$max
	fi 
#EN-7120-

#######################################################################
#EN-7130-
#######################################################################
function es_entero {
#EN-7140-
#EN-7150-
#EN-7160-

#####################################################################################
#EN-7170-
####################################################################################
function ordenarDatosEntradaFicheros_cuatro_cinco_seis_siete_ocho_nueve {
#EN-7180-
		for ((i = 0; i <= $j; i++)); do
			if [[ ${llegada[$i]} -gt ${llegada[$(($i + 1))]} ]]; then
				aux=${proceso[$(($i + 1))]}
				proceso[$(($i + 1))]=${proceso[$i]} 
				proceso[$i]=$aux
				aux=${llegada[$(($i + 1))]}
				llegada[$(($i + 1))]=${llegada[$i]}
				llegada[$i]=$aux
#EN-7190-
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${paginasDefinidasTotal[$(($i + 1)),$counter2]}
				done
#EN-7200-
					unset paginasDefinidasTotal[$(($i + 1)),$counter2]
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					paginasDefinidasTotal[$(($i + 1)),$counter2]=${paginasDefinidasTotal[$i,$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					unset paginasDefinidasTotal[$i,$counter2]
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					paginasDefinidasTotal[$i,$counter2]=${aux2[$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					unset aux2[$counter2]
				done
#EN-7210-
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${directions[$(($i + 1)),$counter2]}
				done
#EN-7220-
					unset directions[$(($i + 1)),$counter2]
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					directions[$(($i + 1)),$counter2]=${directions[$i,$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					unset directions[$i,$counter2]
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					directions[$i,$counter2]=${aux2[$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					unset aux2[$counter2]
				done
				aux=${ejecucion[$(($i + 1))]}
				ejecucion[$(($i + 1))]=${ejecucion[$i]} 
				ejecucion[$i]=$aux
				aux=${tiempoEjecucion[$(($i + 1))]}
#EN-7230-
				tiempoEjecucion[$i]=$aux
				aux=${memoria[$(($i + 1))]}
				memoria[$(($i + 1))]=${memoria[$i]} 
				memoria[$i]=$aux
				aux=${prioProc[$(($i + 1))]}
#EN-7240-
				prioProc[$i]=$aux
#EN-7250-
			fi
		done
	done
#EN-7260-

#######################################################################
#EN-7270-
#EN-7280-
#######################################################################
#EN-7290-
#EN-7300-
#EN-7310-
			a=${llegada[$i]};
#EN-7320-
			if [[ $a -gt $b ]];      then
				aux=${proceso[$i]};
#EN-7330-
				proceso[$j]=$aux;
				aux=${llegada[$i]};        
#EN-7340-
				llegada[$j]=$aux
				aux=${ejecucion[$i]};
#EN-7350-
				ejecucion[$j]=$aux;
				aux=${memoria[$i]};
#EN-7360-
				memoria[$j]=$aux;
				aux=${numeroproceso[$i]};
#EN-7370-
				numeroproceso[$j]=$aux;
			fi
#EN-7380-
				c=${numeroproceso[$i]};
				d=${numeroproceso[$j]};
				if [[ $c -gt $d ]]; then
					aux=${proceso[$i]};
#EN-7390-
					proceso[$j]=$aux
					aux=${llegada[$i]};       
#EN-7400-
					llegada[$j]=$aux
					aux=${ejecucion[$i]};
#EN-7410-
					ejecucion[$j]=$aux;
					aux=${memoria[$i]};
#EN-7420-
					memoria[$j]=$aux;
					aux=${numeroproceso[$i]};
#EN-7430-
					numeroproceso[$j]=$aux;
				fi
			fi
		done
	done
#EN-7440-

#######################################################################
#######################################################################
#EN-7450-
#######################################################################
#######################################################################
#EN-7460-
#######################################################################
function datos_memoria_tabla {
#EN-7470-
	if [[ $seleccionMenuEleccionEntradaDatos -eq 4 ]]; then 
		echo -e "$amarillo Por favor establezca los rangos para datos"                  
	elif [[ $seleccionMenuEleccionEntradaDatos -eq 5 || $seleccionMenuEleccionEntradaDatos -eq 6 ]]; then 
		echo -e "$amarillo Resultados actuales:"                  
	fi
	echo -e "$azul┌────────────────────────────────────────────────────────────┐" | tee -a $informeConColorTotal
	printf  "$azul│$NC""${varhuecos:1:$((36))}""Min-Max rango     Valor""$azul │\n" | tee -a $informeConColorTotal
#EN-7480-
	printf "$MAX_RANGE_MARCOS""${varhuecos:1:$((4 - ${#MAX_RANGE_MARCOS}))}""     ""${varhuecos:1:$((6 - ${#mem_num_marcos}))}""$mem_num_marcos""$azul │\n" | tee -a $informeConColorTotal
#EN-7490-
	printf "$MAX_RANGE_DIRECCIONES""${varhuecos:1:$((4 - ${#MAX_RANGE_DIRECCIONES}))}""     ""${varhuecos:1:$((6 - ${#mem_direcciones}))}""$mem_direcciones""$azul │\n" | tee -a $informeConColorTotal
#EN-7500-
#    printf "$MAX_RANGE_prio_menor""${varhuecos:1:$((4 - ${#MAX_RANGE_prio_menor}))}""     ""${varhuecos:1:$((6 - ${#prio_menorInicial}))}""$prio_menorInicial""$azul │\n" | tee -a $informeConColorTotal
	echo -ne "$prio_menor_maxInicial""${varhuecos:1:$((4 - ${#prio_menor_maxInicial}))}""     ""${varhuecos:1:$((6 - ${#prio_menorInicial}))}""$prio_menorInicial""$azul │\n" | tee -a $informeConColorTotal
#EN-7510-
#    printf "$MAX_RANGE_prio_mayor""${varhuecos:1:$((4 - ${#MAX_RANGE_prio_mayor}))}""     ""${varhuecos:1:$((6 - ${#prio_mayorInicial}))}""$prio_mayorInicial""$azul │\n" | tee -a $informeConColorTotal
	echo -ne "$prio_mayor_maxInicial""${varhuecos:1:$((4 - ${#prio_mayor_maxInicial}))}""     ""${varhuecos:1:$((6 - ${#prio_mayorInicial}))}""$prio_mayorInicial""$azul │\n" | tee -a $informeConColorTotal
#EN-7520-
	printf "$MAX_RANGE_REUB""${varhuecos:1:$((4 - ${#MAX_RANGE_REUB}))}""     ""${varhuecos:1:$((6 - ${#reub}))}""$reub""$azul │\n" | tee -a $informeConColorTotal
#EN-7530-
	printf "$MAX_RANGE_NPROC""${varhuecos:1:$((4 - ${#MAX_RANGE_NPROC}))}""     ""${varhuecos:1:$((6 - ${#n_prog}))}""$n_prog""$azul │\n" | tee -a $informeConColorTotal
#EN-7540-
#EN-7550-
#EN-7560-
#EN-7570-
#EN-7580-
#EN-7590-
#    printf  "$azul│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((13 - ${#MIN_RANGE_prio_proc}))}""$MIN_RANGE_prio_proc"" - " | tee -a $informeConColorTotal
#    printf "$MAX_RANGE_prio_proc""${varhuecos:1:$((13 - ${#MAX_RANGE_prio_proc}))}""$azul   │\n" | tee -a $informeConColorTotal
#EN-7600-
#EN-7610-
#EN-7620-
#EN-7630-
#EN-7640-
#EN-7650-
	echo -e "$azul└────────────────────────────────────────────────────────────┘"  | tee -a $informeConColorTotal
	echo -e "┌────────────────────────────────────────────────────────────┐" >> $informeSinColorTotal
	printf  "│$NC""${varhuecos:1:$((36))}""Min-Max rango     Valor"" │\n" >> $informeSinColorTotal
#EN-7660-
	printf "$MAX_RANGE_MARCOS""${varhuecos:1:$((4 - ${#MAX_RANGE_MARCOS}))}""     ""${varhuecos:1:$((6 - ${#mem_num_marcos}))}""$mem_num_marcos"" │\n" >> $informeSinColorTotal
#EN-7670-
	printf "$MAX_RANGE_DIRECCIONES""${varhuecos:1:$((4 - ${#MAX_RANGE_DIRECCIONES}))}""     ""${varhuecos:1:$((6 - ${#mem_direcciones}))}""$mem_direcciones"" │\n" >> $informeSinColorTotal
#EN-7680-
#    printf "$MAX_RANGE_prio_menor""${varhuecos:1:$((4 - ${#MAX_RANGE_prio_menor}))}""     ""${varhuecos:1:$((6 - ${#prio_menorInicial}))}""$prio_menorInicial"" │\n" >> $informeSinColorTotal
	echo -ne "$prio_menor_maxInicial""${varhuecos:1:$((4 - ${#prio_menor_maxInicial}))}""     ""${varhuecos:1:$((6 - ${#prio_menorInicial}))}""$prio_menorInicial"" │\n" >> $informeSinColorTotal
#EN-7690-
#    printf "$MAX_RANGE_prio_mayor""${varhuecos:1:$((4 - ${#MAX_RANGE_prio_mayor}))}""     ""${varhuecos:1:$((6 - ${#prio_mayorInicial}))}""$prio_mayorInicial"" │\n" >> $informeSinColorTotal
	echo -ne "$prio_mayor_maxInicial""${varhuecos:1:$((4 - ${#prio_mayor_maxInicial}))}""     ""${varhuecos:1:$((6 - ${#prio_mayorInicial}))}""$prio_mayorInicial"" │\n" >> $informeSinColorTotal
#EN-7700-
	printf "$MAX_RANGE_REUB""${varhuecos:1:$((4 - ${#MAX_RANGE_REUB}))}""     ""${varhuecos:1:$((6 - ${#reub}))}""$reub"" │\n" >> $informeSinColorTotal
#EN-7710-
	printf "$MAX_RANGE_NPROC""${varhuecos:1:$((4 - ${#MAX_RANGE_NPROC}))}""     ""${varhuecos:1:$((6 - ${#n_prog}))}""$n_prog"" │\n" >> $informeSinColorTotal
#EN-7720-
#EN-7730-
#EN-7740-
#EN-7750-
#EN-7760-
#EN-7770-
#    printf  "│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((13 - ${#MIN_RANGE_prio_proc}))}""$MIN_RANGE_prio_proc"" - " >> $informeSinColorTotal
#    printf "$MAX_RANGE_prio_proc""${varhuecos:1:$((13 - ${#MAX_RANGE_prio_proc}))}""   │\n" >> $informeSinColorTotal
#EN-7780-
#EN-7790-
#EN-7800-
#EN-7810-
#EN-7820-
#EN-7830-
	echo -e "└────────────────────────────────────────────────────────────┘" >> $informeSinColorTotal
#EN-7840-

#######################################################################
#EN-7850-
#######################################################################
function datos_amplio_memoria_tabla {
#EN-7860-
	if [[ $seleccionMenuEleccionEntradaDatos -eq 4 ]]; then 
		echo -e "$amarillo Por favor establezca los rangos para datos"                  
	elif [[ $seleccionMenuEleccionEntradaDatos -eq 5 || $seleccionMenuEleccionEntradaDatos -eq 6 ]]; then 
		echo -e "$amarillo Resultados actuales:"                  
	fi
	echo -e "$azul┌────────────────────────────────────────────────────────────────────────┐" | tee -a $informeConColorTotal
	printf  "$azul│$NC""${varhuecos:1:$((33))}""Min-Max_amplio   Min-Max_rango   Valor""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Nº de Marcos de Memoria: ""${varhuecos:1:$((7 - ${#memoria_minInicial}))}""$memoria_minInicial"" - ""$memoria_maxInicial""${varhuecos:1:$((7 - ${#memoria_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_MARCOS}))}""$MIN_RANGE_MARCOS"" - ""$MAX_RANGE_MARCOS""${varhuecos:1:$((5 - ${#MAX_RANGE_MARCOS}))}""  ""${varhuecos:1:$((5 - ${#mem_num_marcos}))}""$mem_num_marcos""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Nº de Direcciones/Marco: ""${varhuecos:1:$((7 - ${#direcciones_minInicial}))}""$direcciones_minInicial"" - ""$direcciones_maxInicial""${varhuecos:1:$((7 - ${#direcciones_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_DIRECCIONES}))}""$MIN_RANGE_DIRECCIONES"" - ""$MAX_RANGE_DIRECCIONES""${varhuecos:1:$((5 - ${#MAX_RANGE_DIRECCIONES}))}""  ""${varhuecos:1:$((5 - ${#mem_direcciones}))}""$mem_direcciones""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Prioridad Menor: ""${varhuecos:1:$((15 - ${#prio_menor_minInicial}))}""$prio_menor_minInicial"" - ""$prio_menor_maxInicial""${varhuecos:1:$((7 - ${#prio_menor_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_prio_menorInicial}))}""$MIN_RANGE_prio_menorInicial"" - ""$MAX_RANGE_prio_menorInicial""${varhuecos:1:$((5 - ${#MAX_RANGE_prio_menorInicial}))}""  ""${varhuecos:1:$((5 - ${#prio_menorInicial}))}""$prio_menorInicial""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Prioridad Mayor: ""${varhuecos:1:$((15 - ${#prio_mayor_minInicial}))}""$prio_mayor_minInicial"" - ""$prio_mayor_maxInicial""${varhuecos:1:$((7 - ${#prio_mayor_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_prio_mayorInicial}))}""$MIN_RANGE_prio_mayorInicial"" - ""$MAX_RANGE_prio_mayorInicial""${varhuecos:1:$((5 - ${#MAX_RANGE_prio_mayorInicial}))}""  ""${varhuecos:1:$((5 - ${#prio_mayorInicial}))}""$prio_mayorInicial""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Reubicacion: ""${varhuecos:1:$((19 - ${#reubicacion_minInicial}))}""$reubicacion_minInicial"" - ""$reubicacion_maxInicial""${varhuecos:1:$((7 - ${#reubicacion_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_REUB}))}""$MIN_RANGE_REUB"" - ""$MAX_RANGE_REUB""${varhuecos:1:$((5 - ${#MAX_RANGE_REUB}))}""  ""${varhuecos:1:$((5 - ${#reub}))}""$reub""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Nº de procesos: ""${varhuecos:1:$((16 - ${#programas_minInicial}))}""$programas_minInicial"" - ""$programas_maxInicial""${varhuecos:1:$((7 - ${#programas_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_NPROC}))}""$MIN_RANGE_NPROC"" - ""$MAX_RANGE_NPROC""${varhuecos:1:$((5 - ${#MAX_RANGE_NPROC}))}""  ""${varhuecos:1:$((5 - ${#n_prog}))}""$n_prog""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Tiempo de llegada: ""${varhuecos:1:$((13 - ${#llegada_minInicial}))}""$llegada_minInicial"" - ""$llegada_maxInicial""${varhuecos:1:$((7 - ${#llegada_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_llegada}))}""$MIN_RANGE_llegada"" - ""$MAX_RANGE_llegada""${varhuecos:1:$((12 - ${#MAX_RANGE_llegada}))}""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Tiempo de ejecución: ""${varhuecos:1:$((11 - ${#tiempo_ejec_minInicial}))}""$tiempo_ejec_minInicial"" - ""$tiempo_ejec_maxInicial""${varhuecos:1:$((7 - ${#tiempo_ejec_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_tiempo_ejec}))}""$MIN_RANGE_tiempo_ejec"" - ""$MAX_RANGE_tiempo_ejec""${varhuecos:1:$((12 - ${#MAX_RANGE_tiempo_ejec}))}""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Nº de marcos/proceso: ""${varhuecos:1:$((10 - ${#tamano_marcos_proc_minInicial}))}""$tamano_marcos_proc_minInicial"" - ""$tamano_marcos_proc_maxInicial""${varhuecos:1:$((7 - ${#tamano_marcos_proc_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_tamano_marcos_proc}))}""$MIN_RANGE_tamano_marcos_proc"" - ""$MAX_RANGE_tamano_marcos_proc""${varhuecos:1:$((12 - ${#MAX_RANGE_tamano_marcos_proc}))}""$azul │\n" | tee -a $informeConColorTotal
#    printf "$azul│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((11 - ${#prio_proc_min}))}""$prio_proc_min"" - ""$prio_proc_max""${varhuecos:1:$((7 - ${#prio_proc_max}))}""  " | tee -a $informeConColorTotal
#    printf "${varhuecos:1:$((5 - ${#MIN_RANGE_prio_proc}))}""$MIN_RANGE_prio_proc"" - ""$MAX_RANGE_prio_proc""${varhuecos:1:$((12 - ${#MAX_RANGE_prio_proc}))}""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((11 - ${#prio_menor}))}""$prio_menor"" - ""$prio_mayor""${varhuecos:1:$((7 - ${#prio_mayor}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#prio_menor}))}""$prio_menor"" - ""$prio_mayor""${varhuecos:1:$((12 - ${#prio_mayor}))}""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Quantum: ""${varhuecos:1:$((23 - ${#quantum_minInicial}))}""$quantum_minInicial"" - ""$quantum_maxInicial""${varhuecos:1:$((7 - ${#quantum_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_quantum}))}""$MIN_RANGE_quantum"" - ""$MAX_RANGE_quantum""${varhuecos:1:$((12 - ${#MAX_RANGE_quantum}))}""$azul │\n" | tee -a $informeConColorTotal
	printf "$azul│$NC Rango Nº de direcciones/proceso: ""${varhuecos:1:$((5 - ${#tamano_direcciones_proc_minInicial}))}""$tamano_direcciones_proc_minInicial"" - ""$tamano_direcciones_proc_maxInicial""${varhuecos:1:$((7 - ${#tamano_direcciones_proc_maxInicial}))}""  " | tee -a $informeConColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_tamano_direcciones_proc}))}""$MIN_RANGE_tamano_direcciones_proc"" - ""$MAX_RANGE_tamano_direcciones_proc""${varhuecos:1:$((12 - ${#MAX_RANGE_tamano_direcciones_proc}))}""$azul │\n" | tee -a $informeConColorTotal
	echo -e "$azul└────────────────────────────────────────────────────────────────────────┘" | tee -a $informeConColorTotal  
	
	echo -e "┌────────────────────────────────────────────────────────────────────────┐" >> $informeSinColorTotal
	printf "│$NC""${varhuecos:1:$((33))}""Min-Max_amplio Min-Max_rango Valor"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Nº de Marcos de Memoria: ""${varhuecos:1:$((7 - ${#memoria_minInicial}))}""$memoria_minInicial"" - ""$memoria_maxInicial""${varhuecos:1:$((7 - ${#memoria_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_MARCOS}))}""$MIN_RANGE_MARCOS"" - ""$MAX_RANGE_MARCOS""${varhuecos:1:$((5 - ${#MAX_RANGE_MARCOS}))}""  ""${varhuecos:1:$((5 - ${#mem_num_marcos}))}""$mem_num_marcos"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Nº de Direcciones/Marco: ""${varhuecos:1:$((7 - ${#direcciones_minInicial}))}""$direcciones_minInicial"" - ""$direcciones_maxInicial""${varhuecos:1:$((7 - ${#direcciones_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_DIRECCIONES}))}""$MIN_RANGE_DIRECCIONES"" - ""$MAX_RANGE_DIRECCIONES""${varhuecos:1:$((5 - ${#MAX_RANGE_DIRECCIONES}))}""  ""${varhuecos:1:$((5 - ${#mem_direcciones}))}""$mem_direcciones"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Prioridad Menor: ""${varhuecos:1:$((15 - ${#prio_menor_minInicial}))}""$prio_menor_minInicial"" - ""$prio_menor_maxInicial""${varhuecos:1:$((7 - ${#prio_menor_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_prio_menorInicial}))}""$MIN_RANGE_prio_menorInicial"" - ""$MAX_RANGE_prio_menorInicial""${varhuecos:1:$((5 - ${#MAX_RANGE_prio_menorInicial}))}""  ""${varhuecos:1:$((5 - ${#prio_menorInicial}))}""$prio_menorInicial"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Prioridad Mayor: ""${varhuecos:1:$((15 - ${#prio_mayor_minInicial}))}""$prio_mayor_minInicial"" - ""$prio_mayor_maxInicial""${varhuecos:1:$((7 - ${#prio_mayor_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_prio_mayorInicial}))}""$MIN_RANGE_prio_mayorInicial"" - ""$MAX_RANGE_prio_mayorInicial""${varhuecos:1:$((5 - ${#MAX_RANGE_prio_mayorInicial}))}""  ""${varhuecos:1:$((5 - ${#prio_mayorInicial}))}""$prio_mayorInicial"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Reubicacion: ""${varhuecos:1:$((19 - ${#reubicacion_minInicial}))}""$reubicacion_minInicial"" - ""$reubicacion_maxInicial""${varhuecos:1:$((7 - ${#reubicacion_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_REUB}))}""$MIN_RANGE_REUB"" - ""$MAX_RANGE_REUB""${varhuecos:1:$((5 - ${#MAX_RANGE_REUB}))}""  ""${varhuecos:1:$((5 - ${#reub}))}""$reub"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Nº de procesos: ""${varhuecos:1:$((16 - ${#programas_minInicial}))}""$programas_minInicial"" - ""$programas_maxInicial""${varhuecos:1:$((7 - ${#programas_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_NPROC}))}""$MIN_RANGE_NPROC"" - ""$MAX_RANGE_NPROC""${varhuecos:1:$((5 - ${#MAX_RANGE_NPROC}))}""  ""${varhuecos:1:$((5 - ${#n_prog}))}""$n_prog"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Tiempo de llegada: ""${varhuecos:1:$((13 - ${#llegada_minInicial}))}""$llegada_minInicial"" - ""$llegada_maxInicial""${varhuecos:1:$((7 - ${#llegada_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_llegada}))}""$MIN_RANGE_llegada"" - ""$MAX_RANGE_llegada""${varhuecos:1:$((12 - ${#MAX_RANGE_llegada}))}"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Tiempo de ejecución: ""${varhuecos:1:$((11 - ${#tiempo_ejec_minInicial}))}""$tiempo_ejec_minInicial"" - ""$tiempo_ejec_maxInicial""${varhuecos:1:$((7 - ${#tiempo_ejec_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_tiempo_ejec}))}""$MIN_RANGE_tiempo_ejec"" - ""$MAX_RANGE_tiempo_ejec""${varhuecos:1:$((12 - ${#MAX_RANGE_tiempo_ejec}))}"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Nº de marcos/proceso: ""${varhuecos:1:$((10 - ${#tamano_marcos_proc_minInicial}))}""$tamano_marcos_proc_minInicial"" - ""$tamano_marcos_proc_maxInicial""${varhuecos:1:$((7 - ${#tamano_marcos_proc_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_tamano_marcos_proc}))}""$MIN_RANGE_tamano_marcos_proc"" - ""$MAX_RANGE_tamano_marcos_proc""${varhuecos:1:$((12 - ${#MAX_RANGE_tamano_marcos_proc}))}"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((11 - ${#prio_menor}))}""$prio_menor"" - ""$prio_mayor""${varhuecos:1:$((7 - ${#prio_mayor}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#prio_menor}))}""$prio_menor"" - ""$prio_mayor""${varhuecos:1:$((12 - ${#prio_mayor}))}"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Quantum: ""${varhuecos:1:$((23 - ${#quantum_minInicial}))}""$quantum_minInicial"" - ""$quantum_maxInicial""${varhuecos:1:$((7 - ${#quantum_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_quantum}))}""$MIN_RANGE_quantum"" - ""$MAX_RANGE_quantum""${varhuecos:1:$((12 - ${#MAX_RANGE_quantum}))}"" │\n" >> $informeSinColorTotal
	printf "│$NC Rango Nº de direcciones/proceso: ""${varhuecos:1:$((5 - ${#tamano_direcciones_proc_minInicial}))}""$tamano_direcciones_proc_minInicial"" - ""$tamano_direcciones_proc_maxInicial""${varhuecos:1:$((7 - ${#tamano_direcciones_proc_maxInicial}))}""  " >> $informeSinColorTotal
	printf "${varhuecos:1:$((5 - ${#MIN_RANGE_tamano_direcciones_proc}))}""$MIN_RANGE_tamano_direcciones_proc"" - ""$MAX_RANGE_tamano_direcciones_proc""${varhuecos:1:$((12 - ${#MAX_RANGE_tamano_direcciones_proc}))}"" │\n" >> $informeSinColorTotal
	echo -e "└────────────────────────────────────────────────────────────────────────┘" >> $informeSinColorTotal 
#EN-7870-

#######################################################################
#######################################################################
# funciones para la petición de datos de la opción 4 ##################
#######################################################################
#EN-7880-
#######################################################################
function datos_numero_marcos_memoria {
	datos_memoria_tabla 
	until [[ $MAX_RANGE_MARCOS -ge $MIN_RANGE_MARCOS && $MIN_RANGE_MARCOS -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de marcos de memoria$cian:$NC" 
#EN-7890-
		echo -e "$cian Por favor, establezca el máximo del rango para el número de marcos de memoria$cian:$NC"
#EN-7900-
#EN-7910-
			invertirRangos $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS
			MIN_RANGE_MARCOS=$min
			MAX_RANGE_MARCOS=$max
		fi
#EN-7920-
			desplazarRangos $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS
			MIN_RANGE_MARCOS=$min
			MAX_RANGE_MARCOS=$max
		fi  
	done
#EN-7930-

#######################################################################
#EN-7940-
#######################################################################
function datos_numero_marcos_memoria_amplio {
	datos_amplio_memoria_tabla
	until [[ $memoria_maxInicial -ge $memoria_minInicial && $memoria_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de marcos de memoria$cian:$NC" 
#EN-7950-
		echo -e "$cian Por favor, establezca el máximo del rango para el número de marcos de memoria$cian:$NC"
#EN-7960-
#EN-7970-
			invertirRangos $memoria_minInicial $memoria_maxInicial
			memoria_minInicial=$min
			memoria_maxInicial=$max
		fi
#EN-7980-
			desplazarRangos $memoria_minInicial $memoria_maxInicial
			memoria_minInicial=$min
			memoria_maxInicial=$max
		fi  
	done
#EN-7990-
	memoria_max=$memoria_maxInicial
#EN-8000-

#######################################################################
#EN-8010-
#######################################################################
function datos_numero_direcciones_marco {
	datos_memoria_tabla 
	until [[ $MAX_RANGE_DIRECCIONES -ge $MIN_RANGE_DIRECCIONES && $MIN_RANGE_DIRECCIONES -gt 0 ]]; do                 
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de direcciones por marco$cian:$NC" 
#EN-8020-
		echo -e "$cian Por favor, establezca el máximo del rango para el número de direcciones por marco$cian:$NC"
#EN-8030-
#EN-8040-
			invertirRangos $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
			MIN_RANGE_DIRECCIONES=$min
			MAX_RANGE_DIRECCIONES=$max
		fi
#EN-8050-
			desplazarRangos $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
			MIN_RANGE_DIRECCIONES=$min
			MAX_RANGE_DIRECCIONES=$max
		fi  
	done                    
#EN-8060-

#######################################################################
#EN-8070-
#######################################################################
function datos_numero_direcciones_marco_amplio {
	datos_amplio_memoria_tabla
	until [[ $direcciones_maxInicial -ge $direcciones_minInicial && $direcciones_minInicial -gt 0 ]]; do                 
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de direcciones por marco$cian:$NC" 
#EN-8080-
		echo -e "$cian Por favor, establezca el máximo del rango para el número de direcciones por marco$cian:$NC"
#EN-8090-
#EN-8100-
			invertirRangos $direcciones_minInicial $direcciones_maxInicial
			direcciones_minInicial=$min
			direcciones_maxInicial=$max
		fi
#EN-8110-
			desplazarRangos $direcciones_minInicial $direcciones_maxInicial
			direcciones_minInicial=$min
			direcciones_maxInicial=$max
		fi  
	done                    
	direcciones_min=$direcciones_minInicial
	direcciones_max=$direcciones_maxInicial
#EN-8120-
						
#######################################################################
#EN-8130-
#######################################################################
function datos_prio_menor {
	datos_memoria_tabla 
	echo -e "$cian Por favor, establezca el mínimo del rango para la prioridad menor$cian:$NC" 
#EN-8140-
	echo -e "$cian Por favor, establezca el máximo del rango para la prioridad menor$cian:$NC"
#EN-8150-
	prio_menor_min=$prio_menor_minInicial
	prio_menor_max=$prio_menor_maxInicial
#EN-8160-
						
#######################################################################
#EN-8170-
#######################################################################
function datos_prio_menor_amplio {
	datos_amplio_memoria_tabla
	echo -e "$cian Por favor, establezca el mínimo del rango para la prioridad menor$cian:$NC" 
#EN-8180-
	echo -e "$cian Por favor, establezca el máximo del rango para la prioridad menor$cian:$NC"
#EN-8190-
	prio_menor_min=$prio_menor_minInicial
	prio_menor_max=$prio_menor_maxInicial
#EN-8200-
						
#######################################################################
#EN-8210-
#######################################################################
function datos_prio_mayor {
	datos_memoria_tabla 
	echo -e "$cian Por favor, establezca el mínimo del rango para la prioridad mayor$cian:$NC" 
#EN-8220-
	echo -e "$cian Por favor, establezca el máximo del rango para la prioridad mayor$cian:$NC"
#EN-8230-
	prio_mayor_min=$prio_mayor_minInicial
	prio_mayor_max=$prio_mayor_maxInicial
#EN-8240-
						
#######################################################################
#EN-8250-
#######################################################################
function datos_prio_mayor_amplio {
	datos_amplio_memoria_tabla
	echo -e "$cian Por favor, establezca el mínimo del rango para la prioridad mayor$cian:$NC" 
#EN-8260-
	echo -e "$cian Por favor, establezca el máximo del rango para la prioridad mayor$cian:$NC"
#EN-8270-
	prio_mayor_min=$prio_mayor_minInicial
	prio_mayor_max=$prio_mayor_maxInicial
#EN-8280-

#######################################################################
#EN-8290-
#######################################################################
function datos_numero_programas {
	datos_memoria_tabla 
	until [[ $MAX_RANGE_NPROC -ge $MIN_RANGE_NPROC && $MIN_RANGE_NPROC -gt 0 ]]; do                 
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de procesos$cian:$NC" 
#EN-8300-
		echo -e "$cian Por favor, establezca el máximo del rango para el número de procesos$cian:$NC"
#EN-8310-
#EN-8320-
			invertirRangos $MIN_RANGE_NPROC $MAX_RANGE_NPROC
			MIN_RANGE_NPROC=$min
			MAX_RANGE_NPROC=$max
		fi
#EN-8330-
			desplazarRangos $MIN_RANGE_NPROC $MAX_RANGE_NPROC
			MIN_RANGE_NPROC=$min
			MAX_RANGE_NPROC=$max
		fi  
	done                    
#EN-8340-

#######################################################################
#EN-8350-
#######################################################################
function datos_numero_programas_amplio {
	datos_amplio_memoria_tabla
	until [[ $programas_maxInicial -ge $programas_minInicial && $programas_minInicial -gt 0 ]]; do                 
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de procesos$cian:$NC" 
#EN-8360-
		echo -e "$cian Por favor, establezca el máximo del rango para el número de procesos$cian:$NC"
#EN-8370-
#EN-8380-
			invertirRangos $programas_minInicial $programas_maxInicial
			programas_minInicial=$min
			programas_maxInicial=$max
		fi
#EN-8390-
			desplazarRangos $programas_minInicial $programas_maxInicial
			programas_minInicial=$min
			programas_maxInicial=$max
		fi  
	done                    
		programas_min=$programas_minInicial
		programas_max=$programas_maxInicial
#EN-8400-

#######################################################################
#EN-8410-
#######################################################################
function datos_tamano_reubicacion { 
	datos_memoria_tabla 
#EN-8420-
		echo -e "$cian Por favor, establezca el mínimo del rango para la variable de reubicacion$cian:$NC" 
#EN-8430-
		echo -e "$cian Por favor, establezca el máximo del rango para la variable de reubicacion$cian:$NC" 
#EN-8440-
#EN-8450-
			invertirRangos $MIN_RANGE_REUB $MAX_RANGE_REUB
			MIN_RANGE_REUB=$min
			MAX_RANGE_REUB=$max
		fi
#EN-8460-
			desplazarRangos $MIN_RANGE_REUB $MAX_RANGE_REUB
			MIN_RANGE_REUB=$min
			MAX_RANGE_REUB=$max
		fi  
	done                        
#EN-8470-

#######################################################################
#EN-8480-
#######################################################################
function datos_tamano_reubicacion_amplio { 
	datos_amplio_memoria_tabla
#EN-8490-
		echo -e "$cian Por favor, establezca el mínimo del rango para la variable de reubicacion$cian:$NC" 
#EN-8500-
		echo -e "$cian Por favor, establezca el máximo del rango para la variable de reubicacion$cian:$NC" 
#EN-8510-
#EN-8520-
			invertirRangos $reubicacion_minInicial $reubicacion_maxInicial
			reubicacion_minInicial=$min
			reubicacion_maxInicial=$max
		fi
#EN-8530-
			desplazarRangos $reubicacion_minInicial $reubicacion_maxInicial
			reubicacion_minInicial=$min
			reubicacion_maxInicial=$max
		fi  
		reubicacion_min=$reubicacion_minInicial
		reubicacion_max=$reubicacion_maxInicial
	done                        
#EN-8540-
				
#######################################################################
#EN-8550-
#######################################################################
function datos_tiempo_llegada {
	datos_memoria_tabla 
	MIN_RANGE_llegada=-1 
	until [[ $MAX_RANGE_llegada -ge $MIN_RANGE_llegada && $(($MIN_RANGE_llegada + 1)) -gt 0 ]]; do  
		echo -e "$cian Por favor, establezca el mínimo del rango para el tiempo de llegada$cian:$NC" 
#EN-8560-
		echo -e "$cian Por favor, establezca el máximo del rango para el tiempo de llegada$cian:$NC" 
#EN-8570-
		if [[ $MIN_RANGE_llegada -gt $MAX_RANGE_llegada ]]; then
			invertirRangos $MIN_RANGE_llegada $MAX_RANGE_llegada
			MIN_RANGE_llegada=$min
			MAX_RANGE_llegada=$max
		fi
#EN-8580-
			desplazarRangos $MIN_RANGE_llegada $MAX_RANGE_llegada
#EN-8590-
			MAX_RANGE_llegada=$(($max - 1))
		fi  
	done
#EN-8600-
				
#######################################################################
#EN-8610-
#######################################################################
function datos_tiempo_llegada_amplio {
	datos_amplio_memoria_tabla
	llegada_minInicial=-1 
	until [[ $llegada_maxInicial -ge $llegada_minInicial && $(($llegada_minInicial + 1)) -gt 0 ]]; do  
		echo -e "$cian Por favor, establezca el mínimo del rango para el tiempo de llegada$cian:$NC" 
#EN-8620-
		echo -e "$cian Por favor, establezca el máximo del rango para el tiempo de llegada$cian:$NC" 
#EN-8630-
		if [[ $llegada_minInicial -gt $llegada_maxInicial ]]; then
			invertirRangos $llegada_minInicial $llegada_maxInicial
			llegada_minInicial=$min
			llegada_maxInicial=$max
		fi
#EN-8640-
			desplazarRangos $llegada_minInicial $llegada_maxInicial
#EN-8650-
			llegada_maxInicial=$(($max - 1))
		fi  
		llegada_min=$llegada_minInicial
		llegada_max=$llegada_maxInicial
	done
#EN-8660-
						
#######################################################################
#EN-8670-
#######################################################################
function datos_tiempo_ejecucion {
	datos_memoria_tabla 
	until [[ $MAX_RANGE_tiempo_ejec -ge $MIN_RANGE_tiempo_ejec && $MIN_RANGE_tiempo_ejec -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el tiempo de ejecución$cian:$NC" 
#EN-8680-
		echo -e "$cian Por favor, establezca el máximo del rango para el tiempo de ejecución$cian:$NC"
#EN-8690-
#EN-8700-
			invertirRangos $MIN_RANGE_tiempo_ejec $MAX_RANGE_tiempo_ejec
			MIN_RANGE_tiempo_ejec=$min
			MAX_RANGE_tiempo_ejec=$max
		fi
#EN-8710-
			desplazarRangos $MIN_RANGE_tiempo_ejec $MAX_RANGE_tiempo_ejec
			MIN_RANGE_tiempo_ejec=$min
			MAX_RANGE_tiempo_ejec=$max
		fi  
	done
#EN-8720-
						
#######################################################################
#EN-8730-
#######################################################################
function datos_tiempo_ejecucion_amplio {
	datos_amplio_memoria_tabla
	until [[ $tiempo_ejec_maxInicial -ge $tiempo_ejec_minInicial && $tiempo_ejec_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el tiempo de ejecución$cian:$NC" 
#EN-8740-
		echo -e "$cian Por favor, establezca el máximo del rango para el tiempo de ejecución$cian:$NC"
#EN-8750-
#EN-8760-
			invertirRangos $tiempo_ejec_minInicial $tiempo_ejec_maxInicial
			tiempo_ejec_minInicial=$min
			tiempo_ejec_maxInicial=$max
		fi
#EN-8770-
			desplazarRangos $tiempo_ejec_minInicial $tiempo_ejec_maxInicial
			tiempo_ejec_minInicial=$min
			tiempo_ejec_maxInicial=$max
		fi  
		tiempo_ejec_min=$tiempo_ejec_minInicial
		tiempo_ejec_max=$tiempo_ejec_maxInicial
	done
#EN-8780-
						
#######################################################################
#EN-8790-
#######################################################################
function datos_prio_proc {
	datos_memoria_tabla 
#EN-8800-
						
#######################################################################
#EN-8810-
#######################################################################
function datos_prio_proc_amplio {
	datos_amplio_memoria_tabla
#EN-8820-

#######################################################################
#EN-8830-
#######################################################################
function datos_tamano_marcos_procesos {                
	datos_memoria_tabla 
	until [[ $MAX_RANGE_tamano_marcos_proc -ge $MIN_RANGE_tamano_marcos_proc && $MIN_RANGE_tamano_marcos_proc -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de marcos asociados a cada proceso$cian:$NC" 
#EN-8840-
		echo -e "$cian Por favor, establezca el máximo del rango para el número de marcos asociados a cada proceso:$NC" 
#EN-8850-
#EN-8860-
			invertirRangos $MIN_RANGE_tamano_marcos_proc $MAX_RANGE_tamano_marcos_proc
			MIN_RANGE_tamano_marcos_proc=$min
			MAX_RANGE_tamano_marcos_proc=$max
		fi
#EN-8870-
			desplazarRangos $MIN_RANGE_tamano_marcos_proc $MAX_RANGE_tamano_marcos_proc
			MIN_RANGE_tamano_marcos_proc=$min
			MAX_RANGE_tamano_marcos_proc=$max
		fi  
	done
#EN-8880-

#######################################################################
#EN-8890-
#######################################################################
function datos_tamano_marcos_procesos_amplio {                
	datos_amplio_memoria_tabla
	until [[ $tamano_marcos_proc_maxInicial -ge $tamano_marcos_proc_minInicial && $tamano_marcos_proc_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de marcos asociados a cada proceso$cian:$NC" 
#EN-8900-
		echo -e "$cian Por favor, establezca el máximo del rango para el número de marcos asociados a cada proceso:$NC" 
#EN-8910-
#EN-8920-
			invertirRangos $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial
			tamano_marcos_proc_minInicial=$min
			tamano_marcos_proc_maxInicial=$max
		fi
#EN-8930-
			desplazarRangos $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial
			tamano_marcos_proc_minInicial=$min
			tamano_marcos_proc_maxInicial=$max
		fi  
		tamano_marcos_proc_min=$tamano_marcos_proc_minInicial
		tamano_marcos_proc_max=$tamano_marcos_proc_maxInicial
	done
#EN-8940-

#######################################################################
#EN-8950-
#######################################################################
function datos_tamano_direcciones_procesos {                
	datos_memoria_tabla 
	until [[ $MAX_RANGE_tamano_direcciones_proc -ge $MIN_RANGE_tamano_direcciones_proc && $MIN_RANGE_tamano_direcciones_proc -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el tamaño del proceso en direcciones$cian:$NC" 
#EN-8960-
		echo -e "$cian Por favor, establezca el máximo del rango para el tamaño del proceso en direcciones$cian:$NC" 
#EN-8970-
#EN-8980-
			invertirRangos $MIN_RANGE_tamano_direcciones_proc $MAX_RANGE_tamano_direcciones_proc
			MIN_RANGE_tamano_direcciones_proc=$min
			MAX_RANGE_tamano_direcciones_proc=$max
		fi
#EN-8990-
			desplazarRangos $MIN_RANGE_tamano_direcciones_proc $MAX_RANGE_tamano_direcciones_proc
			MIN_RANGE_tamano_direcciones_proc=$min
			MAX_RANGE_tamano_direcciones_proc=$max
		fi  
	done
#EN-9000-

#######################################################################
#EN-9010-
#######################################################################
function datos_tamano_direcciones_procesos_amplio {                
	datos_amplio_memoria_tabla
	until [[ $tamano_direcciones_proc_maxInicial -ge $tamano_direcciones_proc_minInicial && $tamano_direcciones_proc_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el tamaño del proceso en direcciones$cian:$NC" 
#EN-9020-
		echo -e "$cian Por favor, establezca el máximo del rango para el tamaño del proceso en direcciones$cian:$NC" 
#EN-9030-
#EN-9040-
			invertirRangos $tamano_direcciones_proc_minInicial $tamano_direcciones_proc_maxInicial
			tamano_direcciones_proc_minInicial=$min
			tamano_direcciones_proc_maxInicial=$max
		fi
#EN-9050-
			desplazarRangos $tamano_direcciones_proc_minInicial $tamano_direcciones_proc_maxInicial
			tamano_direcciones_proc_minInicial=$min
			tamano_direcciones_proc_maxInicial=$max
		fi  
		tamano_direcciones_proc_min=$tamano_direcciones_proc_minInicial
		tamano_direcciones_proc_max=$tamano_direcciones_proc_maxInicial
	done
#EN-9060-

#######################################################################
#EN-9070-
#######################################################################
function datos_quantum {                
	datos_memoria_tabla 
	until [[ $MAX_RANGE_quantum -ge $MIN_RANGE_quantum && $MIN_RANGE_quantum -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el quantum$cian:$NC" 
#EN-9080-
		echo -e "$cian Por favor, establezca el máximo del rango para el quantum$cian:$NC" 
#EN-9090-
#EN-9100-
			invertirRangos $MIN_RANGE_quantum $MAX_RANGE_quantum
			MIN_RANGE_quantum=$min
			MAX_RANGE_quantum=$max
		fi
#EN-9110-
			desplazarRangos $MIN_RANGE_quantum $MAX_RANGE_quantum
			MIN_RANGE_quantum=$min
			MAX_RANGE_quantum=$max 
		fi  
	done
#EN-9120-

#######################################################################
#EN-9130-
#######################################################################
function datos_quantum_amplio {                
	datos_amplio_memoria_tabla
	until [[ $quantum_maxInicial -ge $quantum_minInicial && $quantum_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el quantum:$NC" 
#EN-9140-
		echo -e "$cian Por favor, establezca el máximo del rango para el quantum$cian:$NC" 
#EN-9150-
#EN-9160-
			invertirRangos $quantum_minInicial $quantum_maxInicial
			quantum_minInicial=$min
			quantum_maxInicial=$max
		fi
#EN-9170-
			desplazarRangos $quantum_minInicial $quantum_maxInicial
			quantum_minInicial=$min
			quantum_maxInicial=$max
		fi  
		quantum_min=$quantum_minInicial
		quantum_max=$quantum_maxInicial
	done
#EN-9180-

#######################################################################
#######################################################################
#   Funciones para el cálculo de los datos desde los rangos   #########
#######################################################################
#EN-9190-
#######################################################################
function calcDatoAleatorioGeneral {
	#Llamada: calcDatoAleatorioGeneral $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS #Asignación: mem_num_marcos=$datoAleatorioGeneral  #Variable devuelta: mem=$((RANDOM % ($max - $min + 1) + $min))
#EN-9200-
#EN-9210-
#EN-9220-
#EN-9230-

#######################################################################
# Sinopsis: #Si los mínimos son mayores que los invierten los rangos. 
#######################################################################
function invertirRangos {
	aux=$1
	min=$2
	max=$aux
#EN-9240-

#######################################################################
# Sinopsis: #Si mínimo y máximo son negativos se desplaza el mínimo hasta ser 0. 
#######################################################################
function desplazarRangos {
#EN-9250-
#EN-9260-
#EN-9270-

#######################################################################
#EN-9280-
#######################################################################
function  Establecimiento_colores_proces {
	col=1
	aux=0
	for (( i=0,j=0; i<$nprocesos; i++,j++)); do
#EN-9290-
		indice[$i]=$j
		while [[ ${indice[$i]} -ge $auxiliar ]]; do
			indice[$i]=$[ ${indice[$i]} - $auxiliar ]
		done
		colores[$i]=${coloress[${indice[$i]}]}
		colorfondo[$i]=${colorfondos[${indice[$i]}]}
#EN-9300-
			j=$((j-16))
		fi
	done
#EN-9310-

#######################################################################
#EN-9320-
#######################################################################
#EN-9330-
#EN-9340-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC"
#EN-9350-

#EN-9360-
#EN-9370-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal"
#EN-9380-

#######################################################################
#EN-9390-
#######################################################################
#EN-9400-
#EN-9410-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC" 
#EN-9420-

#EN-9430-
#EN-9440-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal" 
#EN-9450-

#######################################################################
#EN-9460-
#######################################################################
#EN-9470-
#EN-9480-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC"
#EN-9490-

#EN-9500-
#EN-9510-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal"
#EN-9520-

#######################################################################
#EN-9530-
#######################################################################
#EN-9540-
#EN-9550-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC"
#EN-9560-

#EN-9570-
#EN-9580-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal"
#EN-9590-

#######################################################################
#EN-9600-
#######################################################################
#EN-9610-
#EN-9620-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC"
#EN-9630-

#EN-9640-
#EN-9650-
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal"
#EN-9660-

####################################################################################
#EN-9670-
#EN-9680-
####################################################################################
function nuevaEjecucion {
#EN-9690-
	if [[ -f $ficheroDatosAnteriorEjecucion ]]; then
		rm $ficheroDatosAnteriorEjecucion   
	fi
	if [[ -f $ficherosRangosAnteriorEjecucion && ($seleccionMenuEleccionEntradaDatos -eq 4 || $seleccionMenuEleccionEntradaDatos -eq 6 || $seleccionMenuEleccionEntradaDatos -eq 7 || $seleccionMenuEleccionEntradaDatos -eq 8 || $seleccionMenuEleccionEntradaDatos -eq 9) ]]; then
		rm $ficherosRangosAnteriorEjecucion     
	fi
	if [[ -f $ficheroRangosAleTotalAnteriorEjecucion && ($seleccionMenuEleccionEntradaDatos -eq 7 || $seleccionMenuEleccionEntradaDatos -eq 9) ]]; then
		rm $ficheroRangosAleTotalAnteriorEjecucion     
	fi
#EN-9700-

#######################################################################
#EN-9710-
#######################################################################
function calcularUnidad {
	sumatorio=0
	sumatorio1=0
	sumatorio2=0
	for (( i=0; i<$nprocesos; i++ )); do
		sumatorio1=$(( sumatorio1 + ${llegada[$i]} + ${tejecucion[$i]} ))
	done
	for (( i=0; i<$nprocesos; i++ )); do
		for (( ii=0; ii<${tejecucion[$i]}; ii++ )); do
			if [[ $sumatorio2 -lt ${paginasDefinidasTotal[$i,$ii]} ]]; then
				sumatorio2=${paginasDefinidasTotal[$i,$ii]}
			fi
		done
	done
	if [[ $sumatorio2 -lt $sumatorio1 ]]; then
		sumatorio=$sumatorio1
	else
		sumatorio=$sumatorio2
	fi
	espacios=$(echo -n "$sumatorio" | wc -c)
	if [[ $espacios -le 2 ]]; then
		digitosUnidad=3
	else
		digitosUnidad=$espacios
		digitosUnidad=$(( $digitosUnidad + 1 ))
	fi
#EN-9720-

####################################################################################
#EN-9730-
####################################################################################
function entradaMemoriaDatosFichero {
#EN-9740-
	echo -e $ROJO"\nFicheros de datos a elegir en './FDatos/': "$NORMAL | tee -a $informeConColorTotal
	echo -e "\nFicheros de datos a elegir en './FDatos/': " >> $informeSinColorTotal
	files=($(ls -l ./FDatos/ | awk '{print $9}'))
#EN-9750-
		echo -e "$i) ${files[$i]}"
	done
	echo -ne "$AMARILLO\n\n\nIntroduce el número correspondiente al fichero a analizar: $NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n\nIntroduce el número correspondiente al fichero a analizar: " >> $informeSinColorTotal
	read -r numeroFichero
#EN-9760-
		echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read -r numeroFichero
		echo -e "$numeroFichero\n\n" >> $informeConColorTotal
		echo -e "$numeroFichero\n\n" >> $informeSinColorTotal
	done
	ficheroParaLectura="./FDatos/${files[$numeroFichero]}"
#EN-9770-

####################################################################################
#EN-9780-
####################################################################################
function entradaMemoriaRangosFichero {
#EN-9790-
	echo -e $ROJO"\nFicheros de datos a elegir en './FDatos/': "$NORMAL | tee -a $informeConColorTotal
	echo -e "\nFicheros de datos a elegir en './FDatos/': " >> $informeSinColorTotal
	files=($(ls -l ./FDatos/ | awk '{print $9}'))
#EN-9800-
		echo -e "$i) ${files[$i]}"
	done
	echo -ne "$AMARILLO\n\n\nIntroduce el número correspondiente al fichero a analizar: $NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n\nIntroduce el número correspondiente al fichero a analizar: " >> $informeSinColorTotal
	read -r numeroFichero
#EN-9810-
		echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read -r numeroFichero
		echo -e "$numeroFichero\n\n" >> $informeConColorTotal
		echo -e "$numeroFichero\n\n" >> $informeSinColorTotal
	done
	ficheroParaLectura="./FDatos/${files[$numeroFichero]}"
#EN-9820-

####################################################################################
####################################################################################
# Funciones de inicialización ######################################################
####################################################################################
#EN-9830-
####################################################################################
function inicializaVectoresVariables { 
#EN-9840-
#EN-9850-
#EN-9860-
	for (( ca=0; ca<(mem_num_marcos); ca++)); do
		unidMemOcupadas[$ca]="_"
#EN-9870-
	done
#EN-9880-
#EN-9890-
	reubicarReubicabilidad=0 
#EN-9900-
	reubicarContinuidad=0 
#EN-9910-
#EN-9920-
#EN-9930-
		temp_rej[$i]="-"
#EN-9940-
		encola[$i]=0
		enmemoria[$i]=0
		enejecucion[$i]=0
		bloqueados[$i]=0
		enpausa[$i]=0 
#EN-9950-
#EN-9960-
		fueraDelSistema[$i]=0
		estad[$i]=0 
		estado[$i]=0
		temp_wait[$i]="-"
		temp_resp[$i]="-"
		temp_ret[$i]="-"
		pos_inicio[$i]="-"
		pos_final[$i]="-"
#EN-9970-
#EN-9980-
#EN-9990-
#EN-10000-
#EN-10010-
#EN-10020-
#EN-10030-
#EN-10040-
#EN-10050-
		max_AlgPagFrecRec_Position[$i]=0
#EN-10060-
		min_AlgPagFrecRec_Position[$i]=0
		indiceResuPaginaProceso[$i]="_"
		indiceResuPaginaAcumulado[$i]="_"
#EN-10070-
#EN-10080-
#EN-10090-
			primerTiempoEntradaPagina[$i,$indMarco]=0 
			restaFrecUsoRec[$i,$indMarco,0]=0
			directions_AlgPagFrecUsoRec_marco_pagina_clase[$i,$indMarco,0]=0
			directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$i,$indMarco]=0
		done
#EN-10100-
#EN-10110-
		contadorAlgPagFallosTotalesProcesos[$i]=0
#EN-10120-
	done
	ResuFrecuenciaAcumulado=();
	ResuTiempoOptimoAcumulado=();
	ResuUsoRecienteAcumulado=();
	max_AlgPagRec_rec=();
	max_AlgPagRec_rec=();
	min_AlgPagRec_position=();
	min_AlgPagRec_position=();
	max_AlgFrecuencia_frec=();
	max_AlgFrecuencia_frec=();
	min_AlgFrecuencia_position=();
	min_AlgFrecuencia_position=();
#EN-10130-
#EN-10140-
#EN-10150-
#EN-10160-
#EN-10170-
		maxProcPorUnidadTiempoBT=$(expr $maxProcPorUnidadTiempoBT + ${llegada[$j]} + ${ejecucion[$j]})  
	done  
#EN-10180-
#EN-10190-
	ejecutandoinst=-1
#EN-10200-
#EN-10210-
#EN-10220-
#EN-10230-
#EN-10240-
#EN-10250-

####################################################################################
#EN-10260-
####################################################################################
#EN-10270-
#EN-10280-
		if [[ $reloj -ne 0 ]]; then
#EN-10290-
		fi
	done
#EN-10300-

####################################################################################
####################################################################################
# Funciones para la gestión de procesos ############################################
####################################################################################
#EN-10310-
####################################################################################
function gestionProcesosFCFS {
	if [[ $cpu_ocupada == "NO" ]]; then
		if [[ $realizadoAntes -eq 0 ]]; then  
			indice_aux=-1
#EN-10320-
				if [[ ${enmemoria[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
#EN-10330-
					temp_aux=${temp_rej[$i]}
					break
				fi
			done
#EN-10340-
#EN-10350-
#EN-10360-
#EN-10370-
#EN-10380-
#EN-10390-
			fi
		fi
	fi
#EN-10400-
		for (( i=0; i<$nprocesos; i++ )); do
			if [[ ${enejecucion[$i]} -eq 1 ]]; then
				ejecutandoinst=$i
			fi
		done
#EN-10410-
#EN-10420-
		else
			ResuTiempoProceso[$reloj]=-1
		fi 
	fi
#EN-10430-
#EN-10440-
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
# 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
#EN-10450-
#EN-10460-
#EN-10470-
#EN-10480-
#EN-10490-
#EN-10500-
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-10510-
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
#EN-10520-
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
#EN-10530-
		fi
	fi 

#EN-10540-
#EN-10550-
#EN-10560-
	for (( i=0; i<$nprocesos; i++ )); do
		if [[ ${fueraDelSistema[$i]} -eq 1 ]] ; then
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
		if [[ ${encola[$i]} -eq 1 && ${bloqueados[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then
#EN-10570-
			temp_ret[$i]=0
#EN-10580-
		fi
		if [[ ${encola[$i]} -eq 1 && ${bloqueados[$i]} -eq 1 ]] ; then
			estado[$i]="En espera"
			estad[$i]=1
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then
#EN-10590-
			temp_ret[$i]=0
#EN-10600-
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${enejecucion[$i]} -eq 1 ]] ; then
			estado[$i]="En ejecucion"
			estad[$i]=3
#EN-10610-
#EN-10620-
			estado[$i]="En pausa"
		elif [[ ${enmemoria[$i]} -eq 1 ]] ; then
			estado[$i]="En memoria"
			estad[$i]=2
		fi
#EN-10630-
			estado[$i]="Finalizado"
			estad[$i]=5
#EN-10640-
		elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
			estado[$i]="Finalizado"
			estad[$i]=5
		fi
	done

#EN-10650-
#EN-10660-
#EN-10670-
		parar_proceso=SI
		evento=1
	fi
#EN-10680-
		evento=1
	fi
#EN-10690-
		evento=0
	fi
#EN-10700-

####################################################################################
#EN-10710-
####################################################################################
function gestionProcesosSJF {
#EN-10720-
#EN-10730-
#EN-10740-
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
#EN-10750-
#EN-10760-
			temp_ret[$i]=0
#EN-10770-
			estado[$i]="En espera"
			estad[$i]=1
		fi
#EN-10780-
#EN-10790-
			temp_ret[$i]=0
#EN-10800-
		fi
	done
 
#EN-10810-
		if [[ $realizadoAntes -eq 0 ]]; then  
#EN-10820-
			temp_aux=0
#EN-10830-
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${temp_rej[$i]} -gt $temp_aux ]]; then
#EN-10840-
#EN-10850-
					fi
				fi
#EN-10860-
			min_indice_aux=-1  
#EN-10870-
#EN-10880-
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${temp_rej[$i]} -lt $min_temp_aux ]]; then
#EN-10890-
#EN-10900-
					fi
				fi
			done
#EN-10910-
#EN-10920-
#EN-10930-
#EN-10940-
#EN-10950-
			fi
		fi
	fi
#EN-10960-
		for (( i=0; i<$nprocesos; i++ )); do
			if [[ ${enejecucion[$i]} -eq 1 ]]; then
				ejecutandoinst=$i
			fi
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enejecucion[$i]} -eq 1 ]] ; then 
				estado[$i]="En ejecucion"
				estad[$i]=3
#EN-10970-
#EN-10980-
				estado[$i]="En pausa"
				estad[$i]=4
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  ]] ; then
				estado[$i]="En memoria"
				estad[$i]=2
			fi
#EN-10990-
				estado[$i]="Finalizado"
				estad[$i]=5
#EN-11000-
			elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
				estado[$i]="Finalizado"
				estad[$i]=5
			fi
		done
	fi
#EN-11010-
#EN-11020-
	else
		ResuTiempoProceso[$reloj]=-1
	fi 

#EN-11030-
#EN-11040-
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
# 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
#EN-11050-

#EN-11060-
#EN-11070-
#EN-11080-
#EN-11090-
#EN-11100-
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-11110-
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
#EN-11120-
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
#EN-11130-
		fi
	fi

#EN-11140-
#EN-11150-
#EN-11160-
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then 
		evento=1
	fi
#EN-11170-
		evento=0
	fi
#EN-11180-

####################################################################################
#EN-11190-
####################################################################################
function gestionProcesosSRPT {
#EN-11200-
#EN-11210-
#EN-11220-
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
#EN-11230-
#EN-11240-
			temp_ret[$i]=0
#EN-11250-
			estado[$i]="En espera"
			estad[$i]=1
		fi
#EN-11260-
#EN-11270-
			temp_ret[$i]=0
#EN-11280-
		fi
	done
 
#EN-11290-
		if [[ $realizadoAntes -eq 0 ]]; then  
#EN-11300-
			temp_aux=0
#EN-11310-
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${temp_rej[$i]} -gt $temp_aux ]]; then
#EN-11320-
#EN-11330-
					fi
				fi
#EN-11340-
			min_indice_aux=-1  
#EN-11350-
#EN-11360-
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${temp_rej[$i]} -lt $min_temp_aux ]]; then
#EN-11370-
#EN-11380-
					fi
				fi
			done
#EN-11390-
#EN-11400-
#EN-11410-
#EN-11420-
				fi
#EN-11430-
#EN-11440-
#EN-11450-
#EN-11460-
					avisoPausa[$anteriorProcesoEjecucion]=1 
				fi
#EN-11470-
				anteriorProcesoEjecucion=$min_indice_aux
			fi
		fi
	fi
	if [[ $cpu_ocupada == "SI" ]]; then ##Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		for (( i=0; i<$nprocesos; i++ )); do
			if [[ ${enejecucion[$i]} -eq 1 ]]; then
				ejecutandoinst=$i
			fi
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enejecucion[$i]} -eq 1 ]] ; then 
				estado[$i]="En ejecucion"
				estad[$i]=3
#EN-11480-
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enpausa[$i]} -eq 1 ]] ; then
				estado[$i]="En pausa"
				estad[$i]=4
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  ]] ; then
				estado[$i]="En memoria"
				estad[$i]=2
			fi
#EN-11490-
				estado[$i]="Finalizado"
				estad[$i]=5
#EN-11500-
			elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
				estado[$i]="Finalizado"
				estad[$i]=5
			fi
		done
	fi
#EN-11510-
#EN-11520-
	else
		ResuTiempoProceso[$reloj]=-1
	fi 

#EN-11530-
#EN-11540-
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
# 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
#EN-11550-

	if [[ $cpu_ocupada == "SI" ]]; then ##Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
#EN-11560-
#EN-11570-
#EN-11580-
#EN-11590-
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-11600-
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
#EN-11610-
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
#EN-11620-
		fi
	fi
	
#EN-11630-
#EN-11640-
#EN-11650-
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then 
		evento=1
	fi
#EN-11660-
		evento=0
	fi
#EN-11670-

####################################################################################
#EN-11680-
####################################################################################
function gestionProcesosPrioridades {
#EN-11690-
#EN-11700-
#EN-11710-
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
#EN-11720-
#EN-11730-
			temp_ret[$i]=0
#EN-11740-
#EN-11750-
			estado[$i]="En espera"
			estad[$i]=1
		fi
#EN-11760-
#EN-11770-
			temp_ret[$i]=0
#EN-11780-
#EN-11790-
		fi
	done
	if [[ $realizadoAntes -eq 0 ]]; then  
		cerrojo_aux=0
#EN-11800-
#EN-11810-
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
#EN-11820-
#EN-11830-
#EN-11840-
					cerrojo_aux=1
				fi
				if [[ ${temp_prio[$i]} -gt $prio_aux && $cerrojo_aux -eq 1 ]]; then
#EN-11850-
#EN-11860-
				fi
			fi
#EN-11870-
#EN-11880-
#EN-11890-
#EN-11900-
#EN-11910-
#EN-11920-
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${terminados[$i]} -ne 1 ]]; then
				if [[ ${temp_prio[$i]} -lt $min_prio_aux ]]; then
#EN-11930-
#EN-11940-
				fi
			fi
		done
	fi
#EN-11950-
		if [[ $seleccionTipoPrioridad -eq 1 ]]; then 
			seleccionTipoPrioridad_2=2
		elif [[ $seleccionTipoPrioridad -eq 2 ]]; then 
			seleccionTipoPrioridad_2=1
		fi
#EN-11960-
		seleccionTipoPrioridad_2=$seleccionTipoPrioridad
	fi
#EN-11970-
		#seleccionTipoPrioridad_2 - 1-Mayor - 2-Menor #seleccionMenuApropiatividad - 1-No apropiativo - 2-Apropiativo
#EN-11980-
#EN-11990-
#EN-12000-
#EN-12010-
#EN-12020-
				fi
#EN-12030-
#EN-12040-
#EN-12050-
#EN-12060-
#EN-12070-
				fi
#EN-12080-
				anteriorProcesoEjecucion=$max_indice_aux
			fi
#EN-12090-
#EN-12100-
#EN-12110-
#EN-12120-
#EN-12130-
				fi
#EN-12140-
#EN-12150-
#EN-12160-
#EN-12170-
					avisoPausa[$anteriorProcesoEjecucion]=1 
				fi
#EN-12180-
				anteriorProcesoEjecucion=$min_indice_aux
			fi
		fi
	fi

#EN-12190-
		#seleccionTipoPrioridad_2 - 1-Mayor - 2-Menor #seleccionMenuApropiatividad - 1-No apropiativo - 2-Apropiativo
#EN-12200-
#EN-12210-
#EN-12220-
#EN-12230-
#EN-12240-
#EN-12250-
			fi
#EN-12260-
#EN-12270-
#EN-12280-
#EN-12290-
#EN-12300-
#EN-12310-
			fi
		fi
	fi

#EN-12320-
		for (( i=0; i<$nprocesos; i++ )); do
			if [[ ${enejecucion[$i]} -eq 1 ]]; then
				ejecutandoinst=$i
			fi
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enejecucion[$i]} -eq 1 ]] ; then 
				estado[$i]="En ejecucion"
				estad[$i]=3
#EN-12330-
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enpausa[$i]} -eq 1 ]] ; then
				estado[$i]="En pausa"
				estad[$i]=4
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  ]] ; then
				estado[$i]="En memoria"
				estad[$i]=2
			fi
#EN-12340-
				estado[$i]="Finalizado"
				estad[$i]=5
#EN-12350-
			elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
				estado[$i]="Finalizado"
				estad[$i]=5
			fi
		done
	fi
#EN-12360-
#EN-12370-
	else
		ResuTiempoProceso[$reloj]=-1
	fi 

#EN-12380-
#EN-12390-
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
# 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
#EN-12400-

	if [[ $cpu_ocupada == "SI" ]]; then ##Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
#EN-12410-
#EN-12420-
#EN-12430-
#EN-12440-
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-12450-
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
#EN-12460-
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
#EN-12470-
		fi
	fi
	
#EN-12480-
#EN-12490-
#EN-12500-
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then 
		evento=1
	fi
#EN-12510-
		evento=0
	fi
#EN-12520-

####################################################################################
#EN-12530-
####################################################################################
function gestionProcesosRoundRobin {
#EN-12540-
#EN-12550-
#EN-12560-
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
#EN-12570-
#EN-12580-
			temp_ret[$i]=0
#EN-12590-
			estado[$i]="En espera"
			estad[$i]=1
		fi
#EN-12600-
#EN-12610-
			temp_ret[$i]=0
#EN-12620-
		fi
	done
#EN-12630-
#EN-12640-
			colaTiempoRR[$i]=-1 
#EN-12650-
#EN-12660-
			anteriorProcesoEjecucion=$i
#EN-12670-
		fi 
	done
#EN-12680-
#EN-12690-
#EN-12700-
#EN-12710-
#EN-12720-
			anteriorProcesoEjecucion=$i
			contadorTiempoRR=0
			colaTiempoRR[$i]=$indiceColaTiempoRRLibre  
#EN-12730-
#EN-12740-
#EN-12750-
#EN-12760-
		fi 
	done
#EN-12770-
		if [[ $realizadoAntes -eq 0 ]]; then  
#EN-12780-
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
#EN-12790-
						colaTiempoRR[$i]=$indiceColaTiempoRRLibre  
						indiceColaTiempoRRLibre=$(($indiceColaTiempoRRLibre + 1))
					fi 
				fi
#EN-12800-
#EN-12810-
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
#EN-12820-
						contadorTiempoRR=$(($contadorTiempoRR + 1))
#EN-12830-
#EN-12840-
#EN-12850-
#EN-12860-
							avisoPausa[$anteriorProcesoEjecucion]=1 
						fi
#EN-12870-
					fi 
				fi
			done 
		fi
	fi
	if [[ $cpu_ocupada == "SI" ]]; then ##Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		for (( i=0; i<$nprocesos; i++ )); do
			if [[ ${enejecucion[$i]} -eq 1 ]]; then
				ejecutandoinst=$i
			fi
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enejecucion[$i]} -eq 1 ]] ; then 
				estado[$i]="En ejecucion"
				estad[$i]=3
#EN-12880-
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enpausa[$i]} -eq 1 ]] ; then
				estado[$i]="En pausa"
				estad[$i]=4
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  ]] ; then
				estado[$i]="En memoria"
				estad[$i]=2
			fi
#EN-12890-
				estado[$i]="Finalizado"
				estad[$i]=5
#EN-12900-
			elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
				estado[$i]="Finalizado"
				estad[$i]=5
			fi
		done
	fi
#EN-12910-
#EN-12920-
	else
		ResuTiempoProceso[$reloj]=-1
	fi 

#EN-12930-
#EN-12940-
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
# 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
#EN-12950-

	if [[ $cpu_ocupada == "SI" ]]; then ##Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
#EN-12960-
#EN-12970-
#EN-12980-
#EN-12990-
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-13000-
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
#EN-13010-
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
#EN-13020-
		fi
	fi
	
#EN-13030-
#EN-13040-
#EN-13050-
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then 
		evento=1
	fi
#EN-13060-
		evento=0
	fi
#EN-13070-

####################################################################################
#EN-13080-
####################################################################################
function gestionAlgoritmoPagNoVirtual { 
#EN-13090-
#EN-13100-
	else
		ResuTiempoProceso[$reloj]=-1
	fi
#EN-13110-
#EN-13120-
#EN-13130-
		ordinal[$counter]=0
	done
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do #El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
#EN-13140-
			relacionMarcosUsados[${unidMemOcupadas[$ii]},$reloj,${ordinal[${unidMemOcupadas[$ii]}]}]=$ii
			ordinal[${unidMemOcupadas[$ii]}]=$((${ordinal[${unidMemOcupadas[$ii]}]} + 1))
		fi
	done
#EN-13150-
#EN-13160-
			paginasEnMemoriaProceso[$v]=${paginasEnMemoriaTotal[$ejecutandoinst,$v]}
		else
			paginasEnMemoriaProceso[$v]=-1
		fi
	done 
#EN-13170-
#EN-13180-
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasPendientesUsarTotal[$ejecutandoinst,$v]=$pagina
	done
#EN-13190-
#EN-13200-
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasUsadasTotal[$ejecutandoinst,$v]=$pagina
#EN-13210-
	done 

#EN-13220-
		for ((v=0; v<${tiempoEjecucion[$ejecutandoinst]}; v++)); do
			if (( ${paginasDefinidasTotal[$ejecutandoinst,$v]} > ${maxpagsNoVirtual[$ejecutandoinst]} )); then
#EN-13230-
			fi
		done
#EN-13240-
#EN-13250-
	fi

#EN-13260-
#EN-13270-
			for (( jj=0; jj<${maxpagsNoVirtual[$counter]}; jj++ )); do
#EN-13280-
			done
		fi
	done
#EN-13290-
#EN-13300-
#EN-13310-
			for (( jj=0; jj<${maxpagsNoVirtual[$counter]}; jj++ )); do
#EN-13320-
#EN-13330-
#EN-13340-
			done
		fi
	done
		
#EN-13350-
#EN-13360-
			paginasEnMemoriaProceso[$counterMarco]="$counterMarco"
			paginasEnMemoriaTotal[$ejecutandoinst,$counterMarco]="$counterMarco"
#EN-13370-
		done
	fi  
	suma_contadorAlgPagFallosProcesoAcumulado=0
	suma_contadorAlgPagFallosProcesoAcumulado2=0
#EN-13380-
		suma_contadorAlgPagFallosProcesoAcumulado=$(($suma_contadorAlgPagFallosProcesoAcumulado + ${contadorAlgPagFallosTotalesProcesos[$counter]}))
		suma_contadorAlgPagFallosProcesoAcumulado2=$(($suma_contadorAlgPagFallosProcesoAcumulado2 + ${contadorAlgPagFallosProcesoAcumulado[$counter]}))
	done

#EN-13390-
#EN-13400-
#EN-13410-
#EN-13420-
#EN-13430-
#		for buscar_primera_pagina in "${paginasEnMemoriaProceso[@]}"; do #Localiza la página, no la posición de la página
#EN-13440-
#			if [[ $buscar_primera_pagina -eq $primera_pagina ]]; then #Si la página está en memoria define x=1
#EN-13450-
#EN-13460-
#				for indMarcoMem in "${paginasEnMemoriaProceso[@]}"; do #Localiza la página, no la posición de la página
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then
#EN-13470-
#EN-13480-
#EN-13490-
#EN-13500-
#EN-13510-
					fi
				done
			fi 
		done
	else #[[ ${temp_rej[$ejecutandoinst]} -eq 0 ]]; then #Y si no quedan más páginas pendientes de ejecutar. No es tiempoEjecucion sino temp_rej.
		for (( counter=0; counter<$nprocesos; counter++ )); do
			if [[ " ${llegados[*]} " == *" $ejecutandoinst "* ]]; then 
#EN-13520-
#EN-13530-
				if [[ ! " ${ejecutando[*]} " == *" $ejecutandoinst "* ]]; then
#EN-13540-
					if [[ " ${haestadopausado[*]} " == *" $ejecutandoinst "* ]]; then
						resta[$ejecutandoinst]=$((tiempo[$ejecutandoinst] - tiempoEjecucion[$ejecutandoinst])) #Como temp_rej(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????. #tiempo o ejecucion[$counter] ???????????? #Esa resta debería ser alrevés, el de ejecución menos lo ya ejecutado...
						espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst] - resta[$ejecutandoinst])) #Como temp_wait() #Tampoco es (reloj - llegada[$ejecutandoinst])
					fi
#EN-13550-
				fi
			fi
		done
#EN-13560-
		ejecutando="" 
		finalizados+=("$finalizado")
		finalizadonuevo+=("$finalizado")
		hanestadomem=$paginasEnMemoriaProceso
		if [[ ${#finalizados[@]} -ge ${#llegada[@]} ]]; then #De momento se cambia ordenados por llegada.
#EN-13570-
#			for i in "${enmemoria[@]}"; do #Define el dato, pero no en qué posición se encuentra.
				if [[ "${enmemoria[$i]}" == "$finalizado" ]]; then
					posicion_finalizado=$i
					unset 'enmemoria[$posicion_finalizado]'
					unset 'llegados[$posicion_finalizado]'
					unset 'enpausa[$posicion_finalizado]'
					unset 'prioridades[$posicion_finalizado]'
					memvacia=$((memvacia + ${memoria[$finalizado]}))
				fi
			done
		fi
	fi
#EN-13580-

####################################################################################
####################################################################################
# Funciones para la gestión de fallos de paginación ################################
####################################################################################
#EN-13590-
####################################################################################
function gestionAlgoritmoPagAlgPagFrecFIFORelojSegOp { 
#EN-13600-
#EN-13610-
	else
		ResuTiempoProceso[$reloj]=-1
	fi
#EN-13620-
#EN-13630-
#EN-13640-
		ordinal[$counter]=0
	done
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do #El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
#EN-13650-
			relacionMarcosUsados[${unidMemOcupadas[$ii]},$reloj,${ordinal[${unidMemOcupadas[$ii]}]}]=$ii
			ordinal[${unidMemOcupadas[$ii]}]=$((${ordinal[${unidMemOcupadas[$ii]}]} + 1))
		fi
	done
#EN-13660-
#EN-13670-
			paginasEnMemoriaProceso[$v]=${paginasEnMemoriaTotal[$ejecutandoinst,$v]}
		else
			paginasEnMemoriaProceso[$v]=-1
		fi
	done 
#EN-13680-
#EN-13690-
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasPendientesUsarTotal[$ejecutandoinst,$v]=$pagina
	done
#EN-13700-
#EN-13710-
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasUsadasTotal[$ejecutandoinst,$v]=$pagina
#EN-13720-
	done 
#EN-13730-
#EN-13740-
			for (( jj=0; jj<${memoria[$counter]}; jj++ )); do
#EN-13750-
#EN-13760-
#EN-13770-
			done
		fi
	done

#EN-13780-
#EN-13790-
			if ([[ ${estad[$counterProc]} -eq 2 || ${estad[$counterProc]} -eq 3 || ${estad[$counterProc]} -eq 4 ]]) && [[ ${numeroPaginasUsadasProceso[$counterProc]} -gt 0 ]]; then
				for (( jj=0; jj<${numeroMarcosUsados[$counterProc]}; jj++ )); do 
					coeficienteSegOp[$counterProc,$jj,$((${numeroPaginasUsadasProceso[$counterProc]}))]=${coeficienteSegOp[$counterProc,$jj,$((${numeroPaginasUsadasProceso[$counterProc]} - 1))]}
				done 
			elif ([[ ${estad[$counterProc]} -eq 2 || ${estad[$counterProc]} -eq 3 || ${estad[$counterProc]} -eq 4 ]]) && [[ ${numeroPaginasUsadasProceso[$counterProc]} -eq 0 ]]; then
				for (( jj=0; jj<${numeroMarcosUsados[$counterProc]}; jj++ )); do 
					coeficienteSegOp[$counterProc,$jj,$((${numeroPaginasUsadasProceso[$counterProc]}))]=0
				done 
			fi
		done
	fi
		
#EN-13800-
#EN-13810-
#EN-13820-
#EN-13830-

#EN-13840-

#EN-13850-
#EN-13860-
#			for buscar_primera_pagina in "${paginasEnMemoriaProceso[@]}"; do #Busca la página en paginasEnMemoriaProceso, pero no la posición.
#				if [[ $buscar_primera_pagina -eq $primera_pagina ]]; then #Esta línea es para cuando usamos el valor del dato y no su posición. Si la página está en memoria define x=1
#EN-13870-
					x=1
#EN-13880-
				fi 
			done
#EN-13890-
#EN-13900-
#				for indMarcoMem in "${paginasEnMemoriaProceso[@]}"; do #Define el dato, pero no en qué posición se encuentra.
#EN-13910-
#EN-13920-
#EN-13930-
						for (( jj=0; jj<${memoria[$ejecutandoinst]}; jj++ )); do
#EN-13940-
#EN-13950-
						done 
#EN-13960-
#EN-13970-
#EN-13980-
						fi
					fi
				done
#EN-13990-
#EN-14000-
#EN-14010-
				else
#EN-14020-
				fi
#EN-14030-
#EN-14040-
#EN-14050-
#EN-14060-
#EN-14070-
#EN-14080-
#EN-14090-
#EN-14100-
#EN-14110-
					done
				fi 
#EN-14120-
#EN-14130-
#EN-14140-
#EN-14150-
#EN-14160-
#EN-14170-
#EN-14180-
#EN-14190-
#EN-14200-
#EN-14210-
				else
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=0
				fi
#EN-14220-
					coeficienteSegOp[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]},$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))]=0
				fi
			fi
#EN-14230-
#EN-14240-
#EN-14250-
#			for buscar_primera_pagina in "${paginasEnMemoriaProceso[@]}"; do #Localiza la página, no la posición de la página
#EN-14260-
#				if [[ $buscar_primera_pagina -eq $primera_pagina ]]; then #Si la página está en memoria define x=1
					x=1
				fi 
			done
#EN-14270-
#EN-14280-
#				for indMarcoMem in "${paginasEnMemoriaProceso[@]}"; do #Localiza la página, no la posición de la página
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then
						for (( jj=0; jj<${memoria[$ejecutandoinst]}; jj++ )); do
#EN-14290-
#EN-14300-
						done
#EN-14310-
#EN-14320-
#EN-14330-
#EN-14340-
#EN-14350-
						fi
#EN-14360-
#EN-14370-
					fi
				done
#EN-14380-
#EN-14390-
					varCoeficienteSegOp=0
					varCoefMarco=""
#EN-14400-
					until [[ $varCoeficienteSegOp -eq 1 ]]; do 
						varCoefMarco=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]}
#EN-14410-
#EN-14420-
#EN-14430-
#EN-14440-
							else
								ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=0
							fi
						else 
#EN-14450-
							varCoeficienteSegOp=1
						fi
					done
				fi
#EN-14460-
#EN-14470-
#EN-14480-
#EN-14490-
				for (( jj=0; jj<${memoria[$ejecutandoinst]}; jj++ )); do
#EN-14500-
#EN-14510-
				done
#EN-14520-
#EN-14530-
#EN-14540-
#EN-14550-
#EN-14560-
#EN-14570-
#EN-14580-
#EN-14590-
				else
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=0
				fi
#EN-14600-
			fi
		fi          
	else #[[ ${temp_rej[$ejecutandoinst]} -eq 0 ]]; then #Y si no quedan más páginas pendientes de ejecutar. No es tiempoEjecucion sino temp_rej.
		for (( counter=0; counter<$nprocesos; counter++ )); do
			if [[ " ${llegados[*]} " == *" $ejecutandoinst "* ]]; then 
#EN-14610-
#EN-14620-
				if [[ ! " ${ejecutando[*]} " == *" $ejecutandoinst "* ]]; then
#EN-14630-
					if [[ " ${haestadopausado[*]} " == *" $ejecutandoinst "* ]]; then
						resta[$ejecutandoinst]=$((tiempo[$ejecutandoinst] - tiempoEjecucion[$ejecutandoinst])) #Como temp_rej(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????. #tiempo o ejecucion[$counter] ???????????? #Esa resta debería ser alrevés, el de ejecución menos lo ya ejecutado...
						espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst] - resta[$ejecutandoinst])) #Como temp_wait(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????. #Tampoco es (reloj - llegada[$ejecutandoinst])
					fi
#EN-14640-
				fi
			fi
		done
#EN-14650-
		ejecutando="" 
		finalizados+=("$finalizado")
		finalizadonuevo+=("$finalizado")
		hanestadomem=$paginasEnMemoriaProceso
		if [[ ${#finalizados[@]} -ge ${#llegada[@]} ]]; then #De momento se cambia ordenados por llegada.
#EN-14660-
#			for i in "${enmemoria[@]}"; do #Define el dato, pero no en qué posición se encuentra.
				if [[ "${enmemoria[$i]}" == "$finalizado" ]]; then
					posicion_finalizado=$i
					unset 'enmemoria[$posicion_finalizado]'
					unset 'llegados[$posicion_finalizado]'
					unset 'enpausa[$posicion_finalizado]'
					unset 'prioridades[$posicion_finalizado]'
					memvacia=$((memvacia + ${memoria[$finalizado]}))
				fi
			done
		fi
	fi
#EN-14670-

####################################################################################
#EN-14680-
####################################################################################
#EN-14690-
	paginasEnMemoriaProceso=(); #Páginas residentes en memoria del Proceso en ejecución. #Se inicializan los arrays que se van a usar temporalmente para cada proceso en ejecución.
#EN-14700-
#EN-14710-
		ordinal[$counter]=0
	done
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do #El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
#EN-14720-
			relacionMarcosUsados[${unidMemOcupadas[$ii]},$reloj,${ordinal[${unidMemOcupadas[$ii]}]}]=$ii
			ordinal[${unidMemOcupadas[$ii]}]=$((${ordinal[${unidMemOcupadas[$ii]}]} + 1))
		fi
	done
#EN-14730-
#EN-14740-
			paginasEnMemoriaProceso[$v]=${paginasEnMemoriaTotal[$ejecutandoinst,$v]}
		else
			paginasEnMemoriaProceso[$v]=-1
		fi
	done 
#EN-14750-
#EN-14760-
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasPendientesUsarTotal[$ejecutandoinst,$v]=$pagina
	done
#EN-14770-
#EN-14780-
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasUsadasTotal[$ejecutandoinst,$v]=$pagina
#EN-14790-
	done 
#EN-14800-
#EN-14810-
			for (( jj=0; jj<${memoria[$counter]}; jj++ )); do
#EN-14820-
#EN-14830-
#EN-14840-
#EN-14850-
#EN-14860-
				fi
			done
		fi
	done
	
#EN-14870-
		indPagIni=$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))
		if [[ $indPagIni -eq 0 ]]; then
#EN-14880-
#EN-14890-
#EN-14900-
		else
#EN-14910-
		fi
	done 
#EN-14920-
#EN-14930-
	done 

#EN-14940-
#EN-14950-
#EN-14960-
#EN-14970-
#EN-14980-
#EN-14990-
#EN-15000-
#EN-15010-
					x=1
				fi 
			done
#EN-15020-
#EN-15030-
#EN-15040-
#EN-15050-
#EN-15060-
#EN-15070-
							if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_frecuencia_valor ]]; then 
#EN-15080-
							else
#EN-15090-
							fi
#EN-15100-
#EN-15110-
#EN-15120-
#EN-15130-
							directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarcoMem]=1
#EN-15140-
#EN-15150-
#EN-15160-
#EN-15170-
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=$seleccionAlgoritmoPaginacion_clases_frecuencia_valor
							fi
						fi
#EN-15180-
#EN-15190-
#EN-15200-
						fi
#EN-15210-
#EN-15220-
						fi
					fi
				done
#EN-15230-
#EN-15240-
#EN-15250-
#EN-15260-
#EN-15270-
#EN-15280-
#EN-15290-
#EN-15300-
#EN-15310-
#EN-15320-
#EN-15330-
#EN-15340-
#EN-15350-
#EN-15360-
				directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))]=0
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then
#EN-15370-
#EN-15380-
#EN-15390-
				fi
#EN-15400-
#EN-15410-
#EN-15420-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
#EN-15430-
#EN-15440-
#EN-15450-
							fi
#EN-15460-
#EN-15470-
#EN-15480-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-15490-
#EN-15500-
						else
							limite_j=0
						fi
#EN-15510-
#EN-15520-
#EN-15530-
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
#EN-15540-
#EN-15550-
#EN-15560-
							fi
#EN-15570-
					
#EN-15580-
#EN-15590-
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-15600-
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
#EN-15610-
					fi
				fi
#EN-15620-
#EN-15630-
				else
#EN-15640-
#EN-15650-
#EN-15660-
#EN-15670-
					fi
				fi
			fi
#EN-15680-
#EN-15690-
#EN-15700-
#EN-15710-
					x=1
				fi 
			done
#EN-15720-
#EN-15730-
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then
#EN-15740-
#EN-15750-
#EN-15760-
							if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_frecuencia_valor ]]; then 
#EN-15770-
							else
#EN-15780-
							fi
#EN-15790-
#EN-15800-
#EN-15810-
#EN-15820-
							directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarcoMem]=1
#EN-15830-
#EN-15840-
#EN-15850-
#EN-15860-
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=$seleccionAlgoritmoPaginacion_clases_frecuencia_valor
							fi
#EN-15870-
						fi
#EN-15880-
#EN-15890-
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
#EN-15900-
#EN-15910-
#EN-15920-
								fi
#EN-15930-
#EN-15940-
				
#EN-15950-
#EN-15960-
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
							paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-15970-
								limite_j=$ultimasPaginasAConsiderar
							else
								limite_j=0
							fi
#EN-15980-
#EN-15990-
#EN-16000-
#EN-16010-
							min_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
#EN-16020-
#EN-16030-
#EN-16040-
								fi
#EN-16050-
#EN-16060-
				
#EN-16070-
#EN-16080-
							min_AlgPagFrecRec_Position[$ejecutandoinst]=0
							ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
							paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-16090-
								limite_j=$ultimasPaginasAConsiderar
							else
								limite_j=0
							fi
#EN-16100-
#EN-16110-
						fi
#EN-16120-
					fi
				done
#EN-16130-
#EN-16140-
#EN-16150-
#EN-16160-
#EN-16170-

#EN-16180-
#EN-16190-
#EN-16200-
#EN-16210-
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=0
#EN-16220-
#EN-16230-
#EN-16240-
#EN-16250-
				
#EN-16260-
#EN-16270-
#EN-16280-
#EN-16290-
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]}]=0
				fi
#EN-16300-
#EN-16310-
#EN-16320-
#EN-16330-
#EN-16340-
#EN-16350-
#EN-16360-
#EN-16370-
#EN-16380-
#EN-16390-
#EN-16400-
#EN-16410-
#EN-16420-
#EN-16430-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-16440-
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
#EN-16450-
					else
#EN-16460-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
#EN-16470-
#EN-16480-
#EN-16490-
							fi
#EN-16500-
					fi
#EN-16510-
#EN-16520-
#EN-16530-
#EN-16540-
#EN-16550-
#EN-16560-
#EN-16570-
#EN-16580-
#EN-16590-
#EN-16600-
#EN-16610-
#EN-16620-
#EN-16630-
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-16640-
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
#EN-16650-
					else
#EN-16660-
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
#EN-16670-
#EN-16680-
#EN-16690-
							fi
#EN-16700-
					fi
#EN-16710-
				fi
#EN-16720-
			fi
		fi          
	
	else #[[ ${temp_rej[$ejecutandoinst]} -eq 0 ]]; then #Y si no quedan más páginas pendientes de ejecutar. No es tiempoEjecucion sino temp_rej.
		for (( counter=0; counter<$nprocesos; counter++ )); do
			if [[ " ${llegados[*]} " == *" $ejecutandoinst "* ]]; then 
#EN-16730-
#EN-16740-
				if [[ ! " ${ejecutando[*]} " == *" $ejecutandoinst "* ]]; then
#EN-16750-
					if [[ " ${haestadopausado[*]} " == *" $ejecutandoinst "* ]]; then
						resta[$ejecutandoinst]=$((tiempo[$ejecutandoinst] - tiempoEjecucion[$ejecutandoinst])) #Como temp_rej() #tiempo o ejecucion[$counter] ???????????? #Esa resta debería ser alrevés, el de ejecución menos lo ya ejecutado...
						espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst] - resta[$ejecutandoinst])) #Como temp_wait() #Tampoco es (reloj - llegada[$ejecutandoinst]).
					fi
#EN-16760-
				fi
			fi
		done
#EN-16770-
		ejecutando="" 
		finalizados+=("$finalizado")
		finalizadonuevo+=("$finalizado")
		hanestadomem=$paginasEnMemoriaProceso
		if [[ ${#finalizados[@]} -ge ${#llegada[@]} ]]; then #De momento se cambia ordenados por llegada.
#EN-16780-
				if [[ "${enmemoria[$i]}" == "$finalizado" ]]; then
					posicion_finalizado=$i
					unset 'enmemoria[$posicion_finalizado]'
					unset 'llegados[$posicion_finalizado]'
					unset 'enpausa[$posicion_finalizado]'
					unset 'prioridades[$posicion_finalizado]'
					memvacia=$((memvacia + ${memoria[$finalizado]}))
				fi
			done
		fi
	fi
#EN-16790-

####################################################################################
#EN-16800-
####################################################################################
#EN-16810-
	paginasEnMemoriaProceso=(); #Páginas residentes en memoria del Proceso en ejecución. #Se inicializan los arrays que se van a usar temporalmente para cada proceso en ejecución.
#EN-16820-
#EN-16830-
		ordinal[$counter]=0
	done
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do #El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
#EN-16840-
			relacionMarcosUsados[${unidMemOcupadas[$ii]},$reloj,${ordinal[${unidMemOcupadas[$ii]}]}]=$ii
			ordinal[${unidMemOcupadas[$ii]}]=$((${ordinal[${unidMemOcupadas[$ii]}]} + 1))
		fi
	done
#EN-16850-
#EN-16860-
			paginasEnMemoriaProceso[$v]=${paginasEnMemoriaTotal[$ejecutandoinst,$v]}
		else
			paginasEnMemoriaProceso[$v]=-1
		fi
	done 
#EN-16870-
#EN-16880-
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasPendientesUsarTotal[$ejecutandoinst,$v]=$pagina
	done
#EN-16890-
#EN-16900-
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasUsadasTotal[$ejecutandoinst,$v]=$pagina
#EN-16910-
	done 
#EN-16920-
#EN-16930-
			for (( jj=0; jj<${memoria[$counter]}; jj++ )); do
#EN-16940-
#EN-16950-
#EN-16960-
#EN-16970-
#EN-16980-
#EN-16990-
				elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-17000-
				fi
#EN-17010-
#EN-17020-
				fi
			done
		fi
	done
	
#EN-17030-
		indPagIni=$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))
		if [[ $indPagIni -eq 0 ]]; then
#EN-17040-
#EN-17050-
#EN-17060-
		else
#EN-17070-
		fi
	done 
#EN-17080-
		if [[ ${primerTiempoEntradaPagina[$ejecutandoinst,$indMarco]} -gt 0 ]]; then
#EN-17090-
		fi
	done 

#EN-17100-
#EN-17110-
#EN-17120-
#EN-17130-
#EN-17140-
#EN-17150-
#EN-17160-
#EN-17170-
					x=1
#EN-17180-
				fi 
			done
#EN-17190-
#EN-17200-
#EN-17210-
					if [[ $indMarcoRec -ne $indMarcoMem ]]; then
#EN-17220-
#EN-17230-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-17240-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-17250-
#EN-17260-
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							else
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$seleccionAlgoritmoPaginacion_uso_rec_valor
							fi
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-17270-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
#EN-17280-
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
							else
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor
							fi 
						fi
					fi
					if [[ $indMarcoRec -eq $indMarcoMem ]]; then
#EN-17290-
#EN-17300-
#EN-17310-
#EN-17320-
#EN-17330-
						fi
					fi
				done
#EN-17340-
#EN-17350-
#EN-17360-
#EN-17370-
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarcoMem]=1
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=0
#EN-17380-
#EN-17390-
				fi
									
#EN-17400-
#EN-17410-
#EN-17420-
				fi
#EN-17430-
#EN-17440-
				fi
			
#EN-17450-
#EN-17460-
#EN-17470-
#EN-17480-
#EN-17490-
					if [[ $indMarcoRec -ne ResuPunteroMarcoUsado[$ejecutandoinst,$reloj] ]]; then
#EN-17500-
#EN-17510-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-17520-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-17530-
#EN-17540-
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							else
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$seleccionAlgoritmoPaginacion_uso_rec_valor
							fi
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-17550-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
#EN-17560-
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
							else
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor
							fi
						fi
					fi
					if [[ $indMarcoRec -eq ${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]} ]]; then
#EN-17570-
#EN-17580-
							
#EN-17590-
#EN-17600-
						fi
					fi
				done
#EN-17610-
#EN-17620-
#EN-17630-
#EN-17640-
#EN-17650-
#EN-17660-
#EN-17670-
#EN-17680-
#EN-17690-
#EN-17700-
#EN-17710-
#EN-17720-
				directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))]=0
#EN-17730-
#EN-17740-
#EN-17750-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
#EN-17760-
#EN-17770-
#EN-17780-
							fi
#EN-17790-
#EN-17800-
#EN-17810-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
#EN-17820-
#EN-17830-
#EN-17840-
							fi
#EN-17850-
#EN-17860-
#EN-17870-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-17880-
#EN-17890-
						else
							limite_j=0
						fi
#EN-17900-
#EN-17910-
#EN-17920-
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
#EN-17930-
#EN-17940-
#EN-17950-
							fi
#EN-17960-
#EN-17970-
#EN-17980-
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-17990-
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
#EN-18000-
					fi
				fi
#EN-18010-
#EN-18020-
				else
#EN-18030-
#EN-18040-
#EN-18050-
#EN-18060-
					fi
				fi
			fi

#EN-18070-
#EN-18080-
#EN-18090-
#EN-18100-
					x=1
				fi 
			done
#EN-18110-
#EN-18120-
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then
#EN-18130-
#EN-18140-
#EN-18150-
							if [[ $indMarcoRec -ne ResuPunteroMarcoUsado[$ejecutandoinst,$reloj] ]]; then
#EN-18160-
#EN-18170-

#EN-18180-
#EN-18190-

#EN-18200-
									ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
									ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-18210-
#EN-18220-
										ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
									else
										ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$seleccionAlgoritmoPaginacion_uso_rec_valor
									fi
									ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-18230-
									ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
#EN-18240-
										ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
									else
										ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor
									fi
								fi
							fi
							if [[ $indMarcoRec -eq ResuPunteroMarcoUsado[$ejecutandoinst,$reloj] ]]; then
#EN-18250-
#EN-18260-

									ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
								fi
							fi							
						done
#EN-18270-
#EN-18280-
#EN-18290-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
#EN-18300-
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_uso_rec_valor ]]; then 
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
							else
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
							fi
#EN-18310-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
							directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarcoMem]=1
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=0
#EN-18320-
#EN-18330-
#EN-18340-
						fi
#EN-18350-
#EN-18360-
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
#EN-18370-
#EN-18380-
#EN-18390-
								fi
#EN-18400-
#EN-18410-
#EN-18420-
#EN-18430-
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
#EN-18440-
#EN-18450-
#EN-18460-
								fi
#EN-18470-
#EN-18480-
				
#EN-18490-
#EN-18500-
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
							paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-18510-
								limite_j=$ultimasPaginasAConsiderar
							else
								limite_j=0
							fi
#EN-18520-
#EN-18530-
#EN-18540-
#EN-18550-
							min_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
#EN-18560-
#EN-18570-
#EN-18580-
								fi
#EN-18590-
#EN-18600-
#EN-18610-
#EN-18620-
							min_AlgPagFrecRec_Position[$ejecutandoinst]=0
							ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
							paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-18630-
								limite_j=$ultimasPaginasAConsiderar
							else
								limite_j=0
							fi
#EN-18640-
#EN-18650-
						fi
#EN-18660-
					fi
				done

#EN-18670-
#EN-18680-
#EN-18690-
#EN-18700-
#EN-18710-
#EN-18720-
#EN-18730-
#EN-18740-
#EN-18750-
#EN-18760-
#EN-18770-
#EN-18780-
#EN-18790-
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=0
				
#EN-18800-
#EN-18810-
#EN-18820-
#EN-18830-
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]}]=0
				fi
#EN-18840-
#EN-18850-
					if [[ $indMarcoRec -ne ${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]} ]]; then
#EN-18860-
#EN-18870-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))

#EN-18880-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-18890-
#EN-18900-
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							else
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$seleccionAlgoritmoPaginacion_uso_rec_valor
							fi
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
#EN-18910-
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
#EN-18920-
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
							else
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor
							fi
						fi
					fi
					if [[ $indMarcoRec -eq ${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]}  ]]; then
#EN-18930-
#EN-18940-

#EN-18950-
#EN-18960-
#EN-18970-
						fi
					fi					
				done
#EN-18980-
#EN-18990-
#EN-19000-
#EN-19010-
#EN-19020-
#EN-19030-
#EN-19040-
#EN-19050-
#EN-19060-
#EN-19070-
#EN-19080-
#EN-19090-
#EN-19100-
#EN-19110-
#EN-19120-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-19130-
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
#EN-19140-
					else
#EN-19150-
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
#EN-19160-
#EN-19170-
#EN-19180-
							fi
#EN-19190-
					fi
#EN-19200-
#EN-19210-
#EN-19220-
#EN-19230-
#EN-19240-
#EN-19250-
#EN-19260-
#EN-19270-
#EN-19280-
#EN-19290-
#EN-19300-
#EN-19310-
#EN-19320-
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
#EN-19330-
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
#EN-19340-
					else
#EN-19350-
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
#EN-19360-
#EN-19370-
#EN-19380-
							fi
#EN-19390-
					fi
#EN-19400-
				fi
#EN-19410-
			fi
		fi          
	
	else #[[ ${temp_rej[$ejecutandoinst]} -eq 0 ]]; then #Y si no quedan más páginas pendientes de ejecutar. No es tiempoEjecucion sino temp_rej.
		for (( counter=0; counter<$nprocesos; counter++ )); do
			if [[ " ${llegados[*]} " == *" $ejecutandoinst "* ]]; then 
#EN-19420-
#EN-19430-
				if [[ ! " ${ejecutando[*]} " == *" $ejecutandoinst "* ]]; then
#EN-19440-
					if [[ " ${haestadopausado[*]} " == *" $ejecutandoinst "* ]]; then
						resta[$ejecutandoinst]=$((tiempo[$ejecutandoinst] - tiempoEjecucion[$ejecutandoinst])) #Como temp_rej() #tiempo o ejecucion[$counter] ???????????? #Esa resta debería ser alrevés, el de ejecución menos lo ya ejecutado...
						espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst] - resta[$ejecutandoinst])) #Como temp_wait() #Tampoco es (reloj - llegada[$ejecutandoinst]).
					fi
#EN-19450-
				fi
			fi
		done
#EN-19460-
#		procFinalizado=$ejecutandoinst #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
		ejecutando="" 
		finalizados+=("$finalizado")
		finalizadonuevo+=("$finalizado")
		hanestadomem=$paginasEnMemoriaProceso
		if [[ ${#finalizados[@]} -ge ${#llegada[@]} ]]; then #De momento se cambia ordenados por llegada.
#EN-19470-
				if [[ "${enmemoria[$i]}" == "$finalizado" ]]; then
					posicion_finalizado=$i
					unset 'enmemoria[$posicion_finalizado]'
					unset 'llegados[$posicion_finalizado]'
					unset 'enpausa[$posicion_finalizado]'
					unset 'prioridades[$posicion_finalizado]'
					memvacia=$((memvacia + ${memoria[$finalizado]}))
				fi
			done
		fi
	fi
#EN-19480-

####################################################################################
#EN-19490-
####################################################################################
function calcularResuTiempoOptimoAcumulado_PaginaEjecutada { 
	varCierreOptimo=0
	indOptimo=$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))
	until [[ $varCierreOptimo -eq 1 ]]; do 
#EN-19500-
			if [[ ${paginasDefinidasTotal[$ejecutandoinst,$indOptimo]} -eq $primera_pagina ]]; then
#EN-19510-
				varCierreOptimo=1
			fi
		else
#EN-19520-
			varCierreOptimo=1
		fi
		indOptimo=$(($indOptimo + 1)) 
	done
}

####################################################################################
#EN-19530-
####################################################################################
function calcularResuTiempoOptimoAcumulado_PaginaNoEjecutada { 
	varCierreOptimo=0
#EN-19540-
	indOptimo=$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))
	until [[ $varCierreOptimo -eq 1 ]]; do 
#EN-19550-
			if [[ ${paginasDefinidasTotal[$ejecutandoinst,$indOptimo]} -eq ${paginasEnMemoriaProceso[$indMarcoRec]} ]]; then
#EN-19560-
				varCierreOptimo=1
			fi
		else
#EN-19570-
			varCierreOptimo=1
		fi
		indOptimo=$(($indOptimo + 1)) 
	done
}

####################################################################################
#EN-19580-
####################################################################################
function gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado { 
#EN-19590-
		tiempoPag=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))
#EN-19600-
#EN-19610-
#EN-19620-
#EN-19630-
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
#EN-19640-
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
#EN-19650-
			fi
		fi

#EN-19660-
			pagUsadaMarco=${#paginasEnMemoriaTotal[$ejecutandoinst,$indMarco]} #Se define como página no usada ni modificada	
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
#EN-19670-
#EN-19680-
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
#EN-19690-
#EN-19700-
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
#EN-19710-
#EN-19720-
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
#EN-19730-
#EN-19740-
#EN-19750-
			fi
		fi

#EN-19760-
#EN-19770-
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
#EN-19780-
#EN-19790-
#EN-19800-
#EN-19810-
#EN-19820-
#EN-19830-
				fi
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 0 ]]; then 
#EN-19840-
#EN-19850-
#EN-19860-
#EN-19870-
#EN-19880-
				fi
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
#EN-19890-
#EN-19900-
#EN-19910-
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 1 ]]; then 
#EN-19920-
#EN-19930-
#EN-19940-
#EN-19950-
#EN-19960-
#EN-19970-
#EN-19980-
#EN-19990-
				fi
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 0 ]]; then 
#EN-20000-
#EN-20010-
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 1 ]]; then 
#EN-20020-
#EN-20030-
#EN-20040-
#EN-20050-
#EN-20060-
#EN-20070-
#EN-20080-
#EN-20090-
#EN-20100-
				fi
			fi 
		fi
		
#EN-20110-
			pagUsadaMarco=${#paginasEnMemoriaTotal[$ejecutandoinst,$indMarco]} #Se define como página no usada ni modificada	
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
#EN-20120-
#EN-20130-
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
#EN-20140-
#EN-20150-
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
#EN-20160-
#EN-20170-
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
#EN-20180-
#EN-20190-
#EN-20200-
			fi
		fi
#EN-20210-
#EN-20220-
#EN-20230-
#EN-20240-
#EN-20250-
#EN-20260-
			fi
#EN-20270-
#EN-20280-
#EN-20290-
#EN-20300-
			fi
		fi
#EN-20310-
	done
#EN-20320-

####################################################################################
#EN-20330-
####################################################################################
function gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max {  
#EN-20340-
	xxx_1=0
	xxx_2=0
	xxx_3=0
#EN-20350-
#EN-20360-
#EN-20370-
#EN-20380-
#EN-20390-
#EN-20400-
#EN-20410-
#EN-20420-

#EN-20430-
#EN-20440-
		if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMax,$punteroPagMarco]} -eq 0 ]]; then
#EN-20450-
#EN-20460-
#EN-20470-
#EN-20480-
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMax,$punteroPagMarco]} -eq 1 ]]; then
#EN-20490-
#EN-20500-
#EN-20510-
				xxx_1=1
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMax,$punteroPagMarco]} -eq 2 ]]; then
#EN-20520-
#EN-20530-
#EN-20540-
				xxx_2=1
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMax,$punteroPagMarco]} -eq 3 ]]; then
#EN-20550-
#EN-20560-
#EN-20570-
				xxx_3=1
			fi
		fi
#EN-20580-
	if [[ $xxx_0 -eq 1 && $xxx_1 -eq 0 && $xxx_2 -eq 0 && $xxx_3 -eq 0 ]]; then
#EN-20590-
#EN-20600-
	elif [[ $xxx_1 -eq 1 && $xxx_2 -eq 0 && $xxx_3 -eq 0 ]]; then
#EN-20610-
#EN-20620-
	elif [[ $xxx_2 -eq 1 && $xxx_3 -eq 0 ]]; then
#EN-20630-
#EN-20640-
	elif [[ $xxx_3 -eq 1 ]]; then
#EN-20650-
#EN-20660-
	fi
#EN-20670-

####################################################################################
#EN-20680-
####################################################################################
function gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min {  
#EN-20690-
	xxx_1=0
	xxx_2=0
	xxx_3=0
#EN-20700-
#EN-20710-
#EN-20720-
#EN-20730-
#EN-20740-
#EN-20750-
#EN-20760-
#EN-20770-

#EN-20780-
#EN-20790-
		if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMin,$punteroPagMarco]} -eq 0 ]]; then
			if [[ $min_AlgPagFrecRec_FrecRec_0 -eq -1 ]]; then
				min_AlgPagFrecRec_FrecRec_0=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]}
				min_AlgPagFrecRec_Position_0=$indMin
#EN-20800-
			fi
#EN-20810-
#EN-20820-
#EN-20830-
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMin,$punteroPagMarco]} -eq 1 ]]; then
			if [[ $min_AlgPagFrecRec_FrecRec_1 -eq -1 ]]; then
				min_AlgPagFrecRec_FrecRec_1=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]}
				min_AlgPagFrecRec_Position_1=$indMin
				xxx_1=1
			fi
#EN-20840-
#EN-20850-
#EN-20860-
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMin,$punteroPagMarco]} -eq 2 ]]; then
			if [[ $min_AlgPagFrecRec_FrecRec_2 -eq -1 ]]; then
				min_AlgPagFrecRec_FrecRec_2=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]}
				min_AlgPagFrecRec_Position_2=$indMin
				xxx_2=1
			fi
#EN-20870-
#EN-20880-
#EN-20890-
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMin,$punteroPagMarco]} -eq 3 ]]; then
			if [[ $min_AlgPagFrecRec_FrecRec_3 -eq -1 ]]; then
				min_AlgPagFrecRec_FrecRec_3=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]}
				min_AlgPagFrecRec_Position_3=$indMin
				xxx_3=1
			fi
#EN-20900-
#EN-20910-
#EN-20920-
			fi
		fi
#EN-20930-
	if [[ $xxx_0 -eq 1 && $xxx_1 -eq 0 && $xxx_2 -eq 0 && $xxx_3 -eq 0 ]]; then
#EN-20940-
#EN-20950-
	elif [[ $xxx_1 -eq 1 && $xxx_2 -eq 0 && $xxx_3 -eq 0 ]]; then
#EN-20960-
#EN-20970-
	elif [[ $xxx_2 -eq 1 && $xxx_3 -eq 0 ]]; then
#EN-20980-
#EN-20990-
	elif [[ $xxx_3 -eq 1 ]]; then
#EN-21000-
#EN-21010-
	fi

#EN-21020-

####################################################################################
####################################################################################
# Funciones para mostrar los datos por pantalla ####################################
####################################################################################
#EN-21030-
####################################################################################
function dibujaDatosPantallaFCFS_SJF_SRPT_RR {
#EN-21040-
	echo -e " ┌───────────────┬───────────────┬───────────────┬───────────────┐" | tee -a $informeConColorTotal 
	echo -e " │    Proceso$NC    │  T.Llegada$NC    │  T.Ejecución$NC  │    Tamaño$NC     │" | tee -a $informeConColorTotal 
	echo -e " └───────────────┴───────────────┴───────────────┴───────────────┘" | tee -a $informeConColorTotal 
	for (( i=0; i<$nprocesos; i++)); do
		echo -e "${coloress[$i % 6]} \t${proceso[$i]}\t \t${llegada[$i]}\t \t${ejecucion[$i]}\t \t${memoria[$i]}\t  $NC" | tee -a $informeConColorTotal
	done 
	echo -e "\n\n Memoria total: $mem_libre uds." | tee -a $informeConColorTotal
#EN-21050-
		echo " Tamaño a partir del cual se reubica: $variableReubicar uds." | tee -a $informeConColorTotal 
	fi
#EN-21060-
		echo " Quantum de tiempo para Round-Robin (RR): $quantum" | tee -a $informeConColorTotal 
	fi
	echo " ---------------------------------------------" | tee -a $informeConColorTotal 
   
#EN-21070-
	echo -e " ┌───────────────┬───────────────┬───────────────┬───────────────┐" >> $informeSinColorTotal
	echo -e " │    Proceso    │  T.Llegada    │  T.Ejecución  │    Tamaño     │" >> $informeSinColorTotal
	echo -e " └───────────────┴───────────────┴───────────────┴───────────────┘" >> $informeSinColorTotal
	for (( i=0; i<$nprocesos; i++)); do
		echo -e " \t${proceso[$i]}\t \t${llegada[$i]}\t \t${ejecucion[$i]}\t \t${memoria[$i]}\t  " >> $informeSinColorTotal
	done
	echo -e "\n\n Memoria total: $mem_libre uds." >> $informeSinColorTotal
#EN-21080-
		echo -e " Tamaño a partir del cual se reubica: $variableReubicar uds." >> $informeSinColorTotal
	fi
#EN-21090-
		echo -e " Quantum de tiempo para Round-Robin (RR): $quantum uds." >> $informeSinColorTotal
	fi
	echo -e  " ---------------------------------------------" >> $informeSinColorTotal
#EN-21100-
		echo -e "\n$NC Pulse enter para continuar..." | tee -a $informeConColorTotal
		echo -e "\n Pulse enter para continuar..." >> $informeSinColorTotal
		read enter
		echo -e $enter "\n" >> $informeConColorTotal
		echo -e $enter "\n" >> $informeSinColorTotal
	fi
#EN-21110-
}

####################################################################################
#EN-21120-
####################################################################################
function dibujaDatosPantallaPrioridad {
#EN-21130-
#EN-21140-
#EN-21150-
	echo -e " ┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐" | tee -a $informeConColorTotal 
	echo -e " │    Proceso$NC    │  T.Llegada$NC    │  T.Ejecución$NC  │    Tamaño$NC     │   Prioridad$NC   │" | tee -a $informeConColorTotal 
	echo -e " └───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘" | tee -a $informeConColorTotal 
	for (( i=0; i<$nprocesos; i++)); do
		echo -e "${coloress[$i % 6]} \t${proceso[$i]}\t \t${llegada[$i]}\t \t${ejecucion[$i]}\t \t${memoria[$i]}\t \t${prioProc[$i]}\t  $NC" | tee -a $informeConColorTotal
	done
	echo -e "\n\n Memoria total: $mem_libre uds." | tee -a $informeConColorTotal
	echo " Tamaño a partir del cual se reubica: $variableReubicar uds." | tee -a $informeConColorTotal 
	echo " ---------------------------------------------" | tee -a $informeConColorTotal 
   
#EN-21160-
	echo -e " ┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐" >> $informeSinColorTotal
	echo -e " │    Proceso    │  T.Llegada    │  T.Ejecución  │    Tamaño     │   Prioridad   │" >> $informeSinColorTotal
	echo -e " └───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘" >> $informeSinColorTotal
	for (( i=0; i<$nprocesos; i++)); do
		echo -e " \t${proceso[$i]}\t \t${llegada[$i]}\t \t${ejecucion[$i]}\t \t${memoria[$i]}\t \t${prioProc[$i]}\t  " >> $informeSinColorTotal
	done
	echo -e "\n\n Memoria total: $mem_libre uds." >> $informeSinColorTotal
	echo -e " Tamaño a partir del cual se reubica: $variableReubicar uds." >> $informeSinColorTotal
	echo -e  " ---------------------------------------------" >> $informeSinColorTotal
#EN-21170-
		echo -e "\n$NC Pulse enter para continuar..." | tee -a $informeConColorTotal
		echo -e "\n Pulse enter para continuar..." >> $informeSinColorTotal
		read enter
		echo -e $enter "\n" >> $informeConColorTotal
		echo -e $enter "\n" >> $informeSinColorTotal
	fi
#EN-21180-
#EN-21190-

####################################################################################
#EN-21200-
####################################################################################
function dibujaResumenBandaMemoriaMarcosPagina { 
#EN-21210-
#EN-21220-
#EN-21230-
		ordinalMarcosProcesoDibujados[$indProc]=-1	
	done
	echo ""
#EN-21240-
	AlgPagFrecUsoRecNotas1=();
	AlgPagFrecUsoRecNotas2=();
	filaAlgPagFrecUsoRecTituloColor=""
	filaAlgPagFrecUsoRecTituloBN=""
	filaAlgPagFrecUsoRecNotas1Color=""
	filaAlgPagFrecUsoRecNotas1BN=""
	
#EN-21250-
		AlgPagFrecUsoRecTitulo=" Resumen de los Marcos/Páginas-Clase/Estadísticas de Frecuencia de Uso/Estadísticas de Antigüedad de Uso de todos los procesos en memoria en la unidad de tiempo actual (reloj:"$reloj")."
		filaAlgPagFrecUsoRecTituloColor=`echo -e "$NORMAL$AlgPagFrecUsoRecTitulo$NORMAL "`
		filaAlgPagFrecUsoRecTituloBN=`echo -e "$AlgPagFrecUsoRecTitulo "`
		if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then
			AlgPagFrecUsoRecNotas1=" Se muestra: Pág.: página ; Frec.:Frecuencia de uso total registrada."
			AlgPagFrecUsoRecNotas2=" Interpretación: Fondo de color-Uso del marco."
		elif [[ $seleccionAlgoritmoPaginacion -eq 1 || $seleccionAlgoritmoPaginacion -eq 3 ]]; then
			AlgPagFrecUsoRecNotas1=" Se muestra: Pág.: página ; Frec.:Frecuencia de uso total registrada."
			AlgPagFrecUsoRecNotas2=" Interpretación: Subrayado-Siguiente fallo ; Fondo de color-Uso del marco ; Negrita-Fallo de Paginación (Marco-F)."
		elif [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then
			AlgPagFrecUsoRecNotas1=" Se muestra: Pág.: página-Coeficiente M ; Frec.:Frecuencia de uso total registrada."
			AlgPagFrecUsoRecNotas2=" Interpretación: Subrayado-Siguiente fallo ; Fondo de color-Uso del marco ; Negrita-Fallo de Paginación (Marco-F)."
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
			AlgPagFrecUsoRecNotas1=" Se muestra: Pág.: página-Tiempo hasta un nuevo uso ; UsoRec:Antigüedad de uso total registrada."
			AlgPagFrecUsoRecNotas2=" Interpretación: Subrayado-Siguiente fallo ; Fondo de color-Uso del marco ; Negrita-Fallo de Paginación (Marco-F)."
		elif ([[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 9 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -eq 15 ]]); then
			AlgPagFrecUsoRecNotas1=" Se muestra: Pág.: página ; Frec.:Frecuencia/Antigüedad de uso total registrada."
			AlgPagFrecUsoRecNotas2=" Interpretación: Subrayado-Siguiente fallo ; Fondo de color-Uso del marco ; Negrita-Fallo de Paginación (Marco-F)."
		elif [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then
			AlgPagFrecUsoRecNotas1=" Se muestra: Pág.: página-clase ; Frec./UsoRec:Frecuencia/Antigüedad de uso total registrada-Frecuencia/Antigüedad de uso en el intervalo-Antigüedad de la clase 2 o 3 en el intervalo."
			AlgPagFrecUsoRecNotas2=" Interpretación: Subrayado-Siguiente fallo ; Fondo de color-Uso del marco ; Negrita-Fallo de Paginación (Marco-F)."
		fi
		filaAlgPagFrecUsoRecNotas1Color=`echo -e "$NORMAL$AlgPagFrecUsoRecNotas1$NORMAL "`
		filaAlgPagFrecUsoRecNotas1BN=`echo -e "$AlgPagFrecUsoRecNotas1 "`
		filaAlgPagFrecUsoRecNotas2Color=`echo -e "$NORMAL$AlgPagFrecUsoRecNotas2$NORMAL "`
		filaAlgPagFrecUsoRecNotas2BN=`echo -e "$AlgPagFrecUsoRecNotas2 "`
	fi

#EN-21260-
#EN-21270-
#EN-21280-
	filamarcosColor[$aux]="$NC Marco  "
	filapagColor[$aux]="$NC Pág.   "
	if ([[ $seleccionAlgoritmoPaginacion -ge 0 && $seleccionAlgoritmoPaginacion -le 4 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]); then
		filaAlgPagFrecUsoRecColor[$aux]="$NC Frec.  "
	elif ([[ $seleccionAlgoritmoPaginacion -eq 5 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]); then
		filaAlgPagFrecUsoRecColor[$aux]="$NC UsoRec "
	fi
	filaprocesosBN[$aux]=" Proc.  "
	filamarcosBN[$aux]=" Marco  "
	filapagBN[$aux]=" Pág.   "
	if ([[ $seleccionAlgoritmoPaginacion -ge 0 && $seleccionAlgoritmoPaginacion -le 4 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]); then
		filaAlgPagFrecUsoRecBN[$aux]=" Frec.  "
	elif ([[ $seleccionAlgoritmoPaginacion -eq 5 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]); then
		filaAlgPagFrecUsoRecBN[$aux]=" UsoRec "
	fi
#EN-21290-
#EN-21300-
#EN-21310-
#EN-21320-
#EN-21330-

#EN-21340-
	for ((indMem=0;indMem<$mem_num_marcos;indMem++)); do
#EN-21350-
#EN-21360-
#EN-21370-
				filaprocesosColor[$aux]="        "
				filaprocesosBN[$aux]="        "
#EN-21380-
			fi
#EN-21390-
				xx=0
			fi
#EN-21400-
#EN-21410-
				filaprocesosBN[$aux]+=`echo -e "${proceso[$((${unidMemOcupadas[$indMem]}))]}""$espaciosfinal "`
				filaprocesosColor[$aux]+=`echo -e "${coloress[${unidMemOcupadas[$indMem]} % 6]}${proceso[$((${unidMemOcupadas[$indMem]}))]}""$NORMAL$espaciosfinal "`
				numCaracteres2=$(($numCaracteres2 + $anchoColumna))
				xx=1
			else
#EN-21420-
#EN-21430-
					filaprocesosBN[$aux]="        "
					filaprocesosColor[$aux]="        "
					numCaracteres2=8
				fi
				espaciosasteriscofinal="*"${varhuecos:1:$(($anchoColumna - 2))}
				filaprocesosBN[$aux]+=`echo -e "$espaciosasteriscofinal "`
				filaprocesosColor[$aux]+=`echo -e "${coloress[${unidMemOcupadas[$indMem]} % 6]}$espaciosasteriscofinal$NORMAL "`
				numCaracteres2=$(($numCaracteres2 + $anchoColumna))
				if [[ $indMem -ne 0 ]]; then
					if [[ ${unidMemOcupadas[$((indMem - 1))]} !=  "_" ]]; then
						if [[ $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$indMem]}))]} != ${proceso[$((${unidMemOcupadas[$((indMem - 1))]}))]} ]]; then
							xx=0
						fi
					fi
				fi
			fi
		else
			xx=0
#EN-21440-
#EN-21450-
				filaprocesosBN[$aux]="        "
				filaprocesosColor[$aux]="        "
				numCaracteres2=8
			fi
			espaciosguionfinal="-"${varhuecos:1:$(($anchoColumna - 2))}
			filaprocesosBN[$aux]+=`echo -e "$espaciosguionfinal "`
			filaprocesosColor[$aux]+=`echo -e "$NORMAL$espaciosguionfinal "`
			numCaracteres2=$(($numCaracteres2 + $anchoColumna))
		fi
	done

#EN-21460-
#EN-21470-
#EN-21480-
	textoFallo1="M"
	textoFallo2="-F"
	for ((indMem=0;indMem<$mem_num_marcos;indMem++)); do
#EN-21490-
#EN-21500-
			filamarcosColor[$aux]="        "
			filamarcosBN[$aux]="        "
#EN-21510-
		fi
		if [[ ${unidMemOcupadas[$indMem]} != "_" ]]; then	
#EN-21520-
#EN-21530-
#EN-21540-
#EN-21550-
#EN-21560-
#EN-21570-
#EN-21580-
				varImprimirSiguiente="\e[4m"
			fi
#EN-21590-
				varImprimirFallo="\e[1m"
			fi
#EN-21600-
				espaciosfinal=${varhuecos:1:$(($anchoColumna - ${#indMem} - 2))} #Espacios por defecto. Se quita 1 por la M. 
				filamarcosColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}$varImprimirSiguiente$textoFallo1$indMem$NC$espaciosfinal "`
				filamarcosBN[$aux]+=`echo -e "M$indMem$espaciosfinal "`
#EN-21610-
				espaciosfinal=${varhuecos:1:$(($anchoColumna - ${#indMem} - 4))} #Se quita 1 por la M, y 2 por "-F".
				filamarcosColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}$varImprimirSiguiente$varImprimirFallo$textoFallo1$indMem$textoFallo2$NC$espaciosfinal "`
				filamarcosBN[$aux]+=`echo -e "M$indMem$textoFallo$espaciosfinal "`
			fi 
		else
			espaciosfinal=${varhuecos:1:$(($anchoColumna - ${#indMem} - 2))} #Espacios por defecto. Se quita 1 por la M. 
			filamarcosColor[$aux]+=`echo -e $NORMAL"$textoFallo1$indMem$espaciosfinal "`
			filamarcosBN[$aux]+=`echo -e "$textoFallo1$indMem$espaciosfinal "`
		fi 
		numCaracteres2=$(($numCaracteres2 + $anchoColumna))
	done

#EN-21620-
#EN-21630-
	numCaracteres2=10
	guionesAMeter=${varguiones:1:$(($anchoColumna - 2))}
	asteriscosAMeter=${varasteriscos:1:$(($anchoColumna - 2))}
	sumaTotalMemoria=0
#EN-21640-
#EN-21650-
	for (( i=0; i<$nprocesos; i++)); do 
#EN-21660-
	done
#EN-21670-
#EN-21680-
#EN-21690-
#EN-21700-
			filapagBN[$aux]="        "
			filapagColor[$aux]="        "
			numCaracteres2=8
		fi
#EN-21710-
#EN-21720-
		espaciosadicionales=0
#EN-21730-
#EN-21740-
#EN-21750-
#EN-21760-
#EN-21770-
#EN-21780-
			fi
#EN-21790-
				varImprimirUsado=${colorfondo[${unidMemOcupadas[$indMem]} % 6]}
			fi
			if [[ ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]} -eq 0 ]]; then #Si no hay página se mete asterisco en BN.
#EN-21800-
				filapagBN[$aux]+=`echo -e "${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$espaciosasteriscofinal "`
				filapagColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$espaciosasteriscofinal$NC "`
#EN-21810-
#EN-21820-
#EN-21830-
					datoM="-"${coeficienteSegOp[$ejecutandoinst,${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$punteroPagMarco]}	
#EN-21840-

#EN-21850-
#EN-21860-
#EN-21870-
#EN-21880-
#EN-21890-
#EN-21900-
#EN-21910-
				fi
				espaciosfinal=${varhuecos:1:$(($anchoColumna - 1 - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]} - $espaciosadicionales))} #2 por el tamaño de $datos4
#EN-21920-
					filapagBN[$aux]+=`echo -e "${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$dato4$datoM$espaciosfinal "`
					filapagColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$dato4$datoM$espaciosfinal$NC "`
#EN-21930-
					filapagBN[$aux]+=`echo -e "${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$dato4$datoM$espaciosfinal "`
					filapagColor[$aux]+=`echo -e "$NC$varImprimirUsado${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$dato4$datoM$espaciosfinal$NC "`
				fi
			fi
#EN-21940-
			numCaracteres2=$(($numCaracteres2 + $anchoColumna))
			if [[ $indMem -ne 0 ]]; then
				if [[ ${unidMemOcupadas[$((indMem - 1))]} !=  "_" ]]; then 
					if [[ $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$indMem]}))]} != ${proceso[$((${unidMemOcupadas[$((indMem - 1))]}))]} ]]; then
						xx=0
					fi
				fi
			fi
#EN-21950-
			xx=0
#EN-21960-
			filapagBN[$aux]+=`echo -e "$espaciosguionfinal "`
			filapagColor[$aux]+=`echo -e "$NC$espaciosguionfinal$NC "`
			numCaracteres2=$(($numCaracteres2 + $anchoColumna))
		fi
#EN-21970-
	done

#EN-21980-
#EN-21990-
	numCaracteres2=10
	guionesAMeter=${varguiones:1:$(($anchoColumna - 2))}
	asteriscosAMeter=${varasteriscos:1:$(($anchoColumna - 2))}
	sumaTotalMemoria=0
#EN-22000-
	for (( i=0; i<$nprocesos; i++)); do 
#EN-22010-
	done			
	for ((indMem=0;indMem<$mem_num_marcos;indMem++)); do
#EN-22020-
#EN-22030-
			filaAlgPagFrecUsoRecBN[$aux]="        "
			filaAlgPagFrecUsoRecColor[$aux]="        "
			numCaracteres2=8
		fi
#EN-22040-
			if [[ ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]} -eq 0 ]]; then #Si no hay página se mete asterisco por ser frecuencia 0.
				espaciosasteriscofinal="*"${varhuecos:1:$(($anchoColumna - 2))}
				filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "$espaciosasteriscofinal "`
				filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}$espaciosasteriscofinal$NC "`
#EN-22050-
				dato5=""
				dato6=""
				espaciosadicionales1=0
				espaciosadicionales2=0
#EN-22060-
#EN-22070-
#EN-22080-
#EN-22090-
#EN-22100-
#EN-22110-
				fi 
#EN-22120-
#EN-22130-
				if [[ $seleccionAlgoritmoPaginacion -ge 0 && $seleccionAlgoritmoPaginacion -le 4 ]]; then
					filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "${ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${ordinalMarcosProcesoDibujados[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal "`
					filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${ordinalMarcosProcesoDibujados[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal$NC "`
				elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-22140-
					filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "${ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal "`
					filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal$NC "`
				elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
					filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "${ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal "`
					filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal$NC "`
				elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
#EN-22150-
					filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "${ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal "`
					filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal$NC "`
				fi
			fi 
#EN-22160-
			numCaracteres2=$(($numCaracteres2 + $anchoColumna))
			if [[ $indMem -ne 0 ]]; then
				if [[ ${unidMemOcupadas[$((indMem - 1))]} !=  "_" ]]; then 
					if [[ $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$indMem]}))]} != ${proceso[$((${unidMemOcupadas[$((indMem - 1))]}))]} ]]; then
						xx=0
					fi
				fi
			fi
		else
			xx=0
#EN-22170-
			filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "$espaciosguionfinal "`
			filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC$espaciosguionfinal$NC "`
			numCaracteres2=$(($numCaracteres2 + $anchoColumna))
		fi
	done

#EN-22180-
#EN-22190-

#EN-22200-
#EN-22210-
		echo -e "$filaAlgPagFrecUsoRecTituloColor" | tee -a $informeConColorTotal
		echo -e "$filaAlgPagFrecUsoRecNotas1Color" | tee -a $informeConColorTotal
		echo -e "$filaAlgPagFrecUsoRecNotas2Color" | tee -a $informeConColorTotal
		echo -e "$filaAlgPagFrecUsoRecTituloBN" >> $informeSinColorTotal
		echo -e "$filaAlgPagFrecUsoRecNotas1BN" >> $informeSinColorTotal
		echo -e "$filaAlgPagFrecUsoRecNotas2BN" >> $informeSinColorTotal
	fi
	for (( jj = 0; jj <= $aux; jj++ )); do
		echo -e "${filaprocesosColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${filamarcosColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${filapagColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${filaAlgPagFrecUsoRecColor[$jj]}\n" | tee -a $informeConColorTotal
		echo -e "${filaprocesosBN[$jj]}" >> $informeSinColorTotal
		echo -e "${filamarcosBN[$jj]}" >> $informeSinColorTotal
		echo -e "${filapagBN[$jj]}" >> $informeSinColorTotal
		echo -e "${filaAlgPagFrecUsoRecBN[$jj]}\n" >> $informeSinColorTotal
	done

#EN-22220-
#EN-22230-
#EN-22240-
#EN-22250-
	done
#EN-22260-
#EN-22270-
#EN-22280-
	done
#EN-22290-
	nposiciones=0
#EN-22300-
	for (( i=0; i<$nposiciones; i++ )) ; do
		 inicialNCmodelo[$i]=0
	done
	for (( i=0; i<$nposiciones; i++ )) ; do 
		 finalNCmodelo[$i]=0
	done
#EN-22310-

####################################################################################
#EN-22320-
####################################################################################
#EN-22330-
	numCaracteres2Inicial=12
	Terminal=$((`tput cols`)) 
	if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 || $seleccionAlgoritmoPaginacion -eq 7 || $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then 
#EN-22340-
#EN-22350-
#EN-22360-
	else
		anchoColumna=$((8 + $digitosUnidad - 3))
	fi
#EN-22370-
	filaAlgPagFrecUsoRecTituloBN=();
	filaAlgPagFrecUsoRecNotas1Color=();
	filaAlgPagFrecUsoRecNotas1BN=();
	filaAlgPagFrecUsoRecNotas2Color=();
	filaAlgPagFrecUsoRecNotas2BN=();
	filatiempoColor=();
	filatiempoBN=();
	filapagColor=();
	filapagBN=();
	filatiempoColor=();
	filatiempoBN=();
	filaAlgPagFrecUsoRecColor=();
	filaAlgPagFrecUsoRecBN=();
	filaFallosColor=();
	filaFallosBN=();

	AlgPagFrecUsoRecMFUTituloColor="\nResumen de los fallos de página del proceso finalizado ${coloress[$procFinalizado % 6]}${proceso[$procFinalizado]}$NORMAL a lo largo del tiempo."
	AlgPagFrecUsoRecMFUTituloBN="\nResumen de los fallos de página del proceso finalizado ${proceso[$procFinalizado]} a lo largo del tiempo."
	filaAlgPagFrecUsoRecTituloColor=`echo -e "$NORMAL$AlgPagFrecUsoRecMFUTituloColor$NORMAL "`
	filaAlgPagFrecUsoRecTituloBN=`echo -e "$AlgPagFrecUsoRecMFUTituloBN "`
	if [[ $seleccionAlgoritmoPaginacion -eq 0 || $seleccionAlgoritmoPaginacion -eq 1 || $seleccionAlgoritmoPaginacion -eq 3 ]]; then
		AlgPagFrecUsoRecMFUNotas1="Se muestra: Número de Marco Real-Página del Proceso-Su Frecuencia de Uso"
	elif [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then
		AlgPagFrecUsoRecMFUNotas1="Se muestra: Número de Marco Real-Página del Proceso-Su Frecuencia de Uso-Coeficiente M."
	elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
		AlgPagFrecUsoRecMFUNotas1="Se muestra: Número de Marco Real-Página del Proceso-Su Tiempo hasta un nuevo uso"
	elif ([[ $seleccionAlgoritmoPaginacion -gt 6 && $seleccionAlgoritmoPaginacion -le 9 ]]) || ([[ $seleccionAlgoritmoPaginacion -gt 12 && $seleccionAlgoritmoPaginacion -eq 15 ]]); then
		AlgPagFrecUsoRecMFUNotas1="Se muestra: Número de Marco Real-Página del Proceso-Su Frecuencia/Antigüedad de Uso."
	elif [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then
		AlgPagFrecUsoRecMFUNotas1="Se muestra: Número de Marco Real-Página del Proceso-Su Frecuencia/Antigüedad de Uso-Página Modificada-Clase."
	fi
	filaAlgPagFrecUsoRecNotas1Color=`echo -e "$NORMAL$AlgPagFrecUsoRecMFUNotas1$NORMAL "`
	filaAlgPagFrecUsoRecNotas1BN=`echo -e "$AlgPagFrecUsoRecMFUNotas1 "`
	if [[ $seleccionAlgoritmoPaginacion -ne 0 ]]; then
		AlgPagFrecUsoRecMFUNotas2="Interpretación: Subrayado-Siguiente fallo ; Fondo de color-Uso del marco ; Negrita-Fallo de Paginación."
	else
		AlgPagFrecUsoRecMFUNotas2="Interpretación: Fondo de color-Uso del marco."
	fi
	filaAlgPagFrecUsoRecNotas2Color=`echo -e "$NORMAL$AlgPagFrecUsoRecMFUNotas2$NORMAL "`
	filaAlgPagFrecUsoRecNotas2BN=`echo -e "$AlgPagFrecUsoRecMFUNotas2 "`

#EN-22380-
#EN-22390-
	filatiempoColor[$aux]="\n$NC Tiempo     "
	filatiempoBN[$aux]="\n Tiempo     "
#EN-22400-
#EN-22410-
	iiSiguiente=0
	for ((counter=0;counter<${ejecucion[$procFinalizado]};counter++)); do
		for ((ii=$iiSiguiente;ii<$reloj;ii++)); do
#EN-22420-
#EN-22430-
				filatiempoColor[$aux]="\n            "
				filatiempoBN[$aux]="\n            "
#EN-22440-
			fi
			if [[ ${ResuTiempoProceso[$ii]} -eq $procFinalizado ]]; then
#EN-22450-
				filatiempoColor[$aux]+=`echo -e "$NORMAL""$ii$espaciosfinal$NORMAL "`
				filatiempoBN[$aux]+=`echo -e "$ii$espaciosfinal "`
#EN-22460-
				numCaracteres2=$(($numCaracteres2 + $anchoColumna + 1))
			fi
		done
	done

#EN-22470-
#EN-22480-
	filapagColor[$aux]="$NC Página     "
	filapagBN[$aux]=" Página     "
#EN-22490-
	iiSiguiente=0
	varCierre=0
	for ((counter=0;counter<${ejecucion[$procFinalizado]};counter++)); do
		for ((ii=$iiSiguiente;ii<$reloj;ii++)); do
#EN-22500-
#EN-22510-
				filapagColor[$aux]="            "
				filapagBN[$aux]="            "
#EN-22520-
			fi
#EN-22530-
				varCierre=$(($varCierre + 1))
#EN-22540-
				filapagColor[$aux]+=`echo -e "$NORMAL""${paginasDefinidasTotal[$procFinalizado,$ii]}$espaciosfinal$NORMAL "`
				filapagBN[$aux]+=`echo -e "${paginasDefinidasTotal[$procFinalizado,$ii]}$espaciosfinal "`
				numCaracteres2=$(($numCaracteres2 + $anchoColumna + 1))
#EN-22550-
			fi
		done
	done

#EN-22560-
#EN-22570-
#EN-22580-
		espaciosfinal=${varhuecos:1:$((2 - ${#k}))} #Se considera que los números de marcos, páginas y frecuencias no superarán los tres dígitos.
#EN-22590-
#EN-22600-
#EN-22610-
		iiSiguiente=0
		for ((counter=0;counter<${ejecucion[$procFinalizado]};counter++)); do
			for ((ii=$iiSiguiente;ii<$reloj;ii++)); do
#EN-22620-
#EN-22630-
#EN-22640-
						filaAlgPagFrecUsoRecColor[$k,$aux]="            "
						filaAlgPagFrecUsoRecBN[$k,$aux]="            "
#EN-22650-
					fi
#EN-22660-
#EN-22670-
					if ([[ $seleccionAlgoritmoPaginacion -ge 0 && $seleccionAlgoritmoPaginacion -le 4 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 9 ]]); then
#EN-22680-
					elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-22690-
					elif [[ $seleccionAlgoritmoPaginacion -ge 10 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
						dato3=${ResuFrecuenciaAcumulado[$procFinalizado,$k,$ii]}
						if [[ $dato3 -ge $seleccionAlgoritmoPaginacion_clases_frecuencia_valor ]]; then
#EN-22700-
						fi
					elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 15 ]]; then
#EN-22710-
					elif [[ $seleccionAlgoritmoPaginacion -ge 16 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
						dato3=${ResuUsoRecienteAcumulado[$procFinalizado,$k,$ii]}
						if [[ $dato3 -ge $seleccionAlgoritmoPaginacion_clases_uso_rec_valor ]]; then
#EN-22720-
						fi
					fi
#EN-22730-
#EN-22740-
					if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-22750-
#EN-22760-
#EN-22770-
							datostot="$dato1-$dato2-$dato3-$datoM"
#EN-22780-
							datostot="$dato1"						
						fi
					elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
#EN-22790-
							datostot="$dato1-$dato2-$dato3"
						else
							datostot="$dato1"						
						fi
					elif [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then
#EN-22800-
#EN-22810-
#EN-22820-
#EN-22830-
						fi
						datostot="$dato1-$dato2-$dato3-$dato4"
					elif [[ $seleccionAlgoritmoPaginacion -eq 0 ]] || [[ $seleccionAlgoritmoPaginacion -eq 1 ]] || [[ $seleccionAlgoritmoPaginacion -eq 3 ]] || ([[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 9 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 15 ]]); then
						datostot="$dato1-$dato2-$dato3"
					fi
#EN-22840-
#EN-22850-
#EN-22860-
					if [[ $seleccionAlgoritmoPaginacion -ne 0 ]]; then
#EN-22870-
					fi
#EN-22880-
					varImprimirUsado=""
					varImprimirSiguiente=""
					varImprimirFallo=""
#EN-22890-
					if [[ ${varUsado} -eq $k ]]; then
						varImprimirUsado=${colorfondo[$procFinalizado % 6]}
					elif [[ ${varSiguiente} -eq $k && $seleccionAlgoritmoPaginacion -ne 0 ]]; then
						varImprimirSiguiente="\e[4m"
#EN-22900-
						varImprimirFallo="\e[1m"
					fi
					if [[ $varImprimirUsado == "" ]]; then
						filaAlgPagFrecUsoRecColor[$k,$aux]+=`echo -e "$NC${coloress[$procFinalizado % 6]}$varImprimirSiguiente$varImprimirFallo$datostot$NC$espaciosfinal "`
						filaAlgPagFrecUsoRecBN[$k,$aux]+=`echo -e "$datostot$espaciosfinal "`
					else
						filaAlgPagFrecUsoRecColor[$k,$aux]+=`echo -e "$NC$varImprimirUsado$varImprimirSiguiente$varImprimirFallo$datostot$NC$espaciosfinal "`
						filaAlgPagFrecUsoRecBN[$k,$aux]+=`echo -e "$datostot$espaciosfinal "`
					fi
					numCaracteres2=$(($numCaracteres2 + $anchoColumna + 1))
				fi
#EN-22910-
			done
		done
	done

#EN-22920-
#EN-22930-
#EN-22940-
#EN-22950-
#EN-22960-
#EN-22970-
	iiSiguiente=0
	for ((counter=0;counter<${ejecucion[$procFinalizado]};counter++)); do
		for ((ii=$iiSiguiente;ii<=$reloj;ii++)); do
#EN-22980-
#EN-22990-
#EN-23000-
					filaFallosColor[$aux]="            "
					filaFallosBN[$aux]="            "
#EN-23010-
				fi
#EN-23020-
#EN-23030-
					filaFallosColor[$aux]+=`echo -e "${coloress[$procFinalizado % 6]}""F""$NC$espaciosfinal "`
					filaFallosBN[$aux]+=`echo -e "F""$espaciosfinal "`
				else
					filaFallosColor[$aux]+=`echo -e "-""$NC$espaciosfinal "`
					filaFallosBN[$aux]+=`echo -e "-""$espaciosfinal "`
				fi
				numCaracteres2=$(($numCaracteres2 + $anchoColumna + 1))
			fi
#EN-23040-
		done
	done

#EN-23050-
#EN-23060-

#EN-23070-
	echo -e "$filaAlgPagFrecUsoRecTituloColor" | tee -a $informeConColorTotal
	echo -e "$filaAlgPagFrecUsoRecNotas1Color" | tee -a $informeConColorTotal
	echo -ne "$filaAlgPagFrecUsoRecNotas2Color" | tee -a $informeConColorTotal
	echo -e "$filaAlgPagFrecUsoRecTituloBN" >> $informeSinColorTotal
	echo -e "$filaMF$filaAlgPagFrecUsoRecNotas1BN" >> $informeSinColorTotal
	echo -ne "$filaAlgPagFrecUsoRecNotas2BN" >> $informeSinColorTotal
#EN-23080-
		echo -e "${filatiempoColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${filapagColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${filatiempoBN[$jj]}" >> $informeSinColorTotal
		echo -e "${filapagBN[$jj]}" >> $informeSinColorTotal
#EN-23090-
			echo -e "${filaAlgPagFrecUsoRecColor[$k,$jj]}" | tee -a $informeConColorTotal
			echo -e "${filaAlgPagFrecUsoRecBN[$k,$jj]}" >> $informeSinColorTotal
		done
		echo -e "${filaFallosColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${filaFallosBN[$jj]}" >> $informeSinColorTotal
	done
	echo -e " Total de Fallos de Página del Proceso "${coloress[$procFinalizado % 6]}${proceso[$procFinalizado]}": $NORMAL"$fallosProceso | tee -a $informeConColorTotal
	echo -e " Total de Fallos de Página del Proceso "${proceso[$procFinalizado]}": "$fallosProceso >> $informeSinColorTotal
	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then
		echo -e " Número de expulsiones forzadas en Round-Robin (RR) del Proceso "${coloress[$procFinalizado % 6]}${proceso[$procFinalizado]}": $NORMAL"${contadorAlgPagExpulsionesForzadasProcesoAcumulado[$procFinalizado]} | tee -a $informeConColorTotal
		echo -e " Número de expulsiones forzadas en Round-Robin (RR) del Proceso "${proceso[$procFinalizado]}": "${contadorAlgPagExpulsionesForzadasProcesoAcumulado[$procFinalizado]} >> $informeSinColorTotal
	fi
#	procFinalizado=-1 #Se define a "-1" para que no vuelva a imprimirse en caso de producirse algún otro evento.
#EN-23100-

####################################################################################
#EN-23110-
####################################################################################
function dibujaResumenReloj {	
#	procFinalizadoOEjecutando #Variable que será procFinalizado o ejecutandoinst, dependiendo de si se muestra todo el proceso o sólo un instante. 
#	procFinalizado=-1 #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
#	ejecutandoinst=-1 #Variable que se usa para determinar el proceso en ejecución en cada instante de tiempo.
#paginasDefinidasTotal 					#Páginas definidas de todos los Proceso (Índices:Proceso, Páginas).
#numeroPaginasUsadasProceso 			#Número de Páginas ya usadas de cada Proceso.
#paginasUsadasProceso 					#Secuencia de Páginas ya usadas de cada Proceso.
#paginasUsadasTotal 					#Páginas ya usadas del Proceso en ejecución. Sale de forma secuencial de paginasDefinidasTotal.
#paginasPendientesUsarTotal 			#Páginas pendientes de ejecutar del Proceso en ejecución. Sale de forma secuencial de paginasDefinidasTotal. 
#paginaAUsar 							#Siguiente Página a ejecutar del Proceso en ejecución. Sale de forma secuencial de paginasDefinidasTotal con el delimitador de numeroPaginasUsadasProceso.
#paginasEnMemoriaProceso 				#Páginas residentes en memoria del Proceso en ejecución. Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
#paginasEnMemoriaTotal 					#Páginas residentes en memoria de cada Proceso (Índices:Proceso,número ordinal de marco asociado). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
#numMarcosDibujadosPorProceso 			#Contiene el número de Marcos de Memoria con Páginas ya dibujadas de cada Proceso.
#contadorAlgPagFallosTotalesProcesos 	#Fallos de página totales de cada proceso.
#ordinalMarcosProcesoDibujados 			#Desde 0, es el ordinal del número de marcos en memoria asociados a cada proceso (Índices:Proceso)
#numeroMarcosUsados 					#Resumen - Índices: (proceso). Dato: Número de Marcos usados en cada Proceso.

#EN-23120-
	iiSiguiente=0
	for ((counter=0;counter<${ejecucion[$procFinalizadoOEjecutando]};counter++)); do
		for ((ii=$iiSiguiente;ii<=$reloj;ii++)); do
#EN-23130-
				dibujaReloj
			fi
#EN-23140-
		done
	done
#EN-23150-

####################################################################################
#EN-23160-
####################################################################################
function dibujaReloj {		
#EN-23170-
#EN-23180-
	CReloj=${coloress[$procFinalizadoOEjecutando % 6]}
#EN-23190-
	AlgPagFrecUsoRecNotas1=();
	filaAlgPagFrecUsoRecTituloColor=""
	filaAlgPagFrecUsoRecTituloBN=""
	filaAlgPagFrecUsoRecNotas1Color=""
	filaAlgPagFrecUsoRecNotas1BN=""
	echo "" | tee -a ./Informes/informeCOLOR.txt ./Informes/informeBN.txt
	
#EN-23200-
		AlgPagFrecUsoRecTitulo=" Representación del Reloj para Fallos de Paginación (reloj:"$reloj")."
		filaAlgPagFrecUsoRecTituloColor=`echo -e "$NORMAL$AlgPagFrecUsoRecTitulo$NORMAL "`
		filaAlgPagFrecUsoRecTituloBN=`echo -e "$AlgPagFrecUsoRecTitulo "`
		if [[ $seleccionAlgoritmoPaginacion -eq 3 ]]; then
			AlgPagFrecUsoRecNotas1=" Se muestra la página que ocupa cada marco en cada instante."
			AlgPagFrecUsoRecNotas2=" Interpretación: Subrayado-Siguiente fallo ; Fondo de color-Uso del marco ; Negrita-Fallo de Paginación (Marco-F)."
		elif [[ $seleccionAlgoritmoPaginacion -eq 4 || $seleccionAlgoritmoPaginacion -eq 3 ]]; then
			AlgPagFrecUsoRecNotas1=" Se muestra: Página que ocupa cada marco en cada instante-Bit de Segunda Oportunidad."
			AlgPagFrecUsoRecNotas2=" Interpretación: Subrayado-Siguiente fallo ; Fondo de color-Uso del marco ; Negrita-Fallo de Paginación (Marco-F)."
		fi
		filaAlgPagFrecUsoRecNotas1BN=`echo -e "$AlgPagFrecUsoRecNotas1 "`
		filaAlgPagFrecUsoRecNotas2BN=`echo -e "$AlgPagFrecUsoRecNotas2 "`
	fi
#EN-23210-
	linea3Color=" "
	linea5Color=" "
#EN-23220-
	linea2BN=" "
	linea3BN=" "
	linea4BN=" "
	linea5BN=" "

	longCampoDatosReloj=6
#EN-23230-
#EN-23240-
#EN-23250-
	espaciosLineasMitad=${varhuecos:1:$TamespaciosLineasMitad}
#EN-23260-
						
#EN-23270-
#EN-23280-
#EN-23290-
#EN-23300-
	else
#EN-23310-
	fi
#EN-23320-
#EN-23330-
#EN-23340-
#EN-23350-
	posArrCentroCalculado=$(($posArrCentro - 1))
#EN-23360-
	posArrDeCalculado=$(($posArrDe - 1))
#EN-23370-
#EN-23380-
#EN-23390-
	posCentroDeCalculado=$(($posCentroDe - 1))
#EN-23400-
	posAbIzCalculado=$(($posAbIz - 1))
#EN-23410-
#EN-23420-
#EN-23430-
#EN-23440-
	if [ $posSobrante -ne 0 ]; then
#EN-23450-
	else
#EN-23460-
	fi

#EN-23470-
#EN-23480-
#EN-23490-
	#varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
	#varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
	#varImprimirPaginaUsada=${colorfondo[$procFinalizado % 6]} #Variable relacionada con el dato: Fondo-Marco usado
	varUsado=${ResuPunteroMarcoUsado[$procFinalizadoOEjecutando,$reloj]} # #Ordinal del marco usado (Puntero - De 0 a n) para el Proceso en ejecución en una unidad de Tiempo. Marco usado (Puntero) para cada Proceso en cada unidad de Tiempo.
#EN-23500-
#EN-23510-

#EN-23520-
	cuadrante=4
#EN-23530-
#EN-23540-
#EN-23550-
#EN-23560-
			if [[ $posArrIzCalculado -le $posArrIzFinal ]]; then 
				counter1=0
				for ((ii=$posArrIzCalculado; ii<=$posArrIzFinal; ii++)); do
					posArrIzReal=$(($posCentroIzReal + 1 + $counter1))
#EN-23570-
#EN-23580-
#EN-23590-
#EN-23600-
#EN-23610-
					fi
					if [[ $varFallo -eq $posArrIzReal ]]; then 
#EN-23620-
					fi
					if [[ $varSiguiente -eq $posArrIzReal ]]; then 
#EN-23630-
					fi
#EN-23640-
					if [[ ${paginasEnMemoriaProceso[$posArrIzReal]} -ne -1 && ${memoria[$procFinalizadoOEjecutando]} -gt $posArrIzReal ]]; then
						if [[ $ii -ne $posArrIzFinal ]]; then
							datoM=""
							if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-23650-
#EN-23660-
							fi
							dato1="${paginasEnMemoriaProceso[$posArrIzReal]}$datoM"
#EN-23670-
							espaciosfinal="${varhuecos:1:$TamNum}"
#EN-23680-
#EN-23690-
							linea2BN="$linea2BN $espaciosfinalIni\\"
						elif [[ $ii -eq $posArrIzFinal ]] && [[ $cuadrante -le $posSobrante || $posSobrante -eq 0 ]]; then
							datoM=""
							if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-23700-
#EN-23710-
							fi
							dato1="${paginasEnMemoriaProceso[$posArrIzReal]}$datoM"
#EN-23720-
							espaciosfinal="${varhuecos:1:$TamNum}"
							linea1BN="$linea1BN $variacionesMarco$dato1 "
							linea1Color="$linea1Color $variacionesMarco$espaciosfinal$dato1$NC$CReloj "
							linea2BN="$linea2BN $espaciosfinalIni\\"
						elif [[ $ii -eq $posArrIzFinal && $cuadrante -gt $posSobrante ]]; then
							TamNum=$longCampoDatosReloj
							espaciosfinal="${varasteriscos:1:$TamNum}"
							linea1BN="$linea1BN $espaciosfinal "
							linea1Color="$linea1Color $espaciosfinal "
							linea2BN="$linea2BN $espaciosfinalIni "
						fi
					elif [[ ${paginasEnMemoriaProceso[$posArrIzReal]} -ne -1 && ${memoria[$procFinalizadoOEjecutando]} -le $posArrIzReal ]]; then
						TamNum=$longCampoDatosReloj
						espaciosfinal="${varasteriscos:1:$TamNum}"
						linea1BN="$linea1BN $espaciosfinal "
						linea1Color="$linea1Color $espaciosfinal "
						linea2BN="$linea2BN $espaciosfinalIni "
					elif [[ ${paginasEnMemoriaProceso[$posArrIzReal]} -eq -1 ]]; then
						if [[ $ii -ne $posArrIzFinal ]]; then
							linea1BN="$linea1BN $guionesfinal "
							linea1Color="$linea1Color $variacionesMarco$guionesfinal$NC$CReloj "
							linea2BN="$linea2BN $espaciosfinalIni\\"
						elif [[ $ii -eq $posArrIzFinal ]] && [[ $cuadrante -le $posSobrante || $posSobrante -eq 0 ]]; then
							linea1BN="$linea1BN $guionesfinal "
							linea1Color="$linea1Color $variacionesMarco$guionesfinal$NC$CReloj "
							linea2BN="$linea2BN $espaciosfinalIni\\"
						elif [[ $ii -eq $posArrIzFinal && $cuadrante -gt $posSobrante ]]; then
							TamNum=$longCampoDatosReloj
							espaciosfinal="${varasteriscos:1:$TamNum}"
							linea1BN="$linea1BN $espaciosfinal "
							linea1Color="$linea1Color $espaciosfinal "
							linea2BN="$linea2BN $espaciosfinalIni "
						fi
					fi
					counter1=$(($counter1 + 1))
				done
			else
				linea1BN="$linea1BN$espaciosfinalIni  " 
				linea1Color="$linea1Color$espaciosfinalIni  " 
				linea2BN="$linea2BN$espaciosfinalIni  "
			fi
		else
			linea1BN="$linea1BN$espaciosfinalIni  "
			linea1Color="$linea1Color$espaciosfinalIni  "
			linea2BN="$linea2BN$espaciosfinalIni  "
		fi
	fi
#EN-23730-
#EN-23740-
#EN-23750-
	if [[ $varUsado -eq $posArrCentroCalculado ]]; then 
#EN-23760-
	fi
	if [[ $varFallo -eq $posArrCentroCalculado ]]; then 
#EN-23770-
	fi
	if [[ $varSiguiente -eq $posArrCentroCalculado ]]; then 
#EN-23780-
	fi
#EN-23790-
	if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-23800-
#EN-23810-
		dato1=" ${paginasEnMemoriaProceso[$posArrCentroCalculado]}$datoM"
#EN-23820-
		espaciosfinal="${varhuecos:1:$TamNum}"
		linea1BN="$linea1BN$dato1$espaciosfinal"
		linea1Color="$linea1Color$variacionesMarco$dato1$NC$CReloj$espaciosfinal"
		linea2BN="$linea2BN $espaciosLineasMitad|$espaciosLineasMitad"
	else
		dato1="${paginasEnMemoriaProceso[$posArrCentroCalculado]}"
		TamNum=$(($longCampoDatosReloj - ${#espaciosLineasMitad} - ${#dato1}))  
		espaciosfinal="${varhuecos:1:$TamNum}"
		linea1BN="$linea1BN$espaciosLineasMitad$dato1$espaciosLineasMitad"
		linea1Color="$linea1Color$espaciosLineasMitad$variacionesMarco$dato1$NC$CReloj$espaciosLineasMitad"
		linea2BN="$linea2BN$espaciosLineasMitad|$espaciosLineasMitad"
	fi
	cuadrante=1
#EN-23830-
#EN-23840-
#EN-23850-
		for ((ii=$posArrDeCalculado; ii<=$posArrDeFinal; ii++)); do
#EN-23860-
#EN-23870-
#EN-23880-
			if [[ $varUsado -eq $ii ]]; then 
#EN-23890-
			fi
			if [[ $varFallo -eq $ii ]]; then 
#EN-23900-
			fi
			if [[ $varSiguiente -eq $ii ]]; then 
#EN-23910-
			fi
#EN-23920-
			if [[ ${paginasEnMemoriaProceso[$ii]} -ge 0 ]]; then
				datoM=""
				if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-23930-
#EN-23940-
				fi
				dato1="${paginasEnMemoriaProceso[$ii]}$datoM"
#EN-23950-
				espaciosfinal="${varhuecos:1:$TamNum}"
				linea1BN="$linea1BN $dato1$espaciosfinal "
				linea1Color="$linea1Color $variacionesMarco$dato1$NC$CReloj$espaciosfinal "
			else
				linea1BN="$linea1BN $guionesfinal "
				linea1Color="$linea1Color $variacionesMarco$guionesfinal$NC$CReloj "
			fi
			linea2BN="$linea2BN/$espaciosfinalIni "
		done
	fi

#EN-23960-
	cuadrante=3
#EN-23970-
	if [[ $posSobrante -ge $cuadrante || $posSobrante -eq 0 ]]; then
#EN-23980-
	else
#EN-23990-
	fi
#EN-24000-
#EN-24010-
#EN-24020-
	if [[ $varUsado -eq $posCentroIzReal ]]; then 
#EN-24030-
	fi
	if [[ $varFallo -eq $posCentroIzReal ]]; then 
#EN-24040-
	fi
	if [[ $varSiguiente -eq $posCentroIzReal ]]; then 
#EN-24050-
	fi
#EN-24060-
	if [[ ${memoria[$procFinalizadoOEjecutando]} -gt 3 ]]; then
		if [[ ${paginasEnMemoriaProceso[$posCentroIzReal]} -ge 0 ]]; then
			datoM=""
			if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-24070-
#EN-24080-
			fi
			dato1="${paginasEnMemoriaProceso[$posCentroIzReal]}$datoM"
#EN-24090-
			espaciosfinal="${varhuecos:1:$TamNum}"
			linea3BN="$linea3BN$espaciosfinal$dato1 ─"
			linea3Color="$linea3Color$espaciosfinal$variacionesMarco$dato1$NC$CReloj ─"
		else
			linea3BN="$linea3BN$guionesfinal ─"
			linea3Color="$linea3Color$variacionesMarco$guionesfinal$NC$CReloj ─"
		fi
	fi
#EN-24100-
	if [[ ${memoria[$procFinalizadoOEjecutando]} -le 3 ]]; then
		espaciosIntermedios="${varhuecos:1:$TamNum}"
	else
		if [[ $numMarcosOblicuos -gt 0 ]]; then
#EN-24110-
		fi
		espaciosIntermedios="${varhuecos:1:$TamNum}"
	fi
#EN-24120-
#EN-24130-
	cuadrante=1
#EN-24140-
	if [[ $posSobrante -ge $cuadrante || $posSobrante -eq 0 ]]; then
#EN-24150-
	else
#EN-24160-
	fi
	if [[ ${memoria[$procFinalizadoOEjecutando]} -ge 2 ]]; then
#EN-24170-
#EN-24180-
#EN-24190-
		if [[ $varUsado -eq $posCentroDeReal ]]; then 
#EN-24200-
		fi
		if [[ $varFallo -eq $posCentroDeReal ]]; then 
#EN-24210-
		fi
		if [[ $varSiguiente -eq $posCentroDeReal ]]; then 
#EN-24220-
		fi
#EN-24230-
		if [[ ${paginasEnMemoriaProceso[$posCentroDeReal]} -ge 0 ]]; then
			datoM=""
			if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-24240-
#EN-24250-
			fi
			dato1="${paginasEnMemoriaProceso[$posCentroDeReal]}$datoM"
#EN-24260-
			espaciosfinal="${varhuecos:1:$TamNum}"
			linea3BN="$linea3BN─ $dato1$espaciosfinal"
			linea3Color="$linea3Color─ $variacionesMarco$dato1$NC$CReloj$espaciosfinal"
		else
			linea3BN="$linea3BN─ $guionesfinal"
			linea3Color="$linea3Color─ $variacionesMarco$guionesfinal$NC$CReloj"
		fi
	fi

#EN-24270-
	cuadrante=3
#EN-24280-
	if [[ ${memoria[$procFinalizadoOEjecutando]} -gt 3 ]]; then
#EN-24290-
#EN-24300-
			if [[ $posAbIzCalculado -le $posAbIzFinal ]]; then
				for ((ii=$posAbIzFinal; ii>=$posAbIzCalculado; ii--)); do
					counter1=$(($posAbIzFinal - $ii)) 
					posAbIzReal=$(($posCentroIzReal - 1 - $counter1))
#EN-24310-
#EN-24320-
#EN-24330-
					if [[ $varUsado -eq $posAbIzReal ]]; then 
#EN-24340-
					fi
					if [[ $varFallo -eq $posAbIzReal ]]; then 
#EN-24350-
					fi
					if [[ $varSiguiente -eq $posAbIzReal ]]; then 
#EN-24360-
					fi
#EN-24370-
					if [[ ${paginasEnMemoriaProceso[$posAbIzReal]} -ne -1 && ${memoria[$procFinalizadoOEjecutando]} -gt $posAbIzReal ]]; then
						if [[ $ii -ne $posAbIzCalculado ]]; then
							datoM=""
							if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-24380-
#EN-24390-
							fi
							dato1="${paginasEnMemoriaProceso[$posAbIzReal]}$datoM"
#EN-24400-
							espaciosfinal="${varhuecos:1:$TamNum}"
							linea4BN="$linea4BN $espaciosfinalIni/"
							linea5BN="$linea5BN $espaciosfinal$dato1 "
							linea5Color="$linea5Color $espaciosfinal$variacionesMarco$dato1$NC$CReloj "
						elif [[ $ii -eq $posAbIzCalculado ]] && [[ $cuadrante -le $posSobrante || $posSobrante -eq 0 ]]; then
							datoM=""
							if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-24410-
#EN-24420-
							fi
							dato1="${paginasEnMemoriaProceso[$posAbIzReal]}$datoM$NC"
#EN-24430-
							espaciosfinal="${varhuecos:1:$TamNum}"
							linea4BN="$linea4BN $espaciosfinalIni/"
							linea5BN="$linea5BN $espaciosfinal$dato1 "
							linea5Color="$linea5Color $espaciosfinal$variacionesMarco$dato1$NC$CReloj "
						elif [[ $ii -eq $posAbIzCalculado && $cuadrante -gt $posSobrante ]]; then
							TamNum=$longCampoDatosReloj
							espaciosfinal="${varasteriscos:1:$TamNum}"
							linea4BN="$linea4BN $espaciosfinalIni "
							linea5BN="$linea5BN $espaciosfinal "
							linea5Color="$linea5Color $espaciosfinal "
						fi
					elif [[ ${paginasEnMemoriaProceso[$posAbIzReal]} -eq -1 && ${memoria[$procFinalizadoOEjecutando]} -gt $posAbIzReal ]]; then
						if [[ $ii -ne $posAbIzCalculado ]]; then
							linea4BN="$linea4BN $espaciosfinalIni/"
							linea5BN="$linea5BN $guionesfinal "
							linea5Color="$linea5Color $variacionesMarco$guionesfinal$NC$CReloj "
						elif [[ $ii -eq $posAbIzCalculado ]] && [[ $cuadrante -le $posSobrante || $posSobrante -eq 0 ]]; then
							linea4BN="$linea4BN $espaciosfinalIni/"
							linea5BN="$linea5BN $guionesfinal "
							linea5Color="$linea5Color $variacionesMarco$guionesfinal$NC$CReloj "
						elif [[ $ii -eq $posAbIzCalculado && $cuadrante -gt $posSobrante ]]; then
							TamNum=$longCampoDatosReloj
							espaciosfinal="${varasteriscos:1:$TamNum}"
							linea4BN="$linea4BN $espaciosfinalIni "
							linea5BN="$linea5BN $espaciosfinal "
							linea5Color="$linea5Color $espaciosfinal "
						fi
					fi
				done
			else
				linea4BN="$linea4BN $espaciosfinalIni "
				linea5BN="$linea5BN $espaciosfinalIni " 
				linea5Color="$linea5Color $espaciosfinalIni " 
			fi
		else
			linea4BN="$linea4BN $espaciosfinalIni "
			linea5BN="$linea5BN $espaciosfinalIni " 
			linea5Color="$linea5Color $espaciosfinalIni " 
		fi
	fi
	cuadrante=2
#EN-24440-
	if [[ $posSobrante -ge $cuadrante || $posSobrante -eq 0 ]]; then
#EN-24450-
	else
#EN-24460-
	fi
#EN-24470-
#EN-24480-
#EN-24490-
	if [[ $varUsado -eq $posAbCentroReal ]]; then 
#EN-24500-
	fi
	if [[ $varFallo -eq $posAbCentroReal ]]; then 
#EN-24510-
	fi
	if [[ $varSiguiente -eq $posAbCentroReal ]]; then 
#EN-24520-
	fi
#EN-24530-
	if [[ ${memoria[$procFinalizadoOEjecutando]} -ge 3 ]]; then
		if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-24540-
#EN-24550-
			dato1=" ${paginasEnMemoriaProceso[$posAbCentroReal]}$datoM"
			TamNum=$(($longCampoDatosReloj - ${#dato1})) #Espacios para tener el número centrado 
			espaciosfinal="${varhuecos:1:$TamNum}"
			if [[ ${paginasEnMemoriaProceso[$posAbCentroReal]} -ge 0 ]]; then
				linea4BN="$linea4BN $espaciosLineasMitad|$espaciosLineasMitad"
				linea5BN="$linea5BN$dato1$espaciosfinal"
				linea5Color="$linea5Color$variacionesMarco$dato1$NC$CReloj$espaciosfinal"
			else
				linea4BN="$linea4BN $espaciosLineasMitad|$espaciosLineasMitad"
				linea5BN="$linea5BN$guionesfinal"
				linea5Color="$linea5Color$variacionesMarco$guionesfinal$NC$CReloj"
			fi
		else
			dato1="${paginasEnMemoriaProceso[$posAbCentroReal]}"
			TamNum=$(($longCampoDatosReloj - ${#espaciosLineasMitad} - ${#dato1})) #Espacios para tener el número centrado 
			espaciosfinal="${varhuecos:1:$TamNum}"
			if [[ ${paginasEnMemoriaProceso[$posAbCentroReal]} -ge 0 ]]; then
				linea4BN="$linea4BN$espaciosLineasMitad|$espaciosLineasMitad"
				linea5BN="$linea5BN$dato1$espaciosfinal"
				linea5Color="$linea5Color$variacionesMarco$dato1$NC$CReloj$espaciosfinal"
			else
				linea4BN="$linea4BN$espaciosLineasMitad|$espaciosLineasMitad"
				linea5BN="$linea5BN$guionesfinal"
				linea5Color="$linea5Color$variacionesMarco$guionesfinal$NC$CReloj"
			fi
		fi
	fi
	cuadrante=2
#EN-24560-
	if [[ ${memoria[$procFinalizadoOEjecutando]} -gt 4 ]]; then
#EN-24570-
#EN-24580-
			if [[ $posAbDeCalculado -le $posAbDeFinal ]]; then
#EN-24590-
#EN-24600-
					posAbDeReal=$(($posCentroDeReal + 1 + $counter1))
#EN-24610-
#EN-24620-
#EN-24630-
					if [[ $varUsado -eq $posAbDeReal ]]; then 
#EN-24640-
					fi
					if [[ $varFallo -eq $posAbDeReal ]]; then 
#EN-24650-
					fi
					if [[ $varSiguiente -eq $posAbDeReal ]]; then 
#EN-24660-
					fi
#EN-24670-
					if [[ ${memoria[$procFinalizadoOEjecutando]} -gt $posAbDeReal ]]; then
						if [[ ${paginasEnMemoriaProceso[$posAbDeReal]} -ne -1 && ${memoria[$procFinalizadoOEjecutando]} -gt $posAbDeReal ]]; then
							if [[ $ii -ne $posAbDeFinal ]]; then
								datoM=""
								if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-24680-
#EN-24690-
								fi
								dato1="${paginasEnMemoriaProceso[$posAbDeReal]}$datoM"
								TamNum=$(($longCampoDatosReloj - ${#dato1})) #Espacios laterales 
								espaciosfinal="${varhuecos:1:$TamNum}"
								linea4BN="$linea4BN\\$espaciosfinalIni "
								linea5BN="$linea5BN $dato1$espaciosfinal "
								linea5Color="$linea5Color $variacionesMarco$dato1$NC$CReloj$espaciosfinal "
							elif [[ $ii -eq $posAbDeFinal ]] && [[ $cuadrante -le $posSobrante || $posSobrante -eq 0 ]]; then
								datoM=""
								if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
#EN-24700-
#EN-24710-
								fi
								dato1="${paginasEnMemoriaProceso[$posAbDeReal]}$datoM"
								TamNum=$(($longCampoDatosReloj - ${#dato1})) #Espacios laterales 
								espaciosfinal="${varhuecos:1:$TamNum}"
								linea4BN="$linea4BN\\$espaciosfinalIni "
								linea5BN="$linea5BN $dato1$espaciosfinal "
								linea5Color="$linea5Color $variacionesMarco$dato1$NC$CReloj$espaciosfinal "
							elif [[ $ii -eq $posAbDeFinal && $cuadrante -gt $posSobrante ]]; then
								TamNum=$longCampoDatosReloj
								espaciosfinal="${varasteriscos:1:$TamNum}"
								linea4BN="$linea4BN $espaciosfinalIni "
								linea5BN="$linea5BN $espaciosfinal "
								linea5Color="$linea5Color $espaciosfinal "
							fi
						elif [[ ${paginasEnMemoriaProceso[$posAbDeReal]} -eq -1 ]]; then
							if [[ $ii -ne $posAbDeFinal ]]; then
								linea4BN="$linea4BN\\$espaciosfinalIni "
								linea5BN="$linea5BN $guionesfinal "
								linea5Color="$linea5Color $variacionesMarco$guionesfinal$NC$CReloj "
							elif [[ $ii -eq $posAbDeFinal ]] && [[ $cuadrante -le $posSobrante || $posSobrante -eq 0 ]]; then
								linea4BN="$linea4BN\\$espaciosfinalIni "
								linea5BN="$linea5BN $guionesfinal "
								linea5Color="$linea5Color $variacionesMarco$guionesfinal$NC$CReloj "
							elif [[ $ii -eq $posAbDeFinal && $cuadrante -gt $posSobrante ]]; then
								TamNum=$longCampoDatosReloj
								espaciosfinal="${varasteriscos:1:$TamNum}"
								linea4BN="$linea4BN $espaciosfinalIni "
								linea5BN="$linea5BN $espaciosfinal "
								linea5Color="$linea5Color $espaciosfinal "
							fi
						fi
					fi
				done
			fi
		fi
	else
		linea4BN="$linea4BN $espaciosfinalIni "
		linea5BN="$linea5BN $espaciosfinalIni " 
		linea5Color="$linea5Color $espaciosfinalIni " 
	fi

#EN-24720-
	echo -e "$NC$filaAlgPagFrecUsoRecTituloBN" | tee -a $informeConColorTotal $informeSinColorTotal
	echo -e "$NC$filaAlgPagFrecUsoRecNotas1BN" | tee -a $informeConColorTotal $informeSinColorTotal
	echo -e "$NC$filaAlgPagFrecUsoRecNotas2BN" | tee -a $informeConColorTotal $informeSinColorTotal
	echo -e "${coloress[$procFinalizadoOEjecutando % 6]}$linea1Color$NC" | tee -a $informeConColorTotal
	echo -e "${coloress[$procFinalizadoOEjecutando % 6]}$linea2BN$NC" | tee -a $informeConColorTotal
	echo -e "${coloress[$procFinalizadoOEjecutando % 6]}$linea3Color$NC" | tee -a $informeConColorTotal
	echo -e "${coloress[$procFinalizadoOEjecutando % 6]}$linea4BN$NC" | tee -a $informeConColorTotal
	echo -e "${coloress[$procFinalizadoOEjecutando % 6]}$linea5Color$NC" | tee -a $informeConColorTotal
	echo -e "$linea1BN" >> $informeSinColorTotal
	echo -e "$linea2BN" >> $informeSinColorTotal
	echo -e "$linea3BN" >> $informeSinColorTotal
	echo -e "$linea4BN" >> $informeSinColorTotal
	echo -e "$linea5BN" >> $informeSinColorTotal

#EN-24730-

####################################################################################
#EN-24740-
####################################################################################
function calcularSobrantes {
	sobrantes=0
	if [[ $1 -eq "1" ]]; then
		sobrantes=1
	elif [[ $1 -eq "2" ]]; then
		sobrantes=2
	elif [[ $1 -eq "3" ]]; then
		sobrantes=3
	elif [[ $1 -eq "4" ]]; then
		sobrantes=4
	fi
}

####################################################################################
####################################################################################
# Funciones para la entrada de datos ###############################################
####################################################################################
#EN-24750-
####################################################################################
function entradaMemoriaTeclado {
#EN-24760-
	echo -ne "$cian Introduzca el número de marcos de memoria del sistema:  $NC" | tee -a $informeConColorTotal  
	echo " Introduzca el número de marcos de memoria del sistema:"  >> $informeSinColorTotal
	read mem_num_marcos
	echo $mem_num_marcos >> $informeConColorTotal
	echo $mem_num_marcos >> $informeSinColorTotal
	until [[ $mem_num_marcos -gt 0 ]] ; do 
		echo -e "$rojo Entrada no válida, el número de marcos de memoria no puede ser menor o igual a 0.$NC" | tee -a $informeConColorTotal 
		echo -ne " Introduzca un$verde número de marcos de memoria correcto:  $NC" | tee -a $informeConColorTotal 
		echo -e " Entrada no válida, el número de marcos de memoria no puede ser menor o igual a 0." >> $informeSinColorTotal
		echo -e " Introduzca un número de marcos de memoria correcto:  " >> $informeSinColorTotal
		read mem_num_marcos
		echo $mem_num_marcos >> $informeConColorTotal
		echo $mem_num_marcos >> $informeSinColorTotal
	done
	while ! es_entero $mem_num_marcos ; do
		echo -e "$rojo Entrada no válida, el número de marcos de memoria no puede ser menor o igual a 0.$NC" | tee -a $informeConColorTotal 
		echo -ne " Introduzca un$verde número de marcos de memoria correcto:  $NC" | tee -a $informeConColorTotal 
		echo -e " Entrada no válida, el número de marcos de memoria no puede ser menor o igual a 0." >> $informeSinColorTotal
		echo -e " Introduzca un número de marcos de memoria correcto:  " >> $informeSinColorTotal
		read mem_num_marcos
		echo $mem_num_marcos >> $informeConColorTotal
		echo $mem_num_marcos >> $informeSinColorTotal
	done
#EN-24770-
	echo -ne "$cian Introduzca el número de direcciones de cada marco de memoria del sistema:  $NC" | tee -a $informeConColorTotal  
	echo " Introduzca el número de direcciones de cada marco de memoria del sistema:"  >> $informeSinColorTotal
	read mem_direcciones
	echo $mem_direcciones >> $informeConColorTotal
	echo $mem_direcciones >> $informeSinColorTotal
	until [[ $mem_direcciones -gt 0 ]] ; do 
		echo -e "$rojo Entrada no válida, el número de direcciones de cada marco de memoria no puede ser menor o igual a 0.$NC" | tee -a $informeConColorTotal 
		echo -ne " Introduzca un$verde número de direcciones de cada marco de memoria correcto:  $NC" | tee -a $informeConColorTotal 
		echo -e " Entrada no válida, el número de direcciones de cada marco de memoria no puede ser menor o igual a 0." >> $informeSinColorTotal
		echo -e " Introduzca un número de direcciones de cada marco de memoria correcto:  " >> $informeSinColorTotal
		read mem_direcciones
		echo $mem_direcciones >> $informeConColorTotal
		echo $mem_direcciones >> $informeSinColorTotal
	done
	while ! es_entero $mem_direcciones ; do
		echo -e "$rojo Entrada no válida, el número de direcciones de cada marco de memoria no puede ser menor o igual a 0.$NC" | tee -a $informeConColorTotal 
		echo -ne " Introduzca un$verde número de direcciones de cada marco de memoria correcto:  $NC" | tee -a $informeConColorTotal 
		echo -e " Entrada no válida, el número de direcciones de cada marco de memoria no puede ser menor o igual a 0." >> $informeSinColorTotal
		echo -e " Introduzca un número de direcciones de cada marco de memoria correcto:  " >> $informeSinColorTotal
		read mem_direcciones
		echo $mem_direcciones >> $informeConColorTotal
		echo $mem_direcciones >> $informeSinColorTotal
	done

#EN-24780-
	echo -ne "$cian Introduzca el mínimo del rango de prioridades de los procesos:  $NC" | tee -a $informeConColorTotal  
	echo " Introduzca el mínimo del rango de prioridades de los procesos:"  >> $informeSinColorTotal
	read PriomInicial
	echo $PriomInicial >> $informeConColorTotal
	echo $PriomInicial >> $informeSinColorTotal
	echo -ne "$cian Introduzca el máximo del rango de prioridades de los procesos:  $NC" | tee -a $informeConColorTotal  
	echo " Introduzca el máximo del rango de prioridades de los procesos:"  >> $informeSinColorTotal
	read PrioMInicial
	echo $PrioMInicial >> $informeConColorTotal
	echo $PrioMInicial >> $informeSinColorTotal
#EN-24790-
#EN-24800-
	prio_mayor=$PrioMFinal

#EN-24810-
	echo -ne "$cian Introduzca el quantum de Round-Robin:  $NC" | tee -a $informeConColorTotal  
	echo " Introduzca el quantum de Round-Robin:"  >> $informeSinColorTotal
	read quantum
	echo $quantum >> $informeConColorTotal
	echo $quantum >> $informeSinColorTotal
	until [[ $quantum -gt 0 ]] ; do 
		echo -e "$rojo Entrada no válida, el quantum de Round-Robin no puede ser menor o igual a 0.$NC" | tee -a $informeConColorTotal 
		echo -ne " Introduzca un$verde quantum de Round-Robin correcto:  $NC" | tee -a $informeConColorTotal 
		echo -e " Entrada no válida, el quantum de Round-Robin no puede ser menor o igual a 0." >> $informeSinColorTotal
		echo -e " Introduzca un quantum de Round-Robin correcto:  " >> $informeSinColorTotal
		read quantum
		echo $quantum >> $informeConColorTotal
		echo $quantum >> $informeSinColorTotal
	done
	while ! es_entero $quantum ; do
		echo -e "$rojo Entrada no válida, el quantum de Round-Robin no puede ser menor o igual a 0.$NC" | tee -a $informeConColorTotal 
		echo -ne " Introduzca un$verde quantum de Round-Robin correcto:  $NC" | tee -a $informeConColorTotal 
		echo -e " Entrada no válida, el quantum de Round-Robin no puede ser menor o igual a 0." >> $informeSinColorTotal
		echo -e " Introduzca un quantum de Round-Robin correcto:  " >> $informeSinColorTotal
		read quantum
		echo $quantum >> $informeConColorTotal
		echo $quantum >> $informeSinColorTotal
	done

#EN-24820-
#EN-24830-
#EN-24840-
#EN-24850-
		echo -ne "$cian Introduzca el tamaño maximo de memoria para que haya reubicacion:  $NC" | tee -a $informeConColorTotal  
		echo " Introduzca el tamaño maximo de memoria para que haya reubicacion:"  >> $informeSinColorTotal
		read reub
		echo $reub >> $informeConColorTotal
		echo $reub >> $informeSinColorTotal
		until [[ $reub -gt 0 && $reub -lt $mem_num_marcos ]] ; do 
			echo -e "$rojo Entrada no válida, el tamaño mínimo de reubicación no puede ser 0.$NC" | tee -a $informeConColorTotal 
			echo -ne " Introduzca un$verde tamaño correcto:  $NC" | tee -a $informeConColorTotal 
			echo -e " Entrada no válida, el tamaño mínimo de reubicación no puede ser 0." >> $informeSinColorTotal
			echo -e " Introduzca un tamaño correcto:  " >> $informeSinColorTotal
			read reub
			echo $reub >> $informeConColorTotal
			echo $reub >> $informeSinColorTotal
		done

		while ! es_entero $reub ; do
			echo -e "$rojo Entrada no válida, el tamaño mínimo de reubicación no puede ser negativo.$NC" | tee -a $informeConColorTotal 
			echo -ne " Introduzca un$verde tamaño correcto:  $NC" | tee -a $informeConColorTotal 
			echo -e " Entrada no válida, el tamaño mínimo de reubicación no puede ser negativo." >> $informeSinColorTotal
			echo -e " Introduzca un tamaño correcto:  " >> $informeSinColorTotal
			read reub
			echo $reub >> $informeConColorTotal
			echo $reub >> $informeSinColorTotal
		done
	else
		reub=1
		echo $reub >> $informeConColorTotal
		echo $reub >> $informeSinColorTotal
	fi
	
#EN-24860-
#EN-24870-
	variableReubicar=$reub

#EN-24880-
	echo ""
#EN-24890-
#EN-24900-
#EN-24910-
#EN-24920-
#EN-24930-

####################################################################################
#EN-24940-
####################################################################################
function entradaProcesosTeclado {
#EN-24950-
	masprocesos="s"
#EN-24960-
	while [[ $masprocesos == "s" ]]; do 
#EN-24970-
#EN-24980-
#EN-24990-
#EN-25000-
		echo -ne $NORMAL"\n Tiempo de llegada del proceso $p: " >> $informeSinColorTotal
		read llegada[$p]
		until [[ ${llegada[$p]} -ge 0 ]]; do
			echo $NORMAL" No se pueden introducir tiempos de llegada negativos" | tee -a $informeConColorTotal
			echo $NORMAL" No se pueden introducir tiempos de llegada negativos" >>$informeSinColorTotal
			echo -ne $NORMAL" Introduce un nuevo tiempo de llegada\n" | tee -a $informeConColorTotal
			echo -ne $NORMAL" Introduce un nuevo tiempo de llegada\n" >> $informeSinColorTotal
			read llegada[$p]
		done
				
#EN-25010-
		echo -ne $NORMAL"\n Número de marcos de memoria asociados al proceso $p: " >>$informeSinColorTotal
		read memoria[$p]
		while [[ ${memoria[$p]} -le 0 || ${memoria[$p]} -gt $mem_num_marcos ]]; do
			echo $NORMAL" No se pueden introducir memoria negativa o superior a la memoria total" | tee -a $informeConColorTotal
			echo $NORMAL" No se pueden introducir memoria negativa o superior a la memoria total" >>$informeSinColorTotal
			echo -ne $NORMAL" Introduce un nuevo número de marcos de memoria\n" | tee -a $informeConColorTotal
			echo -ne $NORMAL" Introduce un nuevo número de marcos de memoria\n" >>$informeSinColorTotal
			read memoria[$p] 
		done

		if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 4 ]]; then
#EN-25020-
			echo -ne $NORMAL"\n Prioridad asociada asociados al proceso $p: " >>$informeSinColorTotal
			read prioProc[$p]
			while [[ ${prioProc[$p]} -le $PriomFinal || ${prioProc[$p]} -gt $PrioMFinal ]]; do
				echo $NORMAL" No se pueden introducir una prioridad fuera de los límites inferior y superior de la Prioridad del problema" | tee -a $informeConColorTotal
				echo $NORMAL" No se pueden introducir una prioridad fuera de los límites inferior y superior de la Prioridad del problema" >>$informeSinColorTotal
				echo -ne $NORMAL" Introduce una nueva prioridad\n" | tee -a $informeConColorTotal
				echo -ne $NORMAL" Introduce una nueva prioridad\n" >>$informeSinColorTotal
				read prioProc[$p] 
			done
		fi

		ejecucion[$p]=0
#EN-25030-
		paginasTeclado=""
		varPaginasTeclado=""
#EN-25040-
			echo -e "\n Escribe la dirección $numOrdinalPagTeclado (si introduces una n acabará la introducción de direcciones)\n\n  --> " | tee -a $informeConColorTotal $informeSinColorTotal
			read paginasTeclado
			if [[ $paginasTeclado != "n" ]]; then
				directions[$p,$numOrdinalPagTeclado]=$paginasTeclado
				if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then
					numDireccionesTotales=$(($mem_num_marcos * $mem_direcciones))
					numDireccionesProceso=$((${memoria[$p]} * $mem_direcciones))
					until [[ ${directions[$p,$numOrdinalPagTeclado]} =~ [0-9] && ${directions[$p,$numOrdinalPagTeclado]} -ge 0 && ${directions[$p,$numOrdinalPagTeclado]} -le $(($numDireccionesTotales - 1)) ]]; do
						echo -e "\n$ROJO Debes introducir un número de dirección igual o superior a 0 e inferior al número total de direcciones definibles para cada proceso: $NC"$(($numDireccionesProceso - 1))
						read -p " Introduce de nuevo la dirección $numOrdinalPagTeclado: " directions[$p,$numOrdinalPagTeclado]
					done
				else
					until [[ ${directions[$p,$numOrdinalPagTeclado]} =~ [0-9] && ${directions[$p,$numOrdinalPagTeclado]} -ge 0 ]]; do
						echo -e "\n$ROJO Debes introducir un número de dirección igual o superior a 0$NC"
						read -p " Introduce de nuevo la dirección $numOrdinalPagTeclado: " directions[$p,$numOrdinalPagTeclado]
					done
				fi
#EN-25050-
#EN-25060-
				varPaginasTeclado=$varPaginasTeclado"$paginasTeclado "
				paginasDefinidasTotal[$p,$numOrdinalPagTeclado]=${pagTransformadas[$numOrdinalPagTeclado]} 
				ejecucion[$p]=$(expr ${ejecucion[$p]} + 1)
#EN-25070-
				numOrdinalPagTeclado=$(expr $numOrdinalPagTeclado + 1)
			fi
		done

#EN-25080-
		echo ""
#EN-25090-
#EN-25100-
#EN-25110-

		echo -e $NORMAL"\n\n Ref Tll Tej nMar Dir-Pag" | tee -a $informeConColorTotal
		echo -e "\n\n Ref Tll Tej nMar Dir-Pag" >> $informeSinColorTotal
#EN-25120-
		echo -e "\n" | tee -a $informeConColorTotal
		echo -e "\n" >> $informeSinColorTotal
		echo -ne $NORMAL"\n ¿Quieres más procesos? s/n " | tee -a $informeConColorTotal
		echo -ne "\n ¿Quieres más procesos? s/n " >>$informeSinColorTotal
		read masprocesos
		echo "$masprocesos" >>$informeConColorTotal
		echo "$masprocesos" >>$informeSinColorTotal
		until [[ $masprocesos == "s" || $masprocesos == "n" ]]; do
			echo -ne "\n Escribe 's' o 'n', por favor: " | tee -a $informeConColorTotal
			echo -ne "\n Escribe 's' o 'n', por favor: " >>$informeSinColorTotal
			read masprocesos
			echo "$masprocesos" >>$informeConColorTotal
			echo "$masprocesos" >>$informeSinColorTotal
		done
#EN-25130-
	done
#EN-25140-
		cp $ficheroDatosDefault $ficheroDatosAnteriorEjecucion
	else
		cp $nomFicheroDatos $ficheroDatosAnteriorEjecucion
	fi
#EN-25150-

####################################################################################
#EN-25160-
####################################################################################
function imprimeprocesos {
#EN-25170-
	for (( counter = 0; counter <= numprocesos; counter++ )); do
		if [[ $counter -gt 8 ]]; then
			let colorjastag[counter]=counter-8;
		else
			let colorjastag[counter]=counter+1;
		fi
	done
	echo -e "\n Ref Tll Tej nMar Dirección-Página ------ imprimeprocesos\n" | tee -a $informeConColorTotal $informeSinColorTotal
#EN-25180-
	echo "" | tee -a $informeConColorTotal $informeSinColorTotal > /dev/null
	echo "|—————————————————————————————————————————————————————————————————————————|" | tee -a $informeConColorTotal $informeSinColorTotal > /dev/null
	echo "" | tee -a $informeConColorTotal $informeSinColorTotal > /dev/null
	echo "" | tee -a $informeConColorTotal $informeSinColorTotal > /dev/null
#EN-25190-

####################################################################################
#EN-25200-
####################################################################################
function entradaProcesosTecladoDatosPantalla { 
	multiplicador=0
	counter2=0
	counter3=0	
	for ((counter = 0; counter <= ${#llegada[@]}; counter++)); do #Define los colores de los procesos de forma cíclica. 
#EN-25210-
			multiplicador=$multiplicador+1
#EN-25220-
		fi
		counter2=$counter-$counter3;
		let colorjastag[counter]=$counter2+1;
	done
#EN-25230-
		echo -ne " ${coloress[$t % 6]}${proceso[$t]}" | tee -a $informeConColorTotal
		echo -n " ${proceso[$t]}" >>$informeSinColorTotal
#EN-25240-
		echo -ne "${varhuecos:1:$longitudLlegada}""${coloress[$t % 6]}${llegada[$t]}" | tee -a $informeConColorTotal 
		echo -n "${varhuecos:1:$longitudLlegada}""${llegada[$t]}" >>$informeSinColorTotal
#EN-25250-
		echo -ne "${varhuecos:1:$longitudTiempo}""${coloress[$t % 6]}${ejecucion[$t]}" | tee -a $informeConColorTotal 
		echo -n "${varhuecos:1:$longitudTiempo}""${ejecucion[$t]}" >>$informeSinColorTotal            
#EN-25260-
		echo -ne "${varhuecos:1:$longitudMemoria}""${coloress[$t % 6]}${memoria[$t]}" | tee -a $informeConColorTotal 
		echo -ne "${varhuecos:1:$longitudMemoria}""${memoria[$t]}" >>$informeSinColorTotal
 		DireccionesPaginasPorProceso=""
 		for ((counter2=0;counter2<${ejecucion[$t]};counter2++)); do
			DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${varC[$t]}${directions[$t,$counter2]}-${paginasDefinidasTotal[$t,$counter2]}"
		done
		echo -e "$DireccionesPaginasPorProceso" | tee -a $informeConColorTotal
	done
#EN-25270-

#####################################################################################
#EN-25280-
####################################################################################
function ordenarDatosEntradaFicheros {
#EN-25290-
#EN-25300-
	done
#EN-25310-
		if [[ $j -ge 9 ]]; then
			proceso[$j]=$(echo P$(($j + 1)))
		else
			proceso[$j]=$(echo P0$(($j + 1)))
		fi
	done
#EN-25320-
		for (( i = 0; i < $j; i++ )); do
			if [[ $((llegada[$i])) -gt $((llegada[$(($i + 1))])) ]]; then
#EN-25330-
				proceso[$(($i + 1))]=${proceso[$i]} 
				proceso[$i]=$aux
				aux=${llegada[$(($i + 1))]}
				llegada[$(($i + 1))]=${llegada[$i]}
				llegada[$i]=$aux
#EN-25340-
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${paginasDefinidasTotal[$(($i + 1)),$counter2]}
				done
#EN-25350-
					unset paginasDefinidasTotal[$(($i + 1)),$counter2]
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					paginasDefinidasTotal[$(($i + 1)),$counter2]=${paginasDefinidasTotal[$i,$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					unset paginasDefinidasTotal[$i,$counter2]
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					paginasDefinidasTotal[$i,$counter2]=${aux2[$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					unset aux2[$counter2]
				done

#EN-25360-
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${directions[$(($i + 1)),$counter2]}
				done
#EN-25370-
					unset directions[$(($i + 1)),$counter2]
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					directions[$(($i + 1)),$counter2]=${directions[$i,$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					unset directions[$i,$counter2]
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					directions[$i,$counter2]=${aux2[$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					unset aux2[$counter2]
				done

#EN-25380-
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${directions_AlgPagFrecUsoRec_pagina_modificada[$(($i + 1)),$counter2,0]}
				done
#EN-25390-
					unset directions_AlgPagFrecUsoRec_pagina_modificada[$(($i + 1)),$counter2,0]
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					directions_AlgPagFrecUsoRec_pagina_modificada[$(($i + 1)),$counter2,0]=${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				done
				for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
					unset directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]=${aux2[$counter2,0]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					unset aux2[$counter2]
				done

				aux=${ejecucion[$(($i + 1))]}
				ejecucion[$(($i + 1))]=${ejecucion[$i]} 
				ejecucion[$i]=$aux
				aux=${tiempoEjecucion[$(($i + 1))]}
#EN-25400-
				tiempoEjecucion[$i]=$aux
				aux=${memoria[$(($i + 1))]}
				memoria[$(($i + 1))]=${memoria[$i]} 
				memoria[$i]=$aux
				aux=${prioProc[$(($i + 1))]}
#EN-25410-
				prioProc[$i]=$aux
			fi
		done
	done
#EN-25420-
#EN-25430-
	done
#EN-25440-

####################################################################################
#EN-25450-
####################################################################################
function entradaMemoriaRangosFichero_op_cuatro_Previo {
#EN-25460-
#EN-25470-
#EN-25480-
#EN-25490-

####################################################################################
#EN-25500-
#EN-25510-
####################################################################################
function entradaMemoriaRangosFichero_op_cuatro { 
#EN-25520-
#EN-25530-
	calcDatoAleatorioGeneral $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS
#EN-25540-
#EN-25550-
	calcDatoAleatorioGeneral $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
	mem_direcciones=$datoAleatorioGeneral
#EN-25560-

#EN-25570-
	MIN_RANGE_prio_menorInicial=${prio_menor_min}
	MAX_RANGE_prio_menorInicial=${prio_menor_max}
#EN-25580-
	MIN_RANGE_prio_menor=$PriomFinal
	MAX_RANGE_prio_menor=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_prio_menor $MAX_RANGE_prio_menor
	prio_menorInicial=$datoAleatorioGeneral
#EN-25590-
	MIN_RANGE_prio_mayorInicial=${prio_mayor_min}
	MAX_RANGE_prio_mayorInicial=${prio_mayor_max}
#EN-25600-
	MIN_RANGE_prio_mayor=$PriomFinal
	MAX_RANGE_prio_mayor=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_prio_mayor $MAX_RANGE_prio_mayor
	prio_mayorInicial=$datoAleatorioGeneral
	prio_menor_min=$prio_menor_minInicial
	prio_menor_max=$prio_menor_maxInicial
#EN-25610-
	prio_menor=$PriomFinal
	prio_mayor=$PrioMFinal
#EN-25620-
	calcDatoAleatorioGeneral $MIN_RANGE_REUB $MAX_RANGE_REUB
	reub=$datoAleatorioGeneral
#EN-25630-
	calcDatoAleatorioGeneral $MIN_RANGE_NPROC $MAX_RANGE_NPROC
	n_prog=$datoAleatorioGeneral
#EN-25640-
	datos_tiempo_llegada    
	datos_tiempo_ejecucion 
#EN-25650-
#    datos_tamano_marcos_procesos #Esta función no se usará como tampoco se usó datos_tamano_marcos_procesos_amplio(), dado que se usará como rango un subconjunto de [1,$mem_num_marcos] para que, si es posible, salgan valores significativamente menores al máximo.
	calcDatoAleatorioGeneral 1 $mem_num_marcos 
	MIN_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial 
	MAX_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
#EN-25660-
	MIN_RANGE_tamano_marcos_proc=$PriomFinal
	MAX_RANGE_tamano_marcos_proc=$PrioMFinal 
#EN-25670-
	datos_prio_proc
#EN-25680-
	datos_quantum         
	calcDatoAleatorioGeneral $MIN_RANGE_quantum $MAX_RANGE_quantum
	quantum=$datoAleatorioGeneral
#EN-25690-
	datos_tamano_direcciones_procesos          
#EN-25700-
#EN-25710-
	for (( p=0; p<$n_prog; p++)); do     
#EN-25720-
#EN-25730-
#EN-25740-
#EN-25750-
#EN-25760-

####################################################################################
#EN-25770-
#################################################################################### 
function entradaMemoriaRangosFichero_op_cuatro_Post_1 {
#EN-25780-
		echo -e "RangoMarcosMemoria $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS" > $nomFicheroRangos 
		echo -e "RangoDireccionesMarco $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES" >> $nomFicheroRangos 
		echo -e "RangoPrioMenor $MIN_RANGE_prio_menor $MAX_RANGE_prio_menor" >> $nomFicheroRangos 
		echo -e "RangoPrioMayor $MIN_RANGE_prio_mayor $MAX_RANGE_prio_mayor" >> $nomFicheroRangos 
		echo -e "RangoNumProc $MIN_RANGE_NPROC $MAX_RANGE_NPROC" >> $nomFicheroRangos 
		echo -e "RangoReubicar $MIN_RANGE_REUB $MAX_RANGE_REUB" >> $nomFicheroRangos 
		echo -e "RangoLlegada $MIN_RANGE_llegada $MAX_RANGE_llegada" >> $nomFicheroRangos 
		echo -e "RangoTEjecucion $MIN_RANGE_tiempo_ejec $MAX_RANGE_tiempo_ejec" >> $nomFicheroRangos 
		echo -e "RangoTamanoMarcosProc $MIN_RANGE_tamano_marcos_proc $MAX_RANGE_tamano_marcos_proc" >> $nomFicheroRangos
		echo -e "RangoPrioProc $MIN_RANGE_prio_proc $MAX_RANGE_prio_proc" >> $nomFicheroRangos
		echo -e "RangoTamanoDireccionesProc $MIN_RANGE_tamano_direcciones_proc $MAX_RANGE_tamano_direcciones_proc" >> $nomFicheroRangos
		echo -ne "RangoQuantum $MIN_RANGE_quantum $MAX_RANGE_quantum" >> $nomFicheroRangos
#EN-25790-
#EN-25800-
#EN-25810-
		PrioR="Mayor"
	else    
		PrioR="Menor"                
	fi              
#EN-25820-
		echo -ne "Marcos totales\n"$mem_num_marcos"\nTamano de pagina\n"$mem_direcciones"\nPrioridad menor\n"$prio_menorInicial\
		"\nPrioridad mayor\n"$prio_mayorInicial"\nTipo de prioridad\n"$PrioR"\nMinimo para reubicabilidad\n"$reub"\nQuantum\n"$quantum\
		"\nTll nMar Prio Direcciones/Modificado:\n" > $nomFicheroDatos
	fi                  

#EN-25830-
	MAX_RANGE_PAGINA_MODIFICADA=1
#EN-25840-
#EN-25850-
#EN-25860-
#EN-25870-
		direccionesAcumuladas+=`echo -ne " ${directions[$p,$numdir]}-${directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]}"`
	done
	echo -e ${llegada[$p]} ${memoria[$p]} ${prioProc[$p]} $direccionesAcumuladas >> $nomFicheroDatos
#EN-25880-
#EN-25890-

####################################################################################
#EN-25900-
####################################################################################
function entradaMemoriaRangosFichero_op_cuatro_Post_2 {
#EN-25910-
		rm $ficheroDatosAnteriorEjecucion
	fi
#EN-25920-
		rm $ficheroRangosAnteriorEjecucion
	fi
#EN-25930-
#EN-25940-
#EN-25950-

####################################################################################
#EN-25960-
####################################################################################
function entradaMemoriaRangosFichero_op_cinco_Previo {
#EN-25970-
#EN-25980-
#EN-25990-

####################################################################################
#EN-26000-
####################################################################################
function entradaMemoriaRangosFichero_op_seis_Previo {
#EN-26010-
#EN-26020-
	echo -e "\n\nFicheros existentes:\n$NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\nFicheros existentes:\n" >> $informeSinColorTotal 
	files=("./FRangos"/*)
#EN-26030-
		echo -e "$i) ${files[$i]}" | tee -a $informeConColorTotal
		echo -e "$i) ${files[$i]}" >> $informeSinColorTotal 
	done
	echo -ne "\n$AMARILLO\n\nIntroduce el número correspondiente al fichero elegido: $NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n\nIntroduce el número correspondiente al fichero elegido: " >> $informeSinColorTotal 
	read -r numeroFichero
#EN-26040-
		echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read -r numeroFichero
		echo -e "$numeroFichero\n\n" >> $informeConColorTotal
		echo -e "$numeroFichero\n\n" >> $informeSinColorTotal
	done
	echo "$numeroFichero" >> $informeConColorTotal
	echo "$numeroFichero" >> $informeSinColorTotal
	ficheroParaLectura="${files[$numeroFichero]}"
#EN-26050-
#EN-26060-

####################################################################################
#EN-26070-
#EN-26080-
####################################################################################
function entradaMemoriaRangosFichero_op_cinco_seis {
#EN-26090-
#EN-26100-
	MIN_RANGE_MARCOS=${memoria_min}
	MAX_RANGE_MARCOS=${memoria_max}
	calcDatoAleatorioGeneral $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS
	mem_num_marcos=$datoAleatorioGeneral
	MIN_RANGE_DIRECCIONES=${direcciones_min}
	MAX_RANGE_DIRECCIONES=${direcciones_max}
	calcDatoAleatorioGeneral $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
	mem_direcciones=$datoAleatorioGeneral
#EN-26110-

	MIN_RANGE_prio_menor=${prio_menor_min}
	MAX_RANGE_prio_menor=${prio_menor_max}
	calcDatoAleatorioGeneral $MIN_RANGE_prio_menor $MAX_RANGE_prio_menor
#EN-26120-
	MIN_RANGE_prio_mayor=${prio_mayor_min}
	MAX_RANGE_prio_mayor=${prio_mayor_max}
	calcDatoAleatorioGeneral $MIN_RANGE_prio_mayor $MAX_RANGE_prio_mayor
#EN-26130-
#EN-26140-
	PrioMInicial=$prio_mayorInicial
#EN-26150-
#EN-26160-
	prio_mayor=$PrioMFinal
	  
	MIN_RANGE_REUB=${reubicacion_min}
	MAX_RANGE_REUB=${reubicacion_max}
	calcDatoAleatorioGeneral $MIN_RANGE_REUB $MAX_RANGE_REUB
	reub=$datoAleatorioGeneral
	MIN_RANGE_NPROC=${programas_min}
	MAX_RANGE_NPROC=${programas_max}
	calcDatoAleatorioGeneral $MIN_RANGE_NPROC $MAX_RANGE_NPROC
	n_prog=$datoAleatorioGeneral
	MIN_RANGE_quantum=${quantum_min}
	MAX_RANGE_quantum=${quantum_max}
	calcDatoAleatorioGeneral $MIN_RANGE_quantum $MAX_RANGE_quantum
	quantum=$datoAleatorioGeneral
	#------------------------------------------------------ #El resto no se recalcula porque son datos de cada proceso, como tiempo_llegada, tamano_procesos,...
	MIN_RANGE_llegada=${llegada_min}
	MAX_RANGE_llegada=${llegada_max}
	MIN_RANGE_tiempo_ejec=${tiempo_ejec_min}
	MAX_RANGE_tiempo_ejec=${tiempo_ejec_max}
#EN-26170-
#EN-26180-
#EN-26190-
	tamano_marcos_proc_min=1
	tamano_marcos_proc_max=$mem_num_marcos
	calcDatoAleatorioGeneral 1 $mem_num_marcos 
	MIN_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial 
	MAX_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
#EN-26200-
	MIN_RANGE_tamano_marcos_proc=$PriomFinal
	MAX_RANGE_tamano_marcos_proc=$PrioMFinal 
#EN-26210-
	MIN_RANGE_prio_proc=${prio_proc_min}
	MAX_RANGE_prio_proc=${prio_proc_max}
	MIN_RANGE_tamano_direcciones_proc=${tamano_direcciones_proc_min}
	MAX_RANGE_tamano_direcciones_proc=${tamano_direcciones_proc_max}
 
	datos_memoria_tabla
#EN-26220-
		echo -e "\n$NC Pulse enter para continuar..." | tee -a $informeConColorTotal
		echo -e "\nPulse enter para continuar..." >> $informeSinColorTotal
		read enter
		echo -e $enter "\n" >> $informeConColorTotal
		echo -e $enter "\n" >> $informeSinColorTotal
	fi
#EN-26230-
	for (( p=0; p<$n_prog; p++)); do     
#EN-26240-
#EN-26250-
#EN-26260-
#EN-26270-
#EN-26280-

####################################################################################
#EN-26290-
####################################################################################
function entradaMemoriaRangosFichero_op_cinco_seis_Post_1 {
#EN-26300-
#EN-26310-
		PrioR="Mayor"
	else    
		PrioR="Menor"                
	fi              
	if [[ $p -eq 0 ]]; then
		echo -ne "Marcos totales\n"$mem_num_marcos"\nTamano de pagina\n"$mem_direcciones"\nPrioridad menor\n"$prio_menorInicial\
		"\nPrioridad mayor\n"$prio_mayorInicial"\nTipo de prioridad\n"$PrioR "\nMinimo para reubicabilidad\n"$reub"\nQuantum\n"$quantum\
		"\nTll nMar Prio Direcciones:\n" > $nomFicheroDatos
	fi                  

#EN-26320-
#EN-26330-
	MAX_RANGE_PAGINA_MODIFICADA=1
#EN-26340-
#EN-26350-
#EN-26360-
		direccionesAcumuladas+=`echo -ne " ${directions[$p,$numdir]}-${directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]}"`
	done
	echo -e ${llegada[$p]} ${memoria[$p]} ${prioProc[$p]} $direccionesAcumuladas >> $nomFicheroDatos
#EN-26370-

####################################################################################
#EN-26380-
####################################################################################
function entradaMemoriaRangosFichero_op_cinco_seis_Post_2 {
#EN-26390-
	if [[ -f "$ficheroDatosAnteriorEjecucion" ]]; then
		rm $ficheroDatosAnteriorEjecucion
	fi
	if [[ -f "$ficheroRangosAnteriorEjecucion" && $seleccionMenuEleccionEntradaDatos -ne 5 ]]; then
		rm $ficheroRangosAnteriorEjecucion
	fi
#EN-26400-
	if [[ $seleccionMenuEleccionEntradaDatos -ne 5 ]]; then
#EN-26410-
	fi
#EN-26420-

####################################################################################
#EN-26430-
####################################################################################
function entradaMemoriaRangosFichero_op_cuatro_cinco_seis_Comun {                          
#EN-26440-
	variableReubicar=$reub
#         
	proc=$(($p-1))
	if [[ $((p + 1)) -ge 10 ]]; then
		nombre="P$((p + 1))"
	else
		nombre="P0$((p + 1))" 
	fi
#EN-26450-
#EN-26460-
	calcDatoAleatorioGeneral $MIN_RANGE_llegada $MAX_RANGE_llegada
#EN-26470-
	calcDatoAleatorioGeneral $MIN_RANGE_tiempo_ejec $MAX_RANGE_tiempo_ejec
#EN-26480-
	calcDatoAleatorioGeneral $MIN_RANGE_tamano_marcos_proc $MAX_RANGE_tamano_marcos_proc
#EN-26490-
	calcDatoAleatorioGeneral $prio_menor $prio_mayor
#EN-26500-
#EN-26510-
	
#EN-26520-
#EN-26530-
#EN-26540-
	tamano_direcciones_proc=$datoAleatorioGeneral
	for (( numdir = 0; numdir <= ${ejecucion[$p]}; numdir++ )); do
#EN-26550-
		directions[$p,$numdir]=$datoAleatorioGeneral
#EN-26560-
			echo -e "\n***Error en la lectura de rangos. La dirección de memoria utilizada ("${directions[$p,$numdir]}") está fuera del rango máximo definido por el número de marcos de página ("$(($numDireccionesTotales_max - 1))")."
			exit 1 
		fi
#EN-26570-
		paginasDefinidasTotal[$p,$numdir]=${pagTransformadas[$numdir]} 
	done
#EN-26580-
			
#################################################################################### 
#EN-26590-
####################################################################################
function entradaMemoriaRangosFichero_op_siete_Previo {
#EN-26600-
#EN-26610-
#EN-26620-
#EN-26630-
#EN-26640-

####################################################################################
#EN-26650-
#EN-26660-
####################################################################################
function entradaMemoriaRangosFichero_op_siete_ocho_nueve { 
	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
#EN-26670-
	fi                     
#EN-26680-
	MIN_RANGE_MARCOSInicial=$datoAleatorioGeneral	
	calcDatoAleatorioGeneral $memoria_minInicial $memoria_maxInicial 
	MAX_RANGE_MARCOSInicial=$datoAleatorioGeneral
#EN-26690-
	MIN_RANGE_MARCOS=$PriomFinal
	MAX_RANGE_MARCOS=$PrioMFinal
#EN-26700-
	mem_num_marcos=$datoAleatorioGeneral

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_numero_direcciones_marco_amplio 
	fi                     
	calcDatoAleatorioGeneral $direcciones_minInicial $direcciones_maxInicial 
	MIN_RANGE_DIRECCIONESInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $direcciones_minInicial $direcciones_maxInicial 
	MAX_RANGE_DIRECCIONESInicial=$datoAleatorioGeneral
#EN-26710-
	MIN_RANGE_DIRECCIONES=$PriomFinal
	MAX_RANGE_DIRECCIONES=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
	mem_direcciones=$datoAleatorioGeneral
#EN-26720-

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_prio_menor_amplio 
	fi                     
#EN-26730-
#EN-26740-
	prio_menor_max=$PrioMFinal
	calcDatoAleatorioGeneral $prio_menor_min $prio_menor_max #calcMinPrioPro #Mínimos #Prioridades asociadas a los procesos.
#EN-26750-
#EN-26760-
	MAX_RANGE_prio_menorInicial=$datoAleatorioGeneral          
#EN-26770-
	MIN_RANGE_prio_menor=$PriomFinal
	MAX_RANGE_prio_menor=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_prio_menor $MAX_RANGE_prio_menor #calcMem #Datos generales
#EN-26780-

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_prio_mayor_amplio 
	fi                     
#EN-26790-
	prio_mayor_min=$PriomFinal
	prio_mayor_max=$PrioMFinal
	calcDatoAleatorioGeneral $prio_mayor_min $prio_mayor_max #calcMinPrioPro #Mínimos #Prioridades asociadas a los procesos.
	MIN_RANGE_prio_mayorInicial=$datoAleatorioGeneral
#EN-26800-
	MAX_RANGE_prio_mayorInicial=$datoAleatorioGeneral          
#EN-26810-
	MIN_RANGE_prio_mayor=$PriomFinal
	MAX_RANGE_prio_mayor=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_prio_mayor $MAX_RANGE_prio_mayor #calcMem #Datos generales
	prio_mayorInicial=$datoAleatorioGeneral

#EN-26820-
#EN-26830-
	prio_mayor=$PrioMFinal

#EN-26840-
	PrioMInicial=$prio_mayorInicial

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_tamano_reubicacion_amplio 
	fi                     
	calcDatoAleatorioGeneral $reubicacion_minInicial $reubicacion_maxInicial 
	MIN_RANGE_REUBInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $reubicacion_minInicial $reubicacion_maxInicial 
	MAX_RANGE_REUBInicial=$datoAleatorioGeneral
#EN-26850-
	MIN_RANGE_REUB=$PriomFinal
	MAX_RANGE_REUB=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_REUB $MAX_RANGE_REUB
	reub=$datoAleatorioGeneral

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_numero_programas_amplio 
	fi                     
	calcDatoAleatorioGeneral $programas_minInicial $programas_maxInicial 
	MIN_RANGE_NPROCInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $programas_minInicial $programas_maxInicial 
	MAX_RANGE_NPROCInicial=$datoAleatorioGeneral
#EN-26860-
	MIN_RANGE_NPROC=$PriomFinal
	MAX_RANGE_NPROC=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_NPROC $MAX_RANGE_NPROC
	n_prog=$datoAleatorioGeneral

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_tiempo_llegada_amplio 
	fi                     
	calcDatoAleatorioGeneral $llegada_minInicial $llegada_maxInicial 
	MIN_RANGE_llegadaInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $llegada_minInicial $llegada_maxInicial 
	MAX_RANGE_llegadaInicial=$datoAleatorioGeneral
#EN-26870-
	MIN_RANGE_llegada=$PriomFinal
	MAX_RANGE_llegada=$PrioMFinal

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_tiempo_ejecucion_amplio 
	fi                     
	calcDatoAleatorioGeneral $tiempo_ejec_minInicial $tiempo_ejec_maxInicial 
	MIN_RANGE_tiempo_ejecInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $tiempo_ejec_minInicial $tiempo_ejec_maxInicial 
	MAX_RANGE_tiempo_ejecInicial=$datoAleatorioGeneral
#EN-26880-
	MIN_RANGE_tiempo_ejec=$PriomFinal
	MAX_RANGE_tiempo_ejec=$PrioMFinal
	
#EN-26890-
#EN-26900-
	tamano_marcos_proc_minInicial=1 
	tamano_marcos_proc_maxInicial=$mem_num_marcos
	MIN_RANGE_tamano_marcos_procInicial=1
	calcDatoAleatorioGeneral $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial 
	MAX_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
	MIN_RANGE_tamano_marcos_proc=1
	MAX_RANGE_tamano_marcos_proc=$MAX_RANGE_tamano_marcos_procInicial

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_quantum_amplio 
	fi                     
	calcDatoAleatorioGeneral $quantum_minInicial $quantum_maxInicial 
	MIN_RANGE_quantumInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $quantum_minInicial $quantum_maxInicial 
	MAX_RANGE_quantumInicial=$datoAleatorioGeneral
#EN-26910-
	MIN_RANGE_quantum=$PriomFinal
	MAX_RANGE_quantum=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_quantum $MAX_RANGE_quantum
	quantum=$datoAleatorioGeneral

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_tamano_direcciones_procesos_amplio 
	fi                     
	calcDatoAleatorioGeneral $tamano_direcciones_proc_minInicial $tamano_direcciones_proc_maxInicial 
	MIN_RANGE_tamano_direcciones_procInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $tamano_direcciones_proc_minInicial $tamano_direcciones_proc_maxInicial 
	MAX_RANGE_tamano_direcciones_procInicial=$datoAleatorioGeneral
#EN-26920-
	MIN_RANGE_tamano_direcciones_proc=$PriomFinal
	MAX_RANGE_tamano_direcciones_proc=$PrioMFinal    
# 
#EN-26930-

#EN-26940-
	p=0
	until [[ $p -eq $n_prog ]]; do  
#EN-26950-
#EN-26960-
#EN-26970-
#EN-26980-
#EN-26990-
#EN-27000-
#EN-27010-

####################################################################################
#EN-27020-
####################################################################################
function entradaMemoriaRangosFichero_op_siete_ocho_nueve_Post_1 { 
#EN-27030-
#EN-27040-
		PrioR="Mayor"
	else    
		PrioR="Menor"                
	fi              
	if [[ $p -eq 0 ]]; then
		echo -ne "Marcos totales\n"$mem_num_marcos"\nTamano de pagina\n"$mem_direcciones"\nPrioridad menor\n"$prio_menorInicial\
		"\nPrioridad mayor\n"$prio_mayorInicial"\nTipo de prioridad\n"$PrioR "\nMinimo para reubicabilidad\n"$reub"\nQuantum\n"$quantum\
		"\nTll nMar Prio Direcciones:\n" > $nomFicheroDatos
	fi                  

#EN-27050-
#EN-27060-
	MAX_RANGE_PAGINA_MODIFICADA=1
#EN-27070-
#EN-27080-
#EN-27090-
		direccionesAcumuladas+=`echo -ne " ${directions[$p,$numdir]}-${directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]}"`
	done
	echo -e ${llegada[$p]} ${memoria[$p]} ${prioProc[$p]} $direccionesAcumuladas >> $nomFicheroDatos

#EN-27100-
		if [[ -f "$nomFicheroRangos" ]]; then
			rm $nomFicheroRangos
		fi 
		echo -e "RangoMarcosMemoria $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS" > $nomFicheroRangos 
		echo -e "RangoDireccionesMarco $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES" >> $nomFicheroRangos 
		echo -e "RangoPrioMenor $MIN_RANGE_prio_menorInicial $MAX_RANGE_prio_menorInicial" >> $nomFicheroRangos 
		echo -e "RangoPrioMayor $MIN_RANGE_prio_mayorInicial $MAX_RANGE_prio_mayorInicial" >> $nomFicheroRangos 
		echo -e "RangoNumProc $MIN_RANGE_NPROC $MAX_RANGE_NPROC" >> $nomFicheroRangos 
		echo -e "RangoReubicar $MIN_RANGE_REUB $MAX_RANGE_REUB" >> $nomFicheroRangos 
		echo -e "RangoLlegada $MIN_RANGE_llegada $MAX_RANGE_llegada" >> $nomFicheroRangos 
		echo -e "RangoTEjecucion $MIN_RANGE_tiempo_ejec $MAX_RANGE_tiempo_ejec" >> $nomFicheroRangos 
		echo -e "RangoTamanoMarcosProc $MIN_RANGE_tamano_marcos_proc $MAX_RANGE_tamano_marcos_proc" >> $nomFicheroRangos
		echo -e "RangoPrioProc $prio_menorInicial $prio_mayorInicial" >> $nomFicheroRangos
		echo -e "RangoTamanoDireccionesProc $MIN_RANGE_tamano_direcciones_proc $MAX_RANGE_tamano_direcciones_proc" >> $nomFicheroRangos
		echo -ne "RangoQuantum $MIN_RANGE_quantum $MAX_RANGE_quantum" >> $nomFicheroRangos
#EN-27110-
#EN-27120-
		if [[ -f "$nomFicheroRangosAleT" ]]; then 
			rm $nomFicheroRangosAleT
		fi
		echo -e "RangoMarcosMemoria $memoria_min $memoria_max" > $nomFicheroRangosAleT  
		echo -e "RangoDireccionesMarco $direcciones_min $direcciones_max" >> $nomFicheroRangosAleT 
		echo -e "RangoPrioMenor $prio_menor_minInicial $prio_menor_maxInicial" >> $nomFicheroRangosAleT 
		echo -e "RangoPrioMayor $prio_mayor_minInicial $prio_mayor_maxInicial" >> $nomFicheroRangosAleT 
		echo -e "RangoNumProc $programas_min $programas_max" >> $nomFicheroRangosAleT 
		echo -e "RangoReubicar $reubicacion_min $reubicacion_max" >> $nomFicheroRangosAleT 
		echo -e "RangoLlegada $llegada_min $llegada_max" >> $nomFicheroRangosAleT 
		echo -e "RangoTEjecucion $tiempo_ejec_min $tiempo_ejec_max" >> $nomFicheroRangosAleT 
		echo -e "RangoTamanoMarcosProc $tamano_marcos_proc_min $tamano_marcos_proc_max" >> $nomFicheroRangosAleT
		echo -e "RangoPrioProc $prio_menorInicial $prio_mayorInicial" >> $nomFicheroRangosAleT
		echo -e "RangoTamanoDireccionesProc $tamano_direcciones_proc_min $tamano_direcciones_proc_max" >> $nomFicheroRangosAleT
		echo -ne "RangoQuantum $quantum_min $quantum_max" >> $nomFicheroRangosAleT
#EN-27130-
#EN-27140-

####################################################################################
#EN-27150-
####################################################################################
function entradaMemoriaRangosFichero_op_siete_ocho_nueve_Post_2 { 
#EN-27160-
		rm $ficheroDatosAnteriorEjecucion
	fi
#EN-27170-
		rm $ficheroRangosAnteriorEjecucion
	fi
	cp $nomFicheroDatos $ficheroDatosAnteriorEjecucion
	cp $nomFicheroRangos $ficheroRangosAnteriorEjecucion
#EN-27180-
#EN-27190-
			rm $ficheroRangosAleTotalAnteriorEjecucion
		fi
		cp $nomFicheroRangosAleT $ficheroRangosAleTotalAnteriorEjecucion        
	fi
#EN-27200-
		   
####################################################################################
#EN-27210-
####################################################################################
function entradaMemoriaRangosFichero_op_ocho_Previo {
#EN-27220-
#EN-27230-
#EN-27240-
#EN-27250-

####################################################################################
#EN-27260-
####################################################################################
function entradaMemoriaRangosFichero_op_nueve_Previo {
#EN-27270-
#EN-27280-
#EN-27290-
	echo -e "\n\nFicheros existentes:\n$NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\nFicheros existentes:\n" >> $informeSinColorTotal  
	files=("./FRangosAleT"/*)
#EN-27300-
#    for i in "${files[@]}"; do #Define el dato, pero no en qué posción se encuentra.
		echo -e "$i) ${files[$i]}" | tee -a $informeConColorTotal
		echo -e "$i) ${files[$i]}" >> $informeSinColorTotal  
	done
	echo -e "\n$AMARILLO\n\nIntroduce el número correspondiente al fichero elegido: $NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\n\nIntroduce el número correspondiente al fichero elegido: " >> $informeSinColorTotal 
	read -r numeroFichero
#EN-27310-
		echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read -r numeroFichero
		echo -e "$numeroFichero\n\n" >> $informeConColorTotal
		echo -e "$numeroFichero\n\n" >> $informeSinColorTotal
	done
	echo "$numeroFichero" >> $informeConColorTotal
	echo "$numeroFichero" >> $informeSinColorTotal
	ficheroParaLectura="${files[$numeroFichero]}"
#EN-27320-
#EN-27330-

####################################################################################
#EN-27340-
####################################################################################
function entradaMemoriaRangosFichero_op_siete_ocho_nueve_Comun {                          
#EN-27350-
	variableReubicar=$reub
#            
	if [[ $p -eq 0 ]] ; then
		if [[ -f $informeConColorTotal ]] ; then
			if [[ $seleccionMenuPreguntaDondeGuardarDatosManuales == "1" ]] ; then
				rm $ficheroDatosDefault
			fi
		fi
	fi
	if [[ $p -eq 0 ]] ; then
		if [[ -f $informeConColorTotal ]] ; then
			if [[ $seleccionMenuPreguntaDondeGuardarRangosManuales == "1" ]] ; then
				rm $ficheroRangosDefault
			fi
		fi
	fi
	proc=$(($p-1))
	if [[ $((p + 1)) -ge 10 ]]; then
		nombre="P$((p + 1))"
	else
		nombre="P0$((p + 1))" 
	fi
#EN-27360-
#EN-27370-
#EN-27380-
#EN-27390-
#EN-27400-

	calcDatoAleatorioGeneral $prio_menor $prio_mayor
	prioProc[$p]=$datoAleatorioGeneral #Se añade el tamaño de ejecución al vector #Sobra uno
#EN-27410-

#EN-27420-
#EN-27430-
#EN-27440-
	tamano_direcciones_proc=$datoAleatorioGeneral
	for (( numdir = 0; numdir <= ${ejecucion[$p]}; numdir++ )); do
#EN-27450-
		directions[$p,$numdir]=$datoAleatorioGeneral
#EN-27460-
			echo -e "\n***Error en la lectura de rangos amplios. La dirección de memoria utilizada ("${directions[$p,$numdir]}") está fuera del rango máximo definido por el número de marcos de página ("$(($numDireccionesTotales_max - 1))")."
			exit 1
		fi
#EN-27470-
		paginasDefinidasTotal[$p,$numdir]=${pagTransformadas[$numdir]} 
	done
#EN-27480-

####################################################################################
#EN-27490-
####################################################################################
#EN-27500-
#EN-27510-
		if [[ ${enejecucion[$i]} -eq 1 ]]; then  
			temp_rej[$i]=`expr ${temp_rej[$i]} - 1`
#EN-27520-
		fi
#EN-27530-
			temp_wait[$i]=`expr ${temp_wait[$i]} + 1`
			temp_ret[$i]=`expr ${temp_ret[$i]} + 1`
		fi
#EN-27540-
			temp_wait[$i]=`expr ${temp_wait[$i]} + 0`
#EN-27550-
			temp_wait[$i]=`expr ${temp_wait[$i]} + 1`
			temp_ret[$i]=`expr ${temp_ret[$i]} + 1`
#EN-27560-
			temp_wait[$i]=`expr ${temp_wait[$i]} + 1`
			temp_ret[$i]=`expr ${temp_ret[$i]} + 1`
		fi
#EN-27570-
#EN-27580-
#EN-27590-
	done
#EN-27600-
#EN-27610-

####################################################################################
#EN-27620-
####################################################################################
function mostrarEventos {
#EN-27630-
#EN-27640-
#EN-27650-
	Dato1=""
	Dato2=""
	Dato3=""
#EN-27660-
		algoritmoSeleccionado="FCFS-PaginaciónNoVirtual-"
#EN-27670-
		algoritmoSeleccionado="FCFS-Paginación-"
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 2 ]]; then    
		algoritmoSeleccionado="SJF-Paginación-"
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 3 ]]; then    
		algoritmoSeleccionado="SRPT-Paginación-" 
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 4 ]]; then    
		algoritmoSeleccionado="Prioridades-"    
#EN-27680-
			algoritmoSeleccionado+="Mayor-"
		else    
			algoritmoSeleccionado+="Menor-"                
		fi              
#EN-27690-
			algoritmoSeleccionado+="NoApropiativo-Paginación-"
		else    
			algoritmoSeleccionado+="Apropiativo-Paginación-"                
		fi  
		Dato2=" Prio.Mínima="$PriomInicial" Prio.Máxima="$PrioMInicial            
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then    
		algoritmoSeleccionado="RoundRobin(RR)-Paginación-" 
		Dato3=" Quantum="$quantum
	fi
	if [[ $seleccionAlgoritmoPaginacion -eq 1 ]]; then    
		algoritmoPaginacionSeleccionado="FIFO-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 2 ]]; then    
		algoritmoPaginacionSeleccionado="FIFOSegOp-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 3 ]]; then    
		algoritmoPaginacionSeleccionado="Reloj-"             
	elif [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then    
		algoritmoPaginacionSeleccionado="RelojSegOp-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then    
		algoritmoPaginacionSeleccionado="Óptimo-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 6 ]]; then 
		algoritmoPaginacionSeleccionado="MFU-" 
	elif [[ $seleccionAlgoritmoPaginacion -eq 7 ]]; then    
		algoritmoPaginacionSeleccionado="LFU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 8 ]]; then    
		algoritmoPaginacionSeleccionado="NFU/MFU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 9 ]]; then    
		algoritmoPaginacionSeleccionado="NFU/LFU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 10 ]]; then    
		algoritmoPaginacionSeleccionado="NFU/Clases/MFU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 11 ]]; then    
		algoritmoPaginacionSeleccionado="NFU/Clases/LFU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 12 ]]; then    
		algoritmoPaginacionSeleccionado="MRU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 13 ]]; then    
		algoritmoPaginacionSeleccionado="LRU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 14 ]]; then    
		algoritmoPaginacionSeleccionado="NRU/MRU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 15 ]]; then    
		algoritmoPaginacionSeleccionado="NRU/LRU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 16 ]]; then    
		algoritmoPaginacionSeleccionado="NRU/Clases/MRU-"                
	elif [[ $seleccionAlgoritmoPaginacion -eq 17 ]]; then    
		algoritmoPaginacionSeleccionado="NRU/Clases/LRU-"                
	fi
#EN-27700-
		continuidadSeleccionado="NC-"
	else    
		continuidadSeleccionado="C-"                
	fi
#EN-27710-
		reubicabilidadSeleccionado="NR"
	else    
		reubicabilidadSeleccionado="R" 
		Dato1=" Máx.Reubicación="$variableReubicar             
	fi
	
	algoritmoPaginacionContinuidadReubicabilidadSeleccionado="$algoritmoSeleccionado""$algoritmoPaginacionSeleccionado""$continuidadSeleccionado""$reubicabilidadSeleccionado"
	echo " $algoritmoPaginacionContinuidadReubicabilidadSeleccionado" | tee -a $informeConColorTotal
	echo " $algoritmoPaginacionContinuidadReubicabilidadSeleccionado" >> ./$informeSinColorTotal
	echo -e $NC" Reloj="$reloj" Num.Marcos="$mem_num_marcos" Mem.Libre="$mem_libre" Num.Direcciones/Marco="$mem_direcciones$Dato1$Dato2$Dato3 | tee -a $informeConColorTotal
	echo -e " Reloj="$reloj" Mem.Total="$mem_num_marcos" Mem.Libre="$mem_libre" Num.Direcciones/Marco="$mem_direcciones$Dato1$Dato2$Dato3 >> $informeSinColorTotal
#EN-27720-
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisosalida[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha salido de memoria." | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha salido de memoria." >> $informeSinColorTotal
#EN-27730-
		fi
	done
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisollegada[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha llegado al sistema." | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha llegado al sitema." >> $informeSinColorTotal
#EN-27740-
		fi
	done
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisoentrada[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha entrado de memoria. " | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha entrado en memoria." >> $informeSinColorTotal
#EN-27750-
		fi
	done
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisoEntradaCPU[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha entrado en CPU. " | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha entrado en CPU." >> $informeSinColorTotal
#EN-27760-
		fi
	done
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisoPausa[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha quedado en pausa. " | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha quedado en pausa." >> $informeSinColorTotal
#EN-27770-
		fi
	done
#EN-27780-

####################################################################################
#EN-27790-
####################################################################################
function dibujarTablaDatos {
	mem_aux=$[ $mem_num_marcos -1 ]
	j=0
	k=0
	for (( i=0; i<$nprocesos; i++ )); do
		if [[ ${enmemoria[$i]} -eq 1 ]]; then
#EN-27800-
			coloresAux[$k]=${coloress[$i % 6]} 
			j=`expr $j + 1`
		fi
		k=`expr $k + 1`
	done
	j=0
	k=0
#EN-27810-
	cont=0
	for (( i=0; i<$nprocesos; i++ )); do
		if [[ ${enmemoria[$i]} -eq 1 ]]; then
			enmemoriavec[$cont]=$i
			cont=$[ $cont + 1 ]
			if [[ ${guardados[0]} -eq $i ]]; then  
				pos_inicio[$i]=0 
				pos_final[$i]=$[ ${memoria[$i]} -1 ]
				mem_aux=`expr $mem_aux - ${memoria[$i]}`
				pos_aux=${pos_final[$i]}
			else
				pos_inicio[$i]=$pos_aux 
				pos_final[$i]=`expr ${pos_inicio[$i]} + ${memoria[$i]}`
				mem_aux=`expr $mem_aux - ${memoria[$i]}`
				pos_aux=${pos_final[$i]}
			fi
		fi
#EN-27820-
			inicio2[$i]="-"
			final2[$i]="-" 
			temp_wait[$i]="-"
			temp_ret[$i]="-"
			temp_rej[$i]="-"
			estado[$i]="Fuera del Sistema"
#EN-27830-
			inicio2[$i]="-"
			final2[$i]="-"
			estado[$i]="En espera"
#EN-27840-
			estado[$i]="En memoria"
#EN-27850-
			estado[$i]="En ejecución"
#EN-27860-
			estado[$i]="En pausa"
#EN-27870-
			inicio2[$i]="-"
			final2[$i]="-" 
			temp_rej[$i]="-"
			estado[$i]="Finalizado"
		fi
			varC[$i]=${coloress[$i % 6]}
	done

#EN-27880-
#EN-27890-
#EN-27900-
#EN-27910-
	inicialNCaux=("${inicialNC[@]}")
	finalNCaux=("${finalNC[@]}")
 	datos4=""
#EN-27920-
		datos4="-Modificación"
	fi

#EN-27930-
		echo -e " Ref Tll Tej Mem Pri TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " | tee -a $informeConColorTotal   
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────────" | tee -a $informeConColorTotal
		echo -e " Ref Tll Tej Mem Pri TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " >> $informeSinColorTotal
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────────" >> $informeSinColorTotal
#EN-27940-
#EN-27950-
			echo -ne " ${varC[$i]}${proceso[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#llegada[$i]})${varC[$i]}${llegada[$i]}$NC" "$(imprimirEspaciosEstrechos ${#ejecucion[$i]})${varC[$i]}${ejecucion[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#memoria[$i]})${varC[$i]}${memoria[$i]}$NC" "$(imprimirEspaciosEstrechos ${#prioProc[$i]})${varC[$i]}${prioProc[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#temp_wait[$i]})${varC[$i]}${temp_wait[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_ret[$i]})${varC[$i]}${temp_ret[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#temp_rej[$i]})${varC[$i]}${temp_rej[$i]}$NC" "$(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC"\
			"$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC" "${varC[$i]}${estado[$i]}""$(imprimirEspaciosMuyAnchos ${#estado[$i]})$NC " | tee -a $informeConColorTotal
			DireccionesPaginasPorProceso=""
#EN-27960-
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
#EN-27970-
					kk=" $varImprimirPaginaUsada${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4$NC"
					DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${varC[$i]}$varImprimirPaginaUsada${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4$NC"
				else
					DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${varC[$i]}${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4"
				fi
			done
			echo -e $DireccionesPaginasPorProceso | tee -a $informeConColorTotal
			echo -ne " ${proceso[$i]}"\
			"$(imprimirEspaciosEstrechosBN ${#llegada[$i]})${llegada[$i]}" "$(imprimirEspaciosEstrechosBN ${#ejecucion[$i]})${ejecucion[$i]}"\
			"$(imprimirEspaciosEstrechosBN ${#memoria[$i]})${memoria[$i]}" "$(imprimirEspaciosEstrechosBN ${#prioProc[$i]})${prioProc[$i]}}"\
			"$(imprimirEspaciosAnchosBN ${#temp_wait[$i]})${temp_wait[$i]}" "$(imprimirEspaciosAnchosBN ${#temp_ret[$i]})${temp_ret[$i]}"\
			"$(imprimirEspaciosAnchosBN ${#temp_rej[$i]})${temp_rej[$i]}" "$(imprimirEspaciosAnchosBN ${#inicialNCaux[$m]})${inicialNCaux[$m]}"\
			"$(imprimirEspaciosAnchosBN ${#finalNCaux[$m]})${finalNCaux[$m]}" "${estado[$i]}""$(imprimirEspaciosMuyAnchosBN ${#estado[$i]}) " >> $informeSinColorTotal
			DireccionesPaginasPorProceso=""
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
				DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4"
			done
			echo -e $DireccionesPaginasPorProceso >> $informeSinColorTotal
			
			m=$((m+1))
#EN-27980-
#EN-27990-
#EN-28000-
#EN-28010-
#EN-28020-
				m=$((m+1))
			done
		done
#EN-28030-
		echo -e " Ref Tll Tej Mem TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " | tee -a $informeConColorTotal   
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────" | tee -a $informeConColorTotal
		echo -e " Ref Tll Tej Mem TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " >> $informeSinColorTotal
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────" >> $informeSinColorTotal
#EN-28040-
#EN-28050-
			echo -ne " ${varC[$i]}${proceso[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#llegada[$i]})${varC[$i]}${llegada[$i]}$NC" "$(imprimirEspaciosEstrechos ${#ejecucion[$i]})${varC[$i]}${ejecucion[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#memoria[$i]})${varC[$i]}${memoria[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_wait[$i]})${varC[$i]}${temp_wait[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#temp_ret[$i]})${varC[$i]}${temp_ret[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_rej[$i]})${varC[$i]}${temp_rej[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC" "$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC"\
#EN-28060-
			DireccionesPaginasPorProceso=""
#EN-28070-
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
#EN-28080-
					kk=" $varImprimirPaginaUsada${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4$NC"
					DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${varC[$i]}$varImprimirPaginaUsada${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4$NC"
				else
					DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${varC[$i]}${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4"
				fi
			done
			echo -e $DireccionesPaginasPorProceso | tee -a $informeConColorTotal
		   
			echo -ne " ${proceso[$i]}"\
			"$(imprimirEspaciosEstrechosBN ${#llegada[$i]})${llegada[$i]}" "$(imprimirEspaciosEstrechosBN ${#ejecucion[$i]})${ejecucion[$i]}"\
			"$(imprimirEspaciosEstrechosBN ${#memoria[$i]})${memoria[$i]}" "$(imprimirEspaciosAnchosBN ${#temp_wait[$i]})${temp_wait[$i]}"\
			"$(imprimirEspaciosAnchosBN ${#temp_ret[$i]})${temp_ret[$i]}" "$(imprimirEspaciosAnchosBN ${#temp_rej[$i]})${temp_rej[$i]}"\
			"$(imprimirEspaciosAnchosBN ${#inicialNCaux[$m]})${inicialNCaux[$m]}" "$(imprimirEspaciosAnchosBN ${#finalNCaux[$m]})${finalNCaux[$m]}"\
#EN-28090-
			DireccionesPaginasPorProceso=""
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
				DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4"
			done
			echo -e $DireccionesPaginasPorProceso >> $informeSinColorTotal
			
			m=$((m+1))
#EN-28100-
#EN-28110-
#EN-28120-
#EN-28130-
#EN-28140-
				m=$((m+1))
			done
		done
#EN-28150-
		echo -e " Ref Tll Tej Mem TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " | tee -a $informeConColorTotal   
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────" | tee -a $informeConColorTotal
		echo -e " Ref Tll Tej Mem TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " >> $informeSinColorTotal
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────" >> $informeSinColorTotal
#EN-28160-
#EN-28170-
			echo -ne " ${varC[$i]}${proceso[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#llegada[$i]})${varC[$i]}${llegada[$i]}$NC" "$(imprimirEspaciosEstrechos ${#ejecucion[$i]})${varC[$i]}${ejecucion[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#memoria[$i]})${varC[$i]}${memoria[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_wait[$i]})${varC[$i]}${temp_wait[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#temp_ret[$i]})${varC[$i]}${temp_ret[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_rej[$i]})${varC[$i]}${temp_rej[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC" "$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC"\
#EN-28180-
			DireccionesPaginasPorProceso=""
#EN-28190-
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
#EN-28200-
					kk=" $varImprimirPaginaUsada${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4$NC"
					DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${varC[$i]}$varImprimirPaginaUsada${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4$NC"
				else
					DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${varC[$i]}${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4"
				fi
			done
			echo -e $DireccionesPaginasPorProceso | tee -a $informeConColorTotal
		   
			echo -ne " ${proceso[$i]}"\
			"$(imprimirEspaciosEstrechosBN ${#llegada[$i]})${llegada[$i]}" "$(imprimirEspaciosEstrechosBN ${#ejecucion[$i]})${ejecucion[$i]}"\
			"$(imprimirEspaciosEstrechosBN ${#memoria[$i]})${memoria[$i]}" "$(imprimirEspaciosAnchosBN ${#temp_wait[$i]})${temp_wait[$i]}"\
			"$(imprimirEspaciosAnchosBN ${#temp_ret[$i]})${temp_ret[$i]}" "$(imprimirEspaciosAnchosBN ${#temp_rej[$i]})${temp_rej[$i]}"\
			"$(imprimirEspaciosAnchosBN ${#inicialNCaux[$m]})${inicialNCaux[$m]}" "$(imprimirEspaciosAnchosBN ${#finalNCaux[$m]})${finalNCaux[$m]}"\
#EN-28210-
			DireccionesPaginasPorProceso=""
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
				DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${directions[$i,$counter2]}-${paginasDefinidasTotal[$i,$counter2]}$datos4"
			done
			echo -e $DireccionesPaginasPorProceso >> $informeSinColorTotal
			
			m=$((m+1))
#EN-28220-
#EN-28230-
#EN-28240-
#EN-28250-
#EN-28260-
				m=$((m+1))
			done
		done
	fi

#EN-28270-
	dividir=0
	for (( i=0; i<nprocesos; i++ )) ; do
		if [[ ${estad[$i]} -ne 0 ]] ; then 
			dividir=$((dividir+1))
		fi
	done
	promedio_espera=0.0
	promedio_retorno=0.0
	suma_espera=0
	suma_retorno=0

	for (( i=0; i<nprocesos; i++ )); do
		tam=${memoria[$i]};
#EN-28280-
#EN-28290-
#EN-28300-
#EN-28310-
#EN-28320-
		fi
	done
	var_uno=1
	echo -e "$NC T. espera medio: $promedio_espera\t      T. retorno medio: $promedio_retorno$NC" | tee -a $informeConColorTotal 
	echo -e " T. espera medio: $promedio_espera\t       T. retorno medio: $promedio_retorno" >> ./$informeSinColorTotal
#EN-28330-

####################################################################################
#EN-28340-
####################################################################################
function calculosActualizarVariablesBandaMemoria {
#EN-28350-
#EN-28360-
		if [[ ${enmemoria[$po]} == 0 && ${escrito[$po]} == 1 ]]; then 
			for (( ra=0; ra<$mem_num_marcos; ra++ )); do
				if [[ ${unidMemOcupadas[$ra]} == $po ]]; then
					unidMemOcupadas[$ra]="_" 
				fi
			done
			escrito[$po]=0
		fi
	done
#EN-28370-
		if [[ ${enmemoria[$po]} -ne 1 ]]; then 
#EN-28380-
				if [[ ${guardadoMemoria[$i]} -eq $po ]]; then
					unset guardadoMemoria[$i]
					unset tamanoGuardadoMemoria[$i]
				fi
			done
		fi
	done
#EN-28390-
#EN-28400-
#EN-28410-

####################################################################################
#EN-28420-
####################################################################################
function calculosReubicarYMeterProcesosBandaMemoria {
#EN-28430-
	if [[ $mem_libre -gt 0 ]]; then 
#EN-28440-
			for (( gm=0 ; gm<${#tamanoGuardadoMemoria[@]} ; gm++ )); do #Se reubican los procesos existentes en la memoria en el mismo orden.
#EN-28450-
				ra=0
#EN-28460-
#EN-28470-
						unidMemOcupadasAux[$ra]=${guardadoMemoria[$gm]}  
						ud=$((ud+1))
					fi
#EN-28480-
					ra=$((ra+1))
				 done
			done
#EN-28490-
#EN-28500-
			echo -e " La memoria ha sido reubicada." $NC | tee -a $informeConColorTotal
			echo -e " La memoria ha sido reubicada." >> $informeSinColorTotal
		fi
	fi
#EN-28510-

####################################################################################
#EN-28520-
####################################################################################
function tratarRangoPrioridadesDirecta {
#EN-28530-
	if [[ $1 -gt $2 ]]; then 
		aux=$1
		PriomFinal=$2
		PrioMFinal=$aux
#EN-28540-
	else
		PriomFinal=$1
		PrioMFinal=$2
	fi
#EN-28550-

######################################################################
#EN-28560-
#EN-28570-
#######################################################################
function crearListaSecuencialProcesosAlEntrarMemoria {
#EN-28580-
#EN-28590-
#EN-28600-
		if [[ ${unidMemOcupadas[$ra]} != "_" ]]; then
			numeroProbar=${unidMemOcupadas[$ra]}
			permiso=1
			for (( i=0; i<${#guardadoMemoria[@]} ; i++ )); do #Si el proceso ya está en memoria, no hace falta meterlo.
				if [[ ${guardadoMemoria[$i]} -eq $numeroProbar ]]; then
					permiso=0
				fi
			done
#EN-28610-
#EN-28620-
#EN-28630-
				permiso=0
			fi
		fi
	done
#EN-28640-

#######################################################################
#EN-28650-
#######################################################################
function comprobacionSiguienteProcesoParaReubicar {
#EN-28660-
#EN-28670-
	encontradoHuecoMuyReducido=0
	primeraUnidadFuturoProcesoSinreubicar=-1
	raInicioProceso=-1
#EN-28680-
#EN-28690-
	contadorReubicar=-1
	contadorReubicarTotal=0
	siguienteProcesoAMeter=-1
#EN-28700-
#EN-28710-
			siguienteProcesoAMeter=$po
			break
		fi 
	done
	if [[ $siguienteProcesoAMeter -eq -1 ]]; then
#EN-28720-
#EN-28730-
				siguienteProcesoAMeter=$po
				break
			fi 
		done
	fi 
	if [[ $mem_libre -gt 0 ]]; then
		for (( ra=0; ra<$mem_num_marcos; ra++ )); do
			if [[ ${unidMemOcupadas[$ra]} == "_" && siguienteProcesoAMeter -gt -1 ]]; then
#EN-28740-
					contadorReubicar=0
					raInicioProceso=$ra
				fi
				contadorReubicar=$((contadorReubicar + 1))
				contadorReubicarTotal=$((contadorReubicarTotal + 1))
				if [[ $contadorReubicar -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $primeraUnidadFuturoProcesoSinreubicar -eq -1 ]]; then 
#EN-28750-
					primeraUnidadFuturoProcesoSinreubicar=$raInicioProceso               
					break
				fi
			elif [[ ${unidMemOcupadas[$ra]} != "_" && siguienteProcesoAMeter -ne -1 ]]; then
				if [[ $contadorReubicar -ne -1 && $contadorReubicar -le $variableReubicar && $reubicabilidadNo0Si1 -eq 1 ]]; then 
#EN-28760-
					encontradoHuecoMuyReducido=1
				fi
				contadorReubicar=-1
			fi
		done
#        if [[ $contadorReubicarTotal -lt ${memoria[$siguienteProcesoAMeter]} ]]; then #No necesario 
#            #1 - 3 - 6 - 9 - No cabe - Ya se considera cuando se resta el tamaño de memoria del proceso a introducir (memoria[$siguienteProcesoAMeter]) de la memoria libre (mem_libre) y comprueba >=0 en comprobacionSiguienteProcesoParaMeterMemoria()
#EN-28770-
#EN-28780-
#EN-28790-
#EN-28800-
#        if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $encontradoHuecoMuyReducido -eq 0 && $contadorReubicarTotal -gt ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 0 ]]; then #No necesario
#            #2 - Lo meterá en memoria a trozos.
#EN-28810-
#EN-28820-
#EN-28830-
#EN-28840-
#        if [[ $contadorReubicarTotal -lt ${memoria[$siguienteProcesoAMeter]} && $encontradoHuecoMuyReducido -eq 0 && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 1 ]]; then #No necesario
#            #4 - 
#EN-28850-
#EN-28860-
#EN-28870-
#EN-28880-
#        if [[ $contadorReubicarTotal -lt ${memoria[$siguienteProcesoAMeter]} && $primeraUnidadFuturoProcesoSinreubicar -ne -1 && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0 ]]; then #No necesario
#            #7 - 
#EN-28890-
#EN-28900-
#EN-28910-
#EN-28920-
#        if [[ $primeraUnidadFuturoProcesoSinreubicar -ne -1  && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0]]; then #No necesario
#            #8 - 
#EN-28930-
#EN-28940-
#EN-28950-
#EN-28960-
#        if [[ $primeraUnidadFuturoProcesoSinreubicar -ne -1 && $encontradoHuecoMuyReducido -eq 0 && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 1 ]]; then #No necesario
#            #10 - 
#EN-28970-
#EN-28980-
#EN-28990-
#EN-29000-
		if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorReubicarTotal -ge ${memoria[$siguienteProcesoAMeter]} && $encontradoHuecoMuyReducido -eq 1 && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 1 ]]; then 
#EN-29010-
		fi
		if [[ $primeraUnidadFuturoProcesoSinreubicar -gt -1 && $encontradoHuecoMuyReducido -eq 1 && $reubicabilidadNo0Si1 -eq 1 ]]; then 
#EN-29020-
#EN-29030-
#EN-29040-
			if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorReubicarTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 1 ]] ; then
#EN-29050-
			fi
		fi
#EN-29060-
			if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorReubicarTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0 ]] ; then
#EN-29070-
			fi
		fi
	else
		noCabe0Cabe1=0
	fi
#EN-29080-
#EN-29090-
#EN-29100-
#EN-29110-
#EN-29120-
#EN-29130-
#EN-29140-
#EN-29150-
#EN-29160-
#EN-29170-
#EN-29180-
#EN-29190-
#EN-29200-
#EN-29210-
#EN-29220-
#EN-29230-
#EN-29240-
#EN-29250-
#EN-29260-

#######################################################################
#EN-29270-
#######################################################################
function comprobacionSiguienteProcesoParaMeterMemoria {
	if [[ $mem_libre -gt 0 && reubicarReubicabilidad -ne 1 && reubicarContinuidad -ne 1 ]]; then
		mem_libreTemp=$mem_libre
#EN-29280-
#EN-29290-
#EN-29300-
#EN-29310-
			encontradoHuecoMuyReducido=0
			raInicioProceso=-1
			contadorMeterMemoria=-1
			contadorMeterMemoriaTotal=0
			siguienteProcesoAMeter=$i
			if [[ $((mem_libreTemp - ${memoria[$i]})) -ge 0 ]]; then
				noCabe0Cabe1=1
				for (( ra=0; ra<$mem_num_marcos; ra++ )); do
					if [[ ${unidMemOcupadas[$ra]} == "_" && siguienteProcesoAMeter -gt -1 ]]; then
#EN-29320-
							contadorMeterMemoria=0
							raInicioProceso=$ra
						fi
						contadorMeterMemoria=$((contadorMeterMemoria + 1))
						contadorMeterMemoriaTotal=$((contadorMeterMemoriaTotal + 1))
						if [[ $contadorMeterMemoria -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $primeraUnidadFuturoProcesoSinreubicar -eq -1 ]]; then 
#EN-29330-
							primeraUnidadFuturoProcesoSinreubicar=$raInicioProceso               
						fi
					elif [[ ${unidMemOcupadas[$ra]} != "_" && siguienteProcesoAMeter -ne -1 ]]; then
						if [[ $contadorMeterMemoria -ne -1 && $contadorMeterMemoria -le $variableReubicar && $reubicabilidadNo0Si1 -eq 1 ]]; then 
#EN-29340-
							encontradoHuecoMuyReducido=1
						fi
						contadorMeterMemoria=-1
					fi
				done
#EN-29350-
					if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorMeterMemoriaTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0 ]] ; then
#EN-29360-
					fi
					if [[ $siguienteProcesoAMeter != -1 && $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorMeterMemoriaTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0 ]] ; then
#EN-29370-
					fi
				fi
#EN-29380-
				if [[ $primeraUnidadFuturoProcesoSinreubicar -ne -1 ||
				$primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorMeterMemoriaTotal -ge ${memoria[$siguienteProcesoAMeter]} && $encontradoHuecoMuyReducido -eq 1 && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 1 ||
				$primeraUnidadFuturoProcesoSinreubicar -gt -1 && $encontradoHuecoMuyReducido -eq 1 && $reubicabilidadNo0Si1 -eq 1 ||
				$primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorMeterMemoriaTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 1 || 
				$primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorMeterMemoriaTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 0 || 
				$primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorMeterMemoriaTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 1 ]]; then 
					if [[ $((mem_libreTemp - ${memoria[$i]})) -ge 0 ]]; then
						mem_libreTemp=`expr $mem_libreTemp - ${memoria[$i]}` 
						avisoentrada[$i]=1
						evento=1
						enmemoria[$i]=1 
						realizadoAntes=0
						noCabe0Cabe1=1
					else 
						noCabe0Cabe1=0
					fi
				fi
			else 
				noCabe0Cabe1=0
			fi
		fi
	else 
		noCabe0Cabe1=0
	fi
#EN-29390-
		bloqueados[$j]=1
	done
#EN-29400-
#EN-29410-
#EN-29420-
#EN-29430-
#EN-29440-
#EN-29450-
#EN-29460-
#EN-29470-
#EN-29480-
#EN-29490-
#EN-29500-
#EN-29510-
#EN-29520-
#EN-29530-
#EN-29540-
#EN-29550-
#EN-29560-
#EN-29570-
#EN-29580-

####################################################################################
#EN-29590-
####################################################################################
function meterProcesosBandaMemoria {
#EN-29600-
		ud=0
		ra=0
#EN-29610-
			ra=$primeraUnidadFuturoProcesoSinreubicar
		fi
#EN-29620-
			if [[ ${unidMemOcupadas[$ra]} == "_" ]]; then
				unidMemOcupadas[$ra]=$po
				ud=$((ud+1))
				mem_libre=$((mem_libre - 1))
			fi
#EN-29630-
#EN-29640-
#EN-29650-
#EN-29660-
			ra=$((ra+1))
		done
	fi
#EN-29670-

####################################################################################
#EN-29680-
####################################################################################
function calculosPrepararLineasImpresionBandaMemoria {
#EN-29690-
#EN-29700-
	arribaMemoriaNC="   |"
	arribaMemoriaNCb="   |"
#EN-29710-
	for (( ra=0; ra<$mem_num_marcos; ra++ )); do
#EN-29720-
		for (( po=0; po<$nprocesos; po++ )); do
			if [[ $ra -eq 0 && ${unidMemOcupadas[$ra]} == $po ]]; then 
#EN-29730-
#EN-29740-
			fi
#EN-29750-
#EN-29760-
#EN-29770-
#EN-29780-
				arribaMemoriaNC=$arribaMemoriaNC${coloress[$po % 6]}"${varhuecos:1:$digitosUnidad}"$NC
				arribaMemoriaNCb=$arribaMemoriaNCb"${varhuecos:1:$digitosUnidad}"
			fi
		done
#EN-29790-
		if [[ ${unidMemOcupadas[$ra]} == '_' ]]; then 
			arribaMemoriaNC=$arribaMemoriaNC"${varhuecos:1:$digitosUnidad}"$NC
			arribaMemoriaNCb=$arribaMemoriaNCb"${varhuecos:1:$digitosUnidad}"
		fi
	done

#EN-29800-
#EN-29810-
	barraMemoriaNC="BM |"
#EN-29820-
#EN-29830-
	coloresPartesMemoria=(" ${coloresPartesMemoria[@]}" "${coloress[97]}" "${coloress[97]}" "${coloress[97]}")
#EN-29840-
#EN-29850-
			barraMemoriaNC=$barraMemoriaNC${coloress[${unidMemOcupadas[$ra]} % 6]}"${varfondos:1:$digitosUnidad}"$NC
			barraMemoriaNCbPantalla=$barraMemoriaNCbPantalla"${varfondos:1:$digitosUnidad}"
		fi
#EN-29860-
			barraMemoriaNC=$barraMemoriaNC" "${coloress[97]}"${varfondos:1:$digitosUnidad}"$NC
			barraMemoriaNCbPantalla=$barraMemoriaNCbPantalla"${varfondos:1:$digitosUnidad}"
		fi
	done

#EN-29870-
	abajoMemoriaNC="   |"
	abajoMemoriaNCb="   |"
	for (( ra=0; ra<$mem_num_marcos; ra++ )); do
#EN-29880-
#EN-29890-
		if [[ $ra -eq 0 ]] ; then 
#EN-29900-
#EN-29910-
		fi
		for (( po=0; po<$nprocesos; po++ )); do
#EN-29920-
			if [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} != $po  && ${unidMemOcupadas[$ra]} == $po ]] ; then 
#EN-29930-
#EN-29940-
#EN-29950-
			elif [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} == $po  && ${unidMemOcupadas[$ra]} == $po ]] ; then 
				abajoMemoriaNC=$abajoMemoriaNC"${varhuecos:1:$digitosUnidad}"$NC
				abajoMemoriaNCb=$abajoMemoriaNCb"${varhuecos:1:$digitosUnidad}"
			fi
		done
#EN-29960-
#EN-29970-
		if [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} != "_" && ${unidMemOcupadas[$ra]} == "_" ]] ; then 
#EN-29980-
#EN-29990-
#EN-30000-
#EN-30010-
			abajoMemoriaNC=$abajoMemoriaNC"${varhuecos:1:$digitosUnidad}"$NC
			abajoMemoriaNCb=$abajoMemoriaNCb"${varhuecos:1:$digitosUnidad}"
		fi
	done
	
#EN-30020-
#EN-30030-
#EN-30040-
	fi
	for (( ra=1; ra<$mem_num_marcos; ra++ )); do
#EN-30050-
#EN-30060-
		fi
	done
#EN-30070-
#EN-30080-
		if [[ ${bloques[$i]} -le 1 ]]; then #Una por proceso, esté o no en memoria, y una más por cada bloque añadido más allá del primero.  #Recorre el número de bloques en los que se fragmenta un proceso
#EN-30090-
		else 
#EN-30100-
		fi
	done
#EN-30110-
		inicialNC[$i]=0
		finalNC[$i]=0
	done
#EN-30120-
	main=0
	mafi=0
	for (( po=0 ; po<$nprocesos; po++ )); do
#EN-30130-
			inicialNC[$main]="-"
			main=$((main+1))
			finalNC[$mafi]="-"
			mafi=$((mafi+1))
#EN-30140-
			contadori=0
			contadorf=0
#EN-30150-
				for (( ra=0; ra<$mem_num_marcos ; ra++ )) ; do
#EN-30160-
#EN-30170-
						main=$((main+1))
						contadori=$((contadori+1))
					fi
					if [[ $ra -ne 0  &&  ${unidMemOcupadas[$((ra - 1))]} != $po && ${unidMemOcupadas[$ra]} == $po ]] ; then
#EN-30180-
						main=$((main+1))
						contadori=$((contadori+1))
					fi
					if [[ $ra -ne 0  &&  $ra -ne $((mem_num_marcos-1)) && ${unidMemOcupadas[$ra]} == $po && ${unidMemOcupadas[$((ra + 1))]} != $po ]] ; then
#EN-30190-
						mafi=$((mafi+1))
						contadorf=$((contadorf+1))
					fi
#EN-30200-
#EN-30210-
						mafi=$((mafi+1))
						contadorf=$((contadorf+1))
					fi
				done
			done
		fi
	done
#EN-30220-

####################################################################################
#EN-30230-
####################################################################################
#EN-30240-
#EN-30250-

#EN-30260-
#EN-30270-
	bandaProcesos=("    |")
	bandaProcesosColor=("$NORMAL    |")
	numCaracteres2=5
#EN-30280-
#EN-30290-
#EN-30300-
#EN-30310-
#EN-30320-
				bandaProcesos[$nn]="     "
				bandaProcesosColor[$nn]="     "
				numCaracteres2=5
			fi
#EN-30330-
				xx=0
			fi
#EN-30340-
#EN-30350-
				bandaProcesos[$nn]+=`echo -e "${proceso[$((${unidMemOcupadas[$ii]}))]}""$espaciosfinal"`
				bandaProcesosColor[$nn]+=`echo -e "${coloress[${unidMemOcupadas[$ii]} % 6]}${proceso[$((${unidMemOcupadas[$ii]}))]}""$NORMAL$espaciosfinal"`
				numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
				xx=1
			else
#EN-30360-
#EN-30370-
					bandaProcesos[$nn]="     "
					bandaProcesosColor[$nn]="     "
					numCaracteres2=5
				fi
				espaciosfinal=${varhuecos:1:$(($digitosUnidad))}
				bandaProcesos[$nn]+=`echo -e "$espaciosfinal"`
				bandaProcesosColor[$nn]+=`echo -e "$NORMAL$espaciosfinal"`
				numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
				if [[ $ii -ne 0 ]]; then
					if [[ ${unidMemOcupadas[$((ii - 1))]} !=  "_" ]]; then
						if [[ $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$ii]}))]} != ${proceso[$((${unidMemOcupadas[$((ii - 1))]}))]} ]]; then
							xx=0
						fi
					fi
				fi
			fi
		else
			xx=0
#EN-30380-
#EN-30390-
				bandaProcesos[$nn]="     "
				bandaProcesosColor[$nn]="     "
				numCaracteres2=5
			fi
			espaciosfinal=${varhuecos:1:$(($digitosUnidad))}
			bandaProcesos[$nn]+=`echo -e "$espaciosfinal"`
			bandaProcesosColor[$nn]+=`echo -e "$NORMAL$espaciosfinal"`
			numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
		fi
	done
#EN-30400-
	if [[ $(($numCaracteres2 + 5 + ${#mem_num_marcos} + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
#EN-30410-
		bandaProcesos[$nn]="     "
		bandaProcesosColor[$nn]="     "
		numCaracteres2=5
	fi
	bandaProcesos[$nn]+=`echo -e "|"`
	bandaProcesosColor[$nn]+=`echo -e "$NORMAL|"`

#EN-30420-
#EN-30430-
	bandaMemoria=(" BM |")
	bandaMemoriaColor=("$NORMAL BM |")
	numCaracteres2=5
	espaciosAMeter=${varfondos:1:$digitosUnidad}
	guionesAMeter=${varguiones:1:$digitosUnidad}
	asteriscosAMeter=${varasteriscos:1:$digitosUnidad}
	fondosAMeter=${varfondos:1:$digitosUnidad}
	sumaTotalMemoria=0
#EN-30440-
	for (( i=0; i<$nprocesos; i++)); do 
#EN-30450-
	done
			
#EN-30460-
#EN-30470-
#EN-30480-
#EN-30490-
				bandaMemoria[$nn]="     "
				bandaMemoriaColor[$nn]="     "
				numCaracteres2=5
			fi
#EN-30500-
			if [[ ${#paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]} -eq 0 ]]; then #Si no hay página se mete asterisco en BN.
#EN-30510-
#EN-30520-
#EN-30530-
			fi
			bandaMemoria[$nn]+=`echo -e "$espaciosasteriscofinal${paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]}"`
			bandaMemoriaColor[$nn]+=`echo -e "$NC${colorfondo[${unidMemOcupadas[$ii]} % 6]}$espaciosfinal${paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]}$NC"`
#EN-30540-
			numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
			if [[ $ii -ne 0 ]]; then
				if [[ ${unidMemOcupadas[$((ii - 1))]} !=  "_" ]]; then 
					if [[ $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$ii]}))]} != ${proceso[$((${unidMemOcupadas[$((ii - 1))]}))]} ]]; then
						xx=0
					fi
				fi
			fi
#EN-30550-
			xx=0
#EN-30560-
#EN-30570-
				bandaMemoria[$nn]="     "
				bandaMemoriaColor[$nn]="     "
				numCaracteres2=5
			fi
#EN-30580-
			bandaMemoria[$nn]+=`echo -e "$espaciosguionfinal"`
			bandaMemoriaColor[$nn]+=`echo -e "$NC$fondosAMeter$NC"`
			numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
		fi
	done

#EN-30590-
	if [[ $(($numCaracteres2 + 5 + ${#mem_num_marcos} + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
#EN-30600-
		bandaMemoria[$nn]="     "
		bandaMemoriaColor[$nn]=$NORMAL"     "
		numCaracteres2=5
	fi
#EN-30610-
#EN-30620-

#EN-30630-
#EN-30640-
	bandaPosicion=("    |")
	bandaPosicionColor=("$NORMAL    |")
	numCaracteres2=5
#EN-30650-
#EN-30660-
#EN-30670-
#EN-30680-
#EN-30690-
				bandaPosicion[$nn]="     "
				bandaPosicionColor[$nn]="     "
				numCaracteres2=5
			fi
#EN-30700-
				xx=0
			fi
#EN-30710-
#EN-30720-
				bandaPosicion[$nn]+=`echo -e "$espaciosfinal""$ii"`
				bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal""$ii"`
				numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
				xx=1
			else
#EN-30730-
#EN-30740-
					bandaPosicion[$nn]="     "
					bandaPosicionColor[$nn]="     "
					numCaracteres2=5
				fi
				espaciosfinal=${varhuecos:1:$(($digitosUnidad))}
				bandaPosicion[$nn]+=`echo -e "$espaciosfinal"`
				bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal"`
				numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
				if [[ $ii -ne 0 ]]; then
					if [[ ${unidMemOcupadas[$((ii - 1))]} !=  "_" ]]; then
						if [[ $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$ii]}))]} != ${proceso[$((${unidMemOcupadas[$((ii - 1))]}))]} ]]; then
							xx=0
						fi
					fi
				fi
			fi
		else
			xx=0
#EN-30750-
#EN-30760-
				bandaPosicion[$nn]="     "
				bandaPosicionColor[$nn]="     "
				numCaracteres2=5
			fi
			if [[ $ii -ne 0 ]]; then
				if [[ ${unidMemOcupadas[$((ii - 1))]} != "_" ]]; then
#EN-30770-
					bandaPosicion[$nn]+=`echo -e "$espaciosfinal""$ii"`
					bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal""$ii"`
				else
					espaciosfinal=${varhuecos:1:$(($digitosUnidad))}
					bandaPosicion[$nn]+=`echo -e "$espaciosfinal"`
					bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal"`
				fi
			else
#EN-30780-
				bandaPosicion[$nn]+=`echo -e "$espaciosfinal""$ii"`
				bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal""$ii"`
			fi
			numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
		fi
	done
#EN-30790-
	if [[ $(($numCaracteres2 + 5 + ${#mem_num_marcos} + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
#EN-30800-
		bandaPosicion[$nn]="     "
		bandaPosicionColor[$nn]="$NORMAL     "
		numCaracteres2=5
	fi
	bandaPosicion[$nn]+=`echo -e "|"`
	bandaPosicionColor[$nn]+=`echo -e "$NORMAL|"`

#EN-30810-
#EN-30820-
		echo -e "${bandaProcesosColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${bandaMemoriaColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${bandaPosicionColor[$jj]}\n" | tee -a $informeConColorTotal
		echo -e "${bandaProcesos[$jj]}" >> $informeSinColorTotal
		echo -e "${bandaMemoria[$jj]}" >> $informeSinColorTotal
		echo -e "${bandaPosicion[$jj]}\n" >> $informeSinColorTotal
	done
 
#EN-30830-
#EN-30840-
#EN-30850-
		unidMemOcupadasAux[$ca]="_"
	done
#EN-30860-
#EN-30870-
		 bloques[$ca]=0
	done
#EN-30880-
	nposiciones=0
#EN-30890-
	for (( i=0; i<$nposiciones; i++ )) ; do
		 inicialNCmodelo[$i]=0
	done
	for (( i=0; i<$nposiciones; i++ )) ; do 
		 finalNCmodelo[$i]=0
	done
#EN-30900-

####################################################################################
#EN-30910-
####################################################################################
function calculosImpresionBandaTiempos { 
#EN-30920-
#EN-30930-
#EN-30940-
#EN-30950-
		
#EN-30960-
#EN-30970-
#EN-30980-
	arribatiempoNC_0="    |"
	arribatiempoNCb_0="    |"
	tiempoNC_0=" BT |"
	tiempoNCb_0=" BT |"
	abajotiempoNC_0="    |"
	abajotiempoNCb_0="    |"
#EN-30990-
#EN-31000-
#EN-31010-
		arribatiempoNC=$arribatiempoNC_0"${varhuecos:1:$(($digitosUnidad))}"$NC 
		arribatiempoNCb=$arribatiempoNCb_0"${varhuecos:1:$(($digitosUnidad))}"
		tiempoNC=$tiempoNC_0"${varhuecos:1:$(($digitosUnidad))}"$NC 
		tiempoNCb=$tiempoNCb_0"${varhuecos:1:$(($digitosUnidad))}"
		abajotiempoNC=$abajotiempoNC_0"${varhuecos:1:$(($digitosUnidad - 1))}0"$NC
		abajotiempoNCb=$abajotiempoNCb_0"${varhuecos:1:$(($digitosUnidad - 1))}0"
	fi
#EN-31020-
		for (( i=0 ; i<$(($reloj)) ; i++ )) ; do
			if [[ $tiempodibujado -eq 0 ]]; then
				arribatiempoNC=$arribatiempoNC_0"${varhuecos:1:$(($digitosUnidad))}""${coloress[$i % 6]}"
				arribatiempoNCb=$arribatiempoNCb_0"${varhuecos:1:$(($digitosUnidad))}"
#EN-31030-
				tiempoNCb=$tiempoNCb_0"${varguiones:1:$(($digitosUnidad))}"
				abajotiempoNC=$abajotiempoNC_0"${varhuecos:1:$(($digitosUnidad - 1))}0"
				abajotiempoNCb=$abajotiempoNCb_0"${varhuecos:1:$(($digitosUnidad - 1))}0"
				tiempodibujado=$(($tiempodibujado + 1))
#EN-31040-
				arribatiempoNC=$arribatiempoNC"${varhuecos:1:$(($digitosUnidad))}""${coloress[$i % 6]}"
				arribatiempoNCb=$arribatiempoNCb"${varhuecos:1:$(($digitosUnidad))}"
#EN-31050-
				tiempoNCb=$tiempoNCb"${varguiones:1:$(($digitosUnidad))}"
				abajotiempoNC=$abajotiempoNC"${varhuecos:1:$(($digitosUnidad))}"
				abajotiempoNCb=$abajotiempoNCb"${varhuecos:1:$(($digitosUnidad))}"
				tiempodibujado=$(($tiempodibujado + 1))
			fi
		done
	fi
	
#EN-31060-
#EN-31070-
#EN-31080-
#EN-31090-
#EN-31100-
#EN-31110-
		if [[ ${nomtiempo[$proanterior]} == 1 && ${dibujasNC[$proanterior]} -eq ${tejecucion[$proanterior]} ]]; then 
#EN-31120-
#EN-31130-
			for (( i=0 ; i<$contad; i++ )); do
				arribatiempoNC=$arribatiempoNC"${varhuecos:1:$(($digitosUnidad))}"$NC
				arribatiempoNCb=$arribatiempoNCb"${varhuecos:1:$(($digitosUnidad))}""222"
#EN-31140-
				tiempoNCb=$tiempoNCb"${varguiones:1:$(($digitosUnidad))}"
				abajotiempoNC=$abajotiempoNC"${varhuecos:1:$(($digitosUnidad))}"$NC
				abajotiempoNCb=$abajotiempoNCb"${varhuecos:1:$(($digitosUnidad))}"
				colorAnterior
				tiempodibujado=$(($tiempodibujado + 1))
			done
			dibujasNC[$proanterior]=0
		fi 
#EN-31150-
#EN-31160-
	for (( po=0; po<$nprocesos; po++)) ; do
		if ( [[ $tiempodibujado -eq $reloj && ${dibujasNC[$po]} -eq ${tejecucion[$po]} && ${estad[$po]} -eq 3 ]] ) ; then 
			arribatiempoNC=$arribatiempoNC"${coloress[$po % 6]}${proceso[$po]}""${varhuecos:1:$(($digitosUnidad - ${proceso[$po]}))}"$NC
			arribatiempoNCb=$arribatiempoNCb"${proceso[$po]}""${varhuecos:1:$(($digitosUnidad - ${proceso[$po]}))}"
#EN-31170-
			tiempoNCb=$tiempoNCb"${varhuecos:1:$(($digitosUnidad))}"
#EN-31180-
#EN-31190-
			tiempodibujado=$(($tiempodibujado + 1))
		fi
#EN-31200-
	done
#EN-31210-

####################################################################################
#EN-31220-
#EN-31230-
####################################################################################
function dibujarBandaTiempos {     
#EN-31240-
#EN-31250-
	local maxCaracteres=0
	maxCaracteres=$((${#sumaParaEspacios} + 1)) # Longitud en número de dígitos de cada unidad 
	if [[ $maxCaracteres -eq 2 ]]; then
#EN-31260-
	fi
#EN-31270-
#EN-31280-
		if [[ ${estado[$s]} == "En ejecución" ]]; then
#EN-31290-
		fi
	done

#EN-31300-
	local bandaProcesos=("    |")
	local bandaProcesosColor=($NORMAL"    |")
#EN-31310-
	local numCaracteres=5
	espaciosAMeter=${varhuecos:1:$maxCaracteres}
	guionesAMeter=${varguiones:1:$maxCaracteres}
	fondosAMeter=${varfondos:1:$maxCaracteres}
	for ((k = 0; k <= $reloj; k++)); do
#EN-31320-
#EN-31330-
#EN-31340-
				bandaProcesos[n]+=`printf "%-$(($maxCaracteres))s" $p`
				bandaProcesosColor[n]+=`printf "${coloress[${procPorUnidadTiempoBT[$k]} % 6]}%-$(($maxCaracteres))s$NORMAL" $p`
#EN-31350-
				bandaInstantes[n]+=`echo -e $espaciosAMeter`
				bandaInstantesColor[n]+=`echo -e $espaciosAMeter`
			fi
			numCaracteres=$(($numCaracteres + $maxCaracteres))
#EN-31360-
#EN-31370-
#EN-31380-
				bandaProcesos[n]="     "
				bandaProcesosColor[n]="     "
				numCaracteres=5
			fi
#EN-31390-
				bandaProcesos[n]+=`printf "%$(($maxCaracteres))s" ""`
				bandaProcesosColor[n]+=`printf "%$(($maxCaracteres))s" ""`
#EN-31400-
#EN-31410-
				bandaProcesos[n]+=`printf "%-$(($maxCaracteres))s" $p`
				bandaProcesosColor[n]+=`printf "${coloress[${procPorUnidadTiempoBT[$k]} % 6]}%-$(($maxCaracteres))s$NORMAL" $p`
			fi
			numCaracteres=$(($numCaracteres + $maxCaracteres))
		fi
	done
#EN-31420-
#EN-31430-
#EN-31440-
		bandaProcesos[n]="     "
		bandaProcesosColor[n]="     "
		numCaracteres=5
	fi
	bandaProcesos[n]+=`printf "|    %$(($maxCaracteres))s" ""`
	bandaProcesosColor[n]+=`printf "|    %$(($maxCaracteres))s" ""`

#EN-31450-
	local bandaTiempo=(" BT |")
	local bandaTiempoColor=(" BT |")
#EN-31460-
	local numCaracteres=5
	for (( i=0; i<$nprocesos; i++)); do 
#EN-31470-
	done
	for ((k = 0; k <= $reloj; k++)); do
#EN-31480-
#EN-31490-
			bandaTiempo[n]="     "
			bandaTiempoColor[n]="     "
			numCaracteres=5
		fi
#EN-31500-
#EN-31510-
				if [[ $k -eq 0 ]]; then
					espaciosguionfinal=${varhuecos:1:$(($digitosUnidad - 1))}"-"
					bandaTiempo[n]+=$espaciosguionfinal
					bandaTiempoColor[n]+=$espaciosguionfinal
				else
					bandaTiempo[n]+=$espaciosAMeter
					bandaTiempoColor[n]+=$espaciosAMeter
				fi
#EN-31520-
#EN-31530-
				bandaTiempo[n]+=$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}
				bandaTiempoColor[n]+=$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}
			fi
#EN-31540-
			if [[ ${procPorUnidadTiempoBT[$k]} -eq $topeProcPorUnidadTiempoBT ]]; then # || ${procPorUnidadTiempoBT[$k]} = 0 ]]# Si NO hay proceso en ejecución asociado a ese instante. Vale 0 si no está definido porque la inicialización empieza en posición=1.
				espaciosguionfinal=${varhuecos:1:$(($digitosUnidad - 1))}"-"
				bandaTiempo[n]+=$espaciosguionfinal
				bandaTiempoColor[n]+=$fondosAMeter
#EN-31550-
#EN-31560-
				bandaTiempo[n]+=$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}
#EN-31570-
					bandaTiempoColor[n]+=$NC${colorfondo[${procPorUnidadTiempoBT[$k]} % 6]}$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}$NC
#EN-31580-
#EN-31590-
						bandaTiempoColor[n]+=$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}$NC
#EN-31600-
						bandaTiempoColor[n]+=$NC${colorfondo[${procPorUnidadTiempoBT[$k]} % 6]}$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}$NC                    
					fi
				fi
#EN-31610-
			fi
		fi
		numCaracteres=$(($numCaracteres + $maxCaracteres))
	done

#EN-31620-
#EN-31630-
#EN-31640-
		bandaTiempo[n]="     "
		bandaTiempoColor[n]="     "
		numCaracteres=5
	fi
	bandaTiempo[n]+=`printf "|T= %-${maxCaracteres}d" $reloj`
	bandaTiempoColor[n]+=$NC`printf "|T= %-${maxCaracteres}d" $reloj`

#EN-31650-
	local bandaInstantes=("    |")
	local bandaInstantesColor=($NC"    |")
#EN-31660-
	local numCaracteres=5
	for ((k = 0; k <= $reloj; k++)); do
#EN-31670-
#EN-31680-
#EN-31690-
#EN-31700-
					bandaInstantes[n]="     "
					bandaInstantesColor[n]=$NC"     "
					numCaracteres=5
				fi
				bandaInstantes[n]+=`printf "%${maxCaracteres}d" $k`
				bandaInstantesColor[n]+=`printf "%${maxCaracteres}d" $k`
				numCaracteres=$(($numCaracteres + $maxCaracteres))
#EN-31710-
#EN-31720-
#EN-31730-
					bandaInstantes[n]="     "
					bandaInstantesColor[n]=$NC"     "
					numCaracteres=5
				fi
				bandaInstantes[n]+=`printf "%${maxCaracteres}s" ""`
				bandaInstantesColor[n]+=`printf "%${maxCaracteres}s" ""`
				numCaracteres=$(($numCaracteres + $maxCaracteres))
			fi
#EN-31740-
#EN-31750-
#EN-31760-
				bandaInstantes[n]="     "
				bandaInstantesColor[n]=$NC"     "
				numCaracteres=5
			fi
			bandaInstantes[n]+=`printf "%${maxCaracteres}d" $k`
			bandaInstantesColor[n]+=`printf "%${maxCaracteres}d" $k`
			numCaracteres=$(($numCaracteres + $maxCaracteres))
		fi
	done
#EN-31770-
#EN-31780-
#EN-31790-
		bandaInstantes[n]="     "
		bandaInstantesColor[n]=$NC"     "
		numCaracteres=5
	fi
	bandaInstantes[n]+=`printf "|    %$(($maxCaracteres))s" ""`
	bandaInstantesColor[n]+=`printf "|    %$(($maxCaracteres))s" ""`

#EN-31800-
#EN-31810-
		echo -e "${bandaProcesos[$i]}" >> $informeSinColorTotal
		echo -e "${bandaTiempo[$i]}" >> $informeSinColorTotal
		echo -e "${bandaInstantes[$i]}\n" >> $informeSinColorTotal
		echo -e "${bandaProcesosColor[$i]}" | tee -a $informeConColorTotal
		echo -e "${bandaTiempoColor[$i]}" | tee -a $informeConColorTotal
		echo -e "${bandaInstantesColor[$i]}\n" | tee -a $informeConColorTotal
	done    

	#########################################################
#EN-31820-
#EN-31830-
		echo -e " Pulse ENTER para continuar.$NC" | tee -a $informeConColorTotal
		echo -e " Pulse ENTER para continuar." >> $informeSinColorTotal
		read continuar
		echo -e $continuar "\n" >> $informeConColorTotal
		echo -e $continuar "\n" >> $informeSinColorTotal
#EN-31840-
#EN-31850-
		echo -e "───────────────────────────────────────────────────────────────────────$NC" | tee -a $informeConColorTotal
		echo -e "───────────────────────────────────────────────────────────────────────" >> $informeSinColorTotal
#EN-31860-
#EN-31870-
		echo -e " Espere para continuar...$NC\n" | tee -a $informeConColorTotal
		echo -e " Espere para continuar...\n" >> $informeSinColorTotal
		sleep $tiempoejecucion 
#EN-31880-
#EN-31890-

####################################################################################
#EN-31900-
#EN-31910-
####################################################################################
function resultadoFinalDeLaEjecucion {
	echo "$NORMAL Procesos introducidos (ordenados por tiempo de llegada):" | tee -a $informeConColorTotal
	echo -e " ┌─────┬─────┬─────┬─────┬──────┬──────┐" | tee -a $informeConColorTotal
	echo -e " │ Ref │ Tll │ Tej │ Mem │ TEsp │ Tret │" | tee -a $informeConColorTotal   
	echo -e " ├─────┼─────┼─────┼─────┼──────┼──────┤" | tee -a $informeConColorTotal
	echo -e " ┌─────┬─────┬─────┬─────┬──────┬──────┐" >> $informeSinColorTotal
	echo -e " │ Ref │ Tll │ Tej │ Mem │ TEsp │ Tret │" >> $informeSinColorTotal
	echo -e " ├─────┼─────┼─────┼─────┼──────┼──────┤" >> $informeSinColorTotal
	
#EN-31920-
		echo -e " │ ${varC[$i]}${proceso[$i]}$NC │"\
#EN-31930-
#EN-31940-
#EN-31950-
#EN-31960-
#EN-31970-
#EN-31980-
#EN-31990-
#EN-32000-
#EN-32010-
#EN-32020-
	done
	echo " └─────┴─────┴─────┴─────┴──────┴──────┘" | tee -a $informeConColorTotal
	echo " └─────┴─────┴─────┴─────┴──────┴──────┘">> $informeSinColorTotal

#EN-32030-
	dividir=0
	for (( i=0; i<nprocesos; i++ )) ; do
		if [[ ${estad[$i]} -ne 0 ]] ; then 
			dividir=$((dividir+1))
		fi
	done
	suma_espera=0
	suma_retorno=0
	suma_contadorAlgPagFallosProcesoAcumulado=0
	suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado=0
	for (( i=0; i<nprocesos; i++ )); do
		tam=${memoria[$i]};
#EN-32040-
#EN-32050-
#EN-32060-

#EN-32070-
#EN-32080-
		fi
		suma_contadorAlgPagFallosProcesoAcumulado=$(($suma_contadorAlgPagFallosProcesoAcumulado + ${contadorAlgPagFallosProcesoAcumulado[$i]}))
		suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado=$(($suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado + ${contadorAlgPagExpulsionesForzadasProcesoAcumulado[$i]}))
	done
	echo -e "\n ┌─────────────────────────────┬─────────────────────────────┐" | tee -a $informeConColorTotal 
#EN-32090-
#EN-32100-
	echo -e " └─────────────────────────────┴─────────────────────────────┘" | tee -a $informeConColorTotal 
	echo -e "\n ┌─────────────────────────────┬─────────────────────────────┐" >> $informeSinColorTotal
#EN-32110-
#EN-32120-
	echo -e " └─────────────────────────────┴─────────────────────────────┘" >> $informeSinColorTotal
	echo -e "\n ┌───────────────────────────────────────────────────────────┐" | tee -a $informeConColorTotal 
#EN-32130-
	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then
#EN-32140-
	fi
	echo -e " └───────────────────────────────────────────────────────────┘" | tee -a $informeConColorTotal 
	echo -e "\n ┌───────────────────────────────────────────────────────────┐" >> $informeSinColorTotal
#EN-32150-
	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then
#EN-32160-
	fi
	echo -e " └───────────────────────────────────────────────────────────┘" >> $informeSinColorTotal
#EN-32170-
		echo -ne $ROJO"\n\n Pulsa ENTER para continuar "$NORMAL
		read enter
	fi
#EN-32180-

####################################################################################
#EN-32190-
####################################################################################
function mostrarInforme {
#EN-32200-
		echo -e "\n Final del proceso, puede consultar la salida en el fichero informeBN.txt" 
		echo -e "\n Pulse enter para las opciones de visualización del fichero informeBN.txt..."
		read enter
	fi
#EN-32210-
	cecho -e " -----------------------------------------------------"  $FRED
	cecho -e "         V I S U A L I Z A C I Ó N " $FYEL
	cecho -e " -----------------------------------------------------"  $FRED
	cecho -e " 1) Leer el fichero informeBN.txt en el terminal" $FYEL
	cecho -e " 2) Leer el fichero informeBN.txt en el editor gedit" $FYEL
	cecho -e " 3) Leer el fichero informeCOLOR.txt en el terminal" $FYEL
	cecho -e " 4) Salir y terminar"  $FYEL
	cecho -e " -----------------------------------------------------\n" $FRED
	cecho -e " Introduce una opcion: " $NC
	num=0 
	continuar="SI"
	while [[ $num -ne 4 && "$continuar" == "SI" ]]; do
		read num
#EN-32220-
		until [[ 0 -lt $num && $num -lt 5 ]];  do
			echo -ne "\n Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
			echo -ne "\n Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
			read num
			echo -ne "$num\n\n" >> $informeConColorTotal
			echo -ne "$num\n\n" >> $informeSinColorTotal
		done
		case $num in
			'1' )  
#EN-32230-
				cat $informeSinColorTotal
				exit 0
				;;
			'2' ) 
#EN-32240-
				gedit $informeSinColorTotal
				exit 0
				;;
			'3' )
#EN-32250-
				cat $informeConColorTotal
				exit 0
				;;
			'4' )
#EN-32260-
				exit 0
				;;
			*) 
				num=0
				cecho "Opción errónea, vuelva a introducir:" $FRED
		esac
	done
#EN-32270-

####################################################################################
####################################################################################
#EN-32280-
####################################################################################
####################################################################################
function inicioNuevo {
#EN-32290-
#EN-32300-
#EN-32310-

#EN-32320-
#EN-32330-
	if [[ seleccionMenuAlgoritmoGestionProcesos -ne 4 ]]; then 
#EN-32340-
	elif [[ seleccionMenuAlgoritmoGestionProcesos -eq 4 ]]; then 
#EN-32350-
	fi
	
#EN-32360-
#EN-32370-
	contador=1
#EN-32380-
#EN-32390-
#EN-32400-
	realizadoAntes=0

	while [[ "$parar_proceso" == "NO" ]]; do
#EN-32410-
		timepoAux=`expr $reloj + 1`

#EN-32420-
#EN-32430-
			if [[ ${llegada[$i]} == $reloj ]]; then
				encola[$i]=1
				fueraDelSistema[$i]=0
				evento=1
				avisollegada[$i]=1
			elif [[ ${llegada[$i]} -lt $reloj ]] ; then 
				fueraDelSistema[$i]=0
			else
				fueraDelSistema[$i]=1
			fi
		done

#EN-32440-
#EN-32450-
			if [[ ${enejecucion[$i]} -eq 1 && ${temp_rej[$i]} -eq 0 ]]; then 
#EN-32460-
#EN-32470-
#EN-32480-
				avisosalida[$i]=1
				evento=1
#EN-32490-
#EN-32500-
#EN-32510-
				estado[$i]="Finalizado"
#EN-32520-
				pos_inicio[$i]=""
				procFinalizado=$i
			fi
		done
		
#EN-32530-
		
#EN-32540-
#EN-32550-
		if [[ $mem_libre -gt 0 ]]; then  
			reubicarReubicabilidad=0 # #Determinará si se debe o no hacer la reubicación de los procesos por condiciones de reubicabilidad. En caso de ser memoria no continua, si hay un hueco demasiado pequeño, y se va a usar como parte de la memoria a usar.
			reubicarContinuidad=0 # #Determinará si se debe o no hacer la reubicación de los procesos por condiciones de continuidad. En caso de ser memoria continua, si no hay un hueco suficientemente grande en el que quepa pero sí en la suma de todos ellos.
#EN-32560-
#EN-32570-
#EN-32580-
#EN-32590-
#EN-32600-
					comprobacionSiguienteProcesoParaMeterMemoria
					meterProcesosBandaMemoria
#EN-32610-
						break
					fi
				done
			else
#EN-32620-
#EN-32630-
#EN-32640-
			fi
		fi

#EN-32650-
		inicializarAcumulados 
		
#EN-32660-
#EN-32670-
#EN-32680-
#EN-32690-
#EN-32700-
#EN-32710-
			if [[ $seleccionMenuAlgoritmoGestionProcesos == 1 ]]; then
#EN-32720-
			elif [[ $seleccionMenuAlgoritmoGestionProcesos == 2 ]]; then
#EN-32730-
			elif [[ $seleccionMenuAlgoritmoGestionProcesos == 3 ]]; then
#EN-32740-
			elif [[ $seleccionMenuAlgoritmoGestionProcesos == 4 ]]; then
#EN-32750-
			elif [[ $seleccionMenuAlgoritmoGestionProcesos == 5 ]]; then
#EN-32760-
			fi
		fi
#EN-32770-
#EN-32780-
#EN-32790-
#EN-32800-
#EN-32810-
#EN-32820-
#EN-32830-
#EN-32840-
			calculosPrepararLineasImpresionBandaMemoria
#EN-32850-
#EN-32860-
#EN-32870-
#EN-32880-
#EN-32890-
#EN-32900-
#EN-32910-
				if [[ $seleccionMenuAlgoritmoPaginacion -eq 3 || $seleccionMenuAlgoritmoPaginacion -eq 4 ]]; then
					procFinalizadoOEjecutando=$procFinalizado
#					dibujaResumenReloj #Se dibuja la evolución del reloj para cada proceso con todos los usos de cada página.
				fi
#EN-32920-
#EN-32930-
				procFinalizado=-1
			fi          
			if ([[ $seleccionMenuAlgoritmoPaginacion -eq 3 || $seleccionMenuAlgoritmoPaginacion -eq 4 ]]) && [[ $ejecutandoinst -ne -1 ]]; then
				procFinalizadoOEjecutando=$ejecutandoinst
#EN-32940-
			fi
#EN-32950-
#EN-32960-
#EN-32970-
#EN-32980-
#EN-32990-
#EN-33000-
#EN-33010-
#EN-33020-
		fi
#EN-33030-
#EN-33040-
#EN-33050-
	echo -e "$NORMAL\n Tiempo: $tiempofinal  " | tee -a $informeConColorTotal
	echo -e " Ejecución terminada." | tee -a $informeConColorTotal
	echo -e "$NORMAL -----------------------------------------------------------\n" | tee -a $informeConColorTotal
	echo -e "\n Tiempo: $tiempofinal  " >> $informeSinColorTotal
	echo -e " Ejecución terminada." >> $informeSinColorTotal
	echo -e " -----------------------------------------------------------\n" >> $informeSinColorTotal
#EN-33060-
#EN-33070-
#EN-33080-
	fi
#EN-33090-

####################################################################################
####################################################################################
##############                   PROGRAMA PRINCIPAL                #################
####################################################################################
#EN-33100-
#EN-33110-
#EN-33120-
#EN-33130-
#EN-33140-
