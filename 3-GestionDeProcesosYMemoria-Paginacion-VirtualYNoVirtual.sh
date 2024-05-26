#!/bin/bash
####################################################################################
#                       
#   AUTORES: Los alumnos de la asignatura Sistemas Operativos del Grado en Ingeniería Informática (2014-2024) - Universidad de Burgos 
#	TUTOR: José Manuel Saiz Diez
#  
####################################################################################
# Script realizado para la simulación de un SO que utilice diferentes modelos de gestión de procesos y memoria con un total de 480 opciones diferentes.
# El algoritmo de gestión de procesos se basará en FCFS, SJF, SRPT, Prioridad Mayor y Menor (Apropiativo y No Apropiativo) y Round-Robin.
# La gestión de memoria será paginada y podrá ser Continua y No continua, y Reubicable y no resubicable.
# Y los algoritmos de paginación para la gestión de memoria junto con alguna de sus variantes: FIFO/Reloj/SegOp/Óptimo/MFU/LFU/NFU/MRU/LRU/NRU. 

####################################################################################
# VARIABLES DE EJECUCIÓN
####################################################################################
# seleccionMenuInicio - Opciones iniciales de ayuda y ejecución
# seleccionMenuAyuda - Opciones de ayuda
# seleccionMenuDOCPDF - Opciones de elección de ficheros PDF de ayuda de los algoritmos
# seleccionMenuDOCVideo - Opciones de elección de ficheros de vídeo de ayuda de los algoritmos
# seleccionMenuEnsayos - Opciones de elección de tipos diferentes de ensayos
# seleccionNumEnsayos - Opciones de elección del número de Ensayos a realizar de forma continua
# seleccionMenuAlgoritmoGestionProcesos - Opciones de elección de algoritmo de gestión de Procesos (FCFS/SJF/SRPT/Prioridades/Round-Robin)
# seleccionTipoPrioridad - Opciones del tipo de Prioridad (Mayor/Menor)
# seleccionMenuApropiatividad - Opciones del tipo de Apropiatividad (Apropiativo/No Apropiativo)
# seleccionMenuReubicabilidad - Opciones del tipo de memoria (Reubicable/No Reubicable)
# seleccionMenuContinuidad - Opciones del tipo de memoria (Continua/No Continua)
# seleccionAlgoritmoPaginacion - Opciones para la selección del algoritmo de gestión fallos de paginación
# seleccionAlgoritmoPaginacion_frecuencia_valor - Se define el valor máximo del contador de frecuencia, a partir de la cual, no será considerada.
# seleccionAlgoritmoPaginacion_clases_frecuencia_valor - Se define el valor máximo de la frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
# seleccionAlgoritmoPaginacion_uso_rec_valor - Se define el valor máximo de la antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.
# seleccionAlgoritmoPaginacion_clases_uso_rec_valor - Se define el valor máximo del contador de la antigüedad a partir de la cual no será considerada.
# seleccionAlgoritmoPaginacion_clases_valor - Se define el número de unidades de tiempo de ejecución de un proceso, a partir del cual, serán consideradas la frecuencia/tiempo de uso de una página y su clase.
# seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado - Se define el valor máximo de unidades de tiempo de antigüedad de ejecución de un proceso, a partir de la cual, una página será considerada como NO referenciada.
# seleccionMenuEleccionEntradaDatos - Opciones para la elección de fuente en la introducción de datos (Datos manual/Fichero de datos de última ejecución/Fichero de datos por defecto/Otro fichero de datos...
# .../Rangos manual/Fichero de rangos de última ejecución/Fichero de rangos por defecto/Otro fichero de rangos...
# .../Rangos aleatorios manual/Fichero de rangos aleatorios de última ejecución/Fichero de rangos aleatorios por defecto/Otro fichero de rangos aleatorios)
# .../Rangos aleatorios amplios manual/Fichero de rangos aleatorios amplios de última ejecución/Fichero de rangos aleatorios amplios por defecto/Otro fichero de rangos aleatorios amplios)
# seleccionMenuModoTiempoEjecucionAlgormitmo - Opciones para la elección del tipo de ejecución (Por eventos/Automatico/Completo)
# seleccionMenuPreguntaDondeGuardarDatosManuales - Opciones para la selección del fichero de datos de salida (datosDefault, Otros)
# seleccionMenuPreguntaDondeGuardarRangosManuales - Opciones para la selección del fichero de rangos de salida (rangosDefault, Otros)
# seleccionMenuPreguntaDondeGuardarRangosAleTManuales - Opciones para la selección del fichero de rangos amplios (ficheroRangosAleTotalDefault, Otros)
####################################################################################
# VARIABLES DE REPRESENTACIÓN DEL MAPA DE MEMORIA
####################################################################################
reloj=0 #Variable que guarda el tiempo de ejecución actual
terminal=0 # Ancho del terminal en cada Enter de ejecución de volcados
longCampoTablaEstrecho=3 # ancho de columnas estrechas en tabla resumen de procesos en los volcados 
longCampoTablaAncho=4 # ancho de columnas anchas en tabla resumen de procesos en los volcados 
longCampoTablaMasAncho=5 # ancho de columnas más anchas en tabla resumen de procesos en los volcados 
longCampoDatosReloj=5 # ancho de los datos en el reloj 
longCampoTablaMuyAncho=17 # ancho de columnas muy anchas en tabla resumen de procesos en los volcados 
longCampoTablaRangosCortos=3 # ancho de columnas estrechas en tabla de rangos 
longCampoTablaRangosLargos=9 # ancho de columnas anchas en tabla de rangos 
varhuecos="                                                                                     "
varguiones="------------------------------------------------------------------------------------"
varasteriscos="*********************************************************************************"
varfondos="█████████████████████████████████████████████████████████████████████████████████████"
esc=$(echo -en "\033")
RESET=$esc"[0m"

####################################################################################
# VARIABLES PARA DESTACAR TEXTO CON COLOR
####################################################################################
NORMAL=$esc"[0;m"		#NORMAL=$esc"[1;m"
ROJO=$esc"[0;31m"		#ROJO=$esc"[1;31m"
VERDE=$esc"[0;32m"		#VERDE=$esc"[1;32m"
AMARILLO=$esc"[0;33m"	#AMARILLO=$esc"[1;33m"
AZUL=$esc"[0;34m"		#AZUL=$esc"[1;34m"
MORADO=$esc"[0;35m"		#MORADO=$esc"[1;35m"
CYAN=$esc"[0;36m"		#CYAN=$esc"[1;36m"
#Variables de colores 
amarillo="\033[1;33m";
verde='\e[1;32m';
morado='\e[1;35m';
rojo='\e[1;31m';
cian='\e[1;36m';
gris='\e[1;30m';
azul='\e[1;34m';
blanco='\e[1bold;37m';
NC='\e[0m'; #default	#reset
#Vector de colores
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
coloress[99]='\e[8m' 	#INVISIBLE

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


#Vector de colores con el fondo pintado. 
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
# ANSI color codes
HC="\033[1m"    # hicolor
UL="\033[4m"    # underline
INV="\033[7m"   # inverse background and foreground
FBLK="\033[0;30m" # foreground black
FWHT="\033[0;37m" # foreground white
BBLK="\033[0;40m" # background black

#################################################################################
#     Tablas de trabajo (CAMBIAR ARRAYS Y VARIABLES)
#################################################################################
# reloj - Instante de tiempo que se está tratando en el programa (reloj).
# nprocesos - Número total de procesos.
# encola() Contendrá qué procesos pueden entrar en memoria. Los valores son:
#	0 : El proceso no ha entrado en la cola (no ha "llegado" - Estado "Fuera del sistema") 
#	1 : El proceso está en la cola (Estado "En espera")
# enmemoria() - Procesos que se encuentran en memoria. Los valores son:
#	0 : El proceso no está en memoria
#	1 : El proceso está en memoria esperando a ejecutarse (Estado "En memoria")
# Estados de los procesos:
#	${estad[$i]}=0 - ${estado[$i]}="Fuera del Sistema"
#	${estad[$i]}=1 - ${estado[$i]}="En espera"
#	${estad[$i]}=2 - ${estado[$i]}="En memoria" 
#	${estad[$i]}=3 - ${estado[$i]}="En ejecución" 
#	${estad[$i]}=4 - ${estado[$i]}="En pausa" 
#	${estad[$i]}=5 - ${estado[$i]}="Finalizado"

# Declaración de los arrays:
declare -a dibujasNC #Índices: (proceso). Contiene el número de unidades de ejecución y será usado para controlar que serán representadas en las bandas.
declare -a nombre #Variacble intermedia usada para la creación automática de los nombres de los procesos.
declare -a proceso #Índices: (proceso). Nombre de los procesos (P01,...).
declare -a llegada #Índices: (proceso). Tiempo de llegada de los procesos
declare -a ejecucion #Índices: (proceso). Tiempo de ejecución de los procesos
declare -a memoria #Índices: (proceso). Unidades de memoria asociados a los procesos
declare -a numeroproceso #Variable recogida de datos para ordenar el temporal por tiempo de llegada
declare -a temp_exec #Índices: (proceso). Tiempo ya ejecutado de los procesos
declare -a temp_wait #Índices: (proceso). Tiempo ya esperado por los procesos
declare -a temp_ret #Índices: (proceso). Tiempo de retorno de los procesos
declare -a temp_rej #Índices: (proceso). Tiempo restante de ejecución de los procesos
declare -a pos_inicio #Índices: (proceso). Posición inicial de cada uno de los huecos de memoria asociados a cada proceso.
declare -a pos_final  #Índices: (proceso). Posición final de cada uno de los huecos de memoria asociados a cada proceso.
declare -a fueraDelSistema #Índices: (proceso). Estado inicial de los procesos cuando aún no han llegado al sistema.
declare -a encola #Índices: (proceso). Estado de los procesos cuando han llegado al sistema, pero aún no han entrado a la memoria.    
declare -a enmemoria #Índices: (proceso). Estado de los procesos cuando han entrado en memoria, pero aún no han empezado a ejecutarse.
declare -a enpausa #Índices: (proceso). Estado de los procesos cuando un proceso ya ha empezado a ejecutarse, pero aunque no han terminado de ejecutarse, otro proceso ha comenzado a ejecutarse.
declare -a enejecucion #Índices: (proceso). Estado de los procesos cuando un proceso ya ha empezado a ejecutarse
declare -a bloqueados #Índices: (proceso). Estado de los procesos cuando un proceso está "En Espera" porque ha llegado al sistema pero no puede entrar a memoria.
declare -a terminados #Índices: (proceso). Estado de los procesos cuando ya han terminado de ejecutarse
declare -a terminadosAux #Índices: (proceso). Determina qué procesos han terminado cuyo resumen de fallos de página ha sido imprimido.
declare -a estad #Índices: (proceso). Número asociado a cada estado de los procesos (de 1 a 5).
declare -A estado #Índices: (proceso). Texto asociado a cada estado de los procesos (de "Fuera del Sistema" a "Finalizado").
declare -a unidMemOcupadas #Índices: (ordinal del número de marco). Secuencia de los procesos que ocupan cada marco de la memoria completa
declare -a unidMemOcupadasAux #Índices: (ordinal del número de marco)Matriz auxiliar de la memoria no continua (para reubicar)
declare -a escrito #Índices: (proceso). Bandera para no escibir dos veces un proceso en memoria. Se marca los procesos que se encuentran en memoria y a los que se les ha encontrado espacio sufiente en la banda de memoria. 
declare -a bloques #Almacena el número de bloques en los que se fragmenta un proceso
declare -a inicialNC #Posición inicial de cada bloque en la memoria NO CONTINUA
declare -a finalNC #Posición final de cada bloque en la memoria NO CONTINUA
declare -a inicialNCaux #Posición inicial en la memoria NO CONTINUA para impresiones (cuadrado en tabla)
declare -a finalNCaux #Posición final en la memoria NO CONTINUA para impresiones (cuadrado en tabla)
declare -a inicialNCmodelo #Para borrar posiciones innecesarias tras la impresión
declare -a finalNCmodelo #Para borrar posiciones innecesarias tras la impresión
declare -a nomtiempo #Para saber si un proceso en la barra de tiempo está nombrado, si se ha introducido en las variables de las diferentes líneas.
hayproanterior=0 #Bandera para saber si hay un proceso anterior que finalizar de dibujar
proanterior="_" #Contiene el proceso que se esté tratando en la asignación de dígitos en la representación de la banda de tiempo
declare -a coloresPartesMemoria #Guarda de uno en uno los colores para cada caracter de la barra de memoria (necesario impresión ventana)
declare -a coloresPartesTiempo #Guarda de uno en uno los colores para cada caracter de la línea del tiempo (necesario impresión ventana)
declare -a guardadoMemoria #Array que va a guardar el orden de la reubicacion
declare -a tamanoGuardadoMemoria #Array que guarda en orden de reubicación la memoria que ocupan
reubicabilidadNo0Si1=0 #Si vale 0 no es reubicable. Si vale 1 es reubicable.
continuidadNo0Si1=0 #Si vale 0 es no continua. Si vale 1 es continua.
declare -a procPorUnidadTiempoBT #En cada casilla (instante actual - reloj) se guarda el número de orden del proceso que se ejecuta en cada instante.
anteriorProcesoEjecucion=-1 #Usada en gestionProcesosSRPT para determinar la anteriorproceso en ejecución que se compara con el actual tiempo restante de ejecución más corto y que va a ser definida como el actual proceso en ejecución.
declare -A directions #Direcciones definidas de todos los Proceso (Índices:Proceso, Direcciones).
declare -A paginasDefinidasTotal #Páginas definidas de todos los Proceso (Índices:Proceso, Páginas).
declare -A numeroPaginasUsadasProceso #Número de Páginas ya usadas de cada Proceso (Índices:Proceso).
declare -A paginasUsadasProceso #Secuencia de Páginas ya usadas de cada Proceso (Índices:Proceso).
declare -A paginasUsadasTotal #Páginas ya usadas del Proceso en ejecución. Sale de forma secuencial de paginasDefinidasTotal. (Índices:Proceso)
declare -A paginasPendientesUsarTotal #Páginas pendientes de ejecutar del Proceso en ejecución. Sale de forma secuencial de paginasDefinidasTotal. (Índices:Proceso) 
declare -A paginaAUsar #Siguiente Página a ejecutar del Proceso en ejecución. Sale de forma secuencial de paginasDefinidasTotal con el delimitador de numeroPaginasUsadasProceso. (Índices:Proceso)
declare -A paginasEnMemoriaProceso #Páginas residentes en memoria del Proceso en ejecución. Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación. (Índices:Página)
declare -A paginasEnMemoriaTotal #Páginas residentes en memoria de cada Proceso (Índices:Proceso,número ordinal de marco asociado). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
declare -A numMarcosDibujadosPorProceso #Contiene el número de Marcos de Memoria con Páginas ya dibujadas de cada Proceso.
declare -A contadorAlgPagFallosTotalesProcesos #Fallos de página totales de cada proceso (Índices:Proceso).
declare -A ordinalMarcosProcesoDibujados #Comenzando siempre desde 0, es el ordinal del número de marcos en memoria asociados a cada proceso (Índices:Proceso)
declare -A maxpagsNoVirtual #Define el número de páginas diferentes definidas por cada proceso, y se usa en No Virtual.

declare -A numeroMarcosUsados #Resumen - Índices: (proceso). Dato: Número de Marcos usados en cada Proceso.
declare -A ResuTiempoProceso #Resumen - Índices: (tiempo). Dato: Proceso que se ejecuta en cada instante de tiempo real (reloj).
declare -A ResuTiempoProcesoUnidadEjecucion #Resumen - Índices: (proceso, tiempo de ejecución). Dato: Tiempo de reloj en el que se ejecuta un Proceso.
declare -A ResuPaginaAcumulado #Resumen - Índices: (proceso, marco, reloj). Dato: Página de un proceso que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
declare -A ResuPaginaOrdinalAcumulado #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
declare -A ResuFrecuenciaAcumulado #Resumen - Índices: (proceso, marco, reloj). Dato: Frecuencia de la Página de un proceso que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
declare -A ResuUsoRecienteAcumulado #Resumen - Índices: (proceso, marco, reloj). Dato: Tiempo que hace que se usó la Página de un proceso que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
declare -A ResuPunteroMarcoSiguienteFalloPagAcumulado #Resumen - Índices: (proceso, reloj). Dato: Marco (Puntero) sobre el que se produce el siguiente fallo para todos los Procesos en cada unidad de Tiempo.
declare -A ResuPunteroMarcoUsado #Resumen - Índices: (proceso, tiempo). Dato: Marco usado (Puntero) para cada Proceso en cada unidad de Tiempo.
declare -A filaAlgPagFrecUsoRecColor #Resumen - Índices: (marco, tiempo). Dato: Texto a iprimir en Color con el seguimiento del uso de los Marcos a lo largo del Tiempo (página-frecuencia).
declare -A filaAlgPagFrecUsoRecBN #Resumen - Índices: (marco, tiempo). Dato: Texto a iprimir en Blanco-Negro con el seguimiento del uso de los Marcos a lo largo del Tiempo (página-frecuencia).
declare -A relacionMarcosUsados #Resumen - Índices: (proceso, tiempo, número ordinal de marco). Dato: Relación de Marcos asignados al Proceso en ejecución en cada unidad de tiempo. El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
declare -A indiceResuPaginaAcumulado #Resumen - Índices: (proceso). Dato: Último instante (reloj) en que cada proceso usó una página para realizar los acumulados de páginas y frecuencias de todos los procesos/marcos.
declare -A ResuFallosPaginaProceso #Resumen - Índices: (proceso, tiempo). Dato: Páginas que produjeron Fallos de Página del Proceso en ejecución.
declare -A ResuFallosMarcoProceso #Resumen - Índices: (proceso, tiempo). Dato: Marcos donde se produjeron Fallos de Página del Proceso en ejecución.
declare -A contadorAlgPagFallosProcesoAcumulado #Resumen - Índices: (proceso). Dato: Número de Fallos de Página de cada Proceso.
declare -A contadorAlgPagExpulsionesForzadasProcesoAcumulado #Resumen - Índices: (proceso). Dato: Número de Expulsiones Forzadas de cada Proceso.
declare -A min_AlgPagFrecRec_FrecRec #Resumen - Índices: (proceso). Dato: Número memor de las Frecuencias de Uso de las Páginas en Memoria de cada Proceso.
declare -A max_AlgPagFrecRec_FrecRec #Resumen - Índices: (proceso). Dato: Número mayor de las Frecuencias de Uso de las Páginas en Memoria de cada Proceso.
declare -A min_AlgPagFrecRec_Position #Resumen - Índices: (proceso). Dato: Número de las posiciones con la memor de las Frecuencias de Uso de las Páginas en Memoria de cada Proceso.
declare -A max_AlgPagFrecRec_Position #Resumen - Índices: (proceso). Dato: Número de las posiciones con la mayor de las Frecuencias de Uso de las Páginas en Memoria de cada Proceso.
declare -A min_AlgPagRec_rec #Resumen - Índices: (proceso). Dato: Número memor de las Antigüedades de Uso de las Páginas en Memoria de cada Proceso.
declare -A max_AlgPagRec_rec #Resumen - Índices: (proceso). Dato: Número mayor de las Antigüedades de Uso de las Páginas en Memoria de cada Proceso.
declare -A min_AlgPagRec_position #Resumen - Índices: (proceso). Dato: Número de las posiciones con la memor de las Antigüedades de Uso de las Páginas en Memoria de cada Proceso.
declare -A max_AlgPagRec_position #Resumen - Índices: (proceso). Dato: Número de las posiciones con la mayor de las Antigüedades de Uso de las Páginas en Memoria de cada Proceso.
declare -A directions_AlgPagFrecUsoRec_pagina_modificada #Resumen - Índices: (proceso, ordinal de página, reloj (0)). Dato: Se usará para determinar de forma aleatoria si una página es o no modificada al ser ejecutada en los algoritmos NFU y NRU.
declare -A directions_AlgPagFrecUsoRec_marco_pagina_referenciada #Resumen - Índices: (proceso, marco). Dato: Se usará para determinar si una página ha sido o no referenciada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_frecuencia_valor unidades de tiempo en los algoritmos NFU y NRU. Se inicia a 0 por no haber sido aún referenciada (vista o modificada) y se cambia sólo cuando ya estuviera en memoria.
declare -A ResuTiempoProcesoUnidadEjecucionReferenciada #Resumen - Índices: (proceso, tiempo de ejecución). Dato: Página referenciada (1) o no referenciada (0).
declare -A ResuTiempoProcesoUnidadEjecucionModificada #Resumen - Índices: (proceso, ordinal del tiempo de ejecución). Dato: Página modificada (1) o no modificada (0).
declare -A ResuTiempoUltimoCambioClase #NO SE USA AUNQUE SE LE ASIGNAN ALGUNOS DATOS#Resumen - Índices: (proceso). Dato: Ordinal del tiempo de ejecución en el que se hizo el último cambio de clase máxima.
declare -A ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor #Resumen - Índices: (proceso, marco). Dato: Histórico con el valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
declare -A ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor #Resumen - Índices: (proceso, marco). Dato: Histórico con el tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
declare -A directions_AlgPagFrecUsoRec_marco_pagina_clase #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Se usará para determinar si una página ha sido o no referenciada y modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_frecuencia_valor unidades de tiempo en los algoritmos NFU y NRU. Se inicia a 0 por no haber sido aún referenciada (vista o modificada) y se cambia sólo cuando ya estuviera en memoria.
declare -A primerTiempoEntradaPagina #Resumen - Índices: (proceso, marco). Dato: Histórico con el tiempo con inicialización a 0 cuando se inicializa $ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor por cambio de la clase, o por inicialización de la frecuencia por llegar a su máximo, para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación	
declare -A restaFrecUsoRec #Resumen - Índices: (proceso, marco, reloj). Dato: Histórico con la resta de las frecuencias de ambos momentos para ver si supera el valor límite máximo.
declare -A ResuClaseAcumulado #Resumen - Índices: (proceso, marco, tiempo). Dato: Clase de la Página de un proceso que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
declare -A coeficienteSegOp #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Histórico con el coeficiente M de los algoritmos de Segunda Oportunidad con valor 0 cuando se inicializa o cuando se permite su mantenimiento, aunque le toque para el fallo de paginación, y 1 como premio cuando se reutiliza.	
declare -A ResuTiempoOptimoAcumulado #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Histórico con el tiempo que hay hasta la reutilización de la página contenida en el marco.	
declare -A colaTiempoRR #Índice: (proceso). Dato: Contiene el orden de ejecución de Round-Robin (RR). Será "-" mientras no esté en cola, o cuando haya terminado, y si aún no ha terminado contendrá el número ordinal del siguiente quantum. El proceso a ejecutar será, por tanto, el que tenga el número ordinal más bajo. Y el número de quantums realizados (cambios de contexto, será el número ordinal más alto.

declare -A filaAlgPagFrecUsoRecTituloColor #Almacena el Título en color para la impresión de volcados
declare -A filaAlgPagFrecUsoRecTituloBN #Almacena el Título en blanco y negro para la impresión de volcados
declare -A filaAlgPagFrecUsoRecNotas1Color #Almacena la interpretación de los datos en color para la impresión de volcados
declare -A filaAlgPagFrecUsoRecNotas1BN #Almacena la interpretación del formato en blanco y negro para la impresión de volcados
declare -A filaAlgPagFrecUsoRecNotas2Color #Almacena la interpretación del formato en color para la impresión de volcados
declare -A filaAlgPagFrecUsoRecNotas2BN #Almacena la interpretación de los datos en blanco y negro para la impresión de volcados
declare -A filatiempoColor #Variables para la impresión de volcados
declare -A filapagColor #Texto relativo a la página en color para la impresión de volcados
declare -A filapagBN #Texto relativo a la página en blanco y negro para la impresión de volcados
declare -A filatiempoColor #Texto relativo al tiempo en color para la impresión de volcados
declare -A filatiempoBN #Texto relativo al tiempo en blanco y negro para la impresión de volcados
declare -A filapagColor #Texto relativo a la página en color para la impresión de volcados
declare -A filapagBN #Texto relativo a la página en blanco y negro para la impresión de volcados
declare -A filaFallosColor #Texto relativo a los fallos de página en color para la impresión de volcados
declare -A filaFallosBN #Texto relativo a los fallos de página en blanco y negro para la impresión de volcados

####################################################################################
# Ficheros de salida. 
####################################################################################
dirFLast="./FLast" #Directorio que contiene los ficheros de última ejecución (datos (DatosLast.txt), rangos (RangosLast.txt) y rangos amplios (RangosAleTotalLast)).
dirFDatos="./FDatos" #Directorio con los ficheros de datos generados por defecto (DatosDefault.txt) o por decisión del susuario.
dirFRangos="./FRangos" #Directorio con los ficheros de datos generados por defecto (RangosDefault.txt) o con el nombre por decisión del susuario.
dirFRangosAleT="./FRangosAleT" #Directorio con los ficheros de datos generados por defecto (RangosAleTotalDefault.txt) o con el nombre por decisión del susuario.
dirInformes="./Informes" #Directorio con los ficheros que contendrán todos los volcados de la ejecución del script en color (informeCOLOR.txt) y en blanco y negro (informeBN.txt).
informeSinColorTotal="./Informes/informeBN.txt" #Informe en blanco/negro de todo lo visto en pantalla durante la ejecución del script.
informeConColorTotal="./Informes/informeCOLOR.txt" #Informe a color de todo lo visto en pantalla durante la ejecución del script.

ficheroDatosAnteriorEjecucion="./FLast/DatosLast.txt" #Datos de particiones y procesos de la ejecución anterior.
ficheroDatosDefault="./FDatos/DatosDefault.txt" #Datos de particiones y procesos de la copia estándar (por defecto).

ficheroRangosAnteriorEjecucion="./FLast/RangosLast.txt" #Rangos de particiones y procesos de la ejecución anterior.
ficheroRangosDefault="./FRangos/RangosDefault.txt" #Rangos de particiones y procesos de la copia estándar (por defecto).

ficheroRangosAleTotalAnteriorEjecucion="./FLast/RangosAleTotalLast.txt" #Rangos amplios de particiones y procesos de la ejecución anterior para la extracción de subrangos.
ficheroRangosAleTotalDefault="./FRangosAleT/RangosAleTotalDefault.txt" #Rangos amplios de particiones y procesos de la copia estándar (por defecto) para la extracción de subrangos.

nomFicheroDatos="./FDatos/DatosDefault.txt" #Se inicializa la variable del fichero de datos
nomFicheroRangos="./FRangos/RangosDefault.txt" #Se inicializa la variable del fichero de rangos
nomFicheroRangosAleT="./FRangosAleT/RangosAleTotalDefault.txt" #Se inicializa la variable del fichero de rangos amplios  

####################################################################################
####################################################################################
#             FUNCIONES
####################################################################################
# Sinopsis: Al inicio del programa muestra la cabecera por pantalla y la envía a los informes de B/N y COLOR. 
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
# Sinopsis: Cabecera de inicio 
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
} #Fin de cabecerainicio()

####################################################################################
# Sinopsis: Menú inicial con ayuda y ejecución
####################################################################################
function menuInicio {
#	clear
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
			menuAlgoritmoGestionProcesos #Menú de elección de algoritmo de gestión de procesos. 
			menuContinuidad #Menú de elección de continuidad.
			menuReubicabilidad #Menú de elección de reubicabilidad.
			seleccionAlgoritmoPaginacion=0
			menuEleccionEntradaDatos #Menú de elección de entrada de datos.
			;;
		'2')
			menuAlgoritmoGestionProcesos #Menú de elección de algoritmo de gestión de procesos. 
			menuContinuidad #Menú de elección de continuidad.
			menuReubicabilidad #Menú de elección de reubicabilidad.
			menuAlgoritmoPaginacion #Menú de elección del algoritmo de paginación.
			menuEleccionEntradaDatos #Menú de elección de entrada de datos.
			;;
		'3')
			menuAyuda #Permite ver los ficheros de ayuda en formato PDF y de vídeo
			;;
		'4')
			echo $0
			echo " El informe resultante es ./zsdoc/$0.adc junto con el subdirectorio ./zsdoc/data." | tee -a $informeConColorTotal
			echo " El informe resultante es ./zsdoc/$0.adc junto con el subdirectorio ./zsdoc/data." >> $informeSinColorTotal
			echo " Si el formato no es el adecuado o para estandarizar ese formato, se puede imprimir o transformar el documento a fichero pdf." | tee -a $informeConColorTotal
			echo " Si el formato no es el adecuado o para estandarizar ese formato, se puede imprimir o transformar el documento a fichero pdf." >> $informeSinColorTotal
			/home/$USER/opt/local/bin/zsd --verbose $0 #...O el directorio que se corresponda con la localización de zshelldoc, dependiendo de dónde se haya instalado
			exit 0
			;;
		'5')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
		'33')
			menuEnsayos #Menú de elección de opciones de ensayos de los algoritmos de gestión de procesos y paginación y tomas de datos. 
			;;
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal ;;
	esac
} #Fin de menuInicio()

####################################################################################
# Sinopsis: Menú de ayuda con ficheros PDF y de vídeo
####################################################################################
function menuAyuda {
#	clear
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
		'2') #Un fichero a elegir
			echo -e "\n\nFicheros de ayuda existentes en formato PDF:\n$NORMAL" | tee -a $informeConColorTotal
			echo -e "\n\nFicheros de ayuda existentes en formato PDF:\n" >> $informeSinColorTotal 
			files=("./DOCPDF"/*)
			for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
				echo -e "$i) ${files[$i]}" | tee -a $informeConColorTotal
				echo -e "$i) ${files[$i]}" >> $informeSinColorTotal 
			done
			echo -ne "\n$AMARILLO\n\nIntroduce el número correspondiente al fichero elegido: $NORMAL" | tee -a $informeConColorTotal
			echo -ne "\n\n\nIntroduce el número correspondiente al fichero elegido: " >> $informeSinColorTotal 
			read -r numeroFicheroPDF
			until [[ "0" -le $numeroFicheroPDF && $numeroFicheroPDF -lt ${#files[@]} && $numeroFicheroPDF -ne "" ]]; do
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
			for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
				echo -e "$i) ${files[$i]}" | tee -a $informeConColorTotal
				echo -e "$i) ${files[$i]}" >> $informeSinColorTotal 
			done
			echo -ne "\n$AMARILLO\n\nIntroduce el número correspondiente al fichero elegido: $NORMAL" | tee -a $informeConColorTotal
			echo -ne "\n\n\nIntroduce el número correspondiente al fichero elegido: " >> $informeSinColorTotal 
			read -r numeroFicheroVideo
			until [[ "0" -le $numeroFicheroVideo && $numeroFicheroVideo -lt ${#files[@]} && $numeroFicheroVideo -ne "" ]]; do
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
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal ;;
	esac
} #Fin de menuAyuda()

####################################################################################
# Sinopsis: Menú de elección del Algoritmo de Gestión de Procesos; FCFS, SJF, SRPT.
####################################################################################
function menuDOCPDF { 
#    clear
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

	#Comprobación de que el número introducido por el usuario es de 1 a 4
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
} #Fin de menuDOCPDF()

####################################################################################
# Sinopsis: Menú de elección del Algoritmo de Gestión de Procesos; FCFS, SJF, SRPT.
####################################################################################
function menuDOCVideo { 
#    clear
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

	#Comprobación de que el número introducido por el usuario es de 1 a 4
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
} #Fin de menuDOCVideo()

####################################################################################
# Sinopsis: Menú de elección del Algoritmo de Gestión de Procesos; FCFS, SJF, SRPT, Prioridades.
####################################################################################
function menuAlgoritmoGestionProcesos {
#	clear
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
	#Se comprueba que el número introducido por el usuario es de 1 a 6
	until [[ 0 -lt $seleccionMenuAlgoritmoGestionProcesos && $seleccionMenuAlgoritmoGestionProcesos -lt 7 ]];   do
		echo -ne "\nError en la elección de una opción válida\n  --> " | tee -a $informeConColorTotal
		echo -ne "\nError en la elección de una opción válida\n  --> " >> $informeSinColorTotal
		read seleccionMenuAlgoritmoGestionProcesos
		echo -e "$seleccionMenuAlgoritmoGestionProcesos\n\n" >> $informeConColorTotal
		echo -e "$seleccionMenuAlgoritmoGestionProcesos\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuAlgoritmoGestionProcesos" in
		'4')
			menuTipoPrioridad #Menú de elección del tipo de prioridad (Mayor/Menor).
			menuApropiatividad #Menú de elección de apropiatividad. Cuando se ejecuta con Prioridades. Se hace en menuAlgoritmoGestionProcesos()
			;;
	esac
} #Fin de menuAlgoritmoGestionProcesos()

####################################################################################
# Sinopsis: Menú de elección de Tipo de Prioridad (Mayor/Menor). Cuando se ejecuta con Prioridades.
####################################################################################
function menuTipoPrioridad { 
#	clear
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
} #Fin de menuApropiatividad()

####################################################################################
# Sinopsis: Menú de elección de Apropiatividad. Cuando se ejecuta con Prioridades.
#################################################################################### 
function menuApropiatividad { 
#	clear
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
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal ;;
	esac
} #Fin de menuApropiatividad()

####################################################################################
# Sinopsis: Menú de elección de reubicabilidad. 
####################################################################################
function menuReubicabilidad { #Si reubicabilidadNo0Si1 vale 0 no es reubicable. Si vale 1 es reubicable.
#	clear
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
	#Se comprueba que el número introducido por el usuario es de 1 a 3
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
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
} #Fin de menuReubicabilidad()

####################################################################################
# Sinopsis: Menú de elección de continuidad. 
####################################################################################
function menuContinuidad { #Si vale 0 es no continua. Si vale 1 es continua.
#	clear
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
	#Se comprueba que el número introducido por el usuario es de 1 a 3
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
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
} #Fin de menuContinuidad()

####################################################################################
# Sinopsis: Menú de elección de Continuidad. 
####################################################################################
function menuAlgoritmoPaginacion { 
#	clear
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
			seleccionAlgoritmoPaginacion=1 ;; #FIFO
		'2')
			seleccionAlgoritmoPaginacion=2 ;; #FIFO - Segunda Oportunidad
		'3')
			seleccionAlgoritmoPaginacion=3 ;; #Reloj
		'4')
			seleccionAlgoritmoPaginacion=4 ;; #Reloj - Segunda Oportunidad
		'5')
			seleccionAlgoritmoPaginacion=5 ;; #Óptimo
		'6')
			seleccionAlgoritmoPaginacion=6 ;; #More Frequently Used (MFU)
		'7')
			seleccionAlgoritmoPaginacion=7 ;; #Lest Frequently Used (LFU)
		'8')
			seleccionAlgoritmoPaginacion=8 #No Frequently Used (NFU) sobre MFU con límite de frecuencia
			menuAlgoritmoPaginacion_frecuencia #Se pide el valor máximo del contador de frecuencia, a partir de la cual, no será considerada.
			;;
		'9')
			seleccionAlgoritmoPaginacion=9 #No Frequently Used (NFU) sobre LFU con límite de frecuencia
			menuAlgoritmoPaginacion_frecuencia #Se pide el valor máximo del contador de frecuencia, a partir de la cual, no será considerada.
			;;
		'10')
			seleccionAlgoritmoPaginacion=10 #No Frequently Used (NFU) con clases sobre MFU con límite de frecuencia en un intervalo de tiempo. Se inician los datos en ordenarDatosEntradaFicheros() y ordenarDatosEntradaFicheros_cuatro_cinco_seis_siete_ocho_nueve().
			menuAlgoritmoPaginacion_TiempoConsiderado_valor #Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
			menuAlgoritmoPaginacion_clases_frecuencia #Se pide el valor máximo del contador de frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
			menuAlgoritmoPaginacion_clases_valor #Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
			;;
		'11')
			seleccionAlgoritmoPaginacion=11 #No Frequently Used (NFU) con clases sobre LFU con límite de frecuencia en un intervalo de tiempo. Se inician los datos en ordenarDatosEntradaFicheros() y ordenarDatosEntradaFicheros_cuatro_cinco_seis_siete_ocho_nueve().
			menuAlgoritmoPaginacion_TiempoConsiderado_valor #Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
			menuAlgoritmoPaginacion_clases_frecuencia #Se pide el valor máximo del contador de frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
			menuAlgoritmoPaginacion_clases_valor #Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
			;;
		'12')
			seleccionAlgoritmoPaginacion=12 ;; #More Recently Used (MRU)
		'13')
			seleccionAlgoritmoPaginacion=13 ;; #Lest Recently Used (LRU)
		'14')
			seleccionAlgoritmoPaginacion=14 #No Recently Used (NRU) sobre MRU con límite de tiempo de uso
			menuAlgoritmoPaginacion_uso_rec #Se pide el valor máximo del contador de la antigüedad a partir de la cual no será considerada.
			;;
		'15')
			seleccionAlgoritmoPaginacion=15 #No Recently Used (NRU) sobre LRU con límite de tiempo de uso
			menuAlgoritmoPaginacion_uso_rec #Se pide el valor máximo del contador de la antigüedad a partir de la cual no será considerada.
			;;
		'16')
			seleccionAlgoritmoPaginacion=16 #No Recently Used (NRU) con clases sobre MRU con límite de tiempo de uso en un intervalo de tiempo. Se inician los datos en ordenarDatosEntradaFicheros() y ordenarDatosEntradaFicheros_cuatro_cinco_seis_siete_ocho_nueve().
			menuAlgoritmoPaginacion_TiempoConsiderado_valor #Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
			menuAlgoritmoPaginacion_clases_uso_rec #Se pide el valor máximo del contador de antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.
			menuAlgoritmoPaginacion_clases_valor #Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
			;;
		'17')
			seleccionAlgoritmoPaginacion=17 #No Recently Used (NRU) con clases sobre LRU con límite de tiempo de uso en un intervalo de tiempo. Se inician los datos en ordenarDatosEntradaFicheros() y ordenarDatosEntradaFicheros_cuatro_cinco_seis_siete_ocho_nueve().
			menuAlgoritmoPaginacion_TiempoConsiderado_valor #Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
			menuAlgoritmoPaginacion_clases_uso_rec #Se pide el valor máximo del contador de antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.
			menuAlgoritmoPaginacion_clases_valor #Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
			;;
		'18')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal $informeSinColorTotal ;;
	esac
} #Fin de menuAlgoritmoPaginacion()

####################################################################################
# Sinopsis: Se pide el valor máximo del contador de frecuencia, a partir de la cual, no será considerada.
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
} #Fin de menuAlgoritmoPaginacion_frecuencia()

####################################################################################
# Sinopsis: Se pide el valor máximo del contador de frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
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
} #Fin de menuAlgoritmoPaginacion_clases_frecuencia()

####################################################################################
# Sinopsis: Se pide el valor máximo del contador de la antigüedad a partir de la cual no será considerada.
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
} #Fin de menuAlgoritmoPaginacion_uso_rec()

####################################################################################
# Sinopsis: Se pide el valor máximo del contador de antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.
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
} #Fin de menuAlgoritmoPaginacion_clases_uso_rec()

####################################################################################
# Sinopsis: Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
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
} #Fin de menuAlgoritmoPaginacion_clases_valor()

####################################################################################
# Sinopsis: Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
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
} #Fin de menuAlgoritmoPaginacion_TiempoConsiderado_valor()

####################################################################################
# Sinopsis: Menú de elección de opciones de entrada de datos/rangos/rangos amplios del programa:
# Manul, Última ejecución, Otros ficheros.
####################################################################################
function menuEleccionEntradaDatos {
#	clear
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

	#Se comprueba que el número introducido por el usuario es de 1 a 10
	until [[ 0 -lt $seleccionMenuEleccionEntradaDatos && $seleccionMenuEleccionEntradaDatos -lt 11 ]];  do
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read seleccionMenuEleccionEntradaDatos
		echo -ne "$seleccionMenuEleccionEntradaDatos\n\n" >> $informeConColorTotal
		echo -ne "$seleccionMenuEleccionEntradaDatos\n\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuEleccionEntradaDatos" in
		'1') #1. Introducción de datos manual 
			nuevaEjecucion
			preguntaDondeGuardarDatosManuales
			entradaMemoriaTeclado
			entradaProcesosTeclado
			menuModoTiempoEjecucionAlgormitmo
			;;
		'2') #2. Fichero de datos de última ejecución (./FLast/DatosLast.txt).
			menuModoTiempoEjecucionAlgormitmo #Elección del algoritmo de gestión de procesos y la fuente de datos.
			leer_datos_desde_fichero $ficheroDatosAnteriorEjecucion
			ordenarDatosEntradaFicheros #Ordenar los datos sacados desde $ficheroDatosAnteriorEjecucion por el tiempo de llegada.
			;;
		'3') #3. Otros ficheros de datos $ficheroDatosAnteriorEjecucion
			entradaMemoriaDatosFichero #Elegir el fichero para la entrada de datos $ficheroParaLectura.
			menuModoTiempoEjecucionAlgormitmo #Elección del algoritmo de gestión de procesos y la fuente de datos.
			leer_datos_desde_fichero $ficheroParaLectura #Leer los datos desde el fichero elegido $ficheroParaLectura
			ordenarDatosEntradaFicheros #Ordenar los datos sacados desde $ficheroParaLectura por el tiempo de llegada.
			;;
		'4') #4. Introducción de rangos manual (modo aleatorio)
			preguntaDondeGuardarRangosManuales #Resuelve los nombres de los ficheros de rangos
			preguntaDondeGuardarDatosManuales #Resuelve los nombres de los ficheros de datos
			nuevaEjecucion 
			entradaMemoriaRangosFichero_op_cuatro
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
		'5') #5. Fichero de rangos de última ejecución (./FLast/RangosLast.txt)
			entradaMemoriaRangosFichero_op_cinco_Previo
			leer_rangos_desde_fichero $ficheroRangosAnteriorEjecucion #Leer los datos desde el fichero elegido $ficheroParaLectura
			entradaMemoriaRangosFichero_op_cinco_seis
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
		'6') #6. Otros ficheros de rangos
			nuevaEjecucion 
			entradaMemoriaRangosFichero_op_seis_Previo 
			leer_rangos_desde_fichero $ficheroParaLectura #Leer los datos desde el fichero elegido $ficheroParaLectura
			entradaMemoriaRangosFichero_op_cinco_seis
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
		'7') #7. Introducción de rangos amplios manual (modo aleatorio total)
			nuevaEjecucion 
			entradaMemoriaRangosFichero_op_siete_Previo
			entradaMemoriaRangosFichero_op_siete_ocho_nueve
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
		'8') #8. Fichero de rangos amplios de última ejecución
			entradaMemoriaRangosFichero_op_ocho_Previo #Pregunta en qué fichero guardar los rangos para la opción 8.
			leer_rangos_desde_fichero $ficheroRangosAleTotalAnteriorEjecucion #Leer los datos desde el fichero elegido $ficheroRangosAleTotalAnteriorEjecucion
			entradaMemoriaRangosFichero_op_siete_ocho_nueve
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
		'9') #9. Otros ficheros de rangos amplios
			nuevaEjecucion 
			entradaMemoriaRangosFichero_op_nueve_Previo
			leer_rangos_desde_fichero $ficheroParaLectura #Leer los datos desde el fichero elegido $ficheroParaLectura
			entradaMemoriaRangosFichero_op_siete_ocho_nueve
			menuModoTiempoEjecucionAlgormitmo
			ordenarDatosEntradaFicheros
			;;
		'10') #10. Salir  
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
} #Fin de menuEleccionEntradaDatos()

####################################################################################
# Sinopsis: Se decide el modo de ejecución: Por eventos, Automática, Completa, Unidad de tiempo a unidad de tiempo  
####################################################################################
function menuModoTiempoEjecucionAlgormitmo {
#	clear
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
	# Se comprueba que el número introducido por el usuario esta entre 1 y 5
	until [[ "0" -lt $seleccionMenuModoTiempoEjecucionAlgormitmo && $seleccionMenuModoTiempoEjecucionAlgormitmo -lt "6" ]]; do
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne " Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read seleccionMenuModoTiempoEjecucionAlgormitmo
		echo -e "$seleccionMenuModoTiempoEjecucionAlgormitmo\n" >> $informeConColorTotal
		echo -e "$seleccionMenuModoTiempoEjecucionAlgormitmo\n" >> $informeSinColorTotal
	done
	case "$seleccionMenuModoTiempoEjecucionAlgormitmo" in
		'1') # Por eventos
			optejecucion=1
			;;
		'2') # Automática
			tiempoejecucion=0
			optejecucion=2
			;;
		'3') # Completa
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
		'4') # De unidad de tiempo en unidad de tiempo
			optejecucion=4
			;;
		'5') # Sólo muestra el resumen final
			optejecucion=5
			;;
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#    clear
} #Fin de menuModoTiempoEjecucionAlgormitmo()

####################################################################################
# Sinopsis: Comprobar si existe el árbol de directorios utilizados en el programa
####################################################################################
function revisarArbolDirectorios { #Regenera el árbol de directorios si no se encuentra. 
#    clear
	#Se regenera la estructura de directorios en caso de no existir
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
	#Informes y temporales 
	if [[ -f $informeConColorTotal ]]; then
		truncate -s 0 $informeConColorTotal #Se borran los ficheros de informes COLOR
	fi
	if [[ -f $informeSinColorTotal ]]; then
		truncate -s 0 $informeSinColorTotal #Se borran los ficheros de informes BN
	fi
} #Fin de revisarArbolDirectorios()

####################################################################################
# Sinopsis: Se pregunta por las opciones de guardar lo datos de particiones y procesos.
# Se pregunta si se quiere guardar los datos en el fichero estándar (Default) o en otro.
# Si es en otro, pide el nombre del archivo.
####################################################################################
function preguntaDondeGuardarDatosManuales {
	#Pregunta para los datos por teclado  
	echo -e $AMARILLO"\n¿Dónde quiere guardar los datos resultantes?\n"$NORMAL | tee -a $informeConColorTotal
	echo -e " 1- En el fichero estándar ($ficheroDatosDefault)" | tee -a $informeConColorTotal
	echo -ne " 2- En otro fichero\n\n\n  --> " | tee -a $informeConColorTotal
	echo -e "¿Dónde quiere guardar los datos resultantes?\n\n" >> $informeSinColorTotal
	echo -e " 1- En el fichero estándar ($ficheroDatosDefault)" >> $informeSinColorTotal
	echo -ne " 2- En otro fichero\n\n\n  --> " >> $informeSinColorTotal
	read seleccionMenuPreguntaDondeGuardarDatosManuales
	echo -e " $seleccionMenuPreguntaDondeGuardarDatosManuales\n\n" >> $informeConColorTotal
	echo -e " $seleccionMenuPreguntaDondeGuardarDatosManuales\n\n" >> $informeSinColorTotal
	# Se comprueba que el número introducido por el usuario esta entre 1 y 2
	until [[ "0" -lt $seleccionMenuPreguntaDondeGuardarDatosManuales && $seleccionMenuPreguntaDondeGuardarDatosManuales -lt "3" ]]; do
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "\n Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read seleccionMenuPreguntaDondeGuardarDatosManuales
		echo -e " $seleccionMenuPreguntaDondeGuardarDatosManuales\n\n" >> $informeConColorTotal
		echo -e " $seleccionMenuPreguntaDondeGuardarDatosManuales\n\n" >> $informeSinColorTotal
	done
	case "${seleccionMenuPreguntaDondeGuardarDatosManuales}" in
		'1') #En el fichero estándar
			truncate -s 0 $ficheroDatosDefault #Se borran los datos del fichero por defecto de la anterior ejecución
			nomFicheroDatos="$ficheroDatosDefault"
			;;
		'2') #En otro fichero
			echo -e $ROJO"\n Ficheros de datos ya existentes en './FDatos/': "$NORMAL | tee -a $informeConColorTotal
			echo -e "\n Ficheros de datos ya existentes en './FDatos/': " >> $informeSinColorTotal
			files=($(ls -l ./FDatos/ | awk '{print $9}'))
			for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
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
				fi #cierre el sobreescribir NO
			done
			;;
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
#    clear
} #Fin de preguntaDondeGuardarDatosManuales()
		
####################################################################################
# Sinopsis: Se pregunta por las opciones de guardar lo rangos de particiones y procesos.
# Se pregunta si se quiere guardar los rangos en el fichero estándar (Default) o en otro.
# Si es en otro, pide el nombre del archivo.
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

	# Se comprueba que el número introducido por el usuario esta entre 1 y 2
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
		'1') #En el fichero estándar
			truncate -s 0 $ficheroRangosDefault #Se borran los rangos del fichero por defecto de la anterior ejecución
			nomFicheroRangos="$ficheroRangosDefault"
			;;
		'2') #En otro fichero
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
				fi #cierre el sobreescribir NO
			done
			;;
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e "Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e "Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
} #Fin de preguntaDondeGuardarRangosManuales()

####################################################################################
# Sinopsis: Se pregunta por las opciones de guardar los mínimos y máximos de los rangos amplios.
# Se pregunta si se quiere guardar los rangos en el fichero estándar (Default) o en otro.
# Si es en otro, pide el nombre del archivo.
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
	# Se comprueba que el número introducido por el usuario esta entre 1 y 2
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
		'1') #En el fichero estándar
			truncate -s 0 $ficheroRangosDefault #Se borran los rangos del fichero por defecto de la anterior ejecución
			nomFicheroRangosAleT="$ficheroRangosAleTotalDefault"
			;;
		'2') #En otro fichero
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
				fi #cierre el sobreescribir NO
			done
			;;
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e "Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e "Error en la elección de una opción válida" >> $informeSinColorTotal
			;;
	esac
} #Fin de preguntaDondeGuardarRangosAleTManuales()

#######################################################################
#######################################################################
#    Funciones de recogida de datos con ejecución cíclica automatizada
#######################################################################
#######################################################################
####################################################################################
# Sinopsis: Menú para la captura de datos a comparar para obtener un análisis del rendimiento de los algoritmos de gestión de procesos con diferentes algoritmos de paginación usados.
####################################################################################
function menuEnsayos {
#	clear
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
			menuAlgoritmoGestionProcesos #Menú de elección de algoritmo de gestión de procesos. 
			menuContinuidad #Menú de elección de continuidad.
			menuReubicabilidad #Menú de elección de reubicabilidad.
			menuNumEnsayos #Menú de elección del número de ensayos automáticos a realizar de forma continua.
			ejecutarEnsayosDatosDiferentes #Se definen y ejecutan los ensayos automáticos y se recogen los datos en ficheros secuenciales.
			;;
		'2')
			menuAlgoritmoGestionProcesos #Menú de elección de algoritmo de gestión de procesos. 
			menuContinuidad #Menú de elección de continuidad.
			menuReubicabilidad #Menú de elección de reubicabilidad.
			menuNumEnsayos #Menú de elección del número de ensayos automáticos a realizar de forma continua.
			ejecutarEnsayosDatosIguales #Se definen y ejecutan los ensayos automáticos y se recogen los datos en ficheros secuenciales.
			;;
		'3')
			menuAlgoritmoGestionProcesos #Menú de elección de algoritmo de gestión de procesos. 
			menuContinuidad #Menú de elección de continuidad.
			menuReubicabilidad #Menú de elección de reubicabilidad.
			menuNumEnsayos #Menú de elección del número de ensayos automáticos a realizar de forma continua.
			ejecutarEnsayosDatosIgualesAnteriores #Se usan los conjuntos de datos ya definidos anteriormente para ejecutar los ensayos automáticos sobre los diferentes algoritmos de paginación y se recoger los datos en ficheros secuenciales. Se usa el mismo conjunto de datos para el ensayo de todos y cada uno de los algoritmos.
			;;
		'4') 
			menuNumEnsayos #Menú de elección del número de ensayos automáticos a realizar de forma continua.
			ejecutarEnsayosDatosIgualesAnterioresCompleto #Se usan los conjuntos de datos ya definidos anteriormente para ejecutar los ensayos automáticos sobre los diferentes algoritmos de gestión de procesos y de paginación y se recoger los datos en ficheros secuenciales. Se usa el mismo conjunto de datos para el ensayo de todos y cada uno de los algoritmos.
			menuInicio #Se vuelve a inicial la aplicación
			;;
		'5')
			echo -e $ROJO"\n SE HA SALIDO DEL PROGRAMA"$NORMAL
			exit 0 ;;
		*) #No es necesario. Existe por si se modifica y no se revisa el until anterior.
			echo -e " Error en la elección de una opción válida" | tee -a $informeConColorTotal
			echo -e " Error en la elección de una opción válida" >> $informeSinColorTotal ;;
	esac
} #Fin de menuEnsayos()

####################################################################################
# Sinopsis: Menú de elección del número de ensayos automáticos a ejecutar de forma continua.
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
} #Fin de menuAlgoritmoPaginacion_TiempoConsiderado_valor()

####################################################################################
# Sinopsis: #Se definen y ejecutan los ensayos automáticos y se recogen los datos en ficheros secuenciales. Se usan datos diferentes en cada aloritmo de paginación y ensayo para buscar errores.
####################################################################################
function ejecutarEnsayosDatosDiferentes { 
#	numAlgoritmosPaginacion=17 #Número de algoritmos de paginación que se probarán con cada conjunto de datos sacados de los subrangos, previamente calculados desde el fichero de rangos amplios.
	numAlgoritmosPaginacion=9 #Número de algoritmos de paginación que se probarán con cada conjunto de datos sacados de los subrangos, previamente calculados desde el fichero de rangos amplios.
	seleccionMenuEleccionEntradaDatos=8 #Rango desde el que se extraen subrangos, desde los que se extraen datos, que se ejecutan con las diferentes opciones.
	#Se pueden definir los diferentes modos de ejecución (1-Ejecución por eventos // 2-Ejecución automática (Por eventos y sin pausas) // 3-Ejecución completa (Por eventos con pausas de cierto número de segundos) // 4-Ejecución por unidad de tiempo (Con un volcado en cada unidad de tiempo) // 5-Ejecución completa (Sin representación de resultados intermedios)) 
	optejecucion=5 #Sólo se guardan los datos de las medias de los tiempos de espera y retorno, el número de fallos de página totales y el número de expulsiones de procesos forzadas en RR totales. Viene de la variable $seleccionMenuModoTiempoEjecucionAlgormitmo en el menú de selección de modo de ejecución MenuModoTiempoEjecucionAlgormitmo()			
	dirInformes="./Informes/RecogerDatosAutomDiferentes"
	if [[ ! -d $dirInformes ]]; then
		mkdir $dirInformes   
	fi
	nomFicheroDatosEjecucionAutomatica="./Informes/RecogerDatosAutomDiferentes/DatosEjecucionAutomatica.txt" #Se inicializa la variable de fichero de datos dond se recogen todos los datos finales.
	if [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then
		truncate -s 0 $nomFicheroDatosEjecucionAutomatica #Se borran los ficheros anteriores
	fi
	ficheroRangosAleTotalAnteriorEjecucion="./Informes/RecogerDatosAutomDiferentes/RangosAleTotalLast.txt" #Origen de los datos sobre los que se desarrollan los subrangos, sobre lso que se extraen los datos, sobre los que se ejecuta el programa.
	for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
		for (( indEnsayos = 1; indEnsayos <= $seleccionNumEnsayos; indEnsayos++ )); do 
			ficheroRangosAleTotalDefault="./Informes/RecogerDatosAutomDiferentes/RangosAleTotalDefault.txt" #Se define el fichero sobre el que se guarda el rango amplio.
			if [[ -f $ficheroRangosAleTotalDefault ]]; then
				truncate -s 0 $ficheroRangosAleTotalDefault #Se borran los ficheros anteriores
			fi
			nomFicheroRangos="./Informes/RecogerDatosAutomDiferentes/RangosDefault"$seleccionAlgoritmoPaginacion"_"$indEnsayos".txt" #Se define el fichero sobre el que se guardan los subrangos.
			if [[ -f $nomFicheroRangos ]]; then
				truncate -s 0 $nomFicheroRangos #Se borran los ficheros anteriores
			fi
			nomFicheroDatos="./Informes/RecogerDatosAutomDiferentes/DatosDefault"$seleccionAlgoritmoPaginacion"_"$indEnsayos".txt" #Se define el fichero sobre el que se guardan los datos que se extraen de los subrangos.
			if [[ -f $nomFicheroDatos ]]; then
				truncate -s 0 $nomFicheroDatos #Se borran los ficheros anteriores
			fi
			informeSinColorTotal="./Informes/RecogerDatosAutomDiferentes/informeBN"$seleccionAlgoritmoPaginacion"_"$indEnsayos".txt" #Se define el fichero sobre el que se guardan los volcados en COLOR.
			if [[ -f $informeSinColorTotal ]]; then
				truncate -s 0 $informeSinColorTotal #Se borran los ficheros anteriores
			fi
			informeConColorTotal="./Informes/RecogerDatosAutomDiferentes/informeCOLOR"$seleccionAlgoritmoPaginacion"_"$indEnsayos".txt" #Se define el fichero sobre el que se guardan los volcados en BN.
			if [[ -f $informeConColorTotal ]]; then
				truncate -s 0 $informeConColorTotal #Se borran los ficheros anteriores
			fi
			leer_rangos_desde_fichero $ficheroRangosAleTotalAnteriorEjecucion #Leer los datos desde el fichero elegido $ficheroRangosAleTotalAnteriorEjecucion
			entradaMemoriaRangosFichero_op_siete_ocho_nueve #Se piden y tratan los mínimos y máximos de los rangos. El cálculo de los datos aleatorios con los que se trabajará se hace en entradaMemoriaRangosFichero_op_siete_ocho_nueve_Comun. 
			ordenarDatosEntradaFicheros #Ordena los datos para ser mostrados y considerados por orden de llegada.
			echo -e "Algoritmo de paginación: $seleccionAlgoritmoPaginacion\n" >> $informeConColorTotal
			echo -e "Número de Ensayo: $indEnsayos\n" >> $informeConColorTotal
			inicioNuevo #Cuando se han definido todas las opciones se inicia la ejecución del programa
			mostrarEventos #Se define la variable con el título completo del algoritmo ejecutado ($algoritmoPaginacionContinuidadReubicabilidadSeleccionado).
			echo -e "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado AlgPag $seleccionAlgoritmoPaginacion NumEnsayo $indEnsayos Tesperamedio $promedio_espera T.retornomedio $promedio_retorno TotalFallosPagina $suma_contadorAlgPagFallosProcesoAcumulado TotalExpulsionesForzadasRR $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
		done
	done
} #Fin de ejecutarEnsayosDatosDiferentes()

####################################################################################
# Sinopsis: #Se definen y ejecutan los ensayos automáticos y se recogen los datos en ficheros secuenciales. Se usa el mismo conjunto de datos para el ensayo de todos y cada uno de los algoritmos.
####################################################################################
function ejecutarEnsayosDatosIguales { 
	numAlgoritmosPaginacion=17 #Número de algoritmos de paginación que se probarán con cada conjunto de datos sacados de los subrangos, previamente calculados desde el fichero de rangos amplios.
	seleccionMenuEleccionEntradaDatos=8 #Rango desde el que se extraen subrangos, desde los que se extraen datos, que se ejecutan con las diferentes opciones.
	#Se pueden definir los diferentes modos de ejecución (1-Ejecución por eventos // 2-Ejecución automática (Por eventos y sin pausas) // 3-Ejecución completa (Por eventos con pausas de cierto número de segundos) // 4-Ejecución por unidad de tiempo (Con un volcado en cada unidad de tiempo) // 5-Ejecución completa (Sin representación de resultados intermedios)) 
	optejecucion=5 #Sólo se guardan los datos de las medias de los tiempos de espera y retorno, el número de fallos de página totales y el número de expulsiones de procesos forzadas en RR totales. Viene de la variable $seleccionMenuModoTiempoEjecucionAlgormitmo en el menú de selección de modo de ejecución MenuModoTiempoEjecucionAlgormitmo()			
	dirInformes="./Informes/RecogerDatosAutomIguales"
	seleccionAlgoritmoPaginacion_uso_rec_valor="" #Se define el valor máximo del contador de la antigüedad a partir de la cual no será considerada.
	seleccionAlgoritmoPaginacion_frecuencia_valor="" #Se define el valor máximo del contador de frecuencia, a partir de la cual, no será considerada.
	if [[ ! -d $dirInformes ]]; then
		mkdir $dirInformes   
	fi
	nomFicheroDatosEjecucionAutomatica="./Informes/RecogerDatosAutomIguales/DatosEjecucionAutomatica.txt" #Se inicializa la variable de fichero de datos dond se recogen todos los datos finales.
	if [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then
		truncate -s 0 $nomFicheroDatosEjecucionAutomatica #Se borran los ficheros anteriores
	fi
			echo -ne "Título AlgPag NumEnsayo T.esperamedio T.retornomedio TotalFallosPagina TotalExpulsionesForzadasRR" >> $nomFicheroDatosEjecucionAutomatica
			echo -ne " MáxFrec TiempoConsiderado FrecValor Clase" >> $nomFicheroDatosEjecucionAutomatica
			echo -e " MáxUsoRec TiempoConsiderado UsoRecValor Clase" >> $nomFicheroDatosEjecucionAutomatica
	ficheroRangosAleTotalAnteriorEjecucion="./Informes/RecogerDatosAutomIguales/RangosAleTotalLast.txt" #Origen de los datos sobre los que se desarrollan los subrangos, sobre lso que se extraen los datos, sobre los que se ejecuta el programa.
	for (( indEnsayos = 1; indEnsayos <= $seleccionNumEnsayos; indEnsayos++ )); do #Primero se inicializan los ficheros con los datos a tratar.
		ficheroRangosAleTotalDefault="./Informes/RecogerDatosAutomIguales/RangosAleTotalDefault.txt" #Se define el fichero sobre el que se guarda el rango amplio.
		if [[ -f $ficheroRangosAleTotalDefault ]]; then
			truncate -s 0 $ficheroRangosAleTotalDefault #Se borran los ficheros anteriores
		fi
		nomFicheroRangos="./Informes/RecogerDatosAutomIguales/RangosDefault"$indEnsayos".txt" #Se define el fichero sobre el que se guardan los subrangos.
		if [[ -f $nomFicheroRangos ]]; then
			truncate -s 0 $nomFicheroRangos #Se borran los ficheros anteriores
		fi
		nomFicheroDatos="./Informes/RecogerDatosAutomIguales/DatosDefault"$indEnsayos".txt" #Se define el fichero sobre el que se guardan los datos que se extraen de los subrangos.
		if [[ -f $nomFicheroDatos ]]; then
			truncate -s 0 $nomFicheroDatos #Se borran los ficheros anteriores
		fi
		leer_rangos_desde_fichero $ficheroRangosAleTotalAnteriorEjecucion #Leer los datos desde el fichero elegido $ficheroRangosAleTotalAnteriorEjecucion
		entradaMemoriaRangosFichero_op_siete_ocho_nueve #Se piden y tratan los mínimos y máximos de los rangos. El cálculo de los datos aleatorios con los que se trabajará se hace en entradaMemoriaRangosFichero_op_siete_ocho_nueve_Comun. 
	done
	for (( indEnsayos = 1; indEnsayos <= $seleccionNumEnsayos; indEnsayos++ )); do #Ahora se leen los datos ya guardados en los ficheros de datos y se tratan.
		nomFicheroDatos="./Informes/RecogerDatosAutomIguales/DatosDefault"$indEnsayos".txt" #Se define el fichero desde el que se leen los datos que se extraen de los subrangos.
		maxDatoCierre=0
		leer_datos_desde_fichero $nomFicheroDatos
		if [[ $maxDatoCierre -eq 0 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
			maxDato=0
			maxDatoCierre=1
			for (( i=0; i<$nprocesos; i++ )); do #Se calcula el mayor de lso tiempos de ejecución para calcular un valor aleatorio entre 1 y ese máximo. Podría usarse cualquier rango, pero este dato puede estar relacionado con lso datos del problema.
				if [[ ${ejecucion[$i]} -gt $maxDato ]]; then 
					maxDato=${ejecucion[$i]} 
				fi
			done
		fi
		for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
			informeSinColorTotal="./Informes/RecogerDatosAutomIguales/informeBN"$indEnsayos"_"$seleccionAlgoritmoPaginacion".txt" #Se define el fichero sobre el que se guardan los volcados en COLOR.
			if [[ -f $informeSinColorTotal ]]; then
				truncate -s 0 $informeSinColorTotal #Se borran los ficheros anteriores
			fi
			informeConColorTotal="./Informes/RecogerDatosAutomIguales/informeCOLOR"$indEnsayos"_"$seleccionAlgoritmoPaginacion".txt" #Se define el fichero sobre el que se guardan los volcados en BN.
			if [[ -f $informeConColorTotal ]]; then
				truncate -s 0 $informeConColorTotal #Se borran los ficheros anteriores
			fi
			if [[ $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
				#8-9-Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_frecuencia_valor=$datoAleatorioGeneral
			fi
			if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
				#10-11-Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
				#10-11-Se pide el valor máximo del contador de frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_clases_frecuencia_valor=$datoAleatorioGeneral
				#10-11-Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
			fi
			if [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
				#14-15-Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_uso_rec_valor=$datoAleatorioGeneral
			fi
			if [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
				#16-17-Se pide el número de unidades de tiempo de ejecución de un proceso, a partir del cual, serán consideradas la frecuencia/tiempo de uso de una página y su clase: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
				#16-17-Se pide el valor máximo de la antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_clases_uso_rec_valor=$datoAleatorioGeneral
				#16-17-Se pide el valor máximo de unidades de tiempo de antigüedad de ejecución de un proceso, a partir de la cual, una página será considerada como NO referenciada: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
			fi
			ordenarDatosEntradaFicheros #Ordena los datos para ser mostrados y considerados por orden de llegada.
			echo -ne "$NORMAL\nAlgoritmo de paginación:$seleccionAlgoritmoPaginacion" | tee -a $informeConColorTotal
			echo -ne "$NORMAL\nNúmero de Ensayo:$indEnsayos\n" | tee -a $informeConColorTotal
			echo -e "Algoritmo de paginación: $seleccionAlgoritmoPaginacion" >> $informeSinColorTotal
			echo -e "Número de Ensayo: $indEnsayos" >> $informeSinColorTotal
			inicioNuevo #Cuando se han definido todas las opciones se inicia la ejecución del programa
			mostrarEventos #Se define la variable con el título completo del algoritmo ejecutado ($algoritmoPaginacionContinuidadReubicabilidadSeleccionado).
			echo -ne "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado $seleccionAlgoritmoPaginacion $indEnsayos $promedio_espera $promedio_retorno $suma_contadorAlgPagFallosProcesoAcumulado $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
			echo -ne " $seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
			echo -e " $seleccionAlgoritmoPaginacion_uso_rec_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
		done
	done	
} #Fin de ejecutarEnsayosDatosIguales()

####################################################################################
# Sinopsis: #Se usan los conjuntos de datos ya definidos anteriormente para ejecutar los ensayos automáticos y se recoger los datos en ficheros secuenciales. Se usa el mismo conjunto de datos para el ensayo de todos y cada uno de los algoritmos.
####################################################################################
function ejecutarEnsayosDatosIgualesAnteriores { 
	numAlgoritmosPaginacion=17 #Número de algoritmos de paginación que se probarán con cada conjunto de datos sacados de los subrangos, previamente calculados desde el fichero de rangos amplios.
	seleccionMenuEleccionEntradaDatos=2 #Datos, que se ejecutan con las diferentes opciones.
	#Se pueden definir los diferentes modos de ejecución (1-Ejecución por eventos // 2-Ejecución automática (Por eventos y sin pausas) // 3-Ejecución completa (Por eventos con pausas de cierto número de segundos) // 4-Ejecución por unidad de tiempo (Con un volcado en cada unidad de tiempo) // 5-Ejecución completa (Sin representación de resultados intermedios)) 
	optejecucion=5 #Sólo se guardan los datos de las medias de los tiempos de espera y retorno, el número de fallos de página totales y el número de expulsiones de procesos forzadas en RR totales. Viene de la variable $seleccionMenuModoTiempoEjecucionAlgormitmo en el menú de selección de modo de ejecución MenuModoTiempoEjecucionAlgormitmo()			
	dirInformes="./Informes/RecogerDatosAutomIguales"
	dirInformesAnteriores="./Informes/RecogerDatosAutomIgualesAnteriores"
	seleccionAlgoritmoPaginacion_uso_rec_valor="" #Se define el valor máximo del contador de la antigüedad a partir de la cual no será considerada.
	seleccionAlgoritmoPaginacion_frecuencia_valor="" #Se define el valor máximo del contador de frecuencia, a partir de la cual, no será considerada.
	if [[ ! -d $dirInformesAnteriores ]]; then
		mkdir $dirInformesAnteriores   
	fi
	for (( indEnsayos = 1; indEnsayos <= $seleccionNumEnsayos; indEnsayos++ )); do #Primero se inicializan los ficheros con los datos a tratar.
		nomFicheroDatos="./Informes/RecogerDatosAutomIgualesAnteriores/DatosDefault"$indEnsayos".txt" #Se define el fichero sobre el que se guardan los datos que se extraen de los subrangos.
		if [[ -f $nomFicheroDatos ]]; then
			truncate -s 0 $nomFicheroDatos #Se borran los ficheros anteriores
		fi
	done
	files=($dirInformes"/DatosDefault"*".txt")
	echo -e "\n\nFicheros existentes:\n$NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\nFicheros existentes:\n" >> $informeSinColorTotal 
	for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
		echo -e ${files[$i]} 
		cp ${files[$i]} "$dirInformesAnteriores/"
	done
	nomFicheroDatosEjecucionAutomatica="$dirInformesAnteriores/DatosEjecucionAutomatica.txt" #Se inicializa la variable de fichero de datos dond se recogen todos los datos finales.
	if [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then
		truncate -s 0 $nomFicheroDatosEjecucionAutomatica #Se borran los ficheros anteriores
	fi
	echo -ne "Título AlgPag NumEnsayo T.esperamedio T.retornomedio TotalFallosPagina TotalExpulsionesForzadasRR" >> $nomFicheroDatosEjecucionAutomatica
	echo -ne " MáxFrec TiempoConsiderado FrecValor Clase" >> $nomFicheroDatosEjecucionAutomatica
	echo -e " MáxUsoRec TiempoConsiderado UsoRecValor Clase" >> $nomFicheroDatosEjecucionAutomatica
	for (( indEnsayos = 1; indEnsayos <= $seleccionNumEnsayos; indEnsayos++ )); do #Ahora se leen los datos ya guardados en los ficheros de datos y se tratan.
		nomFicheroDatos=$dirInformesAnteriores"/DatosDefault"$indEnsayos".txt" #Se define el fichero desde el que se leen los datos que se extraen de los subrangos.
		maxDatoCierre=0
		leer_datos_desde_fichero $nomFicheroDatos
		if [[ $maxDatoCierre -eq 0 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
			maxDato=0
			maxDatoCierre=1
			for (( i=0; i<$nprocesos; i++ )); do #Se calcula el mayor de lso tiempos de ejecución para calcular un valor aleatorio entre 1 y ese máximo. Podría usarse cualquier rango, pero este dato puede estar relacionado con lso datos del problema.
				if [[ ${ejecucion[$i]} -gt $maxDato ]]; then 
					maxDato=${ejecucion[$i]} 
				fi
			done
		fi
		for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
			informeSinColorTotal="./Informes/RecogerDatosAutomIgualesAnteriores/informeBN"$indEnsayos"_"$seleccionAlgoritmoPaginacion".txt" #Se define el fichero sobre el que se guardan los volcados en COLOR.
			if [[ -f $informeSinColorTotal ]]; then
				truncate -s 0 $informeSinColorTotal #Se borran los ficheros anteriores
			fi
			informeConColorTotal="./Informes/RecogerDatosAutomIgualesAnteriores/informeCOLOR"$indEnsayos"_"$seleccionAlgoritmoPaginacion".txt" #Se define el fichero sobre el que se guardan los volcados en BN.
			if [[ -f $informeConColorTotal ]]; then
				truncate -s 0 $informeConColorTotal #Se borran los ficheros anteriores
			fi
			if [[ $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
				#8-9-Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_frecuencia_valor=$datoAleatorioGeneral
			fi
			if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
				#10-11-Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
				#10-11-Se pide el valor máximo del contador de frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_clases_frecuencia_valor=$datoAleatorioGeneral
				#10-11-Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
			fi
			if [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
				#14-15-Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_uso_rec_valor=$datoAleatorioGeneral
			fi
			if [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
				#16-17-Se pide el número de unidades de tiempo de ejecución de un proceso, a partir del cual, serán consideradas la frecuencia/tiempo de uso de una página y su clase: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
				#16-17-Se pide el valor máximo de la antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_clases_uso_rec_valor=$datoAleatorioGeneral
				#16-17-Se pide el valor máximo de unidades de tiempo de antigüedad de ejecución de un proceso, a partir de la cual, una página será considerada como NO referenciada: \n$NORMAL" | tee -a $informeConColorTotal
				calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
				seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
			fi
			ordenarDatosEntradaFicheros #Ordena los datos para ser mostrados y considerados por orden de llegada.
			echo -ne "$NORMAL\nAlgoritmo de paginación:$seleccionAlgoritmoPaginacion" | tee -a $informeConColorTotal
			echo -ne "$NORMAL\nNúmero de Ensayo:$indEnsayos\n" | tee -a $informeConColorTotal
			echo -e "Algoritmo de paginación: $seleccionAlgoritmoPaginacion" >> $informeSinColorTotal
			echo -e "Número de Ensayo: $indEnsayos" >> $informeSinColorTotal
			inicioNuevo #Cuando se han definido todas las opciones se inicia la ejecución del programa
			mostrarEventos #Se define la variable con el título completo del algoritmo ejecutado ($algoritmoPaginacionContinuidadReubicabilidadSeleccionado).
			echo -ne "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado $seleccionAlgoritmoPaginacion $indEnsayos $promedio_espera $promedio_retorno $suma_contadorAlgPagFallosProcesoAcumulado $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
			echo -ne " $seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
			echo -e " $seleccionAlgoritmoPaginacion_uso_rec_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
		done
	done	
} #Fin de ejecutarEnsayosDatosIgualesAnteriores()

####################################################################################
# Sinopsis: #Se usan los conjuntos de datos ya definidos anteriormente para ejecutar los ensayos automáticos y se recoger los datos en ficheros secuenciales. Se usa el mismo conjunto de datos para el ensayo de todos y cada uno de los algoritmos.
####################################################################################
function ejecutarEnsayosDatosIgualesAnterioresCompleto { 	
	#Se define la fuente de datos utilizada para la obtención de los datos a utilizar en el posterior tratamiento. 
	seleccionMenuEleccionEntradaDatos=2 #Datos, que se ejecutan con las diferentes opciones.
	#Se definen los diferentes modos de ejecución (1-Ejecución por eventos // 2-Ejecución automática (Por eventos y sin pausas) // 3-Ejecución completa (Por eventos con pausas de cierto número de segundos) // 4-Ejecución por unidad de tiempo (Con un volcado en cada unidad de tiempo) // 5-Ejecución completa (Sin representación de resultados intermedios)) 
	optejecucion=5 #Sólo se guardan los datos de las medias de los tiempos de espera y retorno, el número de fallos de página totales y el número de expulsiones de procesos forzadas en RR totales. Viene de la variable $seleccionMenuModoTiempoEjecucionAlgormitmo en el menú de selección de modo de ejecución MenuModoTiempoEjecucionAlgormitmo()			
	#Se definen los diferentes directorios utilizados para guardar los datos obtenidos
	dirInformes="./Informes/RecogerDatosAutomIguales"
	dirInformesAnterioresCompleto="./Informes/RecogerDatosAutomIgualesAnterioresCompleto"
	#Se definen las variables necesarias para ejecutar los diferentes algoritmos y opciones.
	algoritmoPaginacionContinuidadReubicabilidadSeleccionado="" #Define el título de la cabecera de los volcados
	indEnsayos="" #Define el número de ensayo tratado 
	seleccionMenuAlgoritmoGestionProcesos="" #Define el algoritmo usado para resolver la gestión de Procesos (FCFS/SJF/SRPT/Prioridades/Round-Robin)
	numAlgoritmosGestionProcesos=5 #Máximo número de algoritmos de gestión de procesos (FCFS (1), SJF (2), SRPT (3), Prioridades (4), Round-Robin (5)) que se probarán con cada conjunto de datos sacados de los subrangos, previamente calculados desde el fichero de rangos amplios.
	numAlgoritmosContinuidad=2 #Máximo número de opciones del tipo de memoria (No Continua (1)/Continua (2)) 
	numAlgoritmoscontinuidadNo0Si1=1 #Máximo número de opciones del tipo de memoria (No Continua (0)/Continua (1)) 
	numAlgoritmosReubicabilidad=2 #Máximo número de opciones del tipo de memoria (No Reubicable (1)/Reubicable (2)) 
	numAlgoritmosreubicabilidadNo0Si1=1 #Máximo número de opciones del tipo de reubicabilidad (No Reubicable (0)/Reubicable (1)) 
	seleccionAlgoritmoPaginacion="" #Define el algoritmo usado para resolver los fallos de página.
	numAlgoritmosPaginacion=17 #Máximo número de algoritmos de paginación (FIFO, Reloj, SegOp, Óptimo, MFU, LFU, NFU, MRU, LRU, NRU,...) que se probarán con cada conjunto de datos sacados de los subrangos, previamente calculados desde el fichero de rangos amplios.
	numAlgoritmosTipoPrioridad=2 #Máximo número de opciones del tipo de prioridad (Mayor (1)/Menor (2)) 
	numAlgoritmosApropiatividad=2 #Máximo número de opciones del tipo de apropiatividad (No Apropiativo (1)/Apropiativo (2)) 
	numAlgoritmosapropiatividadNo0Si1=1 #Máximo número de opciones del tipo de apropiatividad (No Apropiativo (0)/Apropiativo (1)) 
	promedio_espera="" #Define el tiempo de espera medio de los procesos 
	promedio_retorno="" #Define el tiempo de retorno medio de los procesos
	suma_contadorAlgPagFallosProcesoAcumulado="" #Define el número de fallos de página producidos
	suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado="" #Define el número de expulsiones forzadas por Round-Robin (RR)
	seleccionAlgoritmoPaginacion_frecuencia_valor="" #Define el valor máximo del contador de frecuencia, a partir de la cual, no será considerada.
	seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado="" #Define el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
	seleccionAlgoritmoPaginacion_clases_frecuencia_valor="" #Define el valor máximo del contador de frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
	seleccionAlgoritmoPaginacion_clases_valor="" #Define el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada en algoritmos basados en la "frecuencia/tiempo de antigüedad" de uso
	seleccionAlgoritmoPaginacion_uso_rec_valor="" #Define el valor máximo del contador de la antigüedad a partir de la cual no será considerada.
	seleccionAlgoritmoPaginacion_clases_uso_rec_valor="" #Define el valor máximo del contador de antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.
	
	if [[ ! -d $dirInformesAnterioresCompleto ]]; then
		mkdir $dirInformesAnterioresCompleto   
	fi
	for (( indEnsayos = 1; indEnsayos <= $seleccionNumEnsayos; indEnsayos++ )); do #Primero se inicializan los ficheros con los datos a tratar.
		nomFicheroDatos="./Informes/RecogerDatosAutomIgualesAnterioresCompleto/DatosDefault"$indEnsayos".txt" #Se define el fichero sobre el que se guardan los datos que se extraen de los subrangos.
		if [[ -f $nomFicheroDatos ]]; then
			truncate -s 0 $nomFicheroDatos #Se borran los ficheros anteriores
		fi
	done
	files=($dirInformes"/DatosDefault"*".txt")
	echo -e "\n\nFicheros existentes:\n$NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\nFicheros existentes:\n" >> $informeSinColorTotal 
	for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
		echo -e ${files[$i]} 
		cp ${files[$i]} "$dirInformesAnterioresCompleto/"
	done
	nomFicheroDatosEjecucionAutomatica="$dirInformesAnterioresCompleto/DatosEjecucionAutomatica.txt" #Se inicializa la variable de fichero de datos dond se recogen todos los datos finales.
	if [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then
		truncate -s 0 $nomFicheroDatosEjecucionAutomatica #Se borran los ficheros anteriores
	fi
	echo -ne "Título NumEnsayo AlgGestProc Contin Reubic AlgPag TipoPrio Apropia Quantum" >> $nomFicheroDatosEjecucionAutomatica
	echo -ne " T.esperamedio T.retornomedio TotalFallosPagina TotalExpulsionesForzadasRR" >> $nomFicheroDatosEjecucionAutomatica
	echo -ne " MáxFrec TiempoConsiderado FrecValor FrecClase" >> $nomFicheroDatosEjecucionAutomatica
	echo -e " MáxUsoRec TiempoConsiderado UsoRecValor UsoRecClase" >> $nomFicheroDatosEjecucionAutomatica
	for (( indEnsayos = 1; indEnsayos <= $seleccionNumEnsayos; indEnsayos++ )); do #Ahora se leen los datos ya guardados en los ficheros de datos y se tratan.
		nomFicheroDatos=$dirInformesAnterioresCompleto"/DatosDefault"$indEnsayos".txt" #Se define el fichero desde el que se leen los datos que se extraen de los subrangos.
	if ! [[ -f $nomFicheroDatosEjecucionAutomatica ]]; then #Si no se encuentra un archivo de datos por no haber creado previamente el conjunto de datos necesario, se muestra un mensaje de error y se para el bucle.
		echo -ne "Error: No se encuentra el fichero de datos "$nomFicheroDatos | tee -a $informeConColorTotal
		echo -ne "Error: No se encuentra el fichero de datos "$nomFicheroDatos >> $informeSinColorTotal 
		break
	fi		
		maxDatoCierre=0
		leer_datos_desde_fichero $nomFicheroDatos
		quantumSec=$quantum #Define el quantum utilizado en Round-Robin (RR). Se usa para salvar el dato hasta que se necesite y que no se repita en los listados.
		quantum="" #Define el quantum utilizado en Round-Robin (RR)
		seleccionTipoPrioridadSec=$seleccionTipoPrioridad #Define el tipo de apropiatividad utilizado en Prioridad. Se usa para salvar el dato hasta que se necesite y que no se repita en los listados.
		seleccionTipoPrioridad="" #Define el Tipo de Prioridad (Mayor (1)/Menor (2)).
		seleccionMenuApropiatividadSec=$seleccionMenuApropiatividad #Define el modo de apropiatividad utilizado en Prioridad. Se usa para salvar el dato hasta que se necesite y que no se repita en los listados.
		seleccionMenuApropiatividad="" #Define el Tipo de Apropiatividad (No Apropiativo (1)/Apropiativo (2)).
		if [[ $maxDatoCierre -eq 0 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
			maxDato=0
			maxDatoCierre=1
			for (( i=0; i<$nprocesos; i++ )); do #Se calcula el mayor de lso tiempos de ejecución para calcular un valor aleatorio entre 1 y ese máximo. Podría usarse cualquier rango, pero este dato puede estar relacionado con lso datos del problema.
				if [[ ${ejecucion[$i]} -gt $maxDato ]]; then 
					maxDato=${ejecucion[$i]} 
				fi
			done
		fi
		for (( seleccionMenuAlgoritmoGestionProcesos=1 ; seleccionMenuAlgoritmoGestionProcesos<=$numAlgoritmosGestionProcesos ; seleccionMenuAlgoritmoGestionProcesos++ )); do
			if ([[ $seleccionMenuAlgoritmoGestionProcesos -ge 1 && $seleccionMenuAlgoritmoGestionProcesos -le 3 ]]) || [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then
				if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then #Define el quantum utilizado en Round-Robin (RR). Se usa para recuperar el dato cuando se necesite y que no se repita en los listados.
					quantum=$(($quantumSec + 0)) #Se hace para eliminar el espacio que contiene la variable, y por el que la exportación a fichero da problemas porque el resto de datos se desplazan hacia la derecha.
				fi
				seleccionMenuContinuidad="" #Define el número de opciones del tipo de memoria (Continua/No Continua)
				for (( seleccionMenuContinuidad=1 ; seleccionMenuContinuidad<=$numAlgoritmosContinuidad ; seleccionMenuContinuidad++ )); do
					seleccionMenuReubicabilidad="" #Define el número de opciones del tipo de memoria (Reubicable/No Reubicable)
					for (( seleccionMenuReubicabilidad=1 ; seleccionMenuReubicabilidad<=$numAlgoritmosReubicabilidad ; seleccionMenuReubicabilidad++ )); do		
						for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
							informeSinColorTotal="./Informes/RecogerDatosAutomIgualesAnterioresCompleto/informeBN"$indEnsayos"_"$seleccionMenuAlgoritmoGestionProcesos"_"$seleccionMenuContinuidad"_"$seleccionMenuReubicabilidad"_"$seleccionAlgoritmoPaginacion".txt" #Se define el fichero sobre el que se guardan los volcados en COLOR.
							if [[ -f $informeSinColorTotal ]]; then
								truncate -s 0 $informeSinColorTotal #Se borran los ficheros anteriores
							fi
							informeConColorTotal="./Informes/RecogerDatosAutomIgualesAnterioresCompleto/informeCOLOR"$indEnsayos"_"$seleccionMenuAlgoritmoGestionProcesos"_"$seleccionMenuContinuidad"_"$seleccionMenuReubicabilidad"_"$seleccionAlgoritmoPaginacion".txt" #Se define el fichero sobre el que se guardan los volcados en BN.
							if [[ -f $informeConColorTotal ]]; then
								truncate -s 0 $informeConColorTotal #Se borran los ficheros anteriores
							fi
							if [[ $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
								#8-9-Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
								calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
								seleccionAlgoritmoPaginacion_frecuencia_valor=$datoAleatorioGeneral
							fi
							if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
								#10-11-Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
								calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
								seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
								#10-11-Se pide el valor máximo del contador de frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
								calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
								seleccionAlgoritmoPaginacion_clases_frecuencia_valor=$datoAleatorioGeneral
								#10-11-Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
								calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
								seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
							fi
							if [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
								#14-15-Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
								calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
								seleccionAlgoritmoPaginacion_uso_rec_valor=$datoAleatorioGeneral
							fi
							if [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
								#16-17-Se pide el número de unidades de tiempo de ejecución de un proceso, a partir del cual, serán consideradas la frecuencia/tiempo de uso de una página y su clase: \n$NORMAL" | tee -a $informeConColorTotal
								calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
								seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
								#16-17-Se pide el valor máximo de la antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
								calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
								seleccionAlgoritmoPaginacion_clases_uso_rec_valor=$datoAleatorioGeneral
								#16-17-Se pide el valor máximo de unidades de tiempo de antigüedad de ejecución de un proceso, a partir de la cual, una página será considerada como NO referenciada: \n$NORMAL" | tee -a $informeConColorTotal
								calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
								seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
							fi
							ordenarDatosEntradaFicheros #Ordena los datos para ser mostrados y considerados por orden de llegada.
							inicioNuevo #Cuando se han definido todas las opciones se inicia la ejecución del programa
							mostrarEventos #Se define la variable con el título completo del algoritmo ejecutado ($algoritmoPaginacionContinuidadReubicabilidadSeleccionado).
							echo -e "$NORMAL\n Número de Ensayo:$indEnsayos" | tee -a $informeConColorTotal
							echo -e "$NORMAL Algoritmo:$algoritmoPaginacionContinuidadReubicabilidadSeleccionado" | tee -a $informeConColorTotal
							echo -e " Número de Ensayo: $indEnsayos" >> $informeSinColorTotal
							echo -e " Algoritmo: $algoritmoPaginacionContinuidadReubicabilidadSeleccionado" >> $informeSinColorTotal
							echo -ne "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado $indEnsayos $seleccionMenuAlgoritmoGestionProcesos $seleccionMenuContinuidad $seleccionMenuReubicabilidad $seleccionAlgoritmoPaginacion" >> $nomFicheroDatosEjecucionAutomatica
							echo -ne " $seleccionTipoPrioridad $seleccionMenuApropiatividad $quantum $promedio_espera $promedio_retorno $suma_contadorAlgPagFallosProcesoAcumulado $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
							echo -ne " $seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
							echo -e " $seleccionAlgoritmoPaginacion_uso_rec_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
							
							seleccionAlgoritmoPaginacion_frecuencia_valor="" #Se inicializan a "" para empezar el siguiente ciclo.
							seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=""
							seleccionAlgoritmoPaginacion_clases_frecuencia_valor=""
							seleccionAlgoritmoPaginacion_clases_valor=""
							seleccionAlgoritmoPaginacion_uso_rec_valor=""
							seleccionAlgoritmoPaginacion_clases_uso_rec_valor=""

						done #$seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_uso_rec_valor
					done
				done
				quantum="" #Define el quantum utilizado en Round-Robin (RR). Se vuelve a anular hasta que se necesite.
			fi
			if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 4 ]]; then
				seleccionTipoPrioridad="" #Define el Tipo de Prioridad (Mayor (1)/Menor (2)).
				for (( seleccionTipoPrioridad=1 ; seleccionTipoPrioridad<=$numAlgoritmosTipoPrioridad ; seleccionTipoPrioridad++ )); do
					seleccionMenuApropiatividad="" #Define el Tipo de Apropiatividad (No Apropiativo (1)/Apropiativo (2)).
					for (( seleccionMenuApropiatividad=1 ; seleccionMenuApropiatividad<=numAlgoritmosApropiatividad ; seleccionMenuApropiatividad++ )); do
						seleccionMenuContinuidad="" #Define el número de opciones del tipo de memoria (Continua/No Continua)
						for (( seleccionMenuContinuidad=1 ; seleccionMenuContinuidad<=$numAlgoritmosContinuidad ; seleccionMenuContinuidad++ )); do
							seleccionMenuReubicabilidad="" #Define el número de opciones del tipo de memoria (Reubicable/No Reubicable)
							for (( seleccionMenuReubicabilidad=1 ; seleccionMenuReubicabilidad<=$numAlgoritmosReubicabilidad ; seleccionMenuReubicabilidad++ )); do		
								for (( seleccionAlgoritmoPaginacion = 1; seleccionAlgoritmoPaginacion <= $numAlgoritmosPaginacion; seleccionAlgoritmoPaginacion++ )); do 
									informeSinColorTotal="./Informes/RecogerDatosAutomIgualesAnterioresCompleto/informeBN"$indEnsayos"_"$seleccionMenuAlgoritmoGestionProcesos"_"$seleccionMenuContinuidad"_"$seleccionMenuReubicabilidad"_"$seleccionAlgoritmoPaginacion".txt" #Se define el fichero sobre el que se guardan los volcados en COLOR.
									if [[ -f $informeSinColorTotal ]]; then
										truncate -s 0 $informeSinColorTotal #Se borran los ficheros anteriores
									fi
									informeConColorTotal="./Informes/RecogerDatosAutomIgualesAnterioresCompleto/informeCOLOR"$indEnsayos"_"$seleccionMenuAlgoritmoGestionProcesos"_"$seleccionMenuContinuidad"_"$seleccionMenuReubicabilidad"_"$seleccionAlgoritmoPaginacion".txt" #Se define el fichero sobre el que se guardan los volcados en BN.
									if [[ -f $informeConColorTotal ]]; then
										truncate -s 0 $informeConColorTotal #Se borran los ficheros anteriores
									fi
									if [[ $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
										#8-9-Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
										calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
										seleccionAlgoritmoPaginacion_frecuencia_valor=$datoAleatorioGeneral
									fi
									if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
										#10-11-Se pide el valor del tiempo de ejecución de un proceso a partir del cual serán consideradas la "frecuencia de uso/tiempo de uso" de una página y su clase.
										calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
										seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
										#10-11-Se pide el valor máximo del contador de frecuencia en un intervalo de tiempo, a partir de la cual, no será considerada.
										calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
										seleccionAlgoritmoPaginacion_clases_frecuencia_valor=$datoAleatorioGeneral
										#10-11-Se pide el valor máximo de unidades de tiempo de antigüedad a partir de la cual una página será considerada como NO referenciada
										calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
										seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
									fi
									if [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
										#14-15-Introduce el valor máximo de la frecuencia, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
										calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
										seleccionAlgoritmoPaginacion_uso_rec_valor=$datoAleatorioGeneral
									fi
									if [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Permite calcular el máximo del valor una única vez para cada conjunto de datos en cada ensayo, pero que sirve para todos los algoritmos de paginación.
										#16-17-Se pide el número de unidades de tiempo de ejecución de un proceso, a partir del cual, serán consideradas la frecuencia/tiempo de uso de una página y su clase: \n$NORMAL" | tee -a $informeConColorTotal
										calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
										seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=$datoAleatorioGeneral
										#16-17-Se pide el valor máximo de la antigüedad en un intervalo de tiempo, a partir de la cual, no será considerada.: \n$NORMAL" | tee -a $informeConColorTotal
										calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
										seleccionAlgoritmoPaginacion_clases_uso_rec_valor=$datoAleatorioGeneral
										#16-17-Se pide el valor máximo de unidades de tiempo de antigüedad de ejecución de un proceso, a partir de la cual, una página será considerada como NO referenciada: \n$NORMAL" | tee -a $informeConColorTotal
										calcDatoAleatorioGeneral 1 $maxDato # Generar un número aleatorio dentro del rango
										seleccionAlgoritmoPaginacion_clases_valor=$datoAleatorioGeneral
									fi
									ordenarDatosEntradaFicheros #Ordena los datos para ser mostrados y considerados por orden de llegada.
									inicioNuevo #Cuando se han definido todas las opciones se inicia la ejecución del programa
									mostrarEventos #Se define la variable con el título completo del algoritmo ejecutado ($algoritmoPaginacionContinuidadReubicabilidadSeleccionado).
									echo -e "$NORMAL\n Número de Ensayo: $indEnsayos" | tee -a $informeConColorTotal
									echo -e "$NORMAL Algoritmo: $algoritmoPaginacionContinuidadReubicabilidadSeleccionado" | tee -a $informeConColorTotal
									echo -e " Número de Ensayo: $indEnsayos" >> $informeSinColorTotal
									echo -e " Algoritmo: $algoritmoPaginacionContinuidadReubicabilidadSeleccionado" >> $informeSinColorTotal
									echo -ne "$algoritmoPaginacionContinuidadReubicabilidadSeleccionado $indEnsayos $seleccionMenuAlgoritmoGestionProcesos $seleccionMenuContinuidad $seleccionMenuReubicabilidad $seleccionAlgoritmoPaginacion" >> $nomFicheroDatosEjecucionAutomatica
									echo -ne " $seleccionTipoPrioridad $seleccionMenuApropiatividad $quantum $promedio_espera $promedio_retorno $suma_contadorAlgPagFallosProcesoAcumulado $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado" >> $nomFicheroDatosEjecucionAutomatica
									echo -ne " $seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
									echo -e " $seleccionAlgoritmoPaginacion_uso_rec_valor $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_clases_valor" >> $nomFicheroDatosEjecucionAutomatica
								
									seleccionAlgoritmoPaginacion_frecuencia_valor="" #Se inicializan a "" para empezar el siguiente ciclo.
									seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado=""
									seleccionAlgoritmoPaginacion_clases_frecuencia_valor=""
									seleccionAlgoritmoPaginacion_clases_valor=""
									seleccionAlgoritmoPaginacion_uso_rec_valor=""
									seleccionAlgoritmoPaginacion_clases_uso_rec_valor=""
								done #$seleccionAlgoritmoPaginacion_frecuencia_valor $seleccionAlgoritmoPaginacion_clases_uso_rec_valor $seleccionAlgoritmoPaginacion_uso_rec_valor 
							done
						done
					done
					seleccionMenuApropiatividad="" #Define el Tipo de Apropiatividad (No Apropiativo (1)/Apropiativo (2)). Se vuelve a anular hasta que se vuelva a necesitar.
				done
				seleccionTipoPrioridad="" #Define el Tipo de Prioridad (Mayor (1)/Menor (2)). Se vuelve a anular hasta que se vuelva a necesitar.
			fi
		done
	done	
	
} #Fin de ejecutarEnsayosDatosIgualesAnterioresCompleto()

#######################################################################
#######################################################################
#    Funciones
#######################################################################
#######################################################################
#######################################################################
# Sinopsis: Para colorear lo impreso en pantalla.
#######################################################################
function cecho {
	local default_msg="No message passed."                     
	message=${1:-$default_msg}   
	color=${2:-$FWHT}           
	echo -en "$color"
	echo "$message"
	tput sgr0                    
	return
} #Fin de cecho()

####################################################################################
# Sinopsis: Genera los números de página a partir de las direcciones del proceso. 
####################################################################################
function transformapag {
	let pagTransformadas[$2]=`expr $1/$mem_direcciones`
} #Fin de transformapag()

####################################################################################
# Sinopsis: Calcula el número de direcciones por cada proceso y lo guarda en npagprocesos y el mayor número de páginas entre todos los procesos.
####################################################################################
function vermaxpagsfichero {
	i=16 #Empieza en 14 por ser la primera línea del fichero con procesos.
	for (( npagp = 0; npagp <= $p; npagp++ )); do
		npagprocesos[$p]=`awk "NR==$i" $1 | wc -w `
		(( i++ ))	
	done
	maxpags=0 #No se usa para nada
	for verlas in ${npagprocesos[@]}; do #Calcula el mayor número de páginas de entre todos los procesos.
		if (( $verlas > $maxpags )); then
			maxpags=$verlas
		fi
	done
} #Fin de vermaxpagsfichero()

####################################################################################
# Sinopsis: Se leen datos desde fichero 
####################################################################################
function leer_datos_desde_fichero { #Lee los datos del fichero por el número de la línea
	mem_num_marcos=`awk "NR==2" $1`  #Primer dato -> Tamaño en memoria
	mem_direcciones=`awk "NR==4" $1`  #Quinto dato -> Tamaño de pagina
	numDireccionesTotales=$(($mem_num_marcos * $mem_direcciones))
	PriomInicial=`awk "NR==6" $1`  #Segundo dato -> Prioridad menor
	PrioMInicial=`awk "NR==8" $1`  #Tercero dato -> Prioridad mayor
	PrioR=`awk "NR==10" $1`  #Cuarto dato -> Tipo de prioridad - Realmente no se usa porque se introduce por teclado al seleccionar el algoritmo de gestión de procesos mediante la variable de selección $seleccionTipoPrioridad. 
	tratarRangoPrioridadesDirecta $PriomInicial $PrioMInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	variableReubicar=`awk "NR==12" $1`  #Sexto dato -> Variable para la reubicabilidad - Realmente no se usa porque se introduce por teclado tras seleccionar la posibilidad de reubicar procesos. 
	quantum=`awk "NR==14" $1`  #Séptimo dato -> Quantum de Round Robin (RR)
	maxfilas=`wc -l < $1`
	nmarcostotales=$mem_num_marcos #Número de marcos totales de la memoria
	memvacia=$nmarcostotales #Número de marcos vacíos
	tamem=$(($nmarcostotales * $mem_direcciones)) #Tamaño de memoria total en direcciones
	nprocesos=$(($maxfilas-15)) #Número de procesos definidos en el problema
	p=0 #Índice local que recorre cada proceso definido en el problema
	numOrdinalPagTeclado=0 #Índice que recorre cada dirección de cada proceso definido en el problema
	one=0 #Define el número de dígitos de pantalla usados para controlar los saltos de línea. Deja 1 de margen izquierdo y varios más para controlar el comienzo del espacio usado para los datos en la tabla resumen.
	for (( fila = 16; fila <= $maxfilas; fila++ )); do #Se inicia con 16 por ser la primera línea del fichero que contiene procesos. 
		llegada[$p]=`awk "NR==$fila" $1 |  cut -d ' ' -f 1`
		memoria[$p]=`awk "NR==$fila" $1 |  cut -d ' ' -f 2`
		prioProc[$p]=`awk "NR==$fila" $1 |  cut -d ' ' -f 3`
		vermaxpagsfichero $1 #(Usa el número de línea donde empiezan a definirse los procesos.) Calcula el número de direcciones por cada proceso y lo guarda en npagprocesos[] y el mayor número de páginas entre todos los procesos (maxpags).
		ejecucion[$p]=$(expr $[npagprocesos[$p]] - 3)
		tiempoEjecucion[$p]=${ejecucion[$p]} #Para ser equivalente al nuevo programa
		numeroPaginasUsadasProceso[$p]=0 #Contendrá el número de páginas ya usadas en la ejecución de cada proceso
		#El nombre de los procesos está predefinido: P01, P02, ...
		numOrdinalPagTeclado=0
		for ((i=4;i<$((${tiempoEjecucion[$p]} + 4));i++)); do #maxpags es el mayor número de páginas entre todos los procesos. Se inicia con 4 por ser el primer campo que contiene direcciones en cada fila.
			directionsYModificado=`awk "NR==$fila" $1 | cut -d ' ' -f $i` 
			directions[$p,$numOrdinalPagTeclado]=`echo $directionsYModificado | cut -d '-' -f 1`
			directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numOrdinalPagTeclado,0]=`echo $directionsYModificado | cut -d '-' -f 2`
			transformapag directions[$p,$numOrdinalPagTeclado] $numOrdinalPagTeclado #let pagTransformadas[$2]=`expr $1/$mem_direcciones`
			paginasDefinidasTotal[$p,$numOrdinalPagTeclado]=${pagTransformadas[$numOrdinalPagTeclado]} 
			if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then #Este caso es para Memoria No Virtual, y por tanto, con la opción $seleccionMenuInicio=1
				controlDatosNoVirtualFichero 
			fi
			numOrdinalPagTeclado=$((numOrdinalPagTeclado+1)) #Posición en la que se define cada dirección dentro de un proceso.
			((one++))
		done
		unset pagTransformadas[@] #Analiza los datos para el caso de memoria No Virtual. Los procesos deben caber de forma completa en la memoria. Se elimina para poder hacer una segunda lectura sin datos anteriores.
		p=$((p+1))
	done 
#	clear 
} #Fin de leer_datos_desde_fichero() 

#######################################################################
# Sinopsis: Analiza los datos para el caso de memoria No Virtual. Los procesos deben caber de forma completa en la memoria. 
#######################################################################
function controlDatosNoVirtualFichero {
	if [[ ${directions[$p,$numOrdinalPagTeclado]} -gt $(($numDireccionesTotales - 1)) ]]; then #Este caso es para Memoria No Virtual, y por tanto, con la opción $seleccionMenuInicio=1
		echo -e "\n***Error en la lectura de datos. La dirección de memoria utilizada está fuera del rango definido por el número de marcos de página.\n"
		echo -e "\n***Dirección definida: ${directions[$p,$numOrdinalPagTeclado]} \n"
		echo -e "\n***Número de direcciones totales: $numDireccionesTotales \n"
		exit 1
	fi
	if [[ ${pagTransformadas[$numOrdinalPagTeclado]} -gt ${memoria[$p]} ]]; then #Este caso es para Memoria No Virtual, y por tanto, con la opción $seleccionMenuInicio=1
		echo -e "\n***Error en la lectura de datos. La dirección de memoria utilizada está fuera del rango definido por el número de marcos de página y el número de direcciones por marco."
		echo -ne "\n***Número de marcos: ${memoria[$p]}"
		echo -e "\n***Número de páginas del proceso: ${pagTransformadas[$numOrdinalPagTeclado]}"
		exit 1
	fi
	
} #Fin de controlDatosNoVirtualFichero() 

#######################################################################
# Sinopsis: Extrae los límites de los rangos del fichero de rangos de última ejecución. 
#######################################################################
function leer_rangos_desde_fichero { #Lee los datos del fichero por la posición en la línea
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
	prio_menor_maxInicial=$prio_menor_max #*Inicial - Datos a representar
	tratarRangoPrioridadesDirecta $prio_menor_minInicial $prio_menor_maxInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	prio_menor_min=$PriomFinal
	prio_menor_max=$PrioMFinal
	prio_mayor_minInicial=$prio_mayor_min #*Inicial - Datos a representar #Se invierten los rangos para calcular el mínimo, pero no para su representación, en la que se verán los datos originales *Inicial.
	prio_mayor_maxInicial=$prio_mayor_max #*Inicial - Datos a representar
	tratarRangoPrioridadesDirecta $prio_mayor_minInicial $prio_mayor_maxInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
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
	if [[ $memoria_min -gt $memoria_max ]]; then #Si el mayor es menor que el menor, se invierten los rangos 
		invertirRangos $memoria_min $memoria_max
		memoria_min=$min
		memoria_max=$max
	fi 
	if [[ $memoria_min -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos
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
		llegada_min=$(($min - 1)) #Este valor podría ser 0 
		llegada_max=$(($max - 1))
	fi 
	if [[ $tiempo_ejec_min -gt $tiempo_ejec_max ]]; then
		invertirRangos $tiempo_ejec_min $tiempo_ejec_max
		tiempo_ejec_min=$min
		tiempo_ejec_max=$max
	fi
	if [[ $tiempo_ejec_min -lt 0 ]]; then 
		desplazarRangos $tiempo_ejec_min $tiempo_ejec_max
		tiempo_ejec_min=$(($min - 1)) #Este valor podría ser 0 
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
		prio_proc_min=$min #Los valroes de las prioridades podrían ser 0 o negativos. 
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
		numDireccionesTotales_max=$(($memoria_max * $direcciones_max)) #Se comparará este valor con las direcciones definidas, ya que las direcciones deben ser menores en el caso de memoria No Virtual.
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
} #Fin de leer_rangos_desde_fichero()

#######################################################################
# Sinopsis: Se comprueba que los datos son enteros.
#######################################################################
function es_entero {
	[[ "$1" -eq "$1" && "$1" -ge "0" ]] > /dev/null 2>&1 # En caso de error, sentencia falsa
	return $? # Retorna si la sentencia anterior fue verdadera
} #Fin de es_entero()

#####################################################################################
# Sinopsis: Permite ordenar los datos de entrada sacados desde fichero y por teclado. 
####################################################################################
function ordenarDatosEntradaFicheros_cuatro_cinco_seis_siete_ocho_nueve {
	for ((j = $((${#llegada[@]} - 1)); j >= 0; j--)); do
		for ((i = 0; i <= $j; i++)); do
			if [[ ${llegada[$i]} -gt ${llegada[$(($i + 1))]} ]]; then
				aux=${proceso[$(($i + 1))]}
				proceso[$(($i + 1))]=${proceso[$i]} 
				proceso[$i]=$aux
				aux=${llegada[$(($i + 1))]}
				llegada[$(($i + 1))]=${llegada[$i]}
				llegada[$i]=$aux
				aux2="" #Se permutan las páginas
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${paginasDefinidasTotal[$(($i + 1)),$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do #Se borran para que no pueda haber valores anteriores residuales.
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
				aux2="" #Se permutan las direcciones
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${directions[$(($i + 1)),$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do #Se borran para que no pueda haber valores anteriores residuales.
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
				tiempoEjecucion[$(($i + 1))]=${tiempoEjecucion[$i]} #Se permutan los valores de esta variable auxiliar porque se definió en leer_datos_desde_fichero().
				tiempoEjecucion[$i]=$aux
				aux=${memoria[$(($i + 1))]}
				memoria[$(($i + 1))]=${memoria[$i]} 
				memoria[$i]=$aux
				aux=${prioProc[$(($i + 1))]}
				prioProc[$(($i + 1))]=${prioProc[$i]} #En caso de usar el algoritmo basado en Prioridades...
				prioProc[$i]=$aux
				#No se permutan los nombres de los procesos, como en ordenarDatosEntradaFicheros(), porque se definirán más tarde.
			fi
		done
	done
} #Fin de ordenarDatosEntradaFicheros_cuatro_cinco_seis_siete_ocho_nueve()

#######################################################################
# Sinopsis: Se ordenan por t.llegada únicamente los datos que se meten en la introducción de procesos
# (posteriormente se ordenará todo ya que se añaden el resto de arrays con todos los datos de cada proceso).
#######################################################################
function ordenSJF { #En este caso se intercambian todos los datos al ordenar por tiempo de llegada.
	for (( i=1; i<=${#llegada[@]}; i++ )); do
		for (( j=i; j<=${#llegada[@]}; j++ )); do
			a=${llegada[$i]};
			b=${llegada[$j]}; #Asignamos variables (tiempos de llegada)
			if [[ $a -gt $b ]];      then
				aux=${proceso[$i]};
				proceso[$i]=${proceso[$j]}; #Ordenar los nombres
				proceso[$j]=$aux;
				aux=${llegada[$i]};        
				llegada[$i]=${llegada[$j]}; #Ordenar por menor tiempo de llegada
				llegada[$j]=$aux
				aux=${ejecucion[$i]};
				ejecucion[$i]=${ejecucion[$j]}; #Ordenar tiempos de ejecución 
				ejecucion[$j]=$aux;
				aux=${memoria[$i]};
				memoria[$i]=${memoria[$j]}; #Ordenar los tamaños
				memoria[$j]=$aux;
				aux=${numeroproceso[$i]};
				numeroproceso[$i]=${numeroproceso[$j]}; #Ordenar los números de proceso
				numeroproceso[$j]=$aux;
			fi
			if [[ $a -eq $b ]]; then #Si el orden de entrada coincide se arreglan dependiendo de cuál se ha metido primero
				c=${numeroproceso[$i]};
				d=${numeroproceso[$j]};
				if [[ $c -gt $d ]]; then
					aux=${proceso[$i]};
					proceso[$i]=${proceso[$j]}; #Ordenar los nombres 
					proceso[$j]=$aux
					aux=${llegada[$i]};       
					llegada[$i]=${llegada[$j]}; #Ordenar los tiempo de llegada
					llegada[$j]=$aux
					aux=${ejecucion[$i]};
					ejecucion[$i]=${ejecucion[$j]}; #Ordenar tiempos de ejecución 
					ejecucion[$j]=$aux;
					aux=${memoria[$i]};
					memoria[$i]=${memoria[$j]}; #Ordenar los tamaños
					memoria[$j]=$aux;
					aux=${numeroproceso[$i]};
					numeroproceso[$i]=${numeroproceso[$j]}; #Ordenar los números de proceso
					numeroproceso[$j]=$aux;
				fi
			fi
		done
	done
} #Fin de ordenSJF()

#######################################################################
#######################################################################
# Establecimiento de funciones para rangos                
#######################################################################
#######################################################################
# Sinopsis: Presenta una tabla con los rangos y valores calculados 
#######################################################################
function datos_memoria_tabla {
#    clear
	if [[ $seleccionMenuEleccionEntradaDatos -eq 4 ]]; then 
		echo -e "$amarillo Por favor establezca los rangos para datos"                  
	elif [[ $seleccionMenuEleccionEntradaDatos -eq 5 || $seleccionMenuEleccionEntradaDatos -eq 6 ]]; then 
		echo -e "$amarillo Resultados actuales:"                  
	fi
	echo -e "$azul┌────────────────────────────────────────────────────────────┐" | tee -a $informeConColorTotal
	printf  "$azul│$NC""${varhuecos:1:$((36))}""Min-Max rango     Valor""$azul │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Nº de Marcos de Memoria: ""${varhuecos:1:$((9 - ${#MIN_RANGE_MARCOS}))}""$MIN_RANGE_MARCOS"" - " | tee -a $informeConColorTotal 
	printf "$MAX_RANGE_MARCOS""${varhuecos:1:$((4 - ${#MAX_RANGE_MARCOS}))}""     ""${varhuecos:1:$((6 - ${#mem_num_marcos}))}""$mem_num_marcos""$azul │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Nº de Direcciones/Marco: ""${varhuecos:1:$((9 - ${#MIN_RANGE_DIRECCIONES}))}""$MIN_RANGE_DIRECCIONES"" - " | tee -a $informeConColorTotal
	printf "$MAX_RANGE_DIRECCIONES""${varhuecos:1:$((4 - ${#MAX_RANGE_DIRECCIONES}))}""     ""${varhuecos:1:$((6 - ${#mem_direcciones}))}""$mem_direcciones""$azul │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Prioridad Menor: ""${varhuecos:1:$((17 - ${#prio_menor_minInicial}))}""$prio_menor_minInicial"" - " | tee -a $informeConColorTotal
#    printf "$MAX_RANGE_prio_menor""${varhuecos:1:$((4 - ${#MAX_RANGE_prio_menor}))}""     ""${varhuecos:1:$((6 - ${#prio_menorInicial}))}""$prio_menorInicial""$azul │\n" | tee -a $informeConColorTotal
	echo -ne "$prio_menor_maxInicial""${varhuecos:1:$((4 - ${#prio_menor_maxInicial}))}""     ""${varhuecos:1:$((6 - ${#prio_menorInicial}))}""$prio_menorInicial""$azul │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Prioridad Mayor: ""${varhuecos:1:$((17 - ${#prio_mayor_minInicial}))}""$prio_mayor_minInicial"" - " | tee -a $informeConColorTotal
#    printf "$MAX_RANGE_prio_mayor""${varhuecos:1:$((4 - ${#MAX_RANGE_prio_mayor}))}""     ""${varhuecos:1:$((6 - ${#prio_mayorInicial}))}""$prio_mayorInicial""$azul │\n" | tee -a $informeConColorTotal
	echo -ne "$prio_mayor_maxInicial""${varhuecos:1:$((4 - ${#prio_mayor_maxInicial}))}""     ""${varhuecos:1:$((6 - ${#prio_mayorInicial}))}""$prio_mayorInicial""$azul │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Reubicacion: ""${varhuecos:1:$((21 - ${#MIN_RANGE_REUB}))}""$MIN_RANGE_REUB"" - " | tee -a $informeConColorTotal
	printf "$MAX_RANGE_REUB""${varhuecos:1:$((4 - ${#MAX_RANGE_REUB}))}""     ""${varhuecos:1:$((6 - ${#reub}))}""$reub""$azul │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Nº de procesos: ""${varhuecos:1:$((18 - ${#MIN_RANGE_NPROC}))}""$MIN_RANGE_NPROC"" - " | tee -a $informeConColorTotal
	printf "$MAX_RANGE_NPROC""${varhuecos:1:$((4 - ${#MAX_RANGE_NPROC}))}""     ""${varhuecos:1:$((6 - ${#n_prog}))}""$n_prog""$azul │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Tiempo de llegada: ""${varhuecos:1:$((15 - ${#MIN_RANGE_llegada}))}""$MIN_RANGE_llegada"" - " | tee -a $informeConColorTotal
	printf "$MAX_RANGE_llegada""${varhuecos:1:$((13 - ${#MAX_RANGE_llegada}))}""$azul   │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Tiempo de ejecución: ""${varhuecos:1:$((13 - ${#MIN_RANGE_tiempo_ejec}))}""$MIN_RANGE_tiempo_ejec"" - " | tee -a $informeConColorTotal
	printf "$MAX_RANGE_tiempo_ejec""${varhuecos:1:$((13 - ${#MAX_RANGE_tiempo_ejec}))}""$azul   │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Nº de marcos/proceso: ""${varhuecos:1:$((12 - ${#MIN_RANGE_tamano_marcos_proc}))}""$MIN_RANGE_tamano_marcos_proc"" - " | tee -a $informeConColorTotal
	printf "$MAX_RANGE_tamano_marcos_proc""${varhuecos:1:$((13 - ${#MAX_RANGE_tamano_marcos_proc}))}""$azul   │\n" | tee -a $informeConColorTotal
#    printf  "$azul│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((13 - ${#MIN_RANGE_prio_proc}))}""$MIN_RANGE_prio_proc"" - " | tee -a $informeConColorTotal
#    printf "$MAX_RANGE_prio_proc""${varhuecos:1:$((13 - ${#MAX_RANGE_prio_proc}))}""$azul   │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((13 - ${#prio_menorInicial}))}""$prio_menorInicial"" - " | tee -a $informeConColorTotal
	echo -ne "$prio_mayorInicial""${varhuecos:1:$((13 - ${#prio_mayorInicial}))}""$azul   │\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Quantum: ""${varhuecos:1:$((25 - ${#MIN_RANGE_quantum}))}""$MIN_RANGE_quantum"" - " | tee -a $informeConColorTotal
	printf "$MAX_RANGE_quantum""${varhuecos:1:$((16 - ${#MAX_RANGE_quantum}))}""$azul│\n" | tee -a $informeConColorTotal
	printf  "$azul│$NC Rango Nº de direcciones/proceso: ""${varhuecos:1:$((7 - ${#MIN_RANGE_tamano_direcciones_proc}))}""$MIN_RANGE_tamano_direcciones_proc"" - " | tee -a $informeConColorTotal
	printf "$MAX_RANGE_tamano_direcciones_proc""${varhuecos:1:$((16 - ${#MAX_RANGE_tamano_direcciones_proc}))}""$azul│\n" | tee -a $informeConColorTotal
	echo -e "$azul└────────────────────────────────────────────────────────────┘"  | tee -a $informeConColorTotal
	echo -e "┌────────────────────────────────────────────────────────────┐" >> $informeSinColorTotal
	printf  "│$NC""${varhuecos:1:$((36))}""Min-Max rango     Valor"" │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Nº de Marcos de Memoria: ""${varhuecos:1:$((9 - ${#MIN_RANGE_MARCOS}))}""$MIN_RANGE_MARCOS"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_MARCOS""${varhuecos:1:$((4 - ${#MAX_RANGE_MARCOS}))}""     ""${varhuecos:1:$((6 - ${#mem_num_marcos}))}""$mem_num_marcos"" │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Nº de Direcciones/Marco: ""${varhuecos:1:$((9 - ${#MIN_RANGE_DIRECCIONES}))}""$MIN_RANGE_DIRECCIONES"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_DIRECCIONES""${varhuecos:1:$((4 - ${#MAX_RANGE_DIRECCIONES}))}""     ""${varhuecos:1:$((6 - ${#mem_direcciones}))}""$mem_direcciones"" │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Prioridad Menor: ""${varhuecos:1:$((17 - ${#prio_menor_minInicial}))}""$prio_menor_minInicial"" - " >> $informeSinColorTotal
#    printf "$MAX_RANGE_prio_menor""${varhuecos:1:$((4 - ${#MAX_RANGE_prio_menor}))}""     ""${varhuecos:1:$((6 - ${#prio_menorInicial}))}""$prio_menorInicial"" │\n" >> $informeSinColorTotal
	echo -ne "$prio_menor_maxInicial""${varhuecos:1:$((4 - ${#prio_menor_maxInicial}))}""     ""${varhuecos:1:$((6 - ${#prio_menorInicial}))}""$prio_menorInicial"" │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Prioridad Mayor: ""${varhuecos:1:$((17 - ${#prio_mayor_minInicial}))}""$prio_mayor_minInicial"" - " >> $informeSinColorTotal
#    printf "$MAX_RANGE_prio_mayor""${varhuecos:1:$((4 - ${#MAX_RANGE_prio_mayor}))}""     ""${varhuecos:1:$((6 - ${#prio_mayorInicial}))}""$prio_mayorInicial"" │\n" >> $informeSinColorTotal
	echo -ne "$prio_mayor_maxInicial""${varhuecos:1:$((4 - ${#prio_mayor_maxInicial}))}""     ""${varhuecos:1:$((6 - ${#prio_mayorInicial}))}""$prio_mayorInicial"" │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Reubicacion: ""${varhuecos:1:$((21 - ${#MIN_RANGE_REUB}))}""$MIN_RANGE_REUB"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_REUB""${varhuecos:1:$((4 - ${#MAX_RANGE_REUB}))}""     ""${varhuecos:1:$((6 - ${#reub}))}""$reub"" │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Nº de procesos: ""${varhuecos:1:$((18 - ${#MIN_RANGE_NPROC}))}""$MIN_RANGE_NPROC"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_NPROC""${varhuecos:1:$((4 - ${#MAX_RANGE_NPROC}))}""     ""${varhuecos:1:$((6 - ${#n_prog}))}""$n_prog"" │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Tiempo de llegada: ""${varhuecos:1:$((15 - ${#MIN_RANGE_llegada}))}""$MIN_RANGE_llegada"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_llegada""${varhuecos:1:$((13 - ${#MAX_RANGE_llegada}))}""   │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Tiempo de ejecución: ""${varhuecos:1:$((13 - ${#MIN_RANGE_tiempo_ejec}))}""$MIN_RANGE_tiempo_ejec"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_tiempo_ejec""${varhuecos:1:$((13 - ${#MAX_RANGE_tiempo_ejec}))}""   │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Nº de marcos/proceso: ""${varhuecos:1:$((12 - ${#MIN_RANGE_tamano_marcos_proc}))}""$MIN_RANGE_tamano_marcos_proc"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_tamano_marcos_proc""${varhuecos:1:$((13 - ${#MAX_RANGE_tamano_marcos_proc}))}""   │\n" >> $informeSinColorTotal
#    printf  "│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((13 - ${#MIN_RANGE_prio_proc}))}""$MIN_RANGE_prio_proc"" - " >> $informeSinColorTotal
#    printf "$MAX_RANGE_prio_proc""${varhuecos:1:$((13 - ${#MAX_RANGE_prio_proc}))}""   │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Prioridades/proceso: ""${varhuecos:1:$((13 - ${#prio_menorInicial}))}""$prio_menorInicial"" - " >> $informeSinColorTotal
	echo -ne "$prio_mayorInicial""${varhuecos:1:$((13 - ${#prio_mayorInicial}))}""   │\n" >> $informeSinColorTotal
	printf  "│$NC Rango Quantum: ""${varhuecos:1:$((25 - ${#MIN_RANGE_quantum}))}""$MIN_RANGE_quantum"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_quantum""${varhuecos:1:$((16 - ${#MAX_RANGE_quantum}))}""│\n" >> $informeSinColorTotal
	printf  "│$NC Rango Nº de direcciones/proceso: ""${varhuecos:1:$((7 - ${#MIN_RANGE_tamano_direcciones_proc}))}""$MIN_RANGE_tamano_direcciones_proc"" - " >> $informeSinColorTotal
	printf "$MAX_RANGE_tamano_direcciones_proc""${varhuecos:1:$((16 - ${#MAX_RANGE_tamano_direcciones_proc}))}""│\n" >> $informeSinColorTotal
	echo -e "└────────────────────────────────────────────────────────────┘" >> $informeSinColorTotal
} #Fin de datos_memoria_tabla()

#######################################################################
# Sinopsis: Presenta una tabla con los datos de los rangos introducidos, y los subrangos y los valores calculables.
#######################################################################
function datos_amplio_memoria_tabla {
#    clear
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
} #Fin de datos_amplio_memoria_tabla()

#######################################################################
#######################################################################
# funciones para la petición de datos de la opción 4 ##################
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango de la memoria total 
#######################################################################
function datos_numero_marcos_memoria {
	datos_memoria_tabla 
	until [[ $MAX_RANGE_MARCOS -ge $MIN_RANGE_MARCOS && $MIN_RANGE_MARCOS -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de marcos de memoria$cian:$NC" 
		read MIN_RANGE_MARCOS #Rango minimo para la memoria
		echo -e "$cian Por favor, establezca el máximo del rango para el número de marcos de memoria$cian:$NC"
		read MAX_RANGE_MARCOS #Rango maximo para la memoria
		if [[ $MIN_RANGE_MARCOS -gt $MAX_RANGE_MARCOS ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS
			MIN_RANGE_MARCOS=$min
			MAX_RANGE_MARCOS=$max
		fi
		if [[ $MIN_RANGE_MARCOS -lt 0 && $MAX_RANGE_MARCOS -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS
			MIN_RANGE_MARCOS=$min
			MAX_RANGE_MARCOS=$max
		fi  
	done
} #Fin de datos_numero_marcos_memoria()               

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango de la memoria (rangos amplios) 
#######################################################################
function datos_numero_marcos_memoria_amplio {
	datos_amplio_memoria_tabla
	until [[ $memoria_maxInicial -ge $memoria_minInicial && $memoria_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de marcos de memoria$cian:$NC" 
		read memoria_minInicial #Rango minimo para la memoria
		echo -e "$cian Por favor, establezca el máximo del rango para el número de marcos de memoria$cian:$NC"
		read memoria_maxInicial #Rango maximo para la memoria
		if [[ $memoria_minInicial -gt $memoria_maxInicial ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $memoria_minInicial $memoria_maxInicial
			memoria_minInicial=$min
			memoria_maxInicial=$max
		fi
		if [[ $memoria_minInicial -lt 0 && $memoria_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $memoria_minInicial $memoria_maxInicial
			memoria_minInicial=$min
			memoria_maxInicial=$max
		fi  
	done
	memoria_min=$memoria_minInicial #Se definen nuevas variables para redefinir los límites de los subrangos sacados de los rangos amplios. 
	memoria_max=$memoria_maxInicial
} #Fin de datos_numero_marcos_memoria_amplio()               

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del número de procesos 
#######################################################################
function datos_numero_direcciones_marco {
	datos_memoria_tabla 
	until [[ $MAX_RANGE_DIRECCIONES -ge $MIN_RANGE_DIRECCIONES && $MIN_RANGE_DIRECCIONES -gt 0 ]]; do                 
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de direcciones por marco$cian:$NC" 
		read MIN_RANGE_DIRECCIONES #Rango minimo para la memoria
		echo -e "$cian Por favor, establezca el máximo del rango para el número de direcciones por marco$cian:$NC"
		read MAX_RANGE_DIRECCIONES #Rango maximo para la memoria
		if [[ $MIN_RANGE_DIRECCIONES -gt $MAX_RANGE_DIRECCIONES ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
			MIN_RANGE_DIRECCIONES=$min
			MAX_RANGE_DIRECCIONES=$max
		fi
		if [[ $MIN_RANGE_DIRECCIONES -lt 0 && $MAX_RANGE_DIRECCIONES -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
			MIN_RANGE_DIRECCIONES=$min
			MAX_RANGE_DIRECCIONES=$max
		fi  
	done                    
} #Fin de datos_numero_direcciones_marco() 

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del número de procesos (rangos amplios) 
#######################################################################
function datos_numero_direcciones_marco_amplio {
	datos_amplio_memoria_tabla
	until [[ $direcciones_maxInicial -ge $direcciones_minInicial && $direcciones_minInicial -gt 0 ]]; do                 
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de direcciones por marco$cian:$NC" 
		read direcciones_minInicial #Rango minimo para la memoria
		echo -e "$cian Por favor, establezca el máximo del rango para el número de direcciones por marco$cian:$NC"
		read direcciones_maxInicial #Rango maximo para la memoria
		if [[ $direcciones_minInicial -gt $direcciones_maxInicial ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $direcciones_minInicial $direcciones_maxInicial
			direcciones_minInicial=$min
			direcciones_maxInicial=$max
		fi
		if [[ $direcciones_minInicial -lt 0 && $direcciones_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $direcciones_minInicial $direcciones_maxInicial
			direcciones_minInicial=$min
			direcciones_maxInicial=$max
		fi  
	done                    
	direcciones_min=$direcciones_minInicial
	direcciones_max=$direcciones_maxInicial
} #Fin de datos_numero_direcciones_marco_amplio() 
						
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo para el mínimo del rango de la prioridad
#######################################################################
function datos_prio_menor {
	datos_memoria_tabla 
	echo -e "$cian Por favor, establezca el mínimo del rango para la prioridad menor$cian:$NC" 
	read prio_menor_minInicial #Rango minimo para la variable prioridad
	echo -e "$cian Por favor, establezca el máximo del rango para la prioridad menor$cian:$NC"
	read prio_menor_maxInicial #Rango maximo para la variable prioridad
	prio_menor_min=$prio_menor_minInicial
	prio_menor_max=$prio_menor_maxInicial
} #Fin de datos_prio_menor()                               
						
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo para el mínimo del rango de la prioridad (rangos amplios) 
#######################################################################
function datos_prio_menor_amplio {
	datos_amplio_memoria_tabla
	echo -e "$cian Por favor, establezca el mínimo del rango para la prioridad menor$cian:$NC" 
	read prio_menor_minInicial #Rango minimo para la variable prioridad
	echo -e "$cian Por favor, establezca el máximo del rango para la prioridad menor$cian:$NC"
	read prio_menor_maxInicial #Rango maximo para la variable prioridad
	prio_menor_min=$prio_menor_minInicial
	prio_menor_max=$prio_menor_maxInicial
} #Fin de datos_prio_menor_amplio()                               
						
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo para el máximo del rango de la prioridad
#######################################################################
function datos_prio_mayor {
	datos_memoria_tabla 
	echo -e "$cian Por favor, establezca el mínimo del rango para la prioridad mayor$cian:$NC" 
	read prio_mayor_minInicial #Rango minimo para la variable prioridad
	echo -e "$cian Por favor, establezca el máximo del rango para la prioridad mayor$cian:$NC"
	read prio_mayor_maxInicial #Rango maximo para la variable prioridad
	prio_mayor_min=$prio_mayor_minInicial
	prio_mayor_max=$prio_mayor_maxInicial
} #Fin de datos_prio_mayor()                               
						
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo para el máximo del rango de la prioridad (rangos amplios) 
#######################################################################
function datos_prio_mayor_amplio {
	datos_amplio_memoria_tabla
	echo -e "$cian Por favor, establezca el mínimo del rango para la prioridad mayor$cian:$NC" 
	read prio_mayor_minInicial #Rango minimo para la variable prioridad
	echo -e "$cian Por favor, establezca el máximo del rango para la prioridad mayor$cian:$NC"
	read prio_mayor_maxInicial #Rango maximo para la variable prioridad
	prio_mayor_min=$prio_mayor_minInicial
	prio_mayor_max=$prio_mayor_maxInicial
} #Fin de datos_prio_mayor_amplio()                               

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del número de procesos 
#######################################################################
function datos_numero_programas {
	datos_memoria_tabla 
	until [[ $MAX_RANGE_NPROC -ge $MIN_RANGE_NPROC && $MIN_RANGE_NPROC -gt 0 ]]; do                 
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de procesos$cian:$NC" 
		read MIN_RANGE_NPROC #Rango minimo para la memoria
		echo -e "$cian Por favor, establezca el máximo del rango para el número de procesos$cian:$NC"
		read MAX_RANGE_NPROC #Rango maximo para la memoria
		if [[ $MIN_RANGE_NPROC -gt $MAX_RANGE_NPROC ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $MIN_RANGE_NPROC $MAX_RANGE_NPROC
			MIN_RANGE_NPROC=$min
			MAX_RANGE_NPROC=$max
		fi
		if [[ $MIN_RANGE_NPROC -lt 0 && $MAX_RANGE_NPROC -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_NPROC $MAX_RANGE_NPROC
			MIN_RANGE_NPROC=$min
			MAX_RANGE_NPROC=$max
		fi  
	done                    
} #Fin de datos_numero_programas() 

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del número de procesos (rangos amplios)  
#######################################################################
function datos_numero_programas_amplio {
	datos_amplio_memoria_tabla
	until [[ $programas_maxInicial -ge $programas_minInicial && $programas_minInicial -gt 0 ]]; do                 
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de procesos$cian:$NC" 
		read programas_minInicial #Rango minimo para la memoria
		echo -e "$cian Por favor, establezca el máximo del rango para el número de procesos$cian:$NC"
		read programas_maxInicial #Rango maximo para la memoria
		if [[ $programas_minInicial -gt $programas_maxInicial ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $programas_minInicial $programas_maxInicial
			programas_minInicial=$min
			programas_maxInicial=$max
		fi
		if [[ $programas_minInicial -lt 0 && $programas_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $programas_minInicial $programas_maxInicial
			programas_minInicial=$min
			programas_maxInicial=$max
		fi  
	done                    
		programas_min=$programas_minInicial
		programas_max=$programas_maxInicial
} #Fin de datos_numero_programas_amplio() 

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del máximo de unidades de memoria admisible para la reubicabilidad
#######################################################################
function datos_tamano_reubicacion { 
	datos_memoria_tabla 
	until [[ $MAX_RANGE_REUB -ge $MIN_RANGE_REUB && $MIN_RANGE_REUB -gt 0 ]]; do #Si el mayor es menor que el menor, se invierten los rangos
		echo -e "$cian Por favor, establezca el mínimo del rango para la variable de reubicacion$cian:$NC" 
		read MIN_RANGE_REUB #Rango minimo para la variable reubicacion
		echo -e "$cian Por favor, establezca el máximo del rango para la variable de reubicacion$cian:$NC" 
		read MAX_RANGE_REUB #Rango maximo para la variable reubicacion
		if [[ $MIN_RANGE_REUB -gt $MAX_RANGE_REUB ]]; then #Si límite mínimo mayor que límite máximo
			invertirRangos $MIN_RANGE_REUB $MAX_RANGE_REUB
			MIN_RANGE_REUB=$min
			MAX_RANGE_REUB=$max
		fi
		if [[ $MIN_RANGE_REUB -lt 0 && $MAX_RANGE_REUB -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_REUB $MAX_RANGE_REUB
			MIN_RANGE_REUB=$min
			MAX_RANGE_REUB=$max
		fi  
	done                        
} #Fin de datos_tamano_reubicacion()

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del máximo de unidades de memoria admisible para la reubicabilidad (rangos amplios) 
#######################################################################
function datos_tamano_reubicacion_amplio { 
	datos_amplio_memoria_tabla
	until [[ $reubicacion_maxInicial -ge $reubicacion_minInicial && $reubicacion_minInicial -gt 0 ]]; do #Si el mayor es menor que el menor, se invierten los rangos
		echo -e "$cian Por favor, establezca el mínimo del rango para la variable de reubicacion$cian:$NC" 
		read reubicacion_minInicial #Rango minimo para la variable reubicacion
		echo -e "$cian Por favor, establezca el máximo del rango para la variable de reubicacion$cian:$NC" 
		read reubicacion_maxInicial #Rango maximo para la variable reubicacion
		if [[ $reubicacion_minInicial -gt $reubicacion_maxInicial ]]; then #Si límite mínimo mayor que límite máximo
			invertirRangos $reubicacion_minInicial $reubicacion_maxInicial
			reubicacion_minInicial=$min
			reubicacion_maxInicial=$max
		fi
		if [[ $reubicacion_minInicial -lt 0 && $reubicacion_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $reubicacion_minInicial $reubicacion_maxInicial
			reubicacion_minInicial=$min
			reubicacion_maxInicial=$max
		fi  
		reubicacion_min=$reubicacion_minInicial
		reubicacion_max=$reubicacion_maxInicial
	done                        
} #Fin de datos_tamano_reubicacion_amplio()
				
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tiempo de llegada de los procesos
#######################################################################
function datos_tiempo_llegada {
	datos_memoria_tabla 
	MIN_RANGE_llegada=-1 
	until [[ $MAX_RANGE_llegada -ge $MIN_RANGE_llegada && $(($MIN_RANGE_llegada + 1)) -gt 0 ]]; do  
		echo -e "$cian Por favor, establezca el mínimo del rango para el tiempo de llegada$cian:$NC" 
		read MIN_RANGE_llegada #Rango minimo para la variable tiempo de llegada
		echo -e "$cian Por favor, establezca el máximo del rango para el tiempo de llegada$cian:$NC" 
		read MAX_RANGE_llegada #Rango maximo para la variable tiempo de llegada
		if [[ $MIN_RANGE_llegada -gt $MAX_RANGE_llegada ]]; then
			invertirRangos $MIN_RANGE_llegada $MAX_RANGE_llegada
			MIN_RANGE_llegada=$min
			MAX_RANGE_llegada=$max
		fi
		if [[ $MIN_RANGE_llegada -lt 0 && $MAX_RANGE_llegada -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_llegada $MAX_RANGE_llegada
			MIN_RANGE_llegada=$(($min - 1)) #Este valor es el único que puede ser 0
			MAX_RANGE_llegada=$(($max - 1))
		fi  
	done
} #Fin de datos_tiempo_llegada()                       
				
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tiempo de llegada de los procesos (rangos amplios) 
#######################################################################
function datos_tiempo_llegada_amplio {
	datos_amplio_memoria_tabla
	llegada_minInicial=-1 
	until [[ $llegada_maxInicial -ge $llegada_minInicial && $(($llegada_minInicial + 1)) -gt 0 ]]; do  
		echo -e "$cian Por favor, establezca el mínimo del rango para el tiempo de llegada$cian:$NC" 
		read llegada_minInicial #Rango minimo para la variable tiempo de llegada
		echo -e "$cian Por favor, establezca el máximo del rango para el tiempo de llegada$cian:$NC" 
		read llegada_maxInicial #Rango maximo para la variable tiempo de llegada
		if [[ $llegada_minInicial -gt $llegada_maxInicial ]]; then
			invertirRangos $llegada_minInicial $llegada_maxInicial
			llegada_minInicial=$min
			llegada_maxInicial=$max
		fi
		if [[ $llegada_minInicial -lt 0 && $llegada_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $llegada_minInicial $llegada_maxInicial
			llegada_minInicial=$(($min - 1)) #Este valor es el único que puede ser 0
			llegada_maxInicial=$(($max - 1))
		fi  
		llegada_min=$llegada_minInicial
		llegada_max=$llegada_maxInicial
	done
} #Fin de datos_tiempo_llegada_amplio()                       
						
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tiempo de ejecución de los procesos
#######################################################################
function datos_tiempo_ejecucion {
	datos_memoria_tabla 
	until [[ $MAX_RANGE_tiempo_ejec -ge $MIN_RANGE_tiempo_ejec && $MIN_RANGE_tiempo_ejec -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el tiempo de ejecución$cian:$NC" 
		read MIN_RANGE_tiempo_ejec #Rango minimo para la variable tiempo de ejecución
		echo -e "$cian Por favor, establezca el máximo del rango para el tiempo de ejecución$cian:$NC"
		read MAX_RANGE_tiempo_ejec #Rango maximo para la variable tiempo de ejecución
		if [[ $MIN_RANGE_tiempo_ejec -gt $MAX_RANGE_tiempo_ejec ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $MIN_RANGE_tiempo_ejec $MAX_RANGE_tiempo_ejec
			MIN_RANGE_tiempo_ejec=$min
			MAX_RANGE_tiempo_ejec=$max
		fi
		if [[ $MIN_RANGE_tiempo_ejec -lt 0 && $MAX_RANGE_tiempo_ejec -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_tiempo_ejec $MAX_RANGE_tiempo_ejec
			MIN_RANGE_tiempo_ejec=$min
			MAX_RANGE_tiempo_ejec=$max
		fi  
	done
} #Fin de datos_tiempo_ejecucion()                               
						
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tiempo de ejecución de los procesos (rangos amplios) 
#######################################################################
function datos_tiempo_ejecucion_amplio {
	datos_amplio_memoria_tabla
	until [[ $tiempo_ejec_maxInicial -ge $tiempo_ejec_minInicial && $tiempo_ejec_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el tiempo de ejecución$cian:$NC" 
		read tiempo_ejec_minInicial #Rango minimo para la variable tiempo de ejecución
		echo -e "$cian Por favor, establezca el máximo del rango para el tiempo de ejecución$cian:$NC"
		read tiempo_ejec_maxInicial #Rango maximo para la variable tiempo de ejecución
		if [[ $tiempo_ejec_minInicial -gt $tiempo_ejec_maxInicial ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $tiempo_ejec_minInicial $tiempo_ejec_maxInicial
			tiempo_ejec_minInicial=$min
			tiempo_ejec_maxInicial=$max
		fi
		if [[ $tiempo_ejec_minInicial -lt 0 && $tiempo_ejec_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $tiempo_ejec_minInicial $tiempo_ejec_maxInicial
			tiempo_ejec_minInicial=$min
			tiempo_ejec_maxInicial=$max
		fi  
		tiempo_ejec_min=$tiempo_ejec_minInicial
		tiempo_ejec_max=$tiempo_ejec_maxInicial
	done
} #Fin de datos_tiempo_ejecucion_amplio()                               
						
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango de la prioridad de los procesos
#######################################################################
function datos_prio_proc {
	datos_memoria_tabla 
} #Fin de datos_prio_proc()                               
						
#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango de la prioridad de los procesos (rangos amplios) 
#######################################################################
function datos_prio_proc_amplio {
	datos_amplio_memoria_tabla
} #Fin de datos_prio_proc_amplio()                               

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tamaño en memoria de los procesos. Esta función no se va a ejecutar porque elrango desde el que se buscará un subrango estará formado por 1 y $mem_num_marcos (rango máximo calculado desde el rango amplio suministrado por el usuario.
#######################################################################
function datos_tamano_marcos_procesos {                
	datos_memoria_tabla 
	until [[ $MAX_RANGE_tamano_marcos_proc -ge $MIN_RANGE_tamano_marcos_proc && $MIN_RANGE_tamano_marcos_proc -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de marcos asociados a cada proceso$cian:$NC" 
		read MIN_RANGE_tamano_marcos_proc #Rango minimo para la variable tamaño del proceso en marcos
		echo -e "$cian Por favor, establezca el máximo del rango para el número de marcos asociados a cada proceso:$NC" 
		read MAX_RANGE_tamano_marcos_proc #Rango maximo para la variable tamaño del proceso en marcos
		if [[ $MIN_RANGE_tamano_marcos_proc -gt $MAX_RANGE_tamano_marcos_proc ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $MIN_RANGE_tamano_marcos_proc $MAX_RANGE_tamano_marcos_proc
			MIN_RANGE_tamano_marcos_proc=$min
			MAX_RANGE_tamano_marcos_proc=$max
		fi
		if [[ $MIN_RANGE_tamano_marcos_proc -lt 0 && $MAX_RANGE_tamano_marcos_proc -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_tamano_marcos_proc $MAX_RANGE_tamano_marcos_proc
			MIN_RANGE_tamano_marcos_proc=$min
			MAX_RANGE_tamano_marcos_proc=$max
		fi  
	done
} #Fin de datos_tamano_marcos_procesos()

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tamaño en memoria de los procesos (rangos amplios) . Esta función no se va a ejecutar porque elrango desde el que se buscará un subrango estará formado por 1 y $mem_num_marcos (rango máximo calculado desde el rango amplio suministrado por el usuario.
#######################################################################
function datos_tamano_marcos_procesos_amplio {                
	datos_amplio_memoria_tabla
	until [[ $tamano_marcos_proc_maxInicial -ge $tamano_marcos_proc_minInicial && $tamano_marcos_proc_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el número de marcos asociados a cada proceso$cian:$NC" 
		read tamano_marcos_proc_minInicial #Rango minimo para la variable tamaño del proceso en marcos
		echo -e "$cian Por favor, establezca el máximo del rango para el número de marcos asociados a cada proceso:$NC" 
		read tamano_marcos_proc_maxInicial #Rango maximo para la variable tamaño del proceso en marcos
		if [[ $tamano_marcos_proc_minInicial -gt $tamano_marcos_proc_maxInicial ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial
			tamano_marcos_proc_minInicial=$min
			tamano_marcos_proc_maxInicial=$max
		fi
		if [[ $tamano_marcos_proc_minInicial -lt 0 && $tamano_marcos_proc_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial
			tamano_marcos_proc_minInicial=$min
			tamano_marcos_proc_maxInicial=$max
		fi  
		tamano_marcos_proc_min=$tamano_marcos_proc_minInicial
		tamano_marcos_proc_max=$tamano_marcos_proc_maxInicial
	done
} #Fin de datos_tamano_marcos_procesos_amplio()

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tamaño en memoria de los procesos
#######################################################################
function datos_tamano_direcciones_procesos {                
	datos_memoria_tabla 
	until [[ $MAX_RANGE_tamano_direcciones_proc -ge $MIN_RANGE_tamano_direcciones_proc && $MIN_RANGE_tamano_direcciones_proc -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el tamaño del proceso en direcciones$cian:$NC" 
		read MIN_RANGE_tamano_direcciones_proc #Rango minimo para la variable tamaño del proceso en direcciones
		echo -e "$cian Por favor, establezca el máximo del rango para el tamaño del proceso en direcciones$cian:$NC" 
		read MAX_RANGE_tamano_direcciones_proc #Rango maximo para la variable tamaño del proceso en direcciones
		if [[ $MIN_RANGE_tamano_direcciones_proc -gt $MAX_RANGE_tamano_direcciones_proc ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $MIN_RANGE_tamano_direcciones_proc $MAX_RANGE_tamano_direcciones_proc
			MIN_RANGE_tamano_direcciones_proc=$min
			MAX_RANGE_tamano_direcciones_proc=$max
		fi
		if [[ $MIN_RANGE_tamano_direcciones_proc -lt 0 && $MAX_RANGE_tamano_direcciones_proc -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_tamano_direcciones_proc $MAX_RANGE_tamano_direcciones_proc
			MIN_RANGE_tamano_direcciones_proc=$min
			MAX_RANGE_tamano_direcciones_proc=$max
		fi  
	done
} #Fin de datos_tamano_direcciones_procesos()

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tamaño en memoria de los procesos (rangos amplios) 
#######################################################################
function datos_tamano_direcciones_procesos_amplio {                
	datos_amplio_memoria_tabla
	until [[ $tamano_direcciones_proc_maxInicial -ge $tamano_direcciones_proc_minInicial && $tamano_direcciones_proc_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el tamaño del proceso en direcciones$cian:$NC" 
		read tamano_direcciones_proc_minInicial #Rango minimo para la variable tamaño del proceso en direcciones
		echo -e "$cian Por favor, establezca el máximo del rango para el tamaño del proceso en direcciones$cian:$NC" 
		read tamano_direcciones_proc_maxInicial #Rango maximo para la variable tamaño del proceso en direcciones
		if [[ $tamano_direcciones_proc_minInicial -gt $tamano_direcciones_proc_maxInicial ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $tamano_direcciones_proc_minInicial $tamano_direcciones_proc_maxInicial
			tamano_direcciones_proc_minInicial=$min
			tamano_direcciones_proc_maxInicial=$max
		fi
		if [[ $tamano_direcciones_proc_minInicial -lt 0 && $tamano_direcciones_proc_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $tamano_direcciones_proc_minInicial $tamano_direcciones_proc_maxInicial
			tamano_direcciones_proc_minInicial=$min
			tamano_direcciones_proc_maxInicial=$max
		fi  
		tamano_direcciones_proc_min=$tamano_direcciones_proc_minInicial
		tamano_direcciones_proc_max=$tamano_direcciones_proc_maxInicial
	done
} #Fin de datos_tamano_direcciones_procesos_amplio()

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tamaño en memoria de los procesos
#######################################################################
function datos_quantum {                
	datos_memoria_tabla 
	until [[ $MAX_RANGE_quantum -ge $MIN_RANGE_quantum && $MIN_RANGE_quantum -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el quantum$cian:$NC" 
		read MIN_RANGE_quantum #Rango minimo para la variable tamaño del proceso en direcciones
		echo -e "$cian Por favor, establezca el máximo del rango para el quantum$cian:$NC" 
		read MAX_RANGE_quantum #Rango maximo para la variable tamaño del proceso en direcciones
		if [[ $MIN_RANGE_quantum -gt $MAX_RANGE_quantum ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $MIN_RANGE_quantum $MAX_RANGE_quantum
			MIN_RANGE_quantum=$min
			MAX_RANGE_quantum=$max
		fi
		if [[ $MIN_RANGE_quantum -lt 0 && $MAX_RANGE_quantum -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $MIN_RANGE_quantum $MAX_RANGE_quantum
			MIN_RANGE_quantum=$min
			MAX_RANGE_quantum=$max 
		fi  
	done
} #Fin de datos_quantum()

#######################################################################
# Sinopsis: Se piden por pantalla el mínimo y máximo del rango del tamaño en memoria de los procesos (rangos amplios) 
#######################################################################
function datos_quantum_amplio {                
	datos_amplio_memoria_tabla
	until [[ $quantum_maxInicial -ge $quantum_minInicial && $quantum_minInicial -gt 0 ]]; do
		echo -e "$cian Por favor, establezca el mínimo del rango para el quantum:$NC" 
		read quantum_minInicial #Rango minimo para la variable tamaño del proceso en direcciones
		echo -e "$cian Por favor, establezca el máximo del rango para el quantum$cian:$NC" 
		read quantum_maxInicial #Rango maximo para la variable tamaño del proceso en direcciones
		if [[ $quantum_minInicial -gt $quantum_maxInicial ]]; then #Si el mayor es menor que el menor, se invierten los rangos
			invertirRangos $quantum_minInicial $quantum_maxInicial
			quantum_minInicial=$min
			quantum_maxInicial=$max
		fi
		if [[ $quantum_minInicial -lt 0 && $quantum_maxInicial -lt 0 ]]; then #Si ambos son negativos se desplazan a positivos 
			desplazarRangos $quantum_minInicial $quantum_maxInicial
			quantum_minInicial=$min
			quantum_maxInicial=$max
		fi  
		quantum_min=$quantum_minInicial
		quantum_max=$quantum_maxInicial
	done
} #Fin de datos_quantum_amplio()

#######################################################################
#######################################################################
#   Funciones para el cálculo de los datos desde los rangos   #########
#######################################################################
# Sinopsis: Dato calculado de forma aleatoria desde su subrango. Puede usarse para calcular el Mínimo y Máximo del subrango, calculado desde el rango amplio.
#######################################################################
function calcDatoAleatorioGeneral {
	#Llamada: calcDatoAleatorioGeneral $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS #Asignación: mem_num_marcos=$datoAleatorioGeneral  #Variable devuelta: mem=$((RANDOM % ($max - $min + 1) + $min))
	min=$1 #min=$MIN_RANGE_MARCOS
	max=$2 #max=$MAX_RANGE_MARCOS
	datoAleatorioGeneral=$((RANDOM % ($max - $min + 1) + $min)) # Generar un número aleatorio dentro del rango
} #Fin de calcDatoAleatorioGeneral()

#######################################################################
# Sinopsis: #Si los mínimos son mayores que los invierten los rangos. 
#######################################################################
function invertirRangos {
	aux=$1
	min=$2
	max=$aux
} #Fin de invertirRangos()

#######################################################################
# Sinopsis: #Si mínimo y máximo son negativos se desplaza el mínimo hasta ser 0. 
#######################################################################
function desplazarRangos {
	max=$(($2 - $1 + 1)) #La condición es estrictamente mayor para que si sólo hay una unidad de diferencia se quedan iguales.
	min=1 #Todos los valores mínimos tienen que ser 1 como mínimo, salvo el tiempo de llegada que podría ser 0
} #Fin de desplazarRangos()

#######################################################################
# Sinopsis: Establece los colores de cada proceso. Se repetirán cada 6 colores.
#######################################################################
function  Establecimiento_colores_proces {
	col=1
	aux=0
	for (( i=0,j=0; i<$nprocesos; i++,j++)); do
		auxiliar=$[ ${#coloress[@]} - 2 ]
		indice[$i]=$j
		while [[ ${indice[$i]} -ge $auxiliar ]]; do
			indice[$i]=$[ ${indice[$i]} - $auxiliar ]
		done
		colores[$i]=${coloress[${indice[$i]}]}
		colorfondo[$i]=${colorfondos[${indice[$i]}]}
		if [[ $j -eq 16 ]]; then #Para que se reinicien los colores cada 16 procesos. En realidad, se hace cada 6 colores porque el resto tiene un mal contraste o no coinceden los fodos y el texto.
			j=$((j-16))
		fi
	done
} #Fin de Establecimiento_colores_proces()

#######################################################################
# Sinopsis: Dada una unidad de 3 dígitos, se calcula el número de espacios a poner por delante para rellenar.
#######################################################################
function imprimirEspaciosEstrechos { #3 - ancho de columnas estrechas en tabla resumen de procesos en los volcados 
	TamNum=$(($longCampoTablaEstrecho - $1)) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC"
} #Fin de imprimirEspaciosEstrechos()

function imprimirEspaciosEstrechosBN { #3 - ancho de columnas estrechas en tabla resumen de procesos en los volcados 
	TamNum=$(($longCampoTablaEstrecho - $1)) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal"
} #Fin de imprimirEspaciosEstrechosBN()

#######################################################################
# Sinopsis: Dada una unidad de 4 dígitos, se calcula el número de espacios a poner por delante para rellenar.
#######################################################################
function imprimirEspaciosAnchos { #4 - ancho de columnas anchas en tabla resumen de procesos en los volcados
	TamNum=$(("$longCampoTablaAncho" - "$1")) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC" 
} #Fin de imprimirEspaciosAnchos()

function imprimirEspaciosAnchosBN { #4 - ancho de columnas anchas en tabla resumen de procesos en los volcados
	TamNum=$(("$longCampoTablaAncho" - "$1")) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal" 
} #Fin de imprimirEspaciosAnchosBN()

#######################################################################
# Sinopsis: Dada una unidad de 5 dígitos, se calcula el número de espacios a poner por delante para rellenar.
#######################################################################
function imprimirEspaciosMasAnchos { #5 - ancho de columnas más anchas en tabla resumen de procesos en los volcados
	TamNum=$(( $longCampoTablaMasAncho - $1 )) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC"
} #Fin de imprimirEspaciosMasAnchos()

function imprimirEspaciosMasAnchosBN { #5 - ancho de columnas más anchas en tabla resumen de procesos en los volcados
	TamNum=$(( $longCampoTablaMasAncho - $1 )) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal"
} #Fin de imprimirEspaciosMasAnchosBN()

#######################################################################
# Sinopsis: Dada una unidad de 17 dígitos, se calcula el número de espacios a poner por delante para rellenar.
#######################################################################
function imprimirEspaciosMuyAnchos { #17 - ancho de columnas muy anchas en tabla resumen de procesos en los volcados 
	TamNum=$(( $longCampoTablaMuyAncho - $1 )) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC"
} #Fin de imprimirEspaciosMuyAnchos()

function imprimirEspaciosMuyAnchosBN { #17 - ancho de columnas muy anchas en tabla resumen de procesos en los volcados 
	TamNum=$(( $longCampoTablaMuyAncho - $1 )) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal"
} #Fin de imprimirEspaciosMuyAnchosBN()

#######################################################################
# Sinopsis: Dada una unidad de 9 dígitos, se calcula el número de espacios a poner por delante para rellenar.
#######################################################################
function imprimirEspaciosRangosLargos { #9 - ancho de columnas anchas en tabla de rangos 
	TamNum=$(( $longCampoTablaRangosLargos - $1 )) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "${varC[$i]}$espaciosfinal$NC"
} #Fin de imprimirEspaciosRangosLargos()

function imprimirEspaciosRangosLargosBN { #9 - ancho de columnas anchas en tabla de rangos 
	TamNum=$(( $longCampoTablaRangosLargos - $1 )) #No se restan los espacios laterales izquierdo y derecho porque se pintarán por separado. 
	espaciosfinal=${varhuecos:1:$TamNum}
	echo -ne "$espaciosfinal"
} #Fin de imprimirEspaciosRangosLargos()

####################################################################################
# Sinopsis: Se eliminan los archivos de última ejecución que había anteriormente creados y 
# nos direcciona a la entrada de particiones y procesos
####################################################################################
function nuevaEjecucion {
#    clear
	if [[ -f $ficheroDatosAnteriorEjecucion ]]; then
		rm $ficheroDatosAnteriorEjecucion   
	fi
	if [[ -f $ficherosRangosAnteriorEjecucion && ($seleccionMenuEleccionEntradaDatos -eq 4 || $seleccionMenuEleccionEntradaDatos -eq 6 || $seleccionMenuEleccionEntradaDatos -eq 7 || $seleccionMenuEleccionEntradaDatos -eq 8 || $seleccionMenuEleccionEntradaDatos -eq 9) ]]; then
		rm $ficherosRangosAnteriorEjecucion     
	fi
	if [[ -f $ficheroRangosAleTotalAnteriorEjecucion && ($seleccionMenuEleccionEntradaDatos -eq 7 || $seleccionMenuEleccionEntradaDatos -eq 9) ]]; then
		rm $ficheroRangosAleTotalAnteriorEjecucion     
	fi
} #Fin de nuevaEjecucion()

#######################################################################
# Sinopsis: Se calcula el tamaño máximo de la unidad para contener todos los datos que se generen sin modificar el ancho de la columna necesaria
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
} #Fin de calcularUnidad()

####################################################################################
# Sinopsis: Permite introducir las particiones y datos desde otro fichero (predefinido).
####################################################################################
function entradaMemoriaDatosFichero {
#    clear
	echo -e $ROJO"\nFicheros de datos a elegir en './FDatos/': "$NORMAL | tee -a $informeConColorTotal
	echo -e "\nFicheros de datos a elegir en './FDatos/': " >> $informeSinColorTotal
	files=($(ls -l ./FDatos/ | awk '{print $9}'))
	for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
		echo -e "$i) ${files[$i]}"
	done
	echo -ne "$AMARILLO\n\n\nIntroduce el número correspondiente al fichero a analizar: $NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n\nIntroduce el número correspondiente al fichero a analizar: " >> $informeSinColorTotal
	read -r numeroFichero
	until [[ "0" -le $numeroFichero && $numeroFichero -lt ${#files[@]} && $numeroFichero -ne "" ]]; do
		echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read -r numeroFichero
		echo -e "$numeroFichero\n\n" >> $informeConColorTotal
		echo -e "$numeroFichero\n\n" >> $informeSinColorTotal
	done
	ficheroParaLectura="./FDatos/${files[$numeroFichero]}"
} #Fin de entradaMemoriaDatosFichero()

####################################################################################
# Sinopsis: Permite introducir las particiones y datos desde otro fichero (predefinido).
####################################################################################
function entradaMemoriaRangosFichero {
#    clear
	echo -e $ROJO"\nFicheros de datos a elegir en './FDatos/': "$NORMAL | tee -a $informeConColorTotal
	echo -e "\nFicheros de datos a elegir en './FDatos/': " >> $informeSinColorTotal
	files=($(ls -l ./FDatos/ | awk '{print $9}'))
	for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
		echo -e "$i) ${files[$i]}"
	done
	echo -ne "$AMARILLO\n\n\nIntroduce el número correspondiente al fichero a analizar: $NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n\nIntroduce el número correspondiente al fichero a analizar: " >> $informeSinColorTotal
	read -r numeroFichero
	until [[ "0" -le $numeroFichero && $numeroFichero -lt ${#files[@]} && $numeroFichero -ne "" ]]; do
		echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read -r numeroFichero
		echo -e "$numeroFichero\n\n" >> $informeConColorTotal
		echo -e "$numeroFichero\n\n" >> $informeSinColorTotal
	done
	ficheroParaLectura="./FDatos/${files[$numeroFichero]}"
} #Fin de datos_numero_marcos_memoria_amplio()

####################################################################################
####################################################################################
# Funciones de inicialización ######################################################
####################################################################################
# Sinopsis: Se inicilizan diferentes tablas y variables
####################################################################################
function inicializaVectoresVariables { 
	# -----------------------------------------------------------------------------
	# Se inicilizan las tablas indicadoras de la MEMORIA NO CONTINUA
	#Se crea el array para determinar qué unidades de memoria están ocupadas y se inicializan con _
	for (( ca=0; ca<(mem_num_marcos); ca++)); do
		unidMemOcupadas[$ca]="_"
		unidMemOcupadasAux[$ca]="_" #Se inicializa un array auxiliar para realizar la reubicación
	done
	#Se crea variables para determinar si hay que reubicar (en un primer momento no)
	#En caso de ser memoria no continua, si hay un hueco demasiado pequeño, y se va a usar como parte de la memoria a usar.
	reubicarReubicabilidad=0 
	#En caso de ser memoria continua, si no hay un hueco suficientemente grande en el que quepa pero sí en la suma de todos ellos.
	reubicarContinuidad=0 
	# -----------------------------------------------------------------------------
	# Se inicilizan las tablas indicadoras de la situación del proceso
	for (( i=0; i<$nprocesos; i++)); do #Copia algunas listas para luego ponerlas en orden
		temp_rej[$i]="-"
		tejecucion[$i]=${ejecucion[$i]} #Para ser equivalente al nuevo programa
		encola[$i]=0
		enmemoria[$i]=0
		enejecucion[$i]=0
		bloqueados[$i]=0
		enpausa[$i]=0 
		terminados[$i]=0 #Determina qué procesos han terminado.
		terminadosAux[$i]=0 #Determina qué procesos han terminado cuyo resumen de fallos de página ha sido imprimido.
		fueraDelSistema[$i]=0
		estad[$i]=0 
		estado[$i]=0
		temp_wait[$i]="-"
		temp_resp[$i]="-"
		temp_ret[$i]="-"
		pos_inicio[$i]="-"
		pos_final[$i]="-"
		escrito[$i]=0 #Guarda si un proceso está escrito o no EN EL ARRAY.
		bloques[$i]=0 #Almacena el número de bloques en los que se fragmenta un proceso
		nomtiempo[$i]=0 #Controla qué procesos están presentes en la banda de tiempo. Se van poniendo a 1 a medida que se van metiendo en las variables de las líneas de la banda de tiempos.
		numeroMarcosUsados[$i]=0 #Número de Marcos ya usadas de cada Proceso.
		numeroPaginasUsadasProceso[$i]=0 #Número de Páginas ya usadas de cada Proceso.
		numMarcosDibujadosPorProceso[$i]=0 #Número de Marcos en Memoria con Páginas ya dibujadas de cada Proceso para el resumen de Banda.
		numPaginasDibujadas[$i]=0 #Número de Páginas ya dibujadas de cada Proceso para el resumen de Banda.		
		contadorAlgPagFallosTotalesProcesos[$i]=0 #Fallos de página totales de cada proceso.
		max_AlgPagFrecRec_FrecRec[$i]=-1 #Mayor "frecuencia/uso de página".
		max_AlgPagFrecRec_Position[$i]=0
		min_AlgPagFrecRec_FrecRec[$i]=0 #Menor "frecuencia/uso de página".
		min_AlgPagFrecRec_Position[$i]=0
		indiceResuPaginaProceso[$i]="_"
		indiceResuPaginaAcumulado[$i]="_"
		contadorAlgPagFallosProcesoAcumulado[$i]=0 #Número de Fallos de Página de cada Proceso.
		contadorAlgPagExpulsionesForzadasProcesoAcumulado[$i]=0 #Número de expulsiones forzadas en Round-Robin (RR) 
		for (( indMarco=0; indMarco<${memoria[$i]}; indMarco++ )); do #Controlan el ordinal del tiempo de ejecución que hace que se cambió un valor de las clases y la frecuencia de uso de cada página en cada ordinal de tiempo de ejecución.
			primerTiempoEntradaPagina[$i,$indMarco]=0 
			restaFrecUsoRec[$i,$indMarco,0]=0
			directions_AlgPagFrecUsoRec_marco_pagina_clase[$i,$indMarco,0]=0
			directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$i,$indMarco]=0
		done
		colaTiempoRR[$i]=-1 #Contiene el orden de ejecución de Round-Robin (RR). Será "-" mientras no esté en cola, o cuando haya terminado, y si aún no ha terminado contendrá el número ordinal del siguiente quantum. El proceso a ejecutar será, por tanto, el que tenga el número ordinal más bajo. Y el número de quantums realizados (cambios de contexto, será el número ordinal más alto.
		contadorAlgPagFallosProcesoAcumulado[$i]=0 #El número de fallos de página totales es la suma de los números de marcos asociados a cada proceso con páginas.
		contadorAlgPagFallosTotalesProcesos[$i]=0
		maxpagsNoVirtual[$i]=0 #El número más alto entre todas las páginas en cada proceso.
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
	Establecimiento_colores_proces #Establece el color de cada proceso
	mem_libre=$mem_num_marcos #Para ser equivalente al nuevo programa
	mem_aux=$mem_num_marcos #Para ser equivalente al nuevo programa
	maxProcPorUnidadTiempoBT=0 # Se calcula el valor máximo del número de unidades de tiempo. Como mucho, los tiempos de llegada más los tiempos de ejecución. Ese será el número de elementos máximo del array procPorUnidadTiempoBT 
	for ((j = 0; j < ${#proceso[@]}; j++)); do
		maxProcPorUnidadTiempoBT=$(expr $maxProcPorUnidadTiempoBT + ${llegada[$j]} + ${ejecucion[$j]})  
	done  
	topeProcPorUnidadTiempoBT=$maxProcPorUnidadTiempoBT # Se pone un valor que nunca se probará (tope dinámico). Osea, el mismo que maxProcPorUnidadTiempoBT.
	procFinalizado=-1  #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
	ejecutandoinst=-1
	calcularUnidad #Determina el mayor número que podría ser representado por Tllegada y Tejecucion
	contadorTiempoRR=0 #Timpo ejecutado de un proceso que se comparará con el quantum para ser sacado de CPU.
	indiceColaTiempoRRLibre=0 #Índice con el primer ordinal libre a repartir en Round-Robin (RR). Irá creciendo con cada puesto de quantum repartido y marca el futuro orden de ejecución. 
	indiceColaTiempoRREnEjecucion=0 #Índice con el actual ordinal en ejecución para Round-Robin (RR). Irá creciendo con cada quantum ejecutado y marca el actual número ordinal de uantum en ejecución. 
#    clear
} #Fin de inicializaVectoresVariables()

####################################################################################
# Sinopsis: Se inicializan las variables con diferentes acumulados en cada instante de reloj. Algunos acumulados sólo serían necesarios cuando se produzcan eventos, pero se podrían generalizar haciendo acumulados en cada instante. 
####################################################################################
function inicializarAcumulados { #Se ejecuta en cada instante mientra que otras funciones sólo si se producen ciertas condiciones. Sería mejor inicializar aquí los acumulados.
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se arrastran los datos del siguiente fallo de página para cada proceso en cada unidad de tiempo.
		if [[ $reloj -ne 0 ]]; then
			ResuPunteroMarcoSiguienteFalloPagAcumulado[$counter,$reloj]=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$counter,$((reloj - 1))]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
		fi
	done
} #Fin de inicializarAcumulados()

####################################################################################
####################################################################################
# Funciones para la gestión de procesos ############################################
####################################################################################
# Sinopsis: Gestión de procesos - FCFS
####################################################################################
function gestionProcesosFCFS {
	if [[ $cpu_ocupada == "NO" ]]; then
		if [[ $realizadoAntes -eq 0 ]]; then  
			indice_aux=-1
			for (( i=0; i<$nprocesos; i++ )); do  #Establecemos qué proceso es el siguiente que llega a memoria.
				if [[ ${enmemoria[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
					indice_aux=$i #El siguiente proceso que llega a memoria
					temp_aux=${temp_rej[$i]}
					break
				fi
			done
			if ! [[ "$indice_aux" -eq -1 ]]; then #Hemos encontrado el siguiente proceso en memoria
				enejecucion[$indice_aux]=1 #Marco el proceso para ejecutarse
				enpausa[$indice_aux]=0 #Quitamos el estado pausado si el proceso lo estaba anteriormente
				enmemoria[$indice_aux]=1 #Marcamos el proceso como en memoria
				cpu_ocupada=SI #La CPU está ocupada por un proceso
				avisoEntradaCPU[$indice_aux]=1 #Se activa el aviso de entrada en CPU del volcado
			fi
		fi
	fi
	if [[ $cpu_ocupada == "SI" ]]; then #Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		for (( i=0; i<$nprocesos; i++ )); do
			if [[ ${enejecucion[$i]} -eq 1 ]]; then
				ejecutandoinst=$i
			fi
		done
		if [[ $ejecutandoinst -ge 0 ]]; then #Si no hay proceso en ejecución se pone -1, para que pueda ser comparado.  
			ResuTiempoProceso[$reloj]=$ejecutandoinst #Resumen - Proceso en ejecución en cada instante de tiempo. 
		else
			ResuTiempoProceso[$reloj]=-1
		fi 
	fi
	if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Si se trabaja NFU/NRU con clases.
		if [[ $reloj -gt 0 ]]; then #Se traspasan todos los datos al siguiente instante para ser modificados, si se produce nmodificaciones al analizar los fallos y usos de las páginas. 
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
				for (( numMarco=0; numMarco<${memoria[$numProc]}; numMarco++ )); do # 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
	fi #Después de inicializar estos valores, se ejecutan las funciones que actualizarán los valores.
	if [[ $cpu_ocupada == "SI" ]]; then #Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagNoVirtual #Se lanza la gestión sin algoritmo de paginación, dado que en memoria no virtual los procesos entran en memoria de forma completa y no por páginas como en memoria virtual.
		elif [[ $seleccionAlgoritmoPaginacion -ge 1 && $seleccionAlgoritmoPaginacion -le 4 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagAlgPagFrecFIFORelojSegOp #Se lanza la gestión del algoritmo de paginación FIFO - FIFO con Segunda Oportunidad - Reloj - Reloj con Segunda Oportunidad.
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
			gestionAlgoritmoPagAlgPagFrecMFULFUNFU #Se lanza la gestión del algoritmo de paginación More Frequently Used (MFU) - Lest Frequently Used (LFU) - No Frequently Used (NFU) sobre MFU, sobre LFU y con clases (sobre MFU y sobre LFU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		fi
	fi 

	#ESTADO DE CADA PROCESO
	#Se modifican los valores de los arrays, restando de lo que quede
	#ESTADO DE CADA PROCESO EN EL TIEMPO ACTUAL Y HALLAMOS LAS VARIABLES. (Las cuentas se realizaran tras imprimir.)
	for (( i=0; i<$nprocesos; i++ )); do
		if [[ ${fueraDelSistema[$i]} -eq 1 ]] ; then
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
		if [[ ${encola[$i]} -eq 1 && ${bloqueados[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Aunque no entre en memoria ya tiene datos a considerar.
		fi
		if [[ ${encola[$i]} -eq 1 && ${bloqueados[$i]} -eq 1 ]] ; then
			estado[$i]="En espera"
			estad[$i]=1
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Cuando entre en memoria, si no se había considerado antes en cola, ya tiene datos a considerar.
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${enejecucion[$i]} -eq 1 ]] ; then
			estado[$i]="En ejecucion"
			estad[$i]=3
			procPorUnidadTiempoBT[$reloj]=$i #Mete el número de orden del proceso que se mantiene en ejecución en la posición reloj de procPorUnidadTiempoBT.
		elif [[ ${enmemoria[$i]} -eq 1 && ${enpausa[$i]} -eq 1 ]] ; then #No es necesario porque FCFS no es apropiativo.
			estado[$i]="En pausa"
		elif [[ ${enmemoria[$i]} -eq 1 ]] ; then
			estado[$i]="En memoria"
			estad[$i]=2
		fi
		if [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -ne 1 ]] ; then #Tiene esta doble condición porque una vez que pase a terminado no puede estar en otro estado.
			estado[$i]="Finalizado"
			estad[$i]=5
			procFinalizado=$i #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
		elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
			estado[$i]="Finalizado"
			estad[$i]=5
		fi
	done

	#Se pone el estado del siguiente que se vaya a ejecutar (si algún proceso ha terminado) "En ejecucion"
	#SUMAR EL SEGUNDO DEL CICLO ANTES DE PONER ESTE ESTADO
	if [[ "$finalprocesos" -eq 0 ]]; then #En caso de que finalprocesos sea 0, se termina con el programa.
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then #Siempre se imprimie el volcado en T=0. y también cuando se escoja la impresión unidad de tiempo a unidad de tiempo (seleccionMenuModoTiempoEjecucionAlgormitmo = optejecucion = 4).
		evento=1
	fi
	if [[ $optejecucion = "5" ]]; then #Si no se quiere hacer ninguna representación intermedia en pantalla pero sí se quiere ver el resultado final y recogerlo en los ficheros de informes.
		evento=0
	fi
} #Fin de gestionProcesosFCFS()

####################################################################################
# Sinopsis: Gestión de procesos - SJF
####################################################################################
function gestionProcesosSJF {
	#ESTADO DE CADA PROCESO EN EL TIEMPO ACTUAL Y HALLAMOS LAS VARIABLES. (Las cuentas se realizarán tras lanzar el volcado.)
	for (( i=0; i<$nprocesos; i++ )); do #Se modifican los valores de los arrays.
		if [[ ${fueraDelSistema[$i]} -eq 1 ]] ; then #No ha llegado por tiempo de llegada.
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
		if [[ ${encola[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then #Se encola pero no ha llegado por tiempo de llegada.
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Aunque no entre en memoria ya tiene datos a considerar.
			estado[$i]="En espera"
			estad[$i]=1
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then #Se mete en memoria.
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]}  #Cuando entre en memoria, si no se había considerado antes en cola, ya tiene datos a considerar.
		fi
	done
 
	if [[ $cpu_ocupada == "NO" ]]; then #Se establece el proceso con menor tiempo de ejecución de los que están en memoria.
		if [[ $realizadoAntes -eq 0 ]]; then  
			indice_aux=0 #Contendrá un tiempo de ejecución de referencia (el primero encontrado) para su comparación con el de otros procesos.
			temp_aux=0
			for (( i=0; i<$nprocesos; i++ )); do  #Se busca el primer tiempo de ejecución de todos los que se encuentran en memoria.
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${temp_rej[$i]} -gt $temp_aux ]]; then
						indice_aux=$i #Proceso de referencia
						temp_aux=${temp_rej[$i]} #Tiempo de ejecución de referencia
					fi
				fi
			done #Una vez encontrado el primero, se van a comparar todos los procesos hasta encontrar el de tiempo restante de ejecución más pequeño.
			min_indice_aux=-1  
			min_temp_aux=$(($temp_aux + 1)) #Contendrá el menor tiempo de ejecución para su comparación con el de otros procesos.
			for (( i=0; i<$nprocesos; i++ )); do  #Se establece qué proceso tiene menor tiempo de ejecución de todos los que se encuentran en memoria.
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${temp_rej[$i]} -lt $min_temp_aux ]]; then
						min_indice_aux=$i #Proceso de ejecución más corta hasta ahora
						min_temp_aux=${temp_rej[$i]} #Tiempo de ejecución menor hasta ahora
					fi
				fi
			done
			if [[ "$min_indice_aux" -ne -1 ]]; then #Una vez encontrado el proceso más corto, se pone en ejecución. Y si había otro en ejecución y no ha terminado, se marca como "En pausa".
				enejecucion[$min_indice_aux]=1 #Marco el proceso para ejecutarse.
				enpausa[$min_indice_aux]=0 #Quitamos el estado pausado si el proceso lo estaba anteriormente.
				cpu_ocupada=SI #La CPU está ocupada por un proceso.
				avisoEntradaCPU[$min_indice_aux]=1 #Se activa el aviso de entrada en CPU del volcado
			fi
		fi
	fi
	if [[ $cpu_ocupada == "SI" ]]; then #Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		for (( i=0; i<$nprocesos; i++ )); do
			if [[ ${enejecucion[$i]} -eq 1 ]]; then
				ejecutandoinst=$i
			fi
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enejecucion[$i]} -eq 1 ]] ; then 
				estado[$i]="En ejecucion"
				estad[$i]=3
				procPorUnidadTiempoBT[$reloj]=$i #Mete el número de orden del proceso que se mantiene en ejecución en la posición reloj de procPorUnidadTiempoBT.
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enpausa[$i]} -eq 1 ]] ; then #No es necesario porque SJF no es apropiativo.
				estado[$i]="En pausa"
				estad[$i]=4
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  ]] ; then
				estado[$i]="En memoria"
				estad[$i]=2
			fi
			if [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -ne 1 ]] ; then #Tiene esta doble condición porque una vez que pase a terminado no puede estar en otro estado.
				estado[$i]="Finalizado"
				estad[$i]=5
				procFinalizado=$i #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
			elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
				estado[$i]="Finalizado"
				estad[$i]=5
			fi
		done
	fi
	if [[ $ejecutandoinst -ge 0 ]]; then #Si no hay proceso en ejecución se pone -1, para que pueda ser comparado.  
		ResuTiempoProceso[$reloj]=$ejecutandoinst #Resumen - Proceso en ejecución en cada instante de tiempo. 
	else
		ResuTiempoProceso[$reloj]=-1
	fi 

	if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Si se trabaja NFU/NRU con clases.
		if [[ $reloj -gt 0 ]]; then #Se traspasan todos los datos al siguiente instante para ser modificados, si se produce nmodificaciones al analizar los fallos y usos de las páginas. 
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
				for (( numMarco=0; numMarco<${memoria[$numProc]}; numMarco++ )); do # 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
	fi #Después de inicializar estos valores, se ejecutan las funciones que actualizarán los valores.

	if [[ $cpu_ocupada == "SI" ]]; then #Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagNoVirtual #Se lanza la gestión sin algoritmo de paginación, dado que en memoria no virtual los procesos entran en memoria de forma completa y no por páginas como en memoria virtual.
		elif [[ $seleccionAlgoritmoPaginacion -ge 1 && $seleccionAlgoritmoPaginacion -le 4 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagAlgPagFrecFIFORelojSegOp #Se lanza la gestión del algoritmo de paginación FIFO - FIFO con Segunda Oportunidad - Reloj - Reloj con Segunda Oportunidad.
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
			gestionAlgoritmoPagAlgPagFrecMFULFUNFU #Se lanza la gestión del algoritmo de paginación More Frequently Used (MFU) - Lest Frequently Used (LFU) - No Frequently Used (NFU) sobre MFU, sobre LFU y con clases (sobre MFU y sobre LFU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		fi
	fi

	#Se pone el estado del siguiente que se vaya a ejecutar (si algún proceso ha terminado) "En ejecucion"
	#SUMAR EL SEGUNDO DEL CICLO ANTES DE PONER ESTE ESTADO
	if [[ "$finalprocesos" -eq 0 ]]; then #En caso de que finalprocesos sea 0, se termina con el programa.
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then 
		evento=1
	fi
	if [[ $optejecucion = "5" ]]; then #Si no se quiere hacer ninguna representación intermedia en pantalla pero sí se quiere ver el resultado final y recogerlo en los ficheros de informes.
		evento=0
	fi
} #Fin de gestionProcesosSJF()

####################################################################################
# Sinopsis: Gestión de procesos - SRPT
####################################################################################
function gestionProcesosSRPT {
	#ESTADO DE CADA PROCESO EN EL TIEMPO ACTUAL Y HALLAMOS LAS VARIABLES. (Las cuentas se realizarán tras lanzar el volcado.)
	for (( i=0; i<$nprocesos; i++ )); do #Se modifican los valores de los arrays.
		if [[ ${fueraDelSistema[$i]} -eq 1 ]] ; then #No ha llegado por tiempo de llegada.
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
		if [[ ${encola[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then #Se encola pero no ha llegado por tiempo de llegada.
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Aunque no entre en memoria ya tiene datos a considerar.
			estado[$i]="En espera"
			estad[$i]=1
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then #Se mete en memoria.
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Cuando entre en memoria, si no se había considerado antes en cola, ya tiene datos a considerar.
		fi
	done
 
	if [[ $cpu_ocupada == "SI" || $cpu_ocupada == "NO" ]]; then #Se establece el proceso con mayor y menor tiempo de ejecución de los que están en memoria.
		if [[ $realizadoAntes -eq 0 ]]; then  
			indice_aux=0 #Contendrá un tiempo de ejecución de referencia (el mayor tiempo de ejecución encontrado) para su comparación con el de otros procesos. Se busca el mayor para poder encontrar el primero de los de tiempo de ejecución más bajo.
			temp_aux=0
			for (( i=0; i<$nprocesos; i++ )); do  #Se busca el mayor tiempo de ejecución de todos los que se encuentran en memoria.
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${temp_rej[$i]} -gt $temp_aux ]]; then
						indice_aux=$i #Proceso con el mayor tiempo de ejecución.
						temp_aux=${temp_rej[$i]} #Tiempo de ejecución de referencia.
					fi
				fi
			done #Una vez encontrado el mayor, se van a comparar todos los procesos hasta encontrar el de menor tiempo restante de ejecución.
			min_indice_aux=-1  
			min_temp_aux=$(($temp_aux + 1)) #Contendrá el menor tiempo de ejecución para su comparación con el de otros procesos.
			for (( i=0; i<$nprocesos; i++ )); do  #Se establece qué proceso tiene menor tiempo de ejecución de todos los que se encuentran en memoria.
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${temp_rej[$i]} -lt $min_temp_aux ]]; then
						min_indice_aux=$i #Proceso de tiempo de ejecución más bajo hasta ahora.
						min_temp_aux=${temp_rej[$i]} #Tiempo de ejecución menor hasta ahora.
					fi
				fi
			done
			if [[ "$min_indice_aux" -ne -1 && $min_indice_aux -ne $anteriorProcesoEjecucion ]]; then #Una vez encontrado el proceso más corto, se pone en ejecución. Y si había otro en ejecución y no ha terminado, se marca como "En pausa".
				enejecucion[$anteriorProcesoEjecucion]=0 #Marcamos el proceso como no ejecutándose si lo estaba anteriormente.
				if [[ $anteriorProcesoEjecucion -ne -1 ]]; then #Este bucle evita un problema con el estado "En pausa" del último proceso, cuando en realidad, está "En memoria" porque se produce cuando $anteriorProcesoEjecucion=-1 al principio de la ejecución...
					enpausa[$anteriorProcesoEjecucion]=1 #Ponemos el estado pausado si el proceso anteriormente en ejecución.
				fi
				enejecucion[$min_indice_aux]=1 #Marco el proceso para ejecutarse.
				enpausa[$min_indice_aux]=0 #Quitamos el estado pausado si el proceso lo estaba anteriormente.
				cpu_ocupada=SI #La CPU está ocupada por un proceso.
				if [[ $anteriorProcesoEjecucion -ne -1 ]]; then #Si había otro proceso en ejecución con anterioridad se avisa que se pone en pausa.
					avisoPausa[$anteriorProcesoEjecucion]=1 
				fi
				avisoEntradaCPU[$min_indice_aux]=1 #Se activa el aviso de entrada en CPU del volcado
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
				procPorUnidadTiempoBT[$reloj]=$i #Mete el número de orden del proceso que se mantiene en ejecución en la posición reloj de procPorUnidadTiempoBT.
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enpausa[$i]} -eq 1 ]] ; then
				estado[$i]="En pausa"
				estad[$i]=4
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  ]] ; then
				estado[$i]="En memoria"
				estad[$i]=2
			fi
			if [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -ne 1 ]] ; then #Tiene esta doble condición porque una vez que pase a terminado no puede estar en otro estado.
				estado[$i]="Finalizado"
				estad[$i]=5
				procFinalizado=$i #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
			elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
				estado[$i]="Finalizado"
				estad[$i]=5
			fi
		done
	fi
	if [[ $ejecutandoinst -ge 0 ]]; then #Si no hay proceso en ejecución se pone -1, para que pueda ser comparado. 
		ResuTiempoProceso[$reloj]=$ejecutandoinst #Resumen - Proceso en ejecución en cada instante de tiempo. 
	else
		ResuTiempoProceso[$reloj]=-1
	fi 

	if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Si se trabaja NFU/NRU con clases.
		if [[ $reloj -gt 0 ]]; then #Se traspasan todos los datos al siguiente instante para ser modificados, si se producen modificaciones al analizar los fallos y usos de las páginas.   
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
				for (( numMarco=0; numMarco<${memoria[$numProc]}; numMarco++ )); do # 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
	fi #Después de inicializar estos valores, se ejecutan las funciones que actualizarán los valores.

	if [[ $cpu_ocupada == "SI" ]]; then ##Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagNoVirtual #Se lanza la gestión sin algoritmo de paginación, dado que en memoria no virtual los procesos entran en memoria de forma completa y no por páginas como en memoria virtual.
		elif [[ $seleccionAlgoritmoPaginacion -ge 1 && $seleccionAlgoritmoPaginacion -le 4 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagAlgPagFrecFIFORelojSegOp #Se lanza la gestión del algoritmo de paginación FIFO - FIFO con Segunda Oportunidad - Reloj - Reloj con Segunda Oportunidad.
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
			gestionAlgoritmoPagAlgPagFrecMFULFUNFU #Se lanza la gestión del algoritmo de paginación More Frequently Used (MFU) - Lest Frequently Used (LFU) - No Frequently Used (NFU) sobre MFU, sobre LFU y con clases (sobre MFU y sobre LFU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		fi
	fi
	
	#Se pone el estado del siguiente que se vaya a ejecutar (si algún proceso ha terminado) "En ejecucion"
	#SUMAR EL SEGUNDO DEL CICLO ANTES DE PONER ESTE ESTADO
	if [[ "$finalprocesos" -eq 0 ]]; then #En caso de que finalprocesos sea 0, se termina con el programa.
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then 
		evento=1
	fi
	if [[ $optejecucion = "5" ]]; then #Si no se quiere hacer ninguna representación intermedia en pantalla pero sí se quiere ver el resultado final y recogerlo en los ficheros de informes.
		evento=0
	fi
} #Fin de gestionProcesosSRPT()

####################################################################################
# Sinopsis: Gestión de procesos - Prioridades (Mayor/Menor)
####################################################################################
function gestionProcesosPrioridades {
	#ESTADO DE CADA PROCESO EN EL TIEMPO ACTUAL Y HALLAMOS LAS VARIABLES. (Las cuentas se realizarán tras lanzar el volcado.)
	for (( i=0; i<$nprocesos; i++ )); do #Se modifican los valores de los arrays.
		if [[ ${fueraDelSistema[$i]} -eq 1 ]] ; then #No ha llegado por tiempo de llegada.
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
		if [[ ${encola[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then #Se encola pero no ha llegado por tiempo de llegada.
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Aunque no entre en memoria ya tiene datos a considerar.
			temp_prio[$i]=${prioProc[$i]} #Aunque no entre en memoria ya tiene datos a considerar.
			estado[$i]="En espera"
			estad[$i]=1
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then #Se mete en memoria.
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Cuando entre en memoria, si no se había considerado antes en cola, ya tiene datos a considerar.
			temp_prio[$i]=${prioProc[$i]} #Cuando entre en memoria, si no se había considerado antes en cola, ya tiene datos a considerar.
		fi
	done
	if [[ $realizadoAntes -eq 0 ]]; then  
		cerrojo_aux=0
		indice_aux=-1 #Variable de cierre
		for (( i=0; i<$nprocesos; i++ )); do  #Se busca la mayor prioridad de todas las que se encuentran en memoria.
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
				if [[ $cerrojo_aux -eq 0 ]]; then #Se inicializan las variables para determinar el mayor valor de la priridad de los procesos en memoria.
					indice_aux=$i #Se inicializa la variable con el primer proceso para la menor prioridad.
					prio_aux=${temp_prio[$i]} #Prioridad de referencia.
					cerrojo_aux=1
				fi
				if [[ ${temp_prio[$i]} -gt $prio_aux && $cerrojo_aux -eq 1 ]]; then
					indice_aux=$i #Proceso con la menor prioridad.
					prio_aux=${temp_prio[$i]} #Prioridad de referencia.
				fi
			fi
		done #Una vez encontrada la mayor prioridad, se van a comparar todos los procesos hasta encontrar el de prioridad más baja.
		max_indice_aux=$indice_aux #Prioridad mayor de los procesos en memoria.
		max_prio_aux=$prio_aux #Proceso con la mayor prioridad.
		min_indice_aux=-1 #Variable de cierre  
		min_prio_aux=$(($prio_aux + 1)) #Contendrá la menor prioridad para su comparación con la de otros procesos. Se le pone un valor superior al máximo porque se busca el primero de los que tengan el menor valor.
		for (( i=0; i<$nprocesos; i++ )); do  #Se establece qué proceso tiene menor prioridad de todos los que se encuentran en memoria.
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${terminados[$i]} -ne 1 ]]; then
				if [[ ${temp_prio[$i]} -lt $min_prio_aux ]]; then
					min_indice_aux=$i #Proceso de prioridad más baja hasta ahora
					min_prio_aux=${temp_prio[$i]} #Prioridad menor hasta ahora
				fi
			fi
		done
	fi
	if [[ $invertirDatoPrioridadesInversa -eq 1 ]]; then #Si es Prioridad Mayor y se invierte el rango, se calcula la Prioridad Menor, y viveversa. 
		if [[ $seleccionTipoPrioridad -eq 1 ]]; then 
			seleccionTipoPrioridad_2=2
		elif [[ $seleccionTipoPrioridad -eq 2 ]]; then 
			seleccionTipoPrioridad_2=1
		fi
	elif [[ $invertirDatoPrioridadesInversa -eq 0 ]]; then #Si el rango de Prioridades no se invierte, se deja sin modificar la elección Mayor/Menor.
		seleccionTipoPrioridad_2=$seleccionTipoPrioridad
	fi
	if [[ $cpu_ocupada == "SI" || $cpu_ocupada == "NO" ]]; then #Se establece el proceso con menor prioridad de los que están en memoria.
		#seleccionTipoPrioridad_2 - 1-Mayor - 2-Menor #seleccionMenuApropiatividad - 1-No apropiativo - 2-Apropiativo
		if [[ $seleccionTipoPrioridad_2 -eq 1 && $seleccionMenuApropiatividad -eq 2 ]]; then #Prioridad Mayor/Apropiativo - Se roba la CPU por ser Apropiativo.
			if [[ $max_indice_aux -ne $anteriorProcesoEjecucion ]]; then #Una vez encontrado el proceso de menor prioridad, se pone en ejecución. Y si había otro en ejecución y no ha terminado, se marca como "En pausa".
				enejecucion[$anteriorProcesoEjecucion]=0 #Marcamos el proceso como no ejecutándose si lo estaba anteriormente.
				if [[ $anteriorProcesoEjecucion -ne -1 ]]; then #Este bucle evita un problema con el estado "En pausa" del último proceso, cuando en realidad, está "En memoria" porque se produce cuando $anteriorProcesoEjecucion=-1 al principio de la ejecución...
					enpausa[$anteriorProcesoEjecucion]=1 #Ponemos el estado pausado si el proceso anteriormente en ejecución.
				fi
				enejecucion[$max_indice_aux]=1 #Marco el proceso para ejecutarse.
				enpausa[$max_indice_aux]=0 #Quitamos el estado pausado si el proceso lo estaba anteriormente.
				cpu_ocupada=SI #La CPU está ocupada por un proceso.
				if [[ $anteriorProcesoEjecucion -ne -1 ]]; then #Una vez encontrado el proceso con más baja prioridad, se pone en ejecución. Y si había otro en ejecución y no ha terminado, se marca como "En pausa".
					avisoPausa[$anteriorProcesoEjecucion]=1 #Se activa el aviso de entrada en CPU del volcado
				fi
				avisoEntradaCPU[$max_indice_aux]=1 #Se activa el aviso de entrada en CPU del volcado
				anteriorProcesoEjecucion=$max_indice_aux
			fi
		elif [[ $seleccionTipoPrioridad_2 -eq 2 && $seleccionMenuApropiatividad -eq 2 ]]; then #Prioridad Menor/Apropiativo - Se roba la CPU por ser Apropiativo.
			if [[ $min_indice_aux -ne $anteriorProcesoEjecucion ]]; then #Una vez encontrado el proceso de menor prioridad, se pone en ejecución. Y si había otro en ejecución y no ha terminado, se marca como "En pausa".
				enejecucion[$anteriorProcesoEjecucion]=0 #Marcamos el proceso como no ejecutándose si lo estaba anteriormente.
				if [[ $anteriorProcesoEjecucion -ne -1 ]]; then #Este bucle evita un problema con el estado "En pausa" del último proceso, cuando en realidad, está "En memoria" porque se produce cuando $anteriorProcesoEjecucion=-1 al principio de la ejecución...
					enpausa[$anteriorProcesoEjecucion]=1 #Ponemos el estado pausado si el proceso anteriormente en ejecución.
				fi
				enejecucion[$min_indice_aux]=1 #Marco el proceso para ejecutarse.
				enpausa[$min_indice_aux]=0 #Quitamos el estado pausado si el proceso lo estaba anteriormente.
				cpu_ocupada=SI #La CPU está ocupada por un proceso.
				if [[ $anteriorProcesoEjecucion -ne -1 ]]; then #Si había otro proceso en ejecución con anterioridad se avisa que se pone en pausa.
					avisoPausa[$anteriorProcesoEjecucion]=1 
				fi
				avisoEntradaCPU[$min_indice_aux]=1 #Se activa el aviso de entrada en CPU del volcado
				anteriorProcesoEjecucion=$min_indice_aux
			fi
		fi
	fi

	if [[ $cpu_ocupada == "NO" ]]; then #Se establece el proceso con menor prioridad de los que están en memoria.
		#seleccionTipoPrioridad_2 - 1-Mayor - 2-Menor #seleccionMenuApropiatividad - 1-No apropiativo - 2-Apropiativo
		if [[ $seleccionTipoPrioridad_2 -eq 1 && $seleccionMenuApropiatividad -eq 1 ]]; then #1 Prioridad Mayor/No Apropiativo - No se roba la CPU por ser NO Apropiativo.
			if [[ "$max_indice_aux" -ne -1 ]]; then #Una vez encontrado el proceso más corto, se pone en ejecución. Y si había otro en ejecución y no ha terminado, se marca como "En pausa".
				enejecucion[$max_indice_aux]=1 #Marco el proceso para ejecutarse.
				enpausa[$max_indice_aux]=0 #Quitamos el estado pausado si el proceso lo estaba anteriormente.
				cpu_ocupada=SI #La CPU está ocupada por un proceso.
				avisoEntradaCPU[$max_indice_aux]=1 #Se activa el aviso de entrada en CPU del volcado
			fi
		elif [[ $seleccionTipoPrioridad_2 -eq 2 && $seleccionMenuApropiatividad -eq 1 ]]; then #2 Prioridad Menor/No Apropiativo - No se roba la CPU por ser NO Apropiativo.
			if [[ "$min_indice_aux" -ne -1 ]]; then #Una vez encontrado el proceso más corto, se pone en ejecución. Y si había otro en ejecución y no ha terminado, se marca como "En pausa".
				enejecucion[$min_indice_aux]=1 #Marco el proceso para ejecutarse.
				enpausa[$min_indice_aux]=0 #Quitamos el estado pausado si el proceso lo estaba anteriormente.
				cpu_ocupada=SI #La CPU está ocupada por un proceso.
				avisoEntradaCPU[$min_indice_aux]=1 #Se activa el aviso de entrada en CPU del volcado
			fi
		fi
	fi

	if [[ $cpu_ocupada == "SI" ]]; then #Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		for (( i=0; i<$nprocesos; i++ )); do
			if [[ ${enejecucion[$i]} -eq 1 ]]; then
				ejecutandoinst=$i
			fi
			if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enejecucion[$i]} -eq 1 ]] ; then 
				estado[$i]="En ejecucion"
				estad[$i]=3
				procPorUnidadTiempoBT[$reloj]=$i #Mete el número de orden del proceso que se mantiene en ejecución en la posición reloj de procPorUnidadTiempoBT.
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enpausa[$i]} -eq 1 ]] ; then
				estado[$i]="En pausa"
				estad[$i]=4
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  ]] ; then
				estado[$i]="En memoria"
				estad[$i]=2
			fi
			if [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -ne 1 ]] ; then #Tiene esta doble condición porque una vez que pase a terminado no puede estar en otro estado.
				estado[$i]="Finalizado"
				estad[$i]=5
				procFinalizado=$i #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
			elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
				estado[$i]="Finalizado"
				estad[$i]=5
			fi
		done
	fi
	if [[ $ejecutandoinst -ge 0 ]]; then #Si no hay proceso en ejecución se pone -1, para que pueda ser comparado. 
		ResuTiempoProceso[$reloj]=$ejecutandoinst #Resumen - Proceso en ejecución en cada instante de tiempo. 
	else
		ResuTiempoProceso[$reloj]=-1
	fi 

	if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Si se trabaja NFU/NRU con clases.
		if [[ $reloj -gt 0 ]]; then #Se traspasan todos los datos al siguiente instante para ser modificados, si se producen modificaciones al analizar los fallos y usos de las páginas.   
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
				for (( numMarco=0; numMarco<${memoria[$numProc]}; numMarco++ )); do # 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
	fi #Después de inicializar estos valores, se ejecutan las funciones que actualizarán los valores.

	if [[ $cpu_ocupada == "SI" ]]; then ##Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagNoVirtual #Se lanza la gestión sin algoritmo de paginación, dado que en memoria no virtual los procesos entran en memoria de forma completa y no por páginas como en memoria virtual.
		elif [[ $seleccionAlgoritmoPaginacion -ge 1 && $seleccionAlgoritmoPaginacion -le 4 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagAlgPagFrecFIFORelojSegOp #Se lanza la gestión del algoritmo de paginación FIFO - FIFO con Segunda Oportunidad - Reloj - Reloj con Segunda Oportunidad.
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
			gestionAlgoritmoPagAlgPagFrecMFULFUNFU #Se lanza la gestión del algoritmo de paginación More Frequently Used (MFU) - Lest Frequently Used (LFU) - No Frequently Used (NFU) sobre MFU, sobre LFU y con clases (sobre MFU y sobre LFU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		fi
	fi
	
	#Se pone el estado del siguiente que se vaya a ejecutar (si algún proceso ha terminado) "En ejecucion"
	#SUMAR EL SEGUNDO DEL CICLO ANTES DE PONER ESTE ESTADO
	if [[ "$finalprocesos" -eq 0 ]]; then #En caso de que finalprocesos sea 0, se termina con el programa.
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then 
		evento=1
	fi
	if [[ $optejecucion = "5" ]]; then #Si no se quiere hacer ninguna representación intermedia en pantalla pero sí se quiere ver el resultado final y recogerlo en los ficheros de informes.
		evento=0
	fi
} #Fin de gestionProcesosPrioridades()

####################################################################################
# Sinopsis: Gestión de procesos - Round Robin
####################################################################################
function gestionProcesosRoundRobin {
	#ESTADO DE CADA PROCESO EN EL TIEMPO ACTUAL Y HALLAMOS LAS VARIABLES. (Las cuentas se realizarán tras lanzar el volcado.)
   for (( i=0; i<$nprocesos; i++ )); do #Se modifican los valores de los arrays. Primero se trabaja con los estados y tiempos de las estadísticas.
		if [[ ${fueraDelSistema[$i]} -eq 1 ]] ; then #No ha llegado por tiempo de llegada.
			estado[$i]="Fuera del Sistema"
			estad[$i]=0
		fi 
		if [[ ${encola[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then #Se encola pero no ha llegado por tiempo de llegada.
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Aunque no entre en memoria ya tiene datos a considerar.
			estado[$i]="En espera"
			estad[$i]=1
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${temp_wait[$i]} == "-" && ${temp_ret[$i]} == "-" ]] ; then #Se mete en memoria.
			temp_wait[$i]=0 #Se inicializan a 0 para poder operar con el número
			temp_ret[$i]=0
			temp_rej[$i]=${ejecucion[$i]} #Cuando entre en memoria, si no se había considerado antes en cola, ya tiene datos a considerar.
		fi
	done
	for (( i=0; i<$nprocesos; i++ )); do #Se modifican los valores de los arrays, pero ahora se trabaja con el proceso que pueda haber terminado.
		if [[ ${colaTiempoRR[$i]} -eq $indiceColaTiempoRREnEjecucion && ${temp_rej[$i]} -eq 0 ]] ; then #Si termina el proceso, su referencias en la cola RR se actualiza a "_", y el contador $contadorTiempoRR a 0.
			colaTiempoRR[$i]=-1 
			enejecucion[$i]=0 #Marcamos el proceso como no ejecutándose si lo estaba anteriormente.
			indiceColaTiempoRREnEjecucion=$(($indiceColaTiempoRREnEjecucion + 1)) #Índice con el actual ordinal en ejecución para Round-Robin (RR).
			anteriorProcesoEjecucion=$i
			contadorTiempoRR=0 #Para que el proceso que se vaya a ejecutar empiece a usar su quantum desde 0.
		fi 
	done
	for (( i=0; i<$nprocesos; i++ )); do #Se modifican los valores de los arrays. Y ahora se trabaja con el resto de variables para trabajar sobre los tiempos ya establecidos ya que dependen de ellos en algunos casos.
		if [[ ${colaTiempoRR[$i]} -eq $indiceColaTiempoRREnEjecucion && $contadorTiempoRR -ge $quantum ]] ; then #Si termina el quantum de un proceso, su referencias en la cola RR se actualiza al último valor del $contadorTiempoRR.
			enejecucion[$i]=0 #Se marca el proceso par no ser ejecutado ya que comenzará a ejecutarse otro proceso.
			enpausa[$i]=1 #Se marca el proceso como "en pausa".
			contadorAlgPagExpulsionesForzadasProcesoAcumulado[$i]=$((${contadorAlgPagExpulsionesForzadasProcesoAcumulado[$i]} + 1)) #Número de expulsiones forzadas en Round-Robin (RR) 
			anteriorProcesoEjecucion=$i
			contadorTiempoRR=0
			colaTiempoRR[$i]=$indiceColaTiempoRRLibre  
			indiceColaTiempoRRLibre=$(($indiceColaTiempoRRLibre + 1)) #Índice con el primer ordinal libre a repartir en Round-Robin (RR).
			indiceColaTiempoRREnEjecucion=$(($indiceColaTiempoRREnEjecucion + 1)) #Índice con el actual ordinal en ejecución para Round-Robin (RR).
			evento=1 #Provoca un volcado en cada final de quantum
			cpu_ocupada=NO #Se marca que la CPU no está ocupada por un proceso.
		fi 
	done
	if [[ $cpu_ocupada == "SI" || $cpu_ocupada == "NO" ]]; then #En primer lugar se establece el primer proceso que haya entrado en memoria por tiempo de llegada, o por estricto orden de llegada en memoria.
		if [[ $realizadoAntes -eq 0 ]]; then  
			for (( i=0; i<$nprocesos; i++ )); do  #Se busca el primer proceso de entre todos los que se encuentran en memoria.
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${colaTiempoRR[$i]} -eq -1 && ${temp_rej[$i]} -gt 0 ]] ; then #Si hay nuevos procesos en memoria se les encola.
						colaTiempoRR[$i]=$indiceColaTiempoRRLibre  
						indiceColaTiempoRRLibre=$(($indiceColaTiempoRRLibre + 1))
					fi 
				fi
			done #Una vez encolados, se determina si se sigue ejecutando el mismo que ya lo estaba en el instante anterior, o se determina cuál se ejecutará en el instante actual, si el proceso anterior o su quantum han terminado.
			for (( i=0; i<$nprocesos; i++ )); do  #Se busca el primer proceso de entre todos los que se encuentran en memoria.
				if [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1 && ${terminados[$i]} -ne 1 ]]; then
					if [[ ${colaTiempoRR[$i]} -eq $indiceColaTiempoRREnEjecucion && $contadorTiempoRR -lt $quantum && ${temp_rej[$i]} -ne 0 ]] ; then #Si es nuevo, empieza a ejecutarse. Si el proceso está marcado como en ejecución, el contador $contadorTiempoRR aumenta en una unidad.
						contadorTiempoRR=$(($contadorTiempoRR + 1))
						enejecucion[$i]=1 #Se marca el proceso para ejecutarse o se refuerza si ya lo estaba.
						enpausa[$i]=0 #Se quita el estado pausado si el proceso lo estaba anteriormente.
						cpu_ocupada=SI #Se marca que la CPU está ocupada por un proceso o se refuerza si ya lo estaba.
						if [[ $anteriorProcesoEjecucion -ne -1 ]]; then #Si había otro proceso en ejecución con anterioridad se avisa que se pone en pausa.
							avisoPausa[$anteriorProcesoEjecucion]=1 
						fi
						avisoEntradaCPU[$i]=1 #Se activa el aviso de entrada en CPU del volcado
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
				procPorUnidadTiempoBT[$reloj]=$i #Mete el número de orden del proceso que se mantiene en ejecución en la posición reloj de procPorUnidadTiempoBT.
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  && ${enpausa[$i]} -eq 1 ]] ; then
				estado[$i]="En pausa"
				estad[$i]=4
			elif [[ ${enmemoria[$i]} -eq 1 && ${escrito[$i]} -eq 1  ]] ; then
				estado[$i]="En memoria"
				estad[$i]=2
			fi
			if [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -ne 1 ]] ; then #Tiene esta doble condición porque una vez que pase a terminado no puede estar en otro estado.
				estado[$i]="Finalizado"
				estad[$i]=5
				procFinalizado=$i #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
			elif [[ ${terminados[$i]} -eq 1 && ${terminadosAux[$i]} -eq 1 ]] ; then 
				estado[$i]="Finalizado"
				estad[$i]=5
			fi
		done
	fi
	if [[ $ejecutandoinst -ge 0 ]]; then #Si no hay proceso en ejecución se pone -1, para que pueda ser comparado. 
		ResuTiempoProceso[$reloj]=$ejecutandoinst #Resumen - Proceso en ejecución en cada instante de tiempo. 
	else
		ResuTiempoProceso[$reloj]=-1
	fi 

	if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Si se trabaja NFU/NRU con clases.
		if [[ $reloj -gt 0 ]]; then #Se traspasan todos los datos al siguiente instante para ser modificados, si se producen modificaciones al analizar los fallos y usos de las páginas.   
			for (( numProc=0; numProc<${#ejecucion[@]}; numProc++ )); do # 
				for (( numMarco=0; numMarco<${memoria[$numProc]}; numMarco++ )); do # 
					restaFrecUsoRec[$numProc,$numMarco,$reloj]=${restaFrecUsoRec[$numProc,$numMarco,$(($reloj - 1))]} 
				done
			done
		fi
	fi #Después de inicializar estos valores, se ejecutan las funciones que actualizarán los valores.

	if [[ $cpu_ocupada == "SI" ]]; then ##Está separado del anterior if porque la CPU podría estar ocupada por un proceso.
		if [[ $seleccionAlgoritmoPaginacion -eq 0 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagNoVirtual #Se lanza la gestión sin algoritmo de paginación, dado que en memoria no virtual los procesos entran en memoria de forma completa y no por páginas como en memoria virtual.
		elif [[ $seleccionAlgoritmoPaginacion -ge 1 && $seleccionAlgoritmoPaginacion -le 4 ]]; then #Se lanza la gestión del algoritmo de paginación para ver qué página del proceso $ejecutandoinst entra en qué marco en cada instante.
			gestionAlgoritmoPagAlgPagFrecFIFORelojSegOp #Se lanza la gestión del algoritmo de paginación FIFO - FIFO con Segunda Oportunidad - Reloj - Reloj con Segunda Oportunidad.
		elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
			gestionAlgoritmoPagAlgPagFrecMFULFUNFU #Se lanza la gestión del algoritmo de paginación More Frequently Used (MFU) - Lest Frequently Used (LFU) - No Frequently Used (NFU) sobre MFU, sobre LFU y con clases (sobre MFU y sobre LFU).
		elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
			gestionAlgoritmoPagAlgPagRecMRULRUNRU #Se lanza la gestión del algoritmo de paginación More Recently Used (MRU) - Lest Recently Used (LRU) - No Recently Used (NRU) sobre LRU y con clases (sobre MRU y sobre LRU).
		fi
	fi
	
	#Se pone el estado del siguiente que se vaya a ejecutar (si algún proceso ha terminado) "En ejecucion"
	#SUMAR EL SEGUNDO DEL CICLO ANTES DE PONER ESTE ESTADO
	if [[ "$finalprocesos" -eq 0 ]]; then #En caso de que finalprocesos sea 0, se termina con el programa.
		parar_proceso=SI
		evento=1
	fi
	if [[ $reloj -eq 0 || $optejecucion = "4" ]]; then 
		evento=1
	fi
	if [[ $optejecucion = "5" ]]; then #Si no se quiere hacer ninguna representación intermedia en pantalla pero sí se quiere ver el resultado final y recogerlo en los ficheros de informes.
		evento=0
	fi
} #Fin de gestionProcesosRoundRobin()

####################################################################################
# Sinopsis: Algoritmo PagNoVirtual
####################################################################################
function gestionAlgoritmoPagNoVirtual { 
	if [[ $ejecutandoinst -ge 0 ]]; then #Si no hay proceso en ejecución se pone -1, para que pueda ser comparado. 
		ResuTiempoProceso[$reloj]=$ejecutandoinst #Resumen - Proceso en ejecución en cada instante de tiempo. 
	else
		ResuTiempoProceso[$reloj]=-1
	fi
	paginasEnMemoriaProceso=(); #Se inicializan los arrays que se van a usar temporalmente para cada proceso en ejecución.
	ordinal=(); #Contiene el ordinal del número de marco de cada proceso.
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se van a determinar los marcos reales que usa cada proceso.
		ordinal[$counter]=0
	done
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do #El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
		if [[ ${unidMemOcupadas[$ii]} != "_" ]]; then # Se buscan los marcos ocupados por cada proceso
			relacionMarcosUsados[${unidMemOcupadas[$ii]},$reloj,${ordinal[${unidMemOcupadas[$ii]}]}]=$ii
			ordinal[${unidMemOcupadas[$ii]}]=$((${ordinal[${unidMemOcupadas[$ii]}]} + 1))
		fi
	done
	for ((v=0; v<${memoria[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas en memoria de cada proceso.
		if [[ ${paginasEnMemoriaTotal[$ejecutandoinst,$v]} != "" ]]; then #Evita un problema con la indefinición de la página en caso de no existir, ya que la lee como valor 0, y la página 0 también existe. 
			paginasEnMemoriaProceso[$v]=${paginasEnMemoriaTotal[$ejecutandoinst,$v]}
		else
			paginasEnMemoriaProceso[$v]=-1
		fi
	done 
	unset paginasPendientesUsarTotal[$ejecutandoinst] #Se borra la variable para volver a crearla con las páginas aún pendientes de ejecutar.
	for ((v=${numeroPaginasUsadasProceso[$ejecutandoinst]}; v<${tiempoEjecucion[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas de cada proceso pendientes de ejecutar.
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasPendientesUsarTotal[$ejecutandoinst,$v]=$pagina
	done
	unset paginasUsadasTotal[$ejecutandoinst] #Se borra la variable para volver a crearla con las páginas aún pendientes de ejecutar.
	for ((v=0; v<${numeroPaginasUsadasProceso[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas de cada proceso ya ejecutadas.
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasUsadasTotal[$ejecutandoinst,$v]=$pagina
		paginasUsadasProceso[$v]=$pagina #No es necesario ya que paginasUsadasTotal[] se genera en cada ejecución de la función.
	done 

	if [[ ${numeroPaginasUsadasProceso[$counter]} -eq 0 ]]; then #Si no es el primer instante de ejecución de este proceso. Primero se copian y luego se modifican si es necesario.
		for ((v=0; v<${tiempoEjecucion[$ejecutandoinst]}; v++)); do
			if (( ${paginasDefinidasTotal[$ejecutandoinst,$v]} > ${maxpagsNoVirtual[$ejecutandoinst]} )); then
				maxpagsNoVirtual[$ejecutandoinst]=${paginasDefinidasTotal[$ejecutandoinst,$v]} #Se calcula la página más grande, lo que da el número de marcos usados.
			fi
		done
	contadorAlgPagFallosProcesoAcumulado[$ejecutandoinst]=${maxpagsNoVirtual[$ejecutandoinst]} #El número de fallos de página del proceso es el número de marcos asociados a cada proceso con páginas.
	contadorAlgPagFallosTotalesProcesos[$ejecutandoinst]=${maxpagsNoVirtual[$ejecutandoinst]} #El número de fallos de página totales es la suma de los números de marcos asociados a cada proceso con páginas.
	fi

	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se actualizan los datos de frecuencia o antigüedad de uso de cada marco de memoria ocupado por una página de un proceso.
		if [[ ${numeroPaginasUsadasProceso[$counter]} -eq 0 ]]; then #Si no es el primer instante de ejecución de este proceso. Primero se copian y luego se modifican si es necesario.
			for (( jj=0; jj<${maxpagsNoVirtual[$counter]}; jj++ )); do
				ResuFrecuenciaAcumulado[$counter,$jj,$reloj]=0 #Como no cambian las páginas de memoria en el modelo paginado y no virtual, se inicializan a 0 para que se imprima este valor desde el principio-
			done
		fi
	done
	numeroMarcosUsados[$ejecutandoinst]=${maxpagsNoVirtual[$ejecutandoinst]} #En No Virtual se usan todos los marcos asociados al proceso desde el primer momento porque se cargan en memoria todas las páginas del proceso.
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se actualizan los datos de frecuencia o antigüedad de uso de cada marco de memoria ocupado por una página de un proceso.
		if [[ ${numeroPaginasUsadasProceso[$counter]} -gt 0 ]]; then #Si no es el primer instante de ejecución de este proceso. Primero se copian y luego se modifican si es necesario.
			for (( jj=0; jj<${maxpagsNoVirtual[$counter]}; jj++ )); do
				ResuPaginaAcumulado[$counter,$jj,$reloj]=${ResuPaginaAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array con las páginbas en ls diferentes marcos en el instante anterior.
				ResuFrecuenciaAcumulado[$counter,$jj,$reloj]=${ResuFrecuenciaAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
				ResuPaginaOrdinalAcumulado[$counter,$jj,$reloj]=${ResuPaginaOrdinalAcumulado[$counter,$jj,$(($reloj - 1))]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
			done
		fi
	done
		
	if [[ ${numeroPaginasUsadasProceso[$ejecutandoinst]} -eq 0 ]]; then #Se inicializan las variables si no ha sido considerado el proceso con anterioridad.
		for (( counterMarco=0 ; counterMarco<${maxpagsNoVirtual[$ejecutandoinst]} ; counterMarco++ )); do #Se meten las páginas del proceso en ejecución en los marcos de memoria.
			paginasEnMemoriaProceso[$counterMarco]="$counterMarco"
			paginasEnMemoriaTotal[$ejecutandoinst,$counterMarco]="$counterMarco"
			ResuPaginaAcumulado[$ejecutandoinst,$counterMarco,$reloj]="$counterMarco" #Índices: (proceso, marco, tiempo reloj). Dato de la página contenida en el marco
		done
	fi  
	suma_contadorAlgPagFallosProcesoAcumulado=0
	suma_contadorAlgPagFallosProcesoAcumulado2=0
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se actualizan los datos de frecuencia o antigüedad de uso de cada marco de memoria ocupado por una página de un proceso.
		suma_contadorAlgPagFallosProcesoAcumulado=$(($suma_contadorAlgPagFallosProcesoAcumulado + ${contadorAlgPagFallosTotalesProcesos[$counter]}))
		suma_contadorAlgPagFallosProcesoAcumulado2=$(($suma_contadorAlgPagFallosProcesoAcumulado2 + ${contadorAlgPagFallosProcesoAcumulado[$counter]}))
	done

	if [[ ${numeroPaginasUsadasProceso[$ejecutandoinst]} -lt ${tiempoEjecucion[$ejecutandoinst]} ]]; then #Si aún quedan páginas por ejecutar de ese proceso
		primera_pagina=${paginasDefinidasTotal[$ejecutandoinst,${numeroPaginasUsadasProceso[$ejecutandoinst]}]} #Se determina la primera página de la secuencia de páginas pendientes
		numeroPaginasUsadasProceso[$ejecutandoinst]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} + 1)) #Número de páginas usadas en el proceso en ejecución. Aumenta en todas las unidades de ejecución del proceso. 
		paginaAUsar[$ejecutandoinst]=${paginasDefinidasTotal[$ejecutandoinst,${numeroPaginasUsadasProceso[$ejecutandoinst]}]} #Siguiente página, pendiente de ejecutar.
		for buscar_primera_pagina in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página (da la posición pero no la variable en el array)
#		for buscar_primera_pagina in "${paginasEnMemoriaProceso[@]}"; do #Localiza la página, no la posición de la página
			if [[ ${paginasEnMemoriaProceso[$buscar_primera_pagina]} -eq $primera_pagina ]]; then #Si la página está en memoria define x=1
#			if [[ $buscar_primera_pagina -eq $primera_pagina ]]; then #Si la página está en memoria define x=1
				usoMismaPagina=0 #Se usa una página que ya estaba en memoria (0) y, por tanto, no es el resultado de un fallo de página (1).
				for indMarcoMem in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página (da la posición pero no la variable en el array)
#				for indMarcoMem in "${paginasEnMemoriaProceso[@]}"; do #Localiza la página, no la posición de la página
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then
						ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.
						ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$indMarcoMem #Índice que apunta al marco con la página que acaba de ser usada (ya exitente anteriormente). 
						ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
						ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$(($reloj - 1))]} #Se mantiene el mismo mientras no se produzca un fallo de página. 
						indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
					fi
				done
			fi 
		done
	else #[[ ${temp_rej[$ejecutandoinst]} -eq 0 ]]; then #Y si no quedan más páginas pendientes de ejecutar. No es tiempoEjecucion sino temp_rej.
		for (( counter=0; counter<$nprocesos; counter++ )); do
			if [[ " ${llegados[*]} " == *" $ejecutandoinst "* ]]; then 
				retorno[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst])) #Como temp_ret()
				retorno+=("${retorno[$ejecutandoinst]}") #Como temp_ret()
				if [[ ! " ${ejecutando[*]} " == *" $ejecutandoinst "* ]]; then
					espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst])) #Como temp_wait()
					if [[ " ${haestadopausado[*]} " == *" $ejecutandoinst "* ]]; then
						resta[$ejecutandoinst]=$((tiempo[$ejecutandoinst] - tiempoEjecucion[$ejecutandoinst])) #Como temp_rej(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????. #tiempo o ejecucion[$counter] ???????????? #Esa resta debería ser alrevés, el de ejecución menos lo ya ejecutado...
						espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst] - resta[$ejecutandoinst])) #Como temp_wait() #Tampoco es (reloj - llegada[$ejecutandoinst])
					fi
					espera+=("${espera[${numeroproceso[$ejecutandoinst]}]}") #Como temp_wait(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????. Y se aconseja cambiar $ord.
				fi
			fi
		done
		finalizado=$ejecutandoinst #Actualización de variables y cambios de estado. Algunos ya se hacen en ajusteFinalTiemposEsperaEjecucionRestante().
		ejecutando="" 
		finalizados+=("$finalizado")
		finalizadonuevo+=("$finalizado")
		hanestadomem=$paginasEnMemoriaProceso
		if [[ ${#finalizados[@]} -ge ${#llegada[@]} ]]; then #De momento se cambia ordenados por llegada.
			for i in "${!enmemoria[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
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
} #Fin de gestionAlgoritmoPagNoVirtual()

####################################################################################
####################################################################################
# Funciones para la gestión de fallos de paginación ################################
####################################################################################
# Sinopsis: Algoritmo AlgPagFrecFIFORelojSegOp
####################################################################################
function gestionAlgoritmoPagAlgPagFrecFIFORelojSegOp { 
	if [[ $ejecutandoinst -ge 0 ]]; then #Si no hay proceso en ejecución se pone -1, para que pueda ser comparado. 
		ResuTiempoProceso[$reloj]=$ejecutandoinst #Resumen - Proceso en ejecución en cada instante de tiempo. 
	else
		ResuTiempoProceso[$reloj]=-1
	fi
	paginasEnMemoriaProceso=(); #Se inicializan los arrays que se van a usar temporalmente para cada proceso en ejecución.
	ordinal=(); #Contiene el ordinal del número de marco de cada proceso.
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se van a determinar los marcos reales que usa cada proceso.
		ordinal[$counter]=0
	done
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do #El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
		if [[ ${unidMemOcupadas[$ii]} != "_" ]]; then # Se buscan los marcos ocupados por cada proceso
			relacionMarcosUsados[${unidMemOcupadas[$ii]},$reloj,${ordinal[${unidMemOcupadas[$ii]}]}]=$ii
			ordinal[${unidMemOcupadas[$ii]}]=$((${ordinal[${unidMemOcupadas[$ii]}]} + 1))
		fi
	done
	for ((v=0; v<${memoria[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas en memoria de cada proceso.
		if [[ ${paginasEnMemoriaTotal[$ejecutandoinst,$v]} != "" ]]; then #Evita un problema con la indefinición de la página en caso de no existir, ya que la lee como valor 0, y la página 0 también existe. 
			paginasEnMemoriaProceso[$v]=${paginasEnMemoriaTotal[$ejecutandoinst,$v]}
		else
			paginasEnMemoriaProceso[$v]=-1
		fi
	done 
	unset paginasPendientesUsarTotal[$ejecutandoinst] #Se borra la variable para volver a crearla con las páginas aún pendientes de ejecutar.
	for ((v=${numeroPaginasUsadasProceso[$ejecutandoinst]}; v<${tiempoEjecucion[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas de cada proceso pendientes de ejecutar.
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasPendientesUsarTotal[$ejecutandoinst,$v]=$pagina
	done
	unset paginasUsadasTotal[$ejecutandoinst] #Se borra la variable para volver a crearla con las páginas aún pendientes de ejecutar.
	for ((v=0; v<=${numeroPaginasUsadasProceso[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas de cada proceso ya ejecutadas.
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasUsadasTotal[$ejecutandoinst,$v]=$pagina
		paginasUsadasProceso[$v]=$pagina #No es necesario ya que paginasUsadasTotal[] se genera en cada ejecución de la función.
	done 
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se actualizan los datos de frecuencia o antigüedad de uso de cada marco de memoria ocupado por una página de un proceso.
		if [[ ${numeroMarcosUsados[$counter]} -ne 0 ]]; then #Si no es el primer instante de ejecución de este proceso. Primero se copian y luego se modifican si es necesario.
			for (( jj=0; jj<${memoria[$counter]}; jj++ )); do
				ResuPaginaAcumulado[$counter,$jj,$reloj]=${ResuPaginaAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array con las páginbas en ls diferentes marcos en el instante anterior.
				ResuFrecuenciaAcumulado[$counter,$jj,$reloj]=${ResuFrecuenciaAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
				ResuPaginaOrdinalAcumulado[$counter,$jj,$reloj]=${ResuPaginaOrdinalAcumulado[$counter,$jj,$(($reloj - 1))]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
			done
		fi
	done

	if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then #Con Segunda Oportunidad. Se determina el primer marco con coeficiente M=0. Y si encuentra marcos con M=1, les define M=0 y busca el siguiente. El coeficiente de la página intercambiada también se define a 0 por lo que se deja tal y como estaba, a 0.
		for (( counterProc=0 ; counterProc<$nprocesos ; counterProc++ )); do #Se arrastran los datos de los coeficientes en anteriores tiempos ordinales de ejecución para cada proceso en cada unidad de tiempo.
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
		
	if [[ ${numeroPaginasUsadasProceso[$ejecutandoinst]} -lt ${tiempoEjecucion[$ejecutandoinst]} ]]; then #Si aún quedan páginas por ejecutar de ese proceso
		primera_pagina=${paginasDefinidasTotal[$ejecutandoinst,${numeroPaginasUsadasProceso[$ejecutandoinst]}]} #Se determina la primera página de la secuencia de páginas pendientes
		numeroPaginasUsadasProceso[$ejecutandoinst]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} + 1)) #Número de páginas usadas en el proceso en ejecución. Aumenta en todas las unidades de ejecución del proceso. 
		paginaAUsar[$ejecutandoinst]=${paginasDefinidasTotal[$ejecutandoinst,${numeroPaginasUsadasProceso[$ejecutandoinst]}]} #Siguiente página, pendiente de ejecutar.

		if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de marcos usados es menor que el tamaño de la memoria asociada al proceso.

			x=0 #Define si encuentra o no la página en paginasEnMemoriaProceso
			for buscar_primera_pagina in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página en paginasEnMemoriaProceso (da la posición, pero no la variable en el array)
#			for buscar_primera_pagina in "${paginasEnMemoriaProceso[@]}"; do #Busca la página en paginasEnMemoriaProceso, pero no la posición.
#				if [[ $buscar_primera_pagina -eq $primera_pagina ]]; then #Esta línea es para cuando usamos el valor del dato y no su posición. Si la página está en memoria define x=1
				if [[ ${paginasEnMemoriaProceso[$buscar_primera_pagina]} -eq $primera_pagina ]]; then #Esta línea es para cuando usamos la posición del dato y no su valor. Si la página está en memoria define x=1
					x=1
					indMarcoMem=$buscar_primera_pagina # Se guarda el marco en el que se encuentra la página.
				fi 
			done
			if [[ $x -eq 1 && $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) -ne 0 ]]; then #USO DE PÁGINA - Si la página está en memoria, y si no es la primera página a usar para evitar la inicialización de la variable paginasEnMemoriaTotal[$ejecutandoinst,ordinal}] a 0.
				for indMarcoMem in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
#				for indMarcoMem in "${paginasEnMemoriaProceso[@]}"; do #Define el dato, pero no en qué posición se encuentra.
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then #Localiza en qué posición encuentra la página (j). 
						ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$indMarcoMem #Índice que apunta al marco con la página que acaba de ser usada (ya exitente anteriormente). 
						ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
						for (( jj=0; jj<${memoria[$ejecutandoinst]}; jj++ )); do
							ResuPaginaAcumulado[$ejecutandoinst,$jj,$reloj]=${ResuPaginaAcumulado[$ejecutandoinst,$jj,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} #Recoge los datos del array con las páginbas en ls diferentes marcos en el instante anterior.
							ResuFrecuenciaAcumulado[$ejecutandoinst,$jj,$reloj]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$jj,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
						done 
						ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.  
						if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then #Con Segunda Oportunidad
							coeficienteSegOp[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]},$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))]=1 #En caso de reusar una página se pone a 1 aunque pueda ser redundante si ya era 1.
						fi
					fi
				done
				indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se ejecuta este proceso. También se usa para las frecuencias.
				if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de páginas en memoria del proceso es menor que el tamaño de la memoria del proceso. 
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${numeroMarcosUsados[$ejecutandoinst]} #Sumaría 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres, pero no lo suma porque el número de marcos usados no empezará en 0 sino en 1, mientras que las variables suelene empezar en 0. 
				else
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=0 #Sumaría 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres, pero no lo suma porque el número de marcos usados no empezará en 0 sino en 1, mientras que las variables suelene empezar en 0. 
				fi
			else #Si NO está en memoria... FALLO DE PÁGINA
				paginasEnMemoriaProceso[${numeroMarcosUsados[$ejecutandoinst]}]=$primera_pagina #... la página se añade a la secuencia de páginas del proceso en ejecución en memoria.
				paginasEnMemoriaTotal[$ejecutandoinst,${numeroMarcosUsados[$ejecutandoinst]}]=$primera_pagina #... y la página se añade a la secuencia de páginas de ese proceso junto con el resto de páginas del resto de procesos residentes en memoria (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
				contadorAlgPagFallosTotalesProcesos[$ejecutandoinst]=$((contadorAlgPagFallosTotalesProcesos[$ejecutandoinst] + 1)) #Contador de fallos de página totales de cada proceso
				((contadorAlgPagFallosProcesoAcumulado[$ejecutandoinst]++)) #Contador de fallos totales de cada proceso
				if [[ ${numeroMarcosUsados[$ejecutandoinst]} -ne 0 ]]; then #Si no es el primer instante de ejecución de este proceso.  Primero se copian y luego se modifican si es necesario.
					for (( jj=0; jj<${memoria[$ejecutandoinst]}; jj++ )); do #Se recuperan los datos de las páginas que ocupan todos los marcos en el instante anterior en el que se ejecutó este proceso.
						ResuPaginaAcumulado[$ejecutandoinst,$jj,$reloj]=${ResuPaginaAcumulado[$ejecutandoinst,$jj,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} #Recoge los datos del array con las páginbas en ls diferentes marcos en el instante anterior.
						ResuFrecuenciaAcumulado[$ejecutandoinst,$jj,$reloj]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$jj,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
					done
				fi 
				ResuPaginaAcumulado[$ejecutandoinst,${numeroMarcosUsados[$ejecutandoinst]},$reloj]=$primera_pagina #Se añade el dato de la página que acaba de ser incluida en un marco.
				ResuFrecuenciaAcumulado[$ejecutandoinst,${numeroMarcosUsados[$ejecutandoinst]},$reloj]=1 # Se añade el dato de la frecuencia de la página que acaba de ser incluida en un marco.
				indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
				ResuFallosPaginaProceso[$ejecutandoinst,$reloj]=$primera_pagina #Y se añade la página a la secuencia de fallos. 
				ResuFallosMarcoProceso[$ejecutandoinst,$reloj]=${numeroMarcosUsados[$ejecutandoinst]} #Y se añade el marco a la secuencia de fallos. 
				numeroMarcosUsados[$ejecutandoinst]=$((${numeroMarcosUsados[$ejecutandoinst]} + 1)) #Aumenta en 1 el número de marcos usados. Sólo aumenta cuando se usa un nuevo marco y no en todas las unidades de ejecución del proceso. Debe ser la última línea dentro del if paradejarlo preparado para su siguiente uso como variable.
				ResuPaginaOrdinalAcumulado[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1)),$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
				ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$((${numeroMarcosUsados[$ejecutandoinst]} - 1)) #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). Sería -1 porque numeroMarcosUsados empieza a contar en 1.
				if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de páginas en memoria del proceso es menor que el tamaño de la memoria del proceso. 
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${numeroMarcosUsados[$ejecutandoinst]} #Sumaría 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres, pero no lo suma porque el número de marcos usados ya ha aumentado 1. 
				else
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=0
				fi
				if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then #Con Segunda Oportunidad. Redundante porque ya se inicializa a 0...
					coeficienteSegOp[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]},$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))]=0
				fi
			fi
		else #Si el número de marcos usados es mayor o igual que el tamaño de la memoria asociada al proceso.
			x=0 #Define si encuentra o no la página en paginasEnMemoriaProceso
			for buscar_primera_pagina in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página (da la posición pero no la variable en el array)
#			for buscar_primera_pagina in "${paginasEnMemoriaProceso[@]}"; do #Localiza la página, no la posición de la página
				if [[ ${paginasEnMemoriaProceso[$buscar_primera_pagina]} -eq $primera_pagina ]]; then #Si la página está en memoria define x=1
#				if [[ $buscar_primera_pagina -eq $primera_pagina ]]; then #Si la página está en memoria define x=1
					x=1
				fi 
			done
			if [[ $x -eq 1 ]]; then #Si la página está en memoria...USO DE PÁGINA
				for indMarcoMem in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página (da la posición pero no la variable en el array)
#				for indMarcoMem in "${paginasEnMemoriaProceso[@]}"; do #Localiza la página, no la posición de la página
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then
						for (( jj=0; jj<${memoria[$ejecutandoinst]}; jj++ )); do
							ResuPaginaAcumulado[$ejecutandoinst,$jj,$reloj]=${ResuPaginaAcumulado[$ejecutandoinst,$jj,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} #Recoge los datos del array con las páginbas en ls diferentes marcos en el instante anterior.							
							ResuFrecuenciaAcumulado[$ejecutandoinst,$jj,$reloj]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$jj,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
						done
						ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.
						ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$indMarcoMem #Índice que apunta al marco con la página que acaba de ser usada (ya exitente anteriormente). 
						ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
						if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then #Con Segunda Oportunidad
							coeficienteSegOp[$ejecutandoinst,$indMarcoMem,$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))]=1 #En caso de reusar una página se pone a 1 aunque pueda ser redundante si ya era 1.
						fi
						ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$(($reloj - 1))]} #Se mantiene el mismo mientras no se produzca un fallo de página. 
						indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
					fi
				done
			else #Y si NO está en la memoria...FALLO DE PÁGINA. se localiza el que tenga el primer valor del mayor contador de frecuencia por ser AlgPagFrecMFU.
				if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then #Con Segunda Oportunidad. Se determina el primer marco con coeficiente M=0. Y si encuentra marcos con M=1, les define M=0 y busca el siguiente. El coeficiente de la página intercambiada también se define a 0 por lo que se deja tal y como estaba, a 0.
					varCoeficienteSegOp=0
					varCoefMarco=""
					varCoefOrdinal=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se usa el mismo tiempo ordinal de ejecución del proceso para todos los marcos porque es el siguiente tiempo ordinal el que interesa. La variable ResuPaginaOrdinalAcumulado[] se cambiará después, pero ya se tiene en cuenta ahora.
					until [[ $varCoeficienteSegOp -eq 1 ]]; do 
						varCoefMarco=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]}
						if [[ ${coeficienteSegOp[$ejecutandoinst,$varCoefMarco,$varCoefOrdinal]} -eq 1 ]]; then #Si M de Segunda Oportunidad vale 0, se pone a 1. Y si ya vale 1, se deja como está. 
							coeficienteSegOp[$ejecutandoinst,$varCoefMarco,$varCoefOrdinal]=0 #Se define a 0 para que en la segunda vuelta se pueda producir el fallo sobre el primer M=0 que encuentre.
							if [[ ${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]} -lt $((${memoria[$ejecutandoinst]} - 1)) ]]; then #Si el número de páginas en memoria del proceso es menor que el tamaño de la memoria del proceso. 
								ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=$((${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]} + 1)) #Sumaría 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres, pero no lo suma porque el número de marcos usados no empezará en 0 sino en 1, mientras que las variables suelene empezar en 0. 
							else
								ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=0
							fi
						else 
							coeficienteSegOp[$ejecutandoinst,$varCoefMarco,$varCoefOrdinal]=0 #Se define a 0 para que en la segunda vuelta se pueda producir el fallo sobre el primer M=0 que encuentre.
							varCoeficienteSegOp=1
						fi
					done
				fi
				paginasEnMemoriaProceso[${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la mayor frecuencia, sustituyendo la página.
				paginasEnMemoriaTotal[$ejecutandoinst,${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
				contadorAlgPagFallosTotalesProcesos[$ejecutandoinst]=$((contadorAlgPagFallosTotalesProcesos[$ejecutandoinst] + 1)) #Aumenta en una unidad el número de fallos de página del proceso.
				((contadorAlgPagFallosProcesoAcumulado[$ejecutandoinst]++)) #Contador de fallos totales de cada proceso
				for (( jj=0; jj<${memoria[$ejecutandoinst]}; jj++ )); do
					ResuPaginaAcumulado[$ejecutandoinst,$jj,$reloj]=${ResuPaginaAcumulado[$ejecutandoinst,$jj,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} #Recoge los datos del array con las páginbas en ls diferentes marcos en el instante anterior.								
					ResuFrecuenciaAcumulado[$ejecutandoinst,$jj,$reloj]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$jj,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
				done
				ResuPaginaAcumulado[$ejecutandoinst,${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]},$reloj]=$primera_pagina # Se añade el dato de la página que acaba de ser incluida en un marco.
				ResuPaginaOrdinalAcumulado[$ejecutandoinst,${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]},$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
				ResuFrecuenciaAcumulado[$ejecutandoinst,${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]},$reloj]=1 #Como la página acaba de ser metida en el marco, se suma 1 a la frecuencia de la página. 
				ResuFallosPaginaProceso[$ejecutandoinst,$reloj]=$primera_pagina #Y se añade la página a la secuencia de fallos. 
				ResuFallosMarcoProceso[$ejecutandoinst,$reloj]=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]} #Y se añade el marco a la secuencia de fallos. 
				ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
				if [[ ${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]} -lt $((${memoria[$ejecutandoinst]} - 1)) ]]; then #Si el número de páginas en memoria del proceso es menor que el tamaño de la memoria del proceso. 
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=$((${ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]} + 1)) #Sumaría 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres, pero no lo suma porque el número de marcos usados no empezará en 0 sino en 1, mientras que las variables suelene empezar en 0. 
				else
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=0
				fi
				indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
			fi
		fi          
	else #[[ ${temp_rej[$ejecutandoinst]} -eq 0 ]]; then #Y si no quedan más páginas pendientes de ejecutar. No es tiempoEjecucion sino temp_rej.
		for (( counter=0; counter<$nprocesos; counter++ )); do
			if [[ " ${llegados[*]} " == *" $ejecutandoinst "* ]]; then 
				retorno[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst])) #Como temp_ret()
				retorno+=("${retorno[$ejecutandoinst]}") #Como temp_ret()
				if [[ ! " ${ejecutando[*]} " == *" $ejecutandoinst "* ]]; then
					espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst])) #Como temp_wait()
					if [[ " ${haestadopausado[*]} " == *" $ejecutandoinst "* ]]; then
						resta[$ejecutandoinst]=$((tiempo[$ejecutandoinst] - tiempoEjecucion[$ejecutandoinst])) #Como temp_rej(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????. #tiempo o ejecucion[$counter] ???????????? #Esa resta debería ser alrevés, el de ejecución menos lo ya ejecutado...
						espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst] - resta[$ejecutandoinst])) #Como temp_wait(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????. #Tampoco es (reloj - llegada[$ejecutandoinst])
					fi
					espera+=("${espera[${numeroproceso[$ejecutandoinst]}]}") #Como temp_wait(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????.
				fi
			fi
		done
		finalizado=$ejecutandoinst #Actualización de variables y cambios de estado. Algunos ya se hacen en ajusteFinalTiemposEsperaEjecucionRestante().
		ejecutando="" 
		finalizados+=("$finalizado")
		finalizadonuevo+=("$finalizado")
		hanestadomem=$paginasEnMemoriaProceso
		if [[ ${#finalizados[@]} -ge ${#llegada[@]} ]]; then #De momento se cambia ordenados por llegada.
			for i in "${!enmemoria[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
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
} #Fin de gestionAlgoritmoPagAlgPagFrecFIFORelojSegOp()

####################################################################################
# Sinopsis: Algoritmo AlgPagFrecMFULFUNFU - NFU usará un límite máximo de la frecuencia de uso de las páginas (seleccionAlgoritmoPaginacion_clases_frecuencia_valor) y el límite de tiempo de permanencia en las clases 2 y 3 (seleccionAlgoritmoPaginacion_clases_valor) en un intervalo de tiempo (seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado)
####################################################################################
function gestionAlgoritmoPagAlgPagFrecMFULFUNFU { #ResuFrecuenciaAcumulado
	paginasEnMemoriaProceso=(); #Páginas residentes en memoria del Proceso en ejecución. #Se inicializan los arrays que se van a usar temporalmente para cada proceso en ejecución.
	ordinal=(); #Contiene el ordinal del número de marco de cada proceso.
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se van a determinar los marcos reales que usa cada proceso.
		ordinal[$counter]=0
	done
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do #El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
		if [[ ${unidMemOcupadas[$ii]} != "_" ]]; then # Se buscan los marcos ocupados por cada proceso
			relacionMarcosUsados[${unidMemOcupadas[$ii]},$reloj,${ordinal[${unidMemOcupadas[$ii]}]}]=$ii
			ordinal[${unidMemOcupadas[$ii]}]=$((${ordinal[${unidMemOcupadas[$ii]}]} + 1))
		fi
	done
	for ((v=0; v<${memoria[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas en memoria de cada proceso.
		if [[ ${paginasEnMemoriaTotal[$ejecutandoinst,$v]} != "" ]]; then #Evita un problema con la indefinición de la página en caso de no existir, ya que la lee como valor 0, y la página 0 también existe. 
			paginasEnMemoriaProceso[$v]=${paginasEnMemoriaTotal[$ejecutandoinst,$v]}
		else
			paginasEnMemoriaProceso[$v]=-1
		fi
	done 
	unset paginasPendientesUsarTotal[$ejecutandoinst] #Se borra la variable para volver a crearla con las páginas aún pendientes de ejecutar.
	for ((v=${numeroPaginasUsadasProceso[$ejecutandoinst]}; v<${tiempoEjecucion[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas de cada proceso pendientes de ejecutar.
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasPendientesUsarTotal[$ejecutandoinst,$v]=$pagina
	done
	unset paginasUsadasTotal[$ejecutandoinst] #Se borra la variable para volver a crearla con las páginas aún pendientes de ejecutar.
	for ((v=0; v<=${numeroPaginasUsadasProceso[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas de cada proceso ya ejecutadas.
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasUsadasTotal[$ejecutandoinst,$v]=$pagina
		paginasUsadasProceso[$v]=$pagina #No es necesario ya que paginasUsadasTotal[] se genera en cada ejecución de la función.
	done 
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se actualizan los datos de frecuencia o antigüedad de uso de cada marco de memoria ocupado por una página de un proceso.
		if [[ ${numeroMarcosUsados[$counter]} -ne 0 ]]; then #Si no es el primer instante de ejecución de este proceso. Primero se copian y luego se modifican si es necesario.
			for (( jj=0; jj<${memoria[$counter]}; jj++ )); do
				ResuPaginaAcumulado[$counter,$jj,$reloj]=${ResuPaginaAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array con las páginbas en ls diferentes marcos en el instante anterior.
				ResuFrecuenciaAcumulado[$counter,$jj,$reloj]=${ResuFrecuenciaAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
				ResuPaginaOrdinalAcumulado[$counter,$jj,$reloj]=${ResuPaginaOrdinalAcumulado[$counter,$jj,$(($reloj - 1))]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #NFU con clases sobre MFU/LFU
					ResuClaseAcumulado[$counter,$jj,$reloj]=${ResuClaseAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array de clases de uso de las páginas contenidas en los marcos en el instante anterior.
				fi
			done
		fi
	done
	
	for ((indMemIni=0; indMemIni<${memoria[$ejecutandoinst]}; indMemIni++)); do #Se crea la secuencia de páginas en memoria de cada proceso.
		indPagIni=$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))
		if [[ $indPagIni -eq 0 ]]; then
			ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMemIni]=0 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
			ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMemIni]=0 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
			directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMemIni,0]=0 #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Se usará para determinar si una página ha sido o no referenciada y modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_frecuencia_valor unidades de tiempo en los algoritmos NFU y NRU. Se inicia a 0 por no haber sido aún referenciada (vista o modificada) y se cambia sólo cuando ya estuviera en memoria.
		else
			directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMemIni,$indPagIni]=${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMemIni,$(($indPagIni - 1))]} #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Se usará para determinar si una página ha sido o no referenciada y modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_frecuencia_valor unidades de tiempo en los algoritmos NFU y NRU. Se inicia a 0 por no haber sido aún referenciada (vista o modificada) y se cambia sólo cuando ya estuviera en memoria.
		fi
	done 
	for ((indMarco=0; indMarco<${numeroMarcosUsados[$ejecutandoinst]}; indMarco++)); do #Se crea la secuencia de páginas en memoria de cada proceso.
		primerTiempoEntradaPagina[$ejecutandoinst,$indMarco]=$((${primerTiempoEntradaPagina[$ejecutandoinst,$indMarco]} + 1)) #Se inicializa a 0 el número de unidades de tiempo que hace que se cambió la clase por llegar al máximo de tiempo en una clase 2 o 3, o al máximo de frecuencia de uso.
	done 

	if [[ ${numeroPaginasUsadasProceso[$ejecutandoinst]} -lt ${tiempoEjecucion[$ejecutandoinst]} ]]; then #Si aún quedan páginas por ejecutar de ese proceso.
		primera_pagina=${paginasDefinidasTotal[$ejecutandoinst,${numeroPaginasUsadasProceso[$ejecutandoinst]}]} #Se determina la primera página de la secuencia de páginas pendientes.
		numeroPaginasUsadasProceso[$ejecutandoinst]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} + 1)) #Número de páginas usadas en el proceso en ejecución. Aumenta en todas las unidades de ejecución del proceso. 
		paginaAUsar[$ejecutandoinst]=${paginasDefinidasTotal[$ejecutandoinst,$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))]} #Siguiente página, pendiente de ejecutar.
		if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de marcos usados es menor que el tamaño de la memoria asociada al proceso.
			x=0 #Define si encuentra o no la página en paginasEnMemoriaProceso
			for buscar_primera_pagina in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página en paginasEnMemoriaProceso (da la posición, pero no la variable en el array).
				if [[ ${paginasEnMemoriaProceso[$buscar_primera_pagina]} -eq $primera_pagina ]]; then #Esta línea es para cuando usamos la posición del dato y no su valor. Si la página está en memoria define x=1.
					x=1
				fi 
			done
			if [[ $x -eq 1 && $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) -ne 0 ]]; then #USO DE PÁGINA - Si la página está en memoria, y si no es la primera página a usar para evitar la inicialización de la variable paginasEnMemoriaTotal[$ejecutandoinst,ordinal}] a 0.
				for indMarcoMem in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array).
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then #Localiza en qué posición encuentra la página (j). 
						ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$indMarcoMem #Índice que apunta al marco con la página que acaba de ser usada (ya exitente anteriormente). 
						ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
						if [[ $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #NFU-MFU/NFU-LFU
							if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_frecuencia_valor ]]; then 
								ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.  
							else
								ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]})) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.
							fi
						elif [[ $seleccionAlgoritmoPaginacion -eq 6 || $seleccionAlgoritmoPaginacion -eq 7 ]]; then #MFU/LFU
							ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.  
						elif [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #NFU-MFU/NFU-LFU con clases
							ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.  
							directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarcoMem]=1
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]} + 1)) #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
							usoMismaPagina=0 #Se usa una página que ya estaba en memoria (0) y, por tanto, no es el resultado de un fallo de página (1).
							#Si las páginas tienen una frecuencia de uso mayor que la frecuencia máxima $seleccionAlgoritmoPaginacion_clases_frecuencia_valor
							if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]} -gt $seleccionAlgoritmoPaginacion_clases_frecuencia_valor ]]; then # se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor. Si lo supera se comprueba que no sea en la misma clase 2 o 3.
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=$seleccionAlgoritmoPaginacion_clases_frecuencia_valor
							fi
						fi
						indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se ejecuta este proceso. También se usa para las frecuencias.
						if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de páginas en memoria del proceso es menor que el tamaño de la memoria del proceso. 
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${numeroMarcosUsados[$ejecutandoinst]} #Sumaría 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres, pero no lo suma porque el número de marcos usados no empezará en 0 sino en 1, mientras que las variables suelene empezar en 0. 
						fi
						if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #NFU con clases sobre MFU/LFU
							gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado $indMarcoMem $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
						fi
					fi
				done
			else #Si NO está en memoria... FALLO DE PÁGINA
				numeroMarcosUsados[$ejecutandoinst]=$((${numeroMarcosUsados[$ejecutandoinst]} + 1)) #Aumenta en 1 el número de marcos usados. Sólo aumenta cuando se usa un nuevo marco y no en todas las unidades de ejecución del proceso. Debe ser la última línea dentro del if paradejarlo preparado para su siguiente uso como variable.
				ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$(($((${numeroMarcosUsados[$ejecutandoinst]} - 1)))) #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). Sería -1 porque numeroMarcosUsados empieza a contar en 1.
				paginasEnMemoriaProceso[$((${numeroMarcosUsados[$ejecutandoinst]} - 1))]=$primera_pagina #... la página se añade a la secuencia de páginas del proceso en ejecución en memoria.
				paginasEnMemoriaTotal[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1))]=$primera_pagina #... y la página se añade a la secuencia de páginas de ese proceso junto con el resto de páginas del resto de procesos residentes en memoria (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
				contadorAlgPagFallosTotalesProcesos[$ejecutandoinst]=$((contadorAlgPagFallosTotalesProcesos[$ejecutandoinst] + 1)) #Contador de fallos de página totales de cada proceso.
				((contadorAlgPagFallosProcesoAcumulado[$ejecutandoinst]++)) #Contador de fallos totales de cada proceso
				ResuPaginaAcumulado[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1)),$reloj]=$primera_pagina #Se añade el dato de la página que acaba de ser incluida en un marco.
				ResuPaginaOrdinalAcumulado[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1)),$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
				ResuFrecuenciaAcumulado[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1)),$reloj]=1 # Se añade el dato de la frecuencia de la página que acaba de ser incluida en un marco.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1))]=1 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
				ResuFallosPaginaProceso[$ejecutandoinst,$reloj]=$primera_pagina #Y se añade la página a la secuencia de fallos. 
				ResuFallosMarcoProceso[$ejecutandoinst,$reloj]=$((${numeroMarcosUsados[$ejecutandoinst]} - 1)) #Y se añade el marco a la secuencia de fallos. 
				indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
				directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))]=0
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then
					primerTiempoEntradaPagina[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]}]=0 #Se inicializa a 0 el número de unidades de tiempo que hace que se cambió la clase por llegar al máximo de tiempo en una clase 2 o 3 o al máximo de frecuencia de uso.
					usoMismaPagina=1 #Resultado de un fallo de página (1) y no por usar una página ya existente en memoria (0).
					gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado $((${numeroMarcosUsados[$ejecutandoinst]} - 1)) $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
				fi
				if [[ ${numeroMarcosUsados[$ejecutandoinst]} -ge ${memoria[$ejecutandoinst]} ]]; then #Sólo es necesario si se llenan todos los marcos asociados al proceso. 
					if [[ $seleccionAlgoritmoPaginacion -eq 6 || $seleccionAlgoritmoPaginacion -eq 8 ]]; then #MFU
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
							if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} -gt ${max_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página. 
								max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} #Mayor frecuencia encontrada.
								max_AlgPagFrecRec_Position[$ejecutandoinst]=$indMaxAlgPag #Posición del marco con la mayor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página
					elif [[ $seleccionAlgoritmoPaginacion -eq 10 ]]; then #NFU con clases sobre MFU
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
						if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
							limite_j=$ultimasPaginasAConsiderar #QUEDA PENDIENTE USARLO PARA RESTAR LA FRECUENCIA ACTUAL DE LA QUE TENÍA EN AQUEL MOMENTO.
						else
							limite_j=0
						fi
						gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
					elif [[ $seleccionAlgoritmoPaginacion -eq 7 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #LFU
						min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
							if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} -lt ${min_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página. 
								min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} #Menor frecuencia encontrada.
								min_AlgPagFrecRec_Position[$ejecutandoinst]=$indMinAlgPag #Posición del marco con la menor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página
					
					elif [[ $seleccionAlgoritmoPaginacion -eq 11 ]]; then #NFU con clases sobre MFU
						min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
						if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
						gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
					fi
				fi
				if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de páginas en memoria del proceso es menor que el tamaño de la memoria del proceso. 
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${numeroMarcosUsados[$ejecutandoinst]} #Suma 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres. 
				else
					if [[ $seleccionAlgoritmoPaginacion -eq 6 || $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 10 ]]; then #MFU
						ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
					elif [[ $seleccionAlgoritmoPaginacion -eq 7 || $seleccionAlgoritmoPaginacion -eq 9 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #LFU
						ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la mínima frecuencia.  
					fi
				fi
			fi
		else #Si el número de marcos usados es mayor o igual que el tamaño de la memoria asociada al proceso.
			x=0 #Define si encuentra o no la página en paginasEnMemoriaProceso.
			for buscar_primera_pagina in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página (da la posición pero no la variable en el array).
				if [[ ${paginasEnMemoriaProceso[$buscar_primera_pagina]} -eq $primera_pagina ]]; then #Si la página está en memoria define x=1.
					x=1
				fi 
			done
			if [[ $x -eq 1 ]]; then #Si la página está en memoria...USO DE PÁGINA
				for indMarcoMem in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página (da la posición pero no la variable en el array).
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then
						ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$indMarcoMem #Índice que apunta al marco con la página que acaba de ser usada (ya exitente anteriormente). 
						ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
						if [[ $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #NFU-MFU/NFU-LFU
							if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_frecuencia_valor ]]; then 
								ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.
							else
								ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]})) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.
							fi
						elif [[ $seleccionAlgoritmoPaginacion -eq 6 || $seleccionAlgoritmoPaginacion -eq 7 ]]; then #MFU/LFU
							ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.
						elif [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #NFU-MFU/NFU-LFU con clases
							ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} + 1)) #Se lee el dato la frecuencia de la página que estaba en un marco en el instante anterior en el que se ha ejecutado este proceso y se suma 1.  
							directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarcoMem]=1
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
							usoMismaPagina=0 #Se usa una página que ya estaba en memoria (0) y, por tanto, no es el resultado de un fallo de página (1).
							#Si las páginas tienen una frecuencia de uso mayor que la frecuencia máxima $seleccionAlgoritmoPaginacion_clases_frecuencia_valor
							if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]} -gt $seleccionAlgoritmoPaginacion_clases_frecuencia_valor ]]; then # se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor. Si lo supera se comprueba que no sea en la misma clase 2 o 3.
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=$seleccionAlgoritmoPaginacion_clases_frecuencia_valor
							fi
							gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado $indMarcoMem $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
						fi
						if [[ $seleccionAlgoritmoPaginacion -eq 6 || $seleccionAlgoritmoPaginacion -eq 8 ]]; then #MFU
							max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
								if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} -gt ${max_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
									max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} #Mayor frecuencia encontrada.
									max_AlgPagFrecRec_Position[$ejecutandoinst]=$indMaxAlgPag #Posición del marco con la mayor frecuencia.
								fi
							done #Y sobre esa localización se hace el fallo de página
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
				
						elif [[ $seleccionAlgoritmoPaginacion -eq 10 ]]; then #NFU con clases sobre MFU
							max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
							paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
							if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
								limite_j=$ultimasPaginasAConsiderar
							else
								limite_j=0
							fi
							gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
						elif [[ $seleccionAlgoritmoPaginacion -eq 7 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #LFU
							min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
							min_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
								if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} -lt ${min_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
									min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} #Menor frecuencia encontrada.
									min_AlgPagFrecRec_Position[$ejecutandoinst]=$indMinAlgPag #Posición del marco con la menor frecuencia.
								fi
							done #Y sobre esa localización se hace el fallo de página
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la mínima frecuencia.  
				
						elif [[ $seleccionAlgoritmoPaginacion -eq 11 ]]; then #NFU con clases sobre MFU
							min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
							min_AlgPagFrecRec_Position[$ejecutandoinst]=0
							ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
							paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
							if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
								limite_j=$ultimasPaginasAConsiderar
							else
								limite_j=0
							fi
							gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la mínima frecuencia.  
						fi
						indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
					fi
				done
			else #Y si NO está en la memoria...FALLO DE PÁGINA. Se localiza el que tenga el primer valor del mayor contador de frecuencia por ser AlgPagFrecMFU.
				if [[ $seleccionAlgoritmoPaginacion -eq 6 || $seleccionAlgoritmoPaginacion -eq 8 ]]; then #MFU
					ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
					paginasEnMemoriaProceso[${max_AlgPagFrecRec_Position[$ejecutandoinst]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la mayor frecuencia, sustituyendo la página.
					paginasEnMemoriaTotal[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.

				elif [[ $seleccionAlgoritmoPaginacion -eq 10 ]]; then #NFU con clases sobre MFU
					ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
					paginasEnMemoriaProceso[${max_AlgPagFrecRec_Position[$ejecutandoinst]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la mayor frecuencia, sustituyendo la página.
					paginasEnMemoriaTotal[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=0
				elif [[ $seleccionAlgoritmoPaginacion -eq 7 || $seleccionAlgoritmoPaginacion -eq 9 ]]; then #LFU
					ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
					paginasEnMemoriaProceso[${min_AlgPagFrecRec_Position[$ejecutandoinst]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la menor frecuencia, sustituyendo la página.
					paginasEnMemoriaTotal[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
				
				elif [[ $seleccionAlgoritmoPaginacion -eq 11 ]]; then #NFU con clases sobre MFU
					ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
					paginasEnMemoriaProceso[${min_AlgPagFrecRec_Position[$ejecutandoinst]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la menor frecuencia, sustituyendo la página.
					paginasEnMemoriaTotal[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]}]=0
				fi
				contadorAlgPagFallosTotalesProcesos[$ejecutandoinst]=$((contadorAlgPagFallosTotalesProcesos[$ejecutandoinst] + 1)) #Aumenta en una unidad el número de fallos de página del proceso.
				((contadorAlgPagFallosProcesoAcumulado[$ejecutandoinst]++)) #Contador de fallos totales de cada proceso
				if [[ $seleccionAlgoritmoPaginacion -eq 6 || $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 10 ]]; then #MFU
					ResuPaginaAcumulado[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$primera_pagina # Se añade el dato de la página que acaba de ser incluida en un marco.
					ResuPaginaOrdinalAcumulado[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
					ResuFrecuenciaAcumulado[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=1 #Como la página acaba de ser metida en el marco, se suma 1 a la frecuencia de la página. 
					ResuFallosPaginaProceso[$ejecutandoinst,$reloj]=$primera_pagina #Y se añade la página a la secuencia de fallos. 
					ResuFallosMarcoProceso[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #Y se añade el marco a la secuencia de fallos. 
					if [[ $seleccionAlgoritmoPaginacion -eq 10 ]]; then #NFU-MFU con clases					
						ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=1 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
						primerTiempoEntradaPagina[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]}]=0 #Se inicializa a 0 el número de unidades de tiempo que hace que se cambió la clase por llegar al máximo de tiempo en una clase 2 o 3 o al máximo de frecuencia de uso.
						usoMismaPagina=1 #Resultado de un fallo de página (1) y no por usar una página ya existente en memoria (0).
						gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado ${max_AlgPagFrecRec_Position[$ejecutandoinst]} $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
						if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
						gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
					else
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
							if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} -gt ${max_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
								max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} #Mayor frecuencia encontrada.
								max_AlgPagFrecRec_Position[$ejecutandoinst]=$indMaxAlgPag #Posición del marco con la mayor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página.
					fi
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
				elif [[ $seleccionAlgoritmoPaginacion -eq 7 || $seleccionAlgoritmoPaginacion -eq 9 || $seleccionAlgoritmoPaginacion -eq 11 ]]; then #LFU
					ResuPaginaAcumulado[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$primera_pagina # Se añade el dato de la página que acaba de ser incluida en un marco.
					ResuPaginaOrdinalAcumulado[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
					ResuFrecuenciaAcumulado[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=1 #Como la página acaba de ser metida en el marco, se suma 1 a la frecuencia de la página. 
					ResuFallosPaginaProceso[$ejecutandoinst,$reloj]=$primera_pagina #Y se añade la página a la secuencia de fallos. 
					ResuFallosMarcoProceso[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #Y se añade el marco a la secuencia de fallos. 
					if [[ $seleccionAlgoritmoPaginacion -eq 11 ]]; then #NFU-LFU con clases
						ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=1 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
						primerTiempoEntradaPagina[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]}]=0 #Se inicializa a 0 el número de unidades de tiempo que hace que se cambió la clase por llegar al máximo de tiempo en una clase 2 o 3 o al máximo de frecuencia de uso.
						usoMismaPagina=1 #Resultado de un fallo de página (1) y no por usar una página ya existente en memoria (0).
						gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado ${min_AlgPagFrecRec_Position[$ejecutandoinst]} $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
						min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
						if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
						gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
					else
						min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
							if [[ ${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} -lt ${min_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
								min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuFrecuenciaAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} #Mayor frecuencia encontrada.
								min_AlgPagFrecRec_Position[$ejecutandoinst]=$indMinAlgPag #Posición del marco con la menor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página.
					fi
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la mínima frecuencia.  
				fi
				indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
			fi
		fi          
	
	else #[[ ${temp_rej[$ejecutandoinst]} -eq 0 ]]; then #Y si no quedan más páginas pendientes de ejecutar. No es tiempoEjecucion sino temp_rej.
		for (( counter=0; counter<$nprocesos; counter++ )); do
			if [[ " ${llegados[*]} " == *" $ejecutandoinst "* ]]; then 
				retorno[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst])) #Como temp_ret(). Se aconseja quitar la variable $retorno y estandarizar las variables a usar ??????????.
				retorno+=("${retorno[$ejecutandoinst]}") #Como temp_ret(). Se aconseja quitar la variable $retorno y estandarizar las variables a usar ??????????.
				if [[ ! " ${ejecutando[*]} " == *" $ejecutandoinst "* ]]; then
					espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst])) #Como temp_wait(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????.
					if [[ " ${haestadopausado[*]} " == *" $ejecutandoinst "* ]]; then
						resta[$ejecutandoinst]=$((tiempo[$ejecutandoinst] - tiempoEjecucion[$ejecutandoinst])) #Como temp_rej() #tiempo o ejecucion[$counter] ???????????? #Esa resta debería ser alrevés, el de ejecución menos lo ya ejecutado...
						espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst] - resta[$ejecutandoinst])) #Como temp_wait() #Tampoco es (reloj - llegada[$ejecutandoinst]).
					fi
					espera+=("${espera[${numeroproceso[$ejecutandoinst]}]}") #Como temp_wait(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????.
				fi
			fi
		done
		finalizado=$ejecutandoinst #Actualización de variables y cambios de estado. Algunos ya se hacen en ajusteFinalTiemposEsperaEjecucionRestante().
		ejecutando="" 
		finalizados+=("$finalizado")
		finalizadonuevo+=("$finalizado")
		hanestadomem=$paginasEnMemoriaProceso
		if [[ ${#finalizados[@]} -ge ${#llegada[@]} ]]; then #De momento se cambia ordenados por llegada.
			for i in "${!enmemoria[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array).
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
} #Fin de gestionAlgoritmoPagAlgPagFrecMFULFUNFU()

####################################################################################
# Sinopsis: Algoritmo AlgPagFrecMRULRUNRU - NRU usará un límite máximo del tiempo que hace que se usaron las páginas por última vez (seleccionAlgoritmoPaginacion_uso_rec_valor)
####################################################################################
function gestionAlgoritmoPagAlgPagRecMRULRUNRU { #ResuUsoRecienteAcumulado 
	paginasEnMemoriaProceso=(); #Páginas residentes en memoria del Proceso en ejecución. #Se inicializan los arrays que se van a usar temporalmente para cada proceso en ejecución.
	ordinal=(); #Contiene el ordinal del número de marco de cada proceso.
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se van a determinar los marcos reales que usa cada proceso.
		ordinal[$counter]=0
	done
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do #El array relacionMarcosUsados[] no necesita acumulado porque ya contiene todos los datos necesarios y se mantienen hasta que se modifican en las reubicaciones, caso en el que también recoge el cambio.
		if [[ ${unidMemOcupadas[$ii]} != "_" ]]; then # Se buscan los marcos ocupados por cada proceso
			relacionMarcosUsados[${unidMemOcupadas[$ii]},$reloj,${ordinal[${unidMemOcupadas[$ii]}]}]=$ii
			ordinal[${unidMemOcupadas[$ii]}]=$((${ordinal[${unidMemOcupadas[$ii]}]} + 1))
		fi
	done
	for ((v=0; v<${memoria[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas en memoria de cada proceso.
		if [[ ${paginasEnMemoriaTotal[$ejecutandoinst,$v]} != "" ]]; then #Evita un problema con la indefinición de la página en caso de no existir, ya que la lee como valor 0, y la página 0 también existe. 
			paginasEnMemoriaProceso[$v]=${paginasEnMemoriaTotal[$ejecutandoinst,$v]}
		else
			paginasEnMemoriaProceso[$v]=-1
		fi
	done 
	unset paginasPendientesUsarTotal[$ejecutandoinst] #Se borra la variable para volver a crearla con las páginas aún pendientes de ejecutar.
	for ((v=${numeroPaginasUsadasProceso[$ejecutandoinst]}; v<${tiempoEjecucion[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas de cada proceso pendientes de ejecutar.
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasPendientesUsarTotal[$ejecutandoinst,$v]=$pagina
	done
	unset paginasUsadasTotal[$ejecutandoinst] #Se borra la variable para volver a crearla con las páginas aún pendientes de ejecutar.
	for ((v=0; v<=${numeroPaginasUsadasProceso[$ejecutandoinst]}; v++)); do #Se crea la secuencia de páginas de cada proceso ya ejecutadas.
		pagina=${paginasDefinidasTotal[$ejecutandoinst,$v]}
		paginasUsadasTotal[$ejecutandoinst,$v]=$pagina
		paginasUsadasProceso[$v]=$pagina #No es necesario ya que paginasUsadasTotal[] se genera en cada ejecución de la función.
	done 
	for (( counter=0 ; counter<$nprocesos ; counter++ )); do #Se actualizan los datos de frecuencia o antigüedad de uso de cada marco de memoria ocupado por una página de un proceso.
		if [[ ${numeroMarcosUsados[$counter]} -ne 0 ]]; then #Si no es el primer instante de ejecución de este proceso. Primero se copian y luego se modifican si es necesario.
			for (( jj=0; jj<${memoria[$counter]}; jj++ )); do
				ResuPaginaAcumulado[$counter,$jj,$reloj]=${ResuPaginaAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array con las páginbas en ls diferentes marcos en el instante anterior.
				ResuUsoRecienteAcumulado[$counter,$jj,$reloj]=${ResuUsoRecienteAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
				ResuFrecuenciaAcumulado[$counter,$jj,$reloj]=${ResuFrecuenciaAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array de frecuencias de uso de las páginas contenidas en los marcos en el instante anterior.
				ResuPaginaOrdinalAcumulado[$counter,$jj,$reloj]=${ResuPaginaOrdinalAcumulado[$counter,$jj,$(($reloj - 1))]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
				if [[ $seleccionAlgoritmoPaginacion -eq 5 && ${ResuTiempoOptimoAcumulado[$counter,$jj,$(($reloj - 1))]} -gt 0 ]]; then #Óptimo
					ResuTiempoOptimoAcumulado[$counter,$jj,$reloj]=$((${ResuTiempoOptimoAcumulado[$counter,$jj,$(($reloj - 1))]} - 1)) #Recoge los datos del array de clases de uso de las páginas contenidas en los marcos en el instante anterior.
				elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
					ResuTiempoOptimoAcumulado[$counter,$jj,$reloj]=0 #Recoge los datos del array de clases de uso de las páginas contenidas en los marcos en el instante anterior.
				fi
				if [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU con clases sobre MFU/LFU
					ResuClaseAcumulado[$counter,$jj,$reloj]=${ResuClaseAcumulado[$counter,$jj,$(($reloj - 1))]} #Recoge los datos del array de clases de uso de las páginas contenidas en los marcos en el instante anterior.
				fi
			done
		fi
	done
	
	for ((indMemIni=0; indMemIni<${memoria[$ejecutandoinst]}; indMemIni++)); do #Se crea la secuencia de páginas en memoria de cada proceso.
		indPagIni=$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))
		if [[ $indPagIni -eq 0 ]]; then
			ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMemIni]=0 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
			ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMemIni]=0 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
			directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMemIni,0]=0 #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Se usará para determinar si una página ha sido o no referenciada y modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_uso_rec_valor unidades de tiempo en los algoritmos NFU y NRU. Se inicia a 0 por no haber sido aún referenciada (vista o modificada) y se cambia sólo cuando ya estuviera en memoria.
		else
			directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMemIni,$indPagIni]=${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMemIni,$(($indPagIni - 1))]} #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Se usará para determinar si una página ha sido o no referenciada y modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_uso_rec_valor unidades de tiempo en los algoritmos NFU y NRU. Se inicia a 0 por no haber sido aún referenciada (vista o modificada) y se cambia sólo cuando ya estuviera en memoria.
		fi
	done 
	for ((indMarco=0; indMarco<${numeroMarcosUsados[$ejecutandoinst]}; indMarco++)); do #Se actualizan los valores del tiempo que falta para ejecutarse una página de cada proceso, salvo si es 0, ya que en ese caso, no se volverá a encontrar en la sucesión de páginas pendientes del proceso.
		if [[ ${primerTiempoEntradaPagina[$ejecutandoinst,$indMarco]} -gt 0 ]]; then
			primerTiempoEntradaPagina[$ejecutandoinst,$indMarco]=$((${primerTiempoEntradaPagina[$ejecutandoinst,$indMarco]} - 1)) #Se inicializa a 0 el número de unidades de tiempo que hace que se cambió la clase por llegar al máximo de tiempo en una clase 2 o 3, o al máximo de frecuencia de uso.
		fi
	done 

	if [[ ${numeroPaginasUsadasProceso[$ejecutandoinst]} -lt ${tiempoEjecucion[$ejecutandoinst]} ]]; then #Si aún quedan páginas por ejecutar de ese proceso.
		primera_pagina=${paginasDefinidasTotal[$ejecutandoinst,${numeroPaginasUsadasProceso[$ejecutandoinst]}]} #Se determina la primera página de la secuencia de páginas pendientes.
		numeroPaginasUsadasProceso[$ejecutandoinst]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} + 1)) #Número de páginas usadas en el proceso en ejecución. Aumenta en todas las unidades de ejecución del proceso. 
		paginaAUsar[$ejecutandoinst]=${paginasDefinidasTotal[$ejecutandoinst,$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))]} #Siguiente página, pendiente de ejecutar.
		if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de marcos usados es menor que el tamaño de la memoria asociada al proceso.
			x=0 #Define si encuentra o no la página en paginasEnMemoriaProceso
			for buscar_primera_pagina in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página en paginasEnMemoriaProceso (da la posición, pero no la variable en el array).
				if [[ ${paginasEnMemoriaProceso[$buscar_primera_pagina]} -eq $primera_pagina ]]; then #Esta línea es para cuando usamos la posición del dato y no su valor. Si la página está en memoria define x=1.
					x=1
					indMarcoMem=$buscar_primera_pagina # Se guarda el marco en el que se encuentra la página.
				fi 
			done
			if [[ $x -eq 1 && $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) -ne 0 ]]; then #USO DE PÁGINA - Si la página está en memoria, y si no es la primera página a usar para evitar la inicialización de la variable paginasEnMemoriaTotal[$ejecutandoinst,ordinal}] a 0.
				#Se van a tratar las variables que no se corresponden con el marco usado.
				for ((indMarcoRec=0; indMarcoRec<${numeroMarcosUsados[$ejecutandoinst]}; indMarcoRec++)); do #El tiempo desde que se usó una página en memoria aumenta en cada unidad de tiempo de ejecución del proceso, siempre que no sea la que se usa, o sobre la que se produce el fallo de paginación. 
					if [[ $indMarcoRec -ne $indMarcoMem ]]; then
						if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo 
							calcularResuTiempoOptimoAcumulado_PaginaNoEjecutada #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
						elif [[ $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 13 ]]; then #MFU/LFU. Sin máximo de tiempo desde que se usó por última vez.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
						elif [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #NFU-MFU/NFU-LFU
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_uso_rec_valor ]]; then #Hay un máximo par el tiempo desde que se usó (seleccionAlgoritmoPaginacion_uso_rec_valor).
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							else
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$seleccionAlgoritmoPaginacion_uso_rec_valor
							fi
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
						elif [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU-MFU/NFU-LFU con clases. Sin máximo de tiempo desde que se usó por última vez.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_clases_uso_rec_valor ]]; then #Hay un máximo par el tiempo desde que se usó (seleccionAlgoritmoPaginacion_uso_rec_valor).
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
							else
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor
							fi 
						fi
					fi
					if [[ $indMarcoRec -eq $indMarcoMem ]]; then
						ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$indMarcoMem #Índice que apunta al marco con la página que acaba de ser usada (ya exitente anteriormente). 
						if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo
							calcularResuTiempoOptimoAcumulado_PaginaEjecutada #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]} + 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Tiempo que hace que se usó la Página de un proceso que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Histórico con el valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
						fi
					fi
				done
				#Ahora se definirán las variables que se corresponden con el marco usado. 
				ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
				ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0 #0 por haber sido usado.
				if [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU-MFU/NFU-LFU con clases
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarcoMem]=1
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=0
					usoMismaPagina=0 #Se usa una página que ya estaba en memoria (0) y, por tanto, no es el resultado de un fallo de página (1).
					#Si las páginas tienen una frecuencia de uso mayor que la frecuencia máxima $seleccionAlgoritmoPaginacion_clases_uso_rec_valor
				fi
									
				indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se ejecuta este proceso. También se usa para las frecuencias.
				if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de páginas en memoria del proceso es menor que el tamaño de la memoria del proceso. 
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${numeroMarcosUsados[$ejecutandoinst]} #Sumaría 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres, pero no lo suma porque el número de marcos usados no empezará en 0 sino en 1, mientras que las variables suelene empezar en 0. 
				fi
				if [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU con clases sobre MFU/LFU
					gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado $indMarcoMem $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
				fi
			
			else #Si NO está en memoria... FALLO DE PÁGINA
				numeroMarcosUsados[$ejecutandoinst]=$((${numeroMarcosUsados[$ejecutandoinst]} + 1)) #Aumenta en 1 el número de marcos usados. Sólo aumenta cuando se usa un nuevo marco y no en todas las unidades de ejecución del proceso. Debe ser la última línea dentro del if paradejarlo preparado para su siguiente uso como variable.
				ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$(($((${numeroMarcosUsados[$ejecutandoinst]} - 1)))) #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). Sería -1 porque numeroMarcosUsados empieza a contar en 1.
				#Se van a tratar las variables que no se corresponden con el marco usado.
				for ((indMarcoRec=0; indMarcoRec<${numeroMarcosUsados[$ejecutandoinst]}; indMarcoRec++)); do #El tiempo desde que se usó una página en memoria aumenta en cada unidad de tiempo de ejecución del proceso, siempre que no sea la que se usa, o sobre la que se produce el fallo de paginación. 
					if [[ $indMarcoRec -ne ResuPunteroMarcoUsado[$ejecutandoinst,$reloj] ]]; then
						if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo
							calcularResuTiempoOptimoAcumulado_PaginaNoEjecutada #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
						elif [[ $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 13 ]]; then #MFU/LFU. Sin máximo de tiempo desde que se usó por última vez.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
						elif [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #NFU-MFU/NFU-LFU
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_uso_rec_valor ]]; then #Hay un máximo par el tiempo desde que se usó (seleccionAlgoritmoPaginacion_uso_rec_valor).
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							else
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$seleccionAlgoritmoPaginacion_uso_rec_valor
							fi
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
						elif [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU-MFU/NFU-LFU con clases. Sin máximo de tiempo desde que se usó por última vez.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_clases_uso_rec_valor ]]; then #Hay un máximo par el tiempo desde que se usó (seleccionAlgoritmoPaginacion_uso_rec_valor).
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
							else
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor
							fi
						fi
					fi
					if [[ $indMarcoRec -eq ${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]} ]]; then
						if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo
							calcularResuTiempoOptimoAcumulado_PaginaEjecutada #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.
							
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Tiempo que hace que se usó la Página de un proceso que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Histórico con el valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
						fi
					fi
				done
				#Ahora se definirán el resto de variables que se corresponden con el marco usado. 
				paginasEnMemoriaProceso[$((${numeroMarcosUsados[$ejecutandoinst]} - 1))]=$primera_pagina #... la página se añade a la secuencia de páginas del proceso en ejecución en memoria.
				paginasEnMemoriaTotal[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1))]=$primera_pagina #... y la página se añade a la secuencia de páginas de ese proceso junto con el resto de páginas del resto de procesos residentes en memoria (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
				contadorAlgPagFallosTotalesProcesos[$ejecutandoinst]=$((contadorAlgPagFallosTotalesProcesos[$ejecutandoinst] + 1)) #Contador de fallos de página totales de cada proceso.
				((contadorAlgPagFallosProcesoAcumulado[$ejecutandoinst]++)) #Contador de fallos totales de cada proceso
				ResuPaginaAcumulado[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1)),$reloj]=$primera_pagina #Se añade el dato de la página que acaba de ser incluida en un marco.
				ResuPaginaOrdinalAcumulado[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1)),$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
				ResuUsoRecienteAcumulado[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1)),$reloj]=0 # Se añade el dato de la frecuencia de la página que acaba de ser incluida en un marco.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$((${numeroMarcosUsados[$ejecutandoinst]} - 1))]=0 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
				ResuFallosPaginaProceso[$ejecutandoinst,$reloj]=$primera_pagina #Y se añade la página a la secuencia de fallos. 
				ResuFallosMarcoProceso[$ejecutandoinst,$reloj]=$((${numeroMarcosUsados[$ejecutandoinst]} - 1)) #Y se añade el marco a la secuencia de fallos. 
				indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
				directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))]=0
				if [[ ${numeroMarcosUsados[$ejecutandoinst]} -ge ${memoria[$ejecutandoinst]} ]]; then #Sólo es necesario si se llenan todos los marcos asociados al proceso. 
					if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #MFU
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula el siguiente uso de la página utilizada más alejado en el tiempo.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
							if [[ ${ResuTiempoOptimoAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} -gt ${max_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
								max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuTiempoOptimoAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} #Mayor frecuencia encontrada.
								max_AlgPagFrecRec_Position[$ejecutandoinst]=$indMaxAlgPag #Posición del marco con la mayor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página
					elif [[ $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 14 ]]; then #MFU
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} -gt ${max_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
								max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} #Mayor frecuencia encontrada.
								max_AlgPagFrecRec_Position[$ejecutandoinst]=$indMaxAlgPag #Posición del marco con la mayor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página
					elif [[ $seleccionAlgoritmoPaginacion -eq 16 ]]; then #NFU con clases sobre MFU
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
						if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
							limite_j=$ultimasPaginasAConsiderar #QUEDA PENDIENTE USARLO PARA RESTAR LA FRECUENCIA ACTUAL DE LA QUE TENÍA EN AQUEL MOMENTO.
						else
							limite_j=0
						fi
						gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
					elif [[ $seleccionAlgoritmoPaginacion -eq 13 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #LFU
						min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} -lt ${min_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
								min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} #Menor frecuencia encontrada.
								min_AlgPagFrecRec_Position[$ejecutandoinst]=$indMinAlgPag #Posición del marco con la menor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página					
					elif [[ $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU con clases sobre MFU
						min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
						if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
						gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
					fi
				fi
				if [[ ${numeroMarcosUsados[$ejecutandoinst]} -lt ${memoria[$ejecutandoinst]} ]]; then #Si el número de páginas en memoria del proceso es menor que el tamaño de la memoria del proceso. 
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${numeroMarcosUsados[$ejecutandoinst]} #Suma 1 al número de marco sobre el que se hará el fallo de página porque aún hay marcos libres. 
				else
					if [[ $seleccionAlgoritmoPaginacion -eq 5 || $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 16 ]]; then #MFU
						ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
					elif [[ $seleccionAlgoritmoPaginacion -eq 13 || $seleccionAlgoritmoPaginacion -eq 15 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #LFU
						ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la mínima frecuencia.  
					fi
				fi
			fi

		else #Si el número de marcos usados es mayor o igual que el tamaño de la memoria asociada al proceso.
			x=0 #Define si encuentra o no la página en paginasEnMemoriaProceso.
			for buscar_primera_pagina in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página (da la posición pero no la variable en el array).
				if [[ ${paginasEnMemoriaProceso[$buscar_primera_pagina]} -eq $primera_pagina ]]; then #Si la página está en memoria define x=1.
					x=1
				fi 
			done
			if [[ $x -eq 1 ]]; then #Si la página está en memoria...USO DE PÁGINA
				for indMarcoMem in "${!paginasEnMemoriaProceso[@]}"; do #Localiza en qué posición encuentra la página (da la posición pero no la variable en el array).
					if [[ ${paginasEnMemoriaProceso[$indMarcoMem]} -eq $primera_pagina ]]; then
						ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=$indMarcoMem #Índice que apunta al marco con la página que acaba de ser usada (ya exitente anteriormente). 
						#Se van a tratar las variables que no se corresponden con el marco usado.
						for ((indMarcoRec=0; indMarcoRec<${numeroMarcosUsados[$ejecutandoinst]}; indMarcoRec++)); do #El tiempo desde que se usó una página en memoria aumenta en cada unidad de tiempo de ejecución del proceso, siempre que no sea la que se usa, o sobre la que se produce el fallo de paginación. 
							if [[ $indMarcoRec -ne ResuPunteroMarcoUsado[$ejecutandoinst,$reloj] ]]; then
								if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo
									calcularResuTiempoOptimoAcumulado_PaginaNoEjecutada #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.

									ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Tiempo que hace que se usó la Página de un proceso que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
									ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Histórico con el valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación

								elif [[ $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 13 ]]; then #MFU/LFU. Sin máximo de tiempo desde que se usó por última vez.
									ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
									ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
								elif [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #NFU-MFU/NFU-LFU
									if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_uso_rec_valor ]]; then #Hay un máximo par el tiempo desde que se usó (seleccionAlgoritmoPaginacion_uso_rec_valor).
										ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
									else
										ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$seleccionAlgoritmoPaginacion_uso_rec_valor
									fi
									ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
								elif [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU-MFU/NFU-LFU con clases. Sin máximo de tiempo desde que se usó por última vez.
									ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
									if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_clases_uso_rec_valor ]]; then #Hay un máximo par el tiempo desde que se usó (seleccionAlgoritmoPaginacion_uso_rec_valor).
										ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
									else
										ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor
									fi
								fi
							fi
							if [[ $indMarcoRec -eq ResuPunteroMarcoUsado[$ejecutandoinst,$reloj] ]]; then
								if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo
									calcularResuTiempoOptimoAcumulado_PaginaEjecutada #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.

									ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
								fi
							fi							
						done
						#Ahora se definirán las variables que se corresponden con el marco usado. 
						ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
						if [[ $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 13 ]]; then #MFU/LFU
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
						elif [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #NFU-MFU/NFU-LFU
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_uso_rec_valor ]]; then 
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
							else
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
							fi
						elif [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU-MFU/NFU-LFU con clases
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoMem,$reloj]=0
							directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarcoMem]=1
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoMem]=0
							usoMismaPagina=0 #Se usa una página que ya estaba en memoria (0) y, por tanto, no es el resultado de un fallo de página (1).
							#Si las páginas tienen una frecuencia de uso mayor que la frecuencia máxima $seleccionAlgoritmoPaginacion_clases_uso_rec_valor
							gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado $indMarcoMem $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
						fi
						if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #MFU
							max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula el siguiente uso de la página utilizada más alejado en el tiempo.
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
								if [[ ${ResuTiempoOptimoAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} -gt ${max_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
									max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuTiempoOptimoAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} #Mayor frecuencia encontrada.
									max_AlgPagFrecRec_Position[$ejecutandoinst]=$indMaxAlgPag #Posición del marco con la mayor frecuencia.
								fi
							done #Y sobre esa localización se hace el fallo de página
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
						elif [[ $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 14 ]]; then #MFU
							max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
								if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} -gt ${max_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
									max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} #Mayor frecuencia encontrada.
									max_AlgPagFrecRec_Position[$ejecutandoinst]=$indMaxAlgPag #Posición del marco con la mayor frecuencia.
								fi
							done #Y sobre esa localización se hace el fallo de página
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
				
						elif [[ $seleccionAlgoritmoPaginacion -eq 16 ]]; then #NFU con clases sobre MFU
							max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
							max_AlgPagFrecRec_Position[$ejecutandoinst]=0
							ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
							paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
							if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
								limite_j=$ultimasPaginasAConsiderar
							else
								limite_j=0
							fi
							gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
						elif [[ $seleccionAlgoritmoPaginacion -eq 13 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #LFU
							min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
							min_AlgPagFrecRec_Position[$ejecutandoinst]=0
							for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
								if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} -lt ${min_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
									min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} #Menor frecuencia encontrada.
									min_AlgPagFrecRec_Position[$ejecutandoinst]=$indMinAlgPag #Posición del marco con la menor frecuencia.
								fi
							done #Y sobre esa localización se hace el fallo de página
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la mínima frecuencia.  
						elif [[ $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU con clases sobre MFU
							min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
							min_AlgPagFrecRec_Position[$ejecutandoinst]=0
							ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
							paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
							if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
								limite_j=$ultimasPaginasAConsiderar
							else
								limite_j=0
							fi
							gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
							ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la mínima frecuencia.  
						fi
						indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
					fi
				done

			else #Y si NO está en la memoria...FALLO DE PÁGINA. Se localiza el que tenga el primer valor del mayor contador de frecuencia por ser AlgPagFrecMFU.
				if [[ $seleccionAlgoritmoPaginacion -eq 5 || $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 14 ]]; then #MFU
					ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
					paginasEnMemoriaProceso[${max_AlgPagFrecRec_Position[$ejecutandoinst]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la mayor frecuencia, sustituyendo la página.
					paginasEnMemoriaTotal[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
				elif [[ $seleccionAlgoritmoPaginacion -eq 13 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #LFU
					ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
					paginasEnMemoriaProceso[${min_AlgPagFrecRec_Position[$ejecutandoinst]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la menor frecuencia, sustituyendo la página.
					paginasEnMemoriaTotal[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
				elif [[ $seleccionAlgoritmoPaginacion -eq 16 ]]; then #NFU con clases sobre MFU
					ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
					paginasEnMemoriaProceso[${max_AlgPagFrecRec_Position[$ejecutandoinst]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la mayor frecuencia, sustituyendo la página.
					paginasEnMemoriaTotal[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=0
				
				elif [[ $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU con clases sobre MFU
					ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #Índice que apunta al marco con la página que acaba de ser incluida (ocupa un espacio ya utilizado anteriormente por otra página). 
					paginasEnMemoriaProceso[${min_AlgPagFrecRec_Position[$ejecutandoinst]}]="$primera_pagina" #Se hace el fallo de página sobre el primer marco con la menor frecuencia, sustituyendo la página.
					paginasEnMemoriaTotal[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]}]=$primera_pagina #Páginas residentes en memoria de todos los Procesos (Índices:Proceso, Páginas). Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]}]=0
				fi
				#Se van a tratar las variables que no se corresponden con el marco usado.
				for ((indMarcoRec=0; indMarcoRec<${numeroMarcosUsados[$ejecutandoinst]}; indMarcoRec++)); do #El tiempo desde que se usó una página en memoria aumenta en cada unidad de tiempo de ejecución del proceso, siempre que no sea la que se usa, o sobre la que se produce el fallo de paginación. 
					if [[ $indMarcoRec -ne ${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]} ]]; then
						if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo
							calcularResuTiempoOptimoAcumulado_PaginaNoEjecutada #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))

						elif [[ $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 13 ]]; then #MFU/LFU. Sin máximo de tiempo desde que se usó por última vez.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
						elif [[ $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then #NFU-MFU/NFU-LFU
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_uso_rec_valor ]]; then #Hay un máximo par el tiempo desde que se usó (seleccionAlgoritmoPaginacion_uso_rec_valor).
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							else
								ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$seleccionAlgoritmoPaginacion_uso_rec_valor
							fi
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
						elif [[ $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU-MFU/NFU-LFU con clases. Sin máximo de tiempo desde que se usó por última vez.
							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1))
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,${indiceResuPaginaAcumulado[$ejecutandoinst]}]} -lt $seleccionAlgoritmoPaginacion_clases_uso_rec_valor ]]; then #Hay un máximo par el tiempo desde que se usó (seleccionAlgoritmoPaginacion_uso_rec_valor).
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1))
							else
								ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor
							fi
						fi
					fi
					if [[ $indMarcoRec -eq ${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]}  ]]; then
						if [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo
							calcularResuTiempoOptimoAcumulado_PaginaEjecutada #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.

							ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$((${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]} + 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Tiempo que hace que se usó la Página de un proceso que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
							ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMarcoRec]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Histórico con el valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
							ResuPaginaAcumulado[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$primera_pagina # Se añade el dato de la página que acaba de ser incluida en un marco.
						fi
					fi					
				done
				#Ahora se definirán las variables que se corresponden con el marco usado. 
				contadorAlgPagFallosTotalesProcesos[$ejecutandoinst]=$((contadorAlgPagFallosTotalesProcesos[$ejecutandoinst] + 1)) #Aumenta en una unidad el número de fallos de página del proceso.
				((contadorAlgPagFallosProcesoAcumulado[$ejecutandoinst]++)) #Contador de fallos totales de cada proceso
				if [[ $seleccionAlgoritmoPaginacion -eq 12 || $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 16 ]]; then #MFU
					ResuPaginaAcumulado[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$primera_pagina # Se añade el dato de la página que acaba de ser incluida en un marco.
					ResuPaginaOrdinalAcumulado[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
					ResuUsoRecienteAcumulado[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=0 #Como la página acaba de ser metida en el marco, se suma 1 a la frecuencia de la página. 
					ResuFallosPaginaProceso[$ejecutandoinst,$reloj]=$primera_pagina #Y se añade la página a la secuencia de fallos. 
					ResuFallosMarcoProceso[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #Y se añade el marco a la secuencia de fallos. 
					if [[ $seleccionAlgoritmoPaginacion -eq 16 ]]; then #NFU-MFU con clases					
						ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=0 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
						primerTiempoEntradaPagina[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]}]=0 #Se inicializa a 0 el número de unidades de tiempo que hace que se cambió la clase por llegar al máximo de tiempo en una clase 2 o 3 o al máximo de frecuencia de uso.
						usoMismaPagina=1 #Resultado de un fallo de página (1) y no por usar una página ya existente en memoria (0).
						gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado ${max_AlgPagFrecRec_Position[$ejecutandoinst]} $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
						if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
						gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
					else
						max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=-1 #Se recalcula la mayor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión.
						max_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMaxAlgPag=0; indMaxAlgPag<${memoria[$ejecutandoinst]}; indMaxAlgPag++ )); do
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} -gt ${max_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
								max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMaxAlgPag,$reloj]} #Mayor frecuencia encontrada.
								max_AlgPagFrecRec_Position[$ejecutandoinst]=$indMaxAlgPag #Posición del marco con la mayor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página.
					fi
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${max_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la máxima frecuencia.  
				elif [[ $seleccionAlgoritmoPaginacion -eq 13 || $seleccionAlgoritmoPaginacion -eq 15 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #LFU
					ResuPaginaAcumulado[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$primera_pagina # Se añade el dato de la página que acaba de ser incluida en un marco.
					ResuPaginaOrdinalAcumulado[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
					ResuUsoRecienteAcumulado[$ejecutandoinst,${min_AlgPagFrecRec_Position[$ejecutandoinst]},$reloj]=0 #Como la página acaba de ser metida en el marco, se suma 1 a la frecuencia de la página. 
					ResuFallosPaginaProceso[$ejecutandoinst,$reloj]=$primera_pagina #Y se añade la página a la secuencia de fallos. 
					ResuFallosMarcoProceso[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #Y se añade el marco a la secuencia de fallos. 
					if [[ $seleccionAlgoritmoPaginacion -eq 17 ]]; then #NFU-LFU con clases
						ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,${max_AlgPagFrecRec_Position[$ejecutandoinst]}]=0 #Resumen - Índices: (proceso, marco). Dato: Valor de la "frecuencia/tiempo desde su último uso" para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación
						primerTiempoEntradaPagina[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]}]=0 #Se inicializa a 0 el número de unidades de tiempo que hace que se cambió la clase por llegar al máximo de tiempo en una clase 2 o 3 o al máximo de frecuencia de uso.
						usoMismaPagina=1 #Resultado de un fallo de página (1) y no por usar una página ya existente en memoria (0).
						gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado ${min_AlgPagFrecRec_Position[$ejecutandoinst]} $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) #Se recalculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas. Se envía: marco + ordinal_página
						min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						ultimasPaginasAConsiderar=$(($((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)) - $seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado))
						paginasPendientesEjecutar=$((${ejecucion[$ejecutandoinst]}-$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))))
						if [[ $ultimasPaginasAConsiderar -ge 0 ]]; then #Sin se han usado muchas páginas. sólo se consideran las últimas definidas mediante seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado.
							limite_j=$ultimasPaginasAConsiderar
						else
							limite_j=0
						fi
						gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min $limite_j #Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
					else
						min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,0,$reloj]} #Se recalcula la menor frecuencia, aunque parezca no necesario hacerlo, por si es necesario para su impresión. Y se comienza con la frecuencia de la primera página en el primer marco asociado al proceso.
						min_AlgPagFrecRec_Position[$ejecutandoinst]=0
						for (( indMinAlgPag=0; indMinAlgPag<${memoria[$ejecutandoinst]}; indMinAlgPag++ )); do
							if [[ ${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} -lt ${min_AlgPagFrecRec_FrecRec[$ejecutandoinst]} ]]; then #Localiza en qué posición encuentra la página.
								min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=${ResuUsoRecienteAcumulado[$ejecutandoinst,$indMinAlgPag,$reloj]} #Mayor frecuencia encontrada.
								min_AlgPagFrecRec_Position[$ejecutandoinst]=$indMinAlgPag #Posición del marco con la menor frecuencia.
							fi
						done #Y sobre esa localización se hace el fallo de página.
					fi
					ResuPunteroMarcoSiguienteFalloPagAcumulado[$ejecutandoinst,$reloj]=${min_AlgPagFrecRec_Position[$ejecutandoinst]} #El marco siguiente para el fallo de página será el que tiene la mínima frecuencia.  
				fi
				indiceResuPaginaAcumulado[$ejecutandoinst]=$reloj #Guarda el índice de la última modificación de datos por no usar el reloj en todos sus instantes sino sólo en los que se usa este proceso. También se usa para las frecuencias.
			fi
		fi          
	
	else #[[ ${temp_rej[$ejecutandoinst]} -eq 0 ]]; then #Y si no quedan más páginas pendientes de ejecutar. No es tiempoEjecucion sino temp_rej.
		for (( counter=0; counter<$nprocesos; counter++ )); do
			if [[ " ${llegados[*]} " == *" $ejecutandoinst "* ]]; then 
				retorno[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst])) #Como temp_ret(). Se aconseja quitar la variable $retorno y estandarizar las variables a usar ??????????.
				retorno+=("${retorno[$ejecutandoinst]}") #Como temp_ret(). Se aconseja quitar la variable $retorno y estandarizar las variables a usar ??????????.
				if [[ ! " ${ejecutando[*]} " == *" $ejecutandoinst "* ]]; then
					espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst])) #Como temp_wait(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????.
					if [[ " ${haestadopausado[*]} " == *" $ejecutandoinst "* ]]; then
						resta[$ejecutandoinst]=$((tiempo[$ejecutandoinst] - tiempoEjecucion[$ejecutandoinst])) #Como temp_rej() #tiempo o ejecucion[$counter] ???????????? #Esa resta debería ser alrevés, el de ejecución menos lo ya ejecutado...
						espera[$ejecutandoinst]=$((reloj - llegada[$ejecutandoinst] - resta[$ejecutandoinst])) #Como temp_wait() #Tampoco es (reloj - llegada[$ejecutandoinst]).
					fi
					espera+=("${espera[${numeroproceso[$ejecutandoinst]}]}") #Como temp_wait(). Se aconseja quitar la variable $espera y estandarizar las variables a usar ??????????.
				fi
			fi
		done
		finalizado=$ejecutandoinst #Actualización de variables y cambios de estado. Algunos ya se hacen en ajusteFinalTiemposEsperaEjecucionRestante().
#		procFinalizado=$ejecutandoinst #Variable que se usa para controlar la impresión de entrada a dibujaResumenAlgPagFrecUsoRec(). Se modifica en inicializaVectoresVariables(), gestionAlgoritmoPagAlgPagFrecMFU(), gestionProcesosFCFS(), gestionProcesosSJF(), gestionProcesosSRPT() y en inicioNuevo().
		ejecutando="" 
		finalizados+=("$finalizado")
		finalizadonuevo+=("$finalizado")
		hanestadomem=$paginasEnMemoriaProceso
		if [[ ${#finalizados[@]} -ge ${#llegada[@]} ]]; then #De momento se cambia ordenados por llegada.
			for i in "${!enmemoria[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array).
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
} #Fin de gestionAlgoritmoPagAlgPagRecMRULRUNRU()

####################################################################################
# Sinopsis: Se calculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas.
####################################################################################
function calcularResuTiempoOptimoAcumulado_PaginaEjecutada { 
	varCierreOptimo=0
	indOptimo=$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))
	until [[ $varCierreOptimo -eq 1 ]]; do 
		if [[ $indOptimo -lt ${ejecucion[$ejecutandoinst]} ]]; then #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.
			if [[ ${paginasDefinidasTotal[$ejecutandoinst,$indOptimo]} -eq $primera_pagina ]]; then
				ResuTiempoOptimoAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$(($indOptimo - $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)))) #Recoge los datos del array de clases de uso de las páginas contenidas en los marcos en el instante anterior.
				varCierreOptimo=1
			fi
		else
			ResuTiempoOptimoAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=0 #Recoge los datos del array de clases de uso de las páginas contenidas en los marcos en el instante anterior.
			varCierreOptimo=1
		fi
		indOptimo=$(($indOptimo + 1)) 
	done
}

####################################################################################
# Sinopsis: Se calculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas.
####################################################################################
function calcularResuTiempoOptimoAcumulado_PaginaNoEjecutada { 
	varCierreOptimo=0
#	indOptimo=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))
	indOptimo=$((${numeroPaginasUsadasProceso[$ejecutandoinst]}))
	until [[ $varCierreOptimo -eq 1 ]]; do 
		if [[ $indOptimo -lt ${ejecucion[$ejecutandoinst]} ]]; then #Con $indOptimo se busca el tiempo que falta hasta una nueva ejecución de la misma página. 0 si no hay más repeticiones de esa página.
			if [[ ${paginasDefinidasTotal[$ejecutandoinst,$indOptimo]} -eq ${paginasEnMemoriaProceso[$indMarcoRec]} ]]; then
				ResuTiempoOptimoAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=$(($indOptimo - $((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1)))) #Recoge los datos del array de clases de uso de las páginas contenidas en los marcos en el instante anterior.
				varCierreOptimo=1
			fi
		else
			ResuTiempoOptimoAcumulado[$ejecutandoinst,$indMarcoRec,$reloj]=0 #Recoge los datos del array de clases de uso de las páginas contenidas en los marcos en el instante anterior.
			varCierreOptimo=1
		fi
		indOptimo=$(($indOptimo + 1)) 
	done
}

####################################################################################
# Sinopsis: Se calculan las clases NRU de las páginas de cada proceso, dependiendo de si han sido referenciadas y/o modificadas.
####################################################################################
function gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado { 
	for ((indMarco=0; indMarco <= $((${numeroMarcosUsados[$ejecutandoinst]} - 1)); indMarco++)); do #Se usará para determinar si una página ha sido o no referenciada y modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_clases_valor unidades de tiempo en los algoritmos NFU y NRU. Se inicia a 0 por no haber sido aún referenciada (vista o modificada) y se cambia sólo cuando ya estuviera en memoria.
		tiempoPag=$((${numeroPaginasUsadasProceso[$ejecutandoinst]} - 1))
		if [[ $usoMismaPagina -eq 1 && $indMarco -eq $1 ]]; then #Con cambio de página por fallo de página ($usoMismaPagina=1) y, por tanto, sólo para esa página. El fallo sobre un marco sólo puede producir clases 0 o 1.
			pagUsadaMarco=$2 #Se define como página usada o modificada	
			directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=0 #Se reinicia la clase a NO referenciada-NO modificada para recalcular después la clase correcta.
			ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Histórico con el tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=0 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=1 #NO referenciada-SI modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
			fi
		fi

		if [[ $usoMismaPagina -eq 1 && $indMarco -ne $1 ]]; then #Con cambio de página por fallo de página ($usoMismaPagina=1), pero sin actuar sobre la página tratada, ya que se deben actualizar las clases de todas las páginas. El fallo sobre otro marco sólo puede producir un aumento en el tiempo ordinal que hace que se cambió la clase, por lo que podría pasar de clase 2 a 0, o de 3 a 1.
			pagUsadaMarco=${#paginasEnMemoriaTotal[$ejecutandoinst,$indMarco]} #Se define como página no usada ni modificada	
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=0 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Histórico con el tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=1 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=2 #SI referenciada-SI modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]=1 #Si lleva mucho tiempo como clase 3, pasa a no referenciado (0) y no modificada y, por tanto, a clase 0.
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=3 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			fi
		fi

		if [[ $usoMismaPagina -eq 0 && $indMarco -eq $1 ]]; then #Con uso de página, pero sin cambio por fallo de página ($usoMismaPagina=0), ya que se deben actualizar las clases de todas las páginas.
			pagUsadaMarco=$2 #Se define como página usada o modificada	
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
				if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 0 ]]; then #Referencia a una página ya ejecutada en una unidad de reloj anterior, dato copiado en todas las páginas de una unidad de tiempo a la siguiente, antes de analizar lo que ocurrirá en el tiempo actual. 
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=0 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 1 ]]; then #Si ya era de clase 2 se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=1 #SI referenciada-SI modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				fi
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 0 ]]; then 
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=1 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 1 ]]; then #Si ya era de clase 2 se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=1 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Histórico con el tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				fi
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
				if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 0 ]]; then #Referencia a una página ya ejecutada en una unidad de reloj anterior, dato copiado en todas las páginas de una unidad de tiempo a la siguiente, antes de analizar lo que ocurrirá en el tiempo actual. 
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=2 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 1 ]]; then 
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=3 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 2 ]]; then #Si ya era de clase 2 se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=2 #SI referenciada-SI modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 3 ]]; then #Si ya era de clase 2 se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=3 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				fi
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 0 ]]; then 
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=3 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 1 ]]; then 
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=3 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 2 ]]; then #Si ya era de clase 2 se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=3 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$(($tiempoPag - 1))]} -eq 3 ]]; then #Si ya era de clase 3 se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$1]=1 #Si lleva mucho tiempo como clase 3, pasa a no referenciado (0) y no modificada y, por tanto, a clase 0.
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$1,$tiempoPag]=3 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
				fi
			fi 
		fi
		
		if [[ $usoMismaPagina -eq 0 && $indMarco -ne $1 ]]; then #Con uso, pero sin cambio de página ($usoMismaPagina=1), ya que se deben actualizar las clases de todas las páginas.
			pagUsadaMarco=${#paginasEnMemoriaTotal[$ejecutandoinst,$indMarco]} #Se define como página no usada ni modificada	
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=0 #NO referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco, ordinal del tiempo de ejecución (página)). Dato: Histórico con el tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 0 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=1 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 0 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=2 #SI referenciada-SI modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]} -eq 1 && ${directions_AlgPagFrecUsoRec_pagina_modificada[$ejecutandoinst,$pagUsadaMarco,0]} -eq 1 ]]; then
				directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]=1 #Si lleva mucho tiempo como clase 3, pasa a no referenciado (0) y no modificada y, por tanto, a clase 0.
				directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=3 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
				ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=$((${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} + 1)) #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			fi
		fi
		#Si el tiempo ordinal de una página en una clase 2 o 3 en los últimos instantes (intervalo de tiempo) es superior al límite ($seleccionAlgoritmoPaginacion_clases_valor) se modifica a "no referenciado" y luego se calcula la nueva clase.
		if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]} -gt $seleccionAlgoritmoPaginacion_clases_valor ]]; then # se comprueba que no lleve más de un tiempo $seleccionAlgoritmoPaginacion_clases_valor. Si lo supera se comprueba que no sea en la misma clase 2 o 3.
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]} -eq 2 ]]; then #Si ya era de clase 2 se pasa a clase 0.
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]=0 #Si lleva mucho tiempo como clase 2, pasa a no referenciado (0) y no modificada y, por tanto, a clase 0.
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=0 #SI referenciada-NO modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			fi
			if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]} -eq 3 ]]; then #Si ya era de clase 3 se pasa a clase 1.
					directions_AlgPagFrecUsoRec_marco_pagina_referenciada[$ejecutandoinst,$indMarco]=0 #Si lleva mucho tiempo como clase 2, pasa a no referenciado (0) y no modificada y, por tanto, a clase 0.
					directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMarco,$tiempoPag]=1 #SI referenciada-SI modificada en un tiempo anterior inferior a seleccionAlgoritmoPaginacion_FrecRec_TiempoConsiderado unidades de tiempo.
					ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[$ejecutandoinst,$indMarco]=0 #Resumen - Índices: (proceso, marco). Dato: Tiempo desde la asigación de las clases 2 o 3 para NFU/NRU en las opciones para la selección del algoritmo de gestión fallos de paginación.
			fi
		fi
#		echo ""
	done
} #Fin de gestionAlgoritmoPagAlgPagRecNRU_Referenciado_Modificado()

####################################################################################
# Sinopsis: Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
####################################################################################
function gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max {  
	xxx_0=0 #Para determinar si hay alguna página de clase 0, y de no ser así, de clase 1,...
	xxx_1=0
	xxx_2=0
	xxx_3=0
	max_AlgPagFrecRec_FrecRec_0=-1 #Mayor frecuencia encontrada en las páginas de clase 0.
	max_AlgPagFrecRec_FrecRec_1=-1 #Mayor frecuencia encontrada en las páginas de clase 1.
	max_AlgPagFrecRec_FrecRec_2=-1 #Mayor frecuencia encontrada en las páginas de clase 2.
	max_AlgPagFrecRec_FrecRec_3=-1 #Mayor frecuencia encontrada en las páginas de clase 3.
	max_AlgPagFrecRec_Position_0=0 #Posición del marco con la mayor frecuencia en las páginas de clase 0.
	max_AlgPagFrecRec_Position_1=0 #Posición del marco con la mayor frecuencia en las páginas de clase 1.
	max_AlgPagFrecRec_Position_2=0 #Posición del marco con la mayor frecuencia en las páginas de clase 2.
	max_AlgPagFrecRec_Position_3=0 #Posición del marco con la mayor frecuencia en las páginas de clase 3.

	for (( indMax=0; indMax<=$((${numeroMarcosUsados[$ejecutandoinst]} - 1)); indMax++ )); do #Se calculan los max para las 4 clases
		punteroPagMarco=${ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMax,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
		if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMax,$punteroPagMarco]} -eq 0 ]]; then
			if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMax]} -gt $max_AlgPagFrecRec_FrecRec_0 ]]; then #Localiza en qué posición encuentra la página.
				max_AlgPagFrecRec_FrecRec_0=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMax]} #Mayor frecuencia encontrada.
				max_AlgPagFrecRec_Position_0=$indMax #Posición del marco con la mayor frecuencia.
				xxx_0=1 #Sólo se marca en caso de que haya cambio de max. De no ser así, no se marca y tampoco se cambia la variable max_AlgPagFrecRec_FrecRec ni max_AlgPagFrecRec_Position
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMax,$punteroPagMarco]} -eq 1 ]]; then
			if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMax]} -gt $max_AlgPagFrecRec_FrecRec_1 ]]; then #Localiza en qué posición encuentra la página.
				max_AlgPagFrecRec_FrecRec_1=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMax]} #Mayor frecuencia encontrada.
				max_AlgPagFrecRec_Position_1=$indMax #Posición del marco con la mayor frecuencia.
				xxx_1=1
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMax,$punteroPagMarco]} -eq 2 ]]; then
			if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMax]} -gt $max_AlgPagFrecRec_FrecRec_2 ]]; then #Localiza en qué posición encuentra la página.
				max_AlgPagFrecRec_FrecRec_2=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMax]} #Mayor frecuencia encontrada.
				max_AlgPagFrecRec_Position_2=$indMax #Posición del marco con la mayor frecuencia.
				xxx_2=1
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMax,$punteroPagMarco]} -eq 3 ]]; then
			if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMax]} -gt $max_AlgPagFrecRec_FrecRec_3 ]]; then #Localiza en qué posición encuentra la página.
				max_AlgPagFrecRec_FrecRec_3=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMax]} #Mayor frecuencia encontrada.
				max_AlgPagFrecRec_Position_3=$indMax #Posición del marco con la mayor frecuencia.
				xxx_3=1
			fi
		fi
	done #Y sobre esa localización se hace el fallo de página
	if [[ $xxx_0 -eq 1 && $xxx_1 -eq 0 && $xxx_2 -eq 0 && $xxx_3 -eq 0 ]]; then
		max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=$max_AlgPagFrecRec_FrecRec_0 #Mayor frecuencia encontrada.
		max_AlgPagFrecRec_Position[$ejecutandoinst]=$max_AlgPagFrecRec_Position_0 #Posición del marco con la mayor frecuencia.
	elif [[ $xxx_1 -eq 1 && $xxx_2 -eq 0 && $xxx_3 -eq 0 ]]; then
		max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=$max_AlgPagFrecRec_FrecRec_1 #Mayor frecuencia encontrada.
		max_AlgPagFrecRec_Position[$ejecutandoinst]=$max_AlgPagFrecRec_Position_1 #Posición del marco con la mayor frecuencia.
	elif [[ $xxx_2 -eq 1 && $xxx_3 -eq 0 ]]; then
		max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=$max_AlgPagFrecRec_FrecRec_2 #Mayor frecuencia encontrada.
		max_AlgPagFrecRec_Position[$ejecutandoinst]=$max_AlgPagFrecRec_Position_2 #Posición del marco con la mayor frecuencia.
	elif [[ $xxx_3 -eq 1 ]]; then
		max_AlgPagFrecRec_FrecRec[$ejecutandoinst]=$max_AlgPagFrecRec_FrecRec_3 #Mayor frecuencia encontrada.
		max_AlgPagFrecRec_Position[$ejecutandoinst]=$max_AlgPagFrecRec_Position_3 #Posición del marco con la mayor frecuencia.
	fi
} #Fin de gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Max() 

####################################################################################
# Sinopsis: Se calcula el máximo de las frecuencias de las páginas de cada proceso en NFU (max_AlgPagFrecRec_FrecRec y max_AlgPagFrecRec_Position), por clases empezando por 0.
####################################################################################
function gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min {  
	xxx_0=0 #Para determinar si hay alguna página de clase 0, y de no ser así, de clase 1,...
	xxx_1=0
	xxx_2=0
	xxx_3=0
	min_AlgPagFrecRec_FrecRec_0=-1 #Menor frecuencia encontrada en las páginas de clase 0.
	min_AlgPagFrecRec_FrecRec_1=-1 #Menor frecuencia encontrada en las páginas de clase 1.
	min_AlgPagFrecRec_FrecRec_2=-1 #Menor frecuencia encontrada en las páginas de clase 2.
	min_AlgPagFrecRec_FrecRec_3=-1 #Menor frecuencia encontrada en las páginas de clase 3.
	min_AlgPagFrecRec_Position_0=0 #Posición del marco con la menor frecuencia en las páginas de clase 0.
	min_AlgPagFrecRec_Position_1=0 #Posición del marco con la menor frecuencia en las páginas de clase 1.
	min_AlgPagFrecRec_Position_2=0 #Posición del marco con la menor frecuencia en las páginas de clase 2.
	min_AlgPagFrecRec_Position_3=0 #Posición del marco con la menor frecuencia en las páginas de clase 3.

	for (( indMin=0; indMin<=$((${numeroMarcosUsados[$ejecutandoinst]} - 1)); indMin++ )); do #Se calculan los min para las 4 clases
		punteroPagMarco=${ResuPaginaOrdinalAcumulado[$ejecutandoinst,$indMin,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
		if [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMin,$punteroPagMarco]} -eq 0 ]]; then
			if [[ $min_AlgPagFrecRec_FrecRec_0 -eq -1 ]]; then
				min_AlgPagFrecRec_FrecRec_0=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]}
				min_AlgPagFrecRec_Position_0=$indMin
				xxx_0=1 #Sólo se marca en caso de que haya cambio de min. De no ser así, no se marca y tampoco se cambia la variable min_AlgPagFrecRec_FrecRec ni min_AlgPagFrecRec_Position
			fi
			if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]} -lt $min_AlgPagFrecRec_FrecRec_0 ]]; then #Localiza en qué posición encuentra la página.
				min_AlgPagFrecRec_FrecRec_0=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]} #Menor frecuencia encontrada.
				min_AlgPagFrecRec_Position_0=$indMin #Posición del marco con la menor frecuencia.
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMin,$punteroPagMarco]} -eq 1 ]]; then
			if [[ $min_AlgPagFrecRec_FrecRec_1 -eq -1 ]]; then
				min_AlgPagFrecRec_FrecRec_1=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]}
				min_AlgPagFrecRec_Position_1=$indMin
				xxx_1=1
			fi
			if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]} -lt $min_AlgPagFrecRec_FrecRec_1 ]]; then #Localiza en qué posición encuentra la página.
				min_AlgPagFrecRec_FrecRec_1=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]} #Menor frecuencia encontrada.
				min_AlgPagFrecRec_Position_1=$indMin #Posición del menor con la mayor frecuencia.
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMin,$punteroPagMarco]} -eq 2 ]]; then
			if [[ $min_AlgPagFrecRec_FrecRec_2 -eq -1 ]]; then
				min_AlgPagFrecRec_FrecRec_2=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]}
				min_AlgPagFrecRec_Position_2=$indMin
				xxx_2=1
			fi
			if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]} -lt $min_AlgPagFrecRec_FrecRec_2 ]]; then #Localiza en qué posición encuentra la página.
				min_AlgPagFrecRec_FrecRec_2=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]} #Menor frecuencia encontrada.
				min_AlgPagFrecRec_Position_2=$indMin #Posición del marco con la menor frecuencia.
			fi
		elif [[ ${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,$indMin,$punteroPagMarco]} -eq 3 ]]; then
			if [[ $min_AlgPagFrecRec_FrecRec_3 -eq -1 ]]; then
				min_AlgPagFrecRec_FrecRec_3=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]}
				min_AlgPagFrecRec_Position_3=$indMin
				xxx_3=1
			fi
			if [[ ${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]} -lt $min_AlgPagFrecRec_FrecRec_3 ]]; then #Localiza en qué posición encuentra la página.
				min_AlgPagFrecRec_FrecRec_3=${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[$ejecutandoinst,$indMin]} #Menor frecuencia encontrada.
				min_AlgPagFrecRec_Position_3=$indMin #Posición del marco con la menor frecuencia.
			fi
		fi
	done #Y sobre esa localización se hace el fallo de página
	if [[ $xxx_0 -eq 1 && $xxx_1 -eq 0 && $xxx_2 -eq 0 && $xxx_3 -eq 0 ]]; then
		min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=$min_AlgPagFrecRec_FrecRec_0 #Menor frecuencia encontrada.
		min_AlgPagFrecRec_Position[$ejecutandoinst]=$min_AlgPagFrecRec_Position_0 #Posición del marco con la menor frecuencia.
	elif [[ $xxx_1 -eq 1 && $xxx_2 -eq 0 && $xxx_3 -eq 0 ]]; then
		min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=$min_AlgPagFrecRec_FrecRec_1 #Menor frecuencia encontrada.
		min_AlgPagFrecRec_Position[$ejecutandoinst]=$min_AlgPagFrecRec_Position_1 #Posición del marco con la menor frecuencia.
	elif [[ $xxx_2 -eq 1 && $xxx_3 -eq 0 ]]; then
		min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=$min_AlgPagFrecRec_FrecRec_2 #Menor frecuencia encontrada.
		min_AlgPagFrecRec_Position[$ejecutandoinst]=$min_AlgPagFrecRec_Position_2 #Posición del marco con la menor frecuencia.
	elif [[ $xxx_3 -eq 1 ]]; then
		min_AlgPagFrecRec_FrecRec[$ejecutandoinst]=$min_AlgPagFrecRec_FrecRec_3 #Menor frecuencia encontrada.
		min_AlgPagFrecRec_Position[$ejecutandoinst]=$min_AlgPagFrecRec_Position_3 #Posición del marco con la menor frecuencia.
	fi

} #Fin de gestionAlgoritmoPagAlgPagRecNRU_Paginas_Clases_Min() 

####################################################################################
####################################################################################
# Funciones para mostrar los datos por pantalla ####################################
####################################################################################
# Sinopsis: Impresión pantalla tras la solicitud de datos/introducción desde fichero
####################################################################################
function dibujaDatosPantallaFCFS_SJF_SRPT_RR {
	echo -e "\n$azul Los datos introducidos al sistema son:$NC" | tee -a $informeConColorTotal #...color
	echo -e " ┌───────────────┬───────────────┬───────────────┬───────────────┐" | tee -a $informeConColorTotal 
	echo -e " │    Proceso$NC    │  T.Llegada$NC    │  T.Ejecución$NC  │    Tamaño$NC     │" | tee -a $informeConColorTotal 
	echo -e " └───────────────┴───────────────┴───────────────┴───────────────┘" | tee -a $informeConColorTotal 
	for (( i=0; i<$nprocesos; i++)); do
		echo -e "${coloress[$i % 6]} \t${proceso[$i]}\t \t${llegada[$i]}\t \t${ejecucion[$i]}\t \t${memoria[$i]}\t  $NC" | tee -a $informeConColorTotal
	done 
	echo -e "\n\n Memoria total: $mem_libre uds." | tee -a $informeConColorTotal
	if [[ $seleccionMenuReubicabilidad -eq 2 ]]; then #Se ejecuta cuando la selección inicial es por ejecución automática repetitiva. Se guardan todos los datos, aún cuando no es por Round-Robin.
		echo " Tamaño a partir del cual se reubica: $variableReubicar uds." | tee -a $informeConColorTotal 
	fi
	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then #Se ejecuta cuando la selección inicial es por ejecución automática repetitiva. Se guardan todos los datos, aún cuando no es por Round-Robin.
		echo " Quantum de tiempo para Round-Robin (RR): $quantum" | tee -a $informeConColorTotal 
	fi
	echo " ---------------------------------------------" | tee -a $informeConColorTotal 
   
	echo -e "\n Los datos introducidos al sistema son:" >> $informeSinColorTotal #...b/n
	echo -e " ┌───────────────┬───────────────┬───────────────┬───────────────┐" >> $informeSinColorTotal
	echo -e " │    Proceso    │  T.Llegada    │  T.Ejecución  │    Tamaño     │" >> $informeSinColorTotal
	echo -e " └───────────────┴───────────────┴───────────────┴───────────────┘" >> $informeSinColorTotal
	for (( i=0; i<$nprocesos; i++)); do
		echo -e " \t${proceso[$i]}\t \t${llegada[$i]}\t \t${ejecucion[$i]}\t \t${memoria[$i]}\t  " >> $informeSinColorTotal
	done
	echo -e "\n\n Memoria total: $mem_libre uds." >> $informeSinColorTotal
	if [[ $seleccionMenuReubicabilidad -eq 2 ]]; then #Se ejecuta cuando la selección inicial es por ejecución automática repetitiva. Se guardan todos los datos, aún cuando no es por Round-Robin.
		echo -e " Tamaño a partir del cual se reubica: $variableReubicar uds." >> $informeSinColorTotal
	fi
	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then #Se ejecuta cuando la selección inicial es por ejecución automática repetitiva. Se guardan todos los datos, aún cuando no es por Round-Robin.
		echo -e " Quantum de tiempo para Round-Robin (RR): $quantum uds." >> $informeSinColorTotal
	fi
	echo -e  " ---------------------------------------------" >> $informeSinColorTotal
	if [[ $seleccionMenuEnsayos -ne 1 && $seleccionMenuEnsayos -ne 2 && $seleccionMenuEnsayos -ne 3 && $seleccionMenuEnsayos -ne 4 ]]; then #No se ejecuta cuando la selección inicial es la ejecución automática repetitiva.
		echo -e "\n$NC Pulse enter para continuar..." | tee -a $informeConColorTotal
		echo -e "\n Pulse enter para continuar..." >> $informeSinColorTotal
		read enter
		echo -e $enter "\n" >> $informeConColorTotal
		echo -e $enter "\n" >> $informeSinColorTotal
	fi
#    clear
}

####################################################################################
# Sinopsis: Muestra un resumen inicial ordenado por tiempo de llegada de todos los procesos introducidos.
####################################################################################
function dibujaDatosPantallaPrioridad {
#	ordenacion
	ordenarDatosEntradaFicheros #Se ordenan los datos sacados desde $ficheroParaLectura o a medida que se van itroduciendo, por tiempo de llegada. 
	echo -e "\n$azul Los datos introducidos al sistema son:$NC" | tee -a $informeConColorTotal #...color
	echo -e " ┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐" | tee -a $informeConColorTotal 
	echo -e " │    Proceso$NC    │  T.Llegada$NC    │  T.Ejecución$NC  │    Tamaño$NC     │   Prioridad$NC   │" | tee -a $informeConColorTotal 
	echo -e " └───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘" | tee -a $informeConColorTotal 
	for (( i=0; i<$nprocesos; i++)); do
		echo -e "${coloress[$i % 6]} \t${proceso[$i]}\t \t${llegada[$i]}\t \t${ejecucion[$i]}\t \t${memoria[$i]}\t \t${prioProc[$i]}\t  $NC" | tee -a $informeConColorTotal
	done
	echo -e "\n\n Memoria total: $mem_libre uds." | tee -a $informeConColorTotal
	echo " Tamaño a partir del cual se reubica: $variableReubicar uds." | tee -a $informeConColorTotal 
	echo " ---------------------------------------------" | tee -a $informeConColorTotal 
   
	echo -e "\n Los datos introducidos al sistema son:" >> $informeSinColorTotal #...b/n
	echo -e " ┌───────────────┬───────────────┬───────────────┬───────────────┬───────────────┐" >> $informeSinColorTotal
	echo -e " │    Proceso    │  T.Llegada    │  T.Ejecución  │    Tamaño     │   Prioridad   │" >> $informeSinColorTotal
	echo -e " └───────────────┴───────────────┴───────────────┴───────────────┴───────────────┘" >> $informeSinColorTotal
	for (( i=0; i<$nprocesos; i++)); do
		echo -e " \t${proceso[$i]}\t \t${llegada[$i]}\t \t${ejecucion[$i]}\t \t${memoria[$i]}\t \t${prioProc[$i]}\t  " >> $informeSinColorTotal
	done
	echo -e "\n\n Memoria total: $mem_libre uds." >> $informeSinColorTotal
	echo -e " Tamaño a partir del cual se reubica: $variableReubicar uds." >> $informeSinColorTotal
	echo -e  " ---------------------------------------------" >> $informeSinColorTotal
	if [[ $seleccionMenuEnsayos -ne 1 && $seleccionMenuEnsayos -ne 2 && $seleccionMenuEnsayos -ne 3 && $seleccionMenuEnsayos -ne 4 ]]; then #No se ejecuta cuando la selección inicial es la ejecución automática repetitiva.
		echo -e "\n$NC Pulse enter para continuar..." | tee -a $informeConColorTotal
		echo -e "\n Pulse enter para continuar..." >> $informeSinColorTotal
		read enter
		echo -e $enter "\n" >> $informeConColorTotal
		echo -e $enter "\n" >> $informeSinColorTotal
	fi
#    clear
} #Fin de imprimeprocesosresumen

####################################################################################
# Sinopsis: Genera la Banda de Memoria y la muestra en pantalla/informe 
####################################################################################
function dibujaResumenBandaMemoriaMarcosPagina { 
	terminal2=`tput cols` #Ancho del terminal para adecuar el ancho de líneas a cada volcado
	anchoColumna=$((9 + $digitosUnidad - 3)) #Para poder incluir -clase en la página. Se restan 3 porque previamente se ha añadido la logitud $digitosUnidad, y ya venía incluido.
	for ((indProc=0;indProc<$nprocesos;indProc++)); do #Desde 0, es el ordinal del número de marcos en memoria asociados a cada proceso (Índices:Proceso)
		ordinalMarcosProcesoDibujados[$indProc]=-1	
	done
	echo ""
	AlgPagFrecUsoRecTitulo=(); #Se inicializan las variables.
	AlgPagFrecUsoRecNotas1=();
	AlgPagFrecUsoRecNotas2=();
	filaAlgPagFrecUsoRecTituloColor=""
	filaAlgPagFrecUsoRecTituloBN=""
	filaAlgPagFrecUsoRecNotas1Color=""
	filaAlgPagFrecUsoRecNotas1BN=""
	
	if [[ $mem_libre -lt $mem_num_marcos ]]; then #Si hay algún proceso en memoria. ResuUsoRecienteAcumulado
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

	# GENERACIÓN STRING DE PROCESOS (Línea 1 del Resumen de la Banda de Memoria) 
	aux=0 #Define el número de saltos a realizar.
	filaprocesosColor[$aux]="$NC Proc.  " #Contiene el texto a escribir de las diferentes filas antes de hacer cada salto.
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
	long=("${memoria[@]}") #Determina el número de procesos al contar el número de datos en la variable memoria.	
	in=0 #Índice que recorre los procesos del problema
	dibujar_memoria=("${enmemoria[@]}") #Determina qué procesos están en memoria.
	paginadibujar=("${paginasEnMemoriaProceso[@]}") #Páginas residentes en memoria del Proceso en ejecución. Sale de forma calculada de paginasDefinidasTotal y su orden es el establecido tras los fallos de paginación.
	numCaracteres2=8 #Deja 1 de margen izquierdo y 7 para controlar el comienzo del espacio usado para los datos para controlar los saltos de línea.

	xx=0 # Variable que indica si se ha añadido un proceso al Resumen de la Banda de Memoria. ${memoria[$procFinalizado]}
	for ((indMem=0;indMem<$mem_num_marcos;indMem++)); do
		if [[ ${unidMemOcupadas[$indMem]} != "_" ]]; then # El proceso se puede imprimir en memoria
			if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $terminal2 ]]; then # El texto no cabe en la terminal
				aux=$(($aux + 1)) # Se pasa a la siguiente línea
				filaprocesosColor[$aux]="        "
				filaprocesosBN[$aux]="        "
				numCaracteres2=8 #Espacio por la izquierda para cuadrar líneas
			fi
			if [[ $indMem -ne 0 && $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$indMem]}))]} != ${proceso[$((${unidMemOcupadas[$((indMem - 1))]}))]} ]]; then # El texto no cabe en la terminal
				xx=0
			fi
			if [[ $xx -eq 0 ]]; then # Se añade el proceso a la banda
				espaciosfinal=${varhuecos:1:$(($anchoColumna - 1 - ${#proceso[$((${unidMemOcupadas[$indMem]}))]}))}
				filaprocesosBN[$aux]+=`echo -e "${proceso[$((${unidMemOcupadas[$indMem]}))]}""$espaciosfinal "`
				filaprocesosColor[$aux]+=`echo -e "${coloress[${unidMemOcupadas[$indMem]} % 6]}${proceso[$((${unidMemOcupadas[$indMem]}))]}""$NORMAL$espaciosfinal "`
				numCaracteres2=$(($numCaracteres2 + $anchoColumna))
				xx=1
			else
				if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $terminal2 ]]; then # El texto no cabe en la terminal
					aux=$(($aux + 1)) # Se pasa a la siguiente línea
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
			if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $terminal2 ]]; then # El texto no cabe en la terminal
				aux=$(($aux + 1)) # Se pasa a la siguiente línea
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

	# GENERACIÓN STRING DE MARCOS (Línea 2 del Resumen de Memoria)  
	aux=0 #Define el número de saltos a realizar.
	numCaracteres2=10 #Deja 1 de margen izquierdo y 7 para controlar el comienzo del espacio usado para los datos para controlar los saltos de línea.
	textoFallo1="M"
	textoFallo2="-F"
	for ((indMem=0;indMem<$mem_num_marcos;indMem++)); do
		if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $terminal2 ]]; then # El texto no cabe en la terminal
			aux=$(($aux + 1)) # Se pasa a la siguiente línea
			filamarcosColor[$aux]="        "
			filamarcosBN[$aux]="        "
			numCaracteres2=8 #Espacio por la izquierda para cuadrar líneas
		fi
		if [[ ${unidMemOcupadas[$indMem]} != "_" ]]; then	
			varImprimirSiguiente="" #Contendrá el código de subrayado con para subrayar la referencia del marco sobre el que se produciría el siguiente fallo de página.
			varImprimirFallo="" #Contendrá el código de negrita para la referencia del marco sobre el que se habría producido el fallo de página.
			varSiguiente=${ResuPunteroMarcoSiguienteFalloPagAcumulado[${unidMemOcupadas[$indMem]},$reloj]} #Ordinal del marco usado (Puntero - De 0 a n) para el Proceso en ejecución en una unidad de Tiempo.
			varFallo=${ResuFallosMarcoProceso[${unidMemOcupadas[$indMem]},$reloj]} #Negrita - Marcos donde se produjeron Fallos de Página del Proceso en ejecución.
			dato1=${relacionMarcosUsados[${unidMemOcupadas[$indMem]},$reloj,$varSiguiente]} #Marco real correspondiente al ordinal de un marco.
			dato2=${relacionMarcosUsados[${unidMemOcupadas[$indMem]},$reloj,$varFallo]} #Marco real correspondiente al ordinal de un marco.
			if [[ $dato1 == $indMem ]]; then #Si coincide el marco real al ordinal del marco usado, se define el color del fondo. 
				varImprimirSiguiente="\e[4m"
			fi
			if [[ $dato2 == $indMem ]]; then #Si coincide el marco real al ordinal del marco con fallo, se define el código de negrita. 
				varImprimirFallo="\e[1m"
			fi
			if [[ $varImprimirFallo == "" ]]; then #Si ese marco NO será sobre el que se produzca el siguiente fallo de página
				espaciosfinal=${varhuecos:1:$(($anchoColumna - ${#indMem} - 2))} #Espacios por defecto. Se quita 1 por la M. 
				filamarcosColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}$varImprimirSiguiente$textoFallo1$indMem$NC$espaciosfinal "`
				filamarcosBN[$aux]+=`echo -e "M$indMem$espaciosfinal "`
			else #Si el marco será sobre el que se produzca el siguiente fallo de página
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

	# GENERACIÓN STRING DE PÁGINAS (Línea 3 del Resumen de la Banda de Memoria)
	aux=0 # Línea de la banda
	numCaracteres2=10
	guionesAMeter=${varguiones:1:$(($anchoColumna - 2))}
	asteriscosAMeter=${varasteriscos:1:$(($anchoColumna - 2))}
	sumaTotalMemoria=0
	numeroMarco=0 #Contador que recorrerá el número de marcos asociados a un proceso y determinar el ordinal que le corresponde.
	xx=0 # Variable que indica si se ha añadido un proceso a la banda
	for (( i=0; i<$nprocesos; i++)); do 
		numMarcosDibujadosPorProceso[$i]=0 #Número de Marcos en Memoria con Páginas ya dibujadas de cada Proceso para el resumen de Banda.
	done
	for ((indMem=0;indMem<$mem_num_marcos;indMem++)); do #unidMemOcupadas[$indMem] da el Proceso que ocupa el marco indMem
		punteroPagMarco="" #Contendrá el ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo.
		if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $terminal2 ]]; then # El texto no cabe en la terminal
			aux=$(($aux + 1)) # Se pasa a la siguiente línea
			filapagBN[$aux]="        "
			filapagColor[$aux]="        "
			numCaracteres2=8
		fi
		dato4="" #Contendrá la clase de la página en NFU/NRU con clases.
		datoM="" #Contendrá el coeficiente M de los algoritmos de Segunda Oportunidad.
		espaciosadicionales=0
		if [[ ${unidMemOcupadas[$indMem]} != "_" ]]; then # El proceso se puede imprimir en memoria
			espaciosfinal=${varhuecos:1:$(($anchoColumna - 1 - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}))}
			varImprimirUsado="" #Contendrá el color asociado al proceso en ejecución. Con él se establece el color del fondo de la página usada.
			if [[ ${unidMemOcupadas[$indMem]} -eq $ejecutandoinst ]]; then #Sólo puede estar siendo usada una página en toda la memmoria y para el proceso en ejecución, y no las páginas de otros procesos en pausa. 
				varUsado=${ResuPunteroMarcoUsado[${unidMemOcupadas[$indMem]},$reloj]} #Ordinal del marco usado (Puntero - De 0 a n) para el Proceso en ejecución en una unidad de Tiempo.
				dato1=${relacionMarcosUsados[$ejecutandoinst,$reloj,$varUsado]} #Marco real correspondiente al ordinal de un marco ($varUsado).
			fi
			if [[ $dato1 -eq $indMem ]]; then #Si coincide el marco real al puntero al ordinal del marco usado se define el color del fondo. 
				varImprimirUsado=${colorfondo[${unidMemOcupadas[$indMem]} % 6]}
			fi
			if [[ ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]} -eq 0 ]]; then #Si no hay página se mete asterisco en BN.
				espaciosasteriscofinal="*"${varhuecos:1:$(($anchoColumna - 2 - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}))}
				filapagBN[$aux]+=`echo -e "${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$espaciosasteriscofinal "`
				filapagColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$espaciosasteriscofinal$NC "`
			else  #Y si hay página se mete espacios y el número.
				if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then #FIFO y Reloj con Segunda oportunidad
					punteroPagMarco=${ResuPaginaOrdinalAcumulado[$ejecutandoinst,${ResuPunteroMarcoUsado[$ejecutandoinst,$reloj]},$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
					datoM="-"${coeficienteSegOp[$ejecutandoinst,${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$punteroPagMarco]}	
					espaciosadicionales=${#datoM}				

				elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then #Óptimo
					dato4="-"${ResuTiempoOptimoAcumulado[$ejecutandoinst,${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]} #Índices: (proceso, marco, reloj).
					espaciosadicionales=${#dato4}
				elif [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Contendrá la clase de la página en NFU/NRU con clases.
					punteroPagMarco=${ResuPaginaOrdinalAcumulado[$ejecutandoinst,${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
					dato4="-"${directions_AlgPagFrecUsoRec_marco_pagina_clase[$ejecutandoinst,${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$punteroPagMarco]} #Índices: (proceso, marco, número ordinal de la dirección a ejecutar(número de páginas usadas del proceso)).
					espaciosadicionales=${#dato4}
				fi
				espaciosfinal=${varhuecos:1:$(($anchoColumna - 1 - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]} - $espaciosadicionales))} #2 por el tamaño de $datos4
				if [[ $varImprimirUsado == "" ]]; then #Si el marco NO ha sido usado en el instante actual
					filapagBN[$aux]+=`echo -e "${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$dato4$datoM$espaciosfinal "`
					filapagColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$dato4$datoM$espaciosfinal$NC "`
				else #Si el marco ha sido usado en el instante actual
					filapagBN[$aux]+=`echo -e "${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$dato4$datoM$espaciosfinal "`
					filapagColor[$aux]+=`echo -e "$NC$varImprimirUsado${paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}$dato4$datoM$espaciosfinal$NC "`
				fi
			fi
			((numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]++)) #Número de Marcos con Páginas ya dibujadas de cada Proceso.
			numCaracteres2=$(($numCaracteres2 + $anchoColumna))
			if [[ $indMem -ne 0 ]]; then
				if [[ ${unidMemOcupadas[$((indMem - 1))]} !=  "_" ]]; then 
					if [[ $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$indMem]}))]} != ${proceso[$((${unidMemOcupadas[$((indMem - 1))]}))]} ]]; then
						xx=0
					fi
				fi
			fi
		else #Sin proceso asignado al marco 
			xx=0
			espaciosguionfinal="-"${varhuecos:1:$(($anchoColumna - 2 - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}))}
			filapagBN[$aux]+=`echo -e "$espaciosguionfinal "`
			filapagColor[$aux]+=`echo -e "$NC$espaciosguionfinal$NC "`
			numCaracteres2=$(($numCaracteres2 + $anchoColumna))
		fi
  		numeroMarco=$((numeroMarco + 1)) #Aumenta el contador de marcos (ordinal de marcos distinto para cada proceso=
	done

	# GENERACIÓN STRING DE FRECUENCIA/USO RECIENTE DE USO DE LAS PÁGINAS (Línea 4 del Resumen de la Banda de Memoria)  
	aux=0 # Línea de la frecuencia
	numCaracteres2=10
	guionesAMeter=${varguiones:1:$(($anchoColumna - 2))}
	asteriscosAMeter=${varasteriscos:1:$(($anchoColumna - 2))}
	sumaTotalMemoria=0
	xx=0 # Variable que indica si se ha añadido un proceso a la banda
	for (( i=0; i<$nprocesos; i++)); do 
		numMarcosDibujadosPorProceso[$i]=0 #Número de Marcos en Memoria con Páginas ya dibujadas de cada Proceso para el resumen de Banda.
	done			
	for ((indMem=0;indMem<$mem_num_marcos;indMem++)); do
		if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $terminal2 ]]; then # El texto no cabe en la terminal
			aux=$(($aux + 1)) # Se pasa a la siguiente línea
			filaAlgPagFrecUsoRecBN[$aux]="        "
			filaAlgPagFrecUsoRecColor[$aux]="        "
			numCaracteres2=8
		fi
		if [[ ${unidMemOcupadas[$indMem]} != "_" ]]; then # El proceso se puede imprimir en memoria
			if [[ ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]} -eq 0 ]]; then #Si no hay página se mete asterisco por ser frecuencia 0.
				espaciosasteriscofinal="*"${varhuecos:1:$(($anchoColumna - 2))}
				filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "$espaciosasteriscofinal "`
				filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}$espaciosasteriscofinal$NC "`
			else  #Y si hay página se mete espacios y el número.
				dato5=""
				dato6=""
				espaciosadicionales1=0
				espaciosadicionales2=0
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Contendrá la clase de la página en NFU/NRU con clases.
					punteroPagMarco=${ResuPaginaOrdinalAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
					dato5="-"${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaFrecRec_valor[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]} #Índices: (proceso, marco)).
					espaciosadicionales1=${#dato5}
					dato6="-"${ResuTiempoProcesoUnidadEjecucion_MarcoPaginaClase_valor[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]} #Índices: (proceso, número ordinal del marco usado para ese proceso comenzando por 0).
					espaciosadicionales2=${#dato6}
				fi 
				ordinalMarcosProcesoDibujados[${unidMemOcupadas[$indMem]}]=$((${ordinalMarcosProcesoDibujados[${unidMemOcupadas[$indMem]}]} + 1)) #Desde 0, es el ordinal del número de marcos en memoria asociados a cada proceso (Índices:Proceso)
				espaciosfinal=${varhuecos:1:$(($anchoColumna - 1 - ${#ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]} - $espaciosadicionales1 - $espaciosadicionales2))}
				if [[ $seleccionAlgoritmoPaginacion -ge 0 && $seleccionAlgoritmoPaginacion -le 4 ]]; then
					filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "${ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${ordinalMarcosProcesoDibujados[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal "`
					filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${ordinalMarcosProcesoDibujados[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal$NC "`
				elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
					espaciosfinal=${varhuecos:1:$(($anchoColumna - 1 - ${#ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]} - $espaciosadicionales1 - $espaciosadicionales2))}
					filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "${ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal "`
					filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal$NC "`
				elif [[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
					filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "${ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal "`
					filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${ResuFrecuenciaAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal$NC "`
				elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
					espaciosfinal=${varhuecos:1:$(($anchoColumna - 1 - ${#ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]} - $espaciosadicionales1 - $espaciosadicionales2))}
					filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "${ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal "`
					filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC${coloress[${unidMemOcupadas[$indMem]} % 6]}${ResuUsoRecienteAcumulado[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]},$reloj]}$dato5$dato6$espaciosfinal$NC "`
				fi
			fi 
			((numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]++)) #Número de Marcos con Páginas ya dibujadas de cada Proceso.
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
			espaciosguionfinal="-"${varhuecos:1:$(($anchoColumna - 2 - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$indMem]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$indMem]}]}]}))}
			filaAlgPagFrecUsoRecBN[$aux]+=`echo -e "$espaciosguionfinal "`
			filaAlgPagFrecUsoRecColor[$aux]+=`echo -e "$NC$espaciosguionfinal$NC "`
			numCaracteres2=$(($numCaracteres2 + $anchoColumna))
		fi
	done

	# GENERACIÓN STRING DE FALLOS TOTALES POR PROCESO   
	fallosProceso=${contadorAlgPagFallosProcesoAcumulado[$ejecutandoinst]} #Total de Fallos de Página del Proceso en el instante actual 

	# IMPRIMIR LAS 4 LÍNEAS DE LA BANDA DE MEMORIA (COLOR y BN a pantalla y ficheros)
	if [[ $mem_libre -lt $mem_num_marcos ]]; then #Si hay algún proceso en memoria.
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

	#Tras mostrar el resumen de la Banda de Memoria, se inicializan las variables usadas.
	#Se inicializa la auxiliar usada para la reubicación de la memoria.
	for (( ca=0; ca<(mem_num_marcos); ca++)); do #Se borran los datos de la variable auxiliar, usada para la reubicación.
		unidMemOcupadasAux[$ca]="_" #Para cada posición de memoria se determinará qué proceso la ocupa.
	done
	#Se inicializan los bloques donde se introducirán los datos de los procesos.
	for (( ca=0; ca<($nprocesos) ; ca++)); do #Se borran los bloques usados para la reubicación
		 bloques[$ca]=0 #Almacena el número de bloques en los que se fragmenta un proceso
	done
	#Se inicializa la variable que contendrá el número de bloques de cada proceso.
	nposiciones=0
	#Se inicializan las posiciones iniciales y finales de los bloques asociados a cada proceso, para borrar elementos innecesarios
	for (( i=0; i<$nposiciones; i++ )) ; do
		 inicialNCmodelo[$i]=0
	done
	for (( i=0; i<$nposiciones; i++ )) ; do 
		 finalNCmodelo[$i]=0
	done
} #Fin de la nueva versión de dibujaResumenBandaMemoriaMarcosPagina

####################################################################################
# Sinopsis: Muestra los fallos de paginación por AlgPagFrecUsoRec al acabar un proceso.  ${coloress[${unidMemOcupadas[$ii]} % 6]}
####################################################################################
function dibujaResumenAlgPagFrecUsoRec { #  proceso[$po]  ${unidMemOcupadas[$ii]}  nproceso ejecutandoinst numeroproceso
	numCaracteres2Inicial=12
	Terminal=$((`tput cols`)) 
	if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 || $seleccionAlgoritmoPaginacion -eq 7 || $seleccionAlgoritmoPaginacion -eq 8 || $seleccionAlgoritmoPaginacion -eq 14 || $seleccionAlgoritmoPaginacion -eq 15 ]]; then 
		anchoColumna=$((10 + $digitosUnidad - 3)) #Para poder incluir -clase en la página. Se restan 3 porque previamente se ha añadido la logitud $digitosUnidad, y ya venía incluido.
	elif [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #MFU/LFU con clases 
		anchoColumna=$((11 + $digitosUnidad - 3)) #Para poder incluir -clase en la página. Se restan 3 porque previamente se ha añadido la logitud $digitosUnidad, y ya venía incluido.
	else
		anchoColumna=$((8 + $digitosUnidad - 3))
	fi
	filaAlgPagFrecUsoRecTituloColor=(); #Se inicializan las variables.
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

	# GENERACIÓN STRING DE RELOJ (Línea 1 del Resumen de Fallos de Paginación)  
	aux=0 #Define el número de saltos a realizar.
	filatiempoColor[$aux]="\n$NC Tiempo     "
	filatiempoBN[$aux]="\n Tiempo     "
	numCaracteres2=$numCaracteres2Inicial #Deja 1 de margen izquierdo y 11 para controlar el comienzo del espacio usado para los datos para controlar los saltos de línea.
	counter=0 #Índice 
	iiSiguiente=0
	for ((counter=0;counter<${ejecucion[$procFinalizado]};counter++)); do
		for ((ii=$iiSiguiente;ii<$reloj;ii++)); do
			if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $Terminal ]]; then # El texto no cabe en la terminal
				aux=$(($aux + 1)) # Se pasa a la siguiente línea
				filatiempoColor[$aux]="\n            "
				filatiempoBN[$aux]="\n            "
				numCaracteres2=$numCaracteres2Inicial #Espacio por la izquierda para cuadrar líneas
			fi
			if [[ ${ResuTiempoProceso[$ii]} -eq $procFinalizado ]]; then
				espaciosfinal=${varhuecos:1:$(($anchoColumna - ${#ii}))}
				filatiempoColor[$aux]+=`echo -e "$NORMAL""$ii$espaciosfinal$NORMAL "`
				filatiempoBN[$aux]+=`echo -e "$ii$espaciosfinal "`
				iiSiguiente=$((ii + 1)) #Para que no se repitan los datos en cada ciclo al no empezar desde 0.
				numCaracteres2=$(($numCaracteres2 + $anchoColumna + 1))
			fi
		done
	done

	# GENERACIÓN STRING DE PÁGINAS (Línea 2 del Resumen de Fallos de Paginación)  
	aux=0 #Define el número de saltos a realizar. paginasDefinidasTotal  (Índices:Proceso, Páginas).
	filapagColor[$aux]="$NC Página     "
	filapagBN[$aux]=" Página     "
	numCaracteres2=$numCaracteres2Inicial #Deja 1 de margen izquierdo y 11 para controlar el comienzo del espacio usado para los datos para controlar los saltos de línea.
	iiSiguiente=0
	varCierre=0
	for ((counter=0;counter<${ejecucion[$procFinalizado]};counter++)); do
		for ((ii=$iiSiguiente;ii<$reloj;ii++)); do
			if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $Terminal ]]; then # El texto no cabe en la terminal
				aux=$(($aux + 1)) # Se pasa a la siguiente línea
				filapagColor[$aux]="            "
				filapagBN[$aux]="            "
				numCaracteres2=$numCaracteres2Inicial #Espacio por la izquierda para cuadrar líneas
			fi
			if [[ ${paginasDefinidasTotal[$procFinalizado,$ii]} -ge 0 && $varCierre -lt ${ejecucion[$procFinalizado]} ]]; then #Evita qe queden elementos definidos de ejecuciones anteriores por las que sake un número al final de la línea en una nueva columna que, teóricamente no existe.
				varCierre=$(($varCierre + 1))
				espaciosfinal=${varhuecos:1:$(($anchoColumna - ${#paginasDefinidasTotal[$procFinalizado,$ii]}))}
				filapagColor[$aux]+=`echo -e "$NORMAL""${paginasDefinidasTotal[$procFinalizado,$ii]}$espaciosfinal$NORMAL "`
				filapagBN[$aux]+=`echo -e "${paginasDefinidasTotal[$procFinalizado,$ii]}$espaciosfinal "`
				numCaracteres2=$(($numCaracteres2 + $anchoColumna + 1))
				iiSiguiente=$(($ii + 1)) #Para que no se repitan los datos en cada ciclo al no empezar desde 0.
			fi
		done
	done

	# GENERACIÓN STRING DE Página-Frecuencia-Uso Reciente-Clase (Líneas de Marcos del Resumen de Fallos de Paginación)  
	for (( k=0; k<${memoria[$procFinalizado]}; k++ )); do #Bucle que recorre la ejecución del proceso finalizado a lo largo del tiempo para generar las variables con los datos a usar en la impresión del resumen. 	
		aux=0 #Define el número de saltos a realizar.
		espaciosfinal=${varhuecos:1:$((2 - ${#k}))} #Se considera que los números de marcos, páginas y frecuencias no superarán los tres dígitos.
		filaAlgPagFrecUsoRecColor[$k,$aux]="$NC M$k(Orden)$espaciosfinal " #"$NC Marco-Pág-Frec/UsoRec "
		filaAlgPagFrecUsoRecBN[$k,$aux]=" M$k(Orden)$espaciosfinal " #" Marco-Pág-Frec/UsoRec "
		numCaracteres2=$numCaracteres2Inicial #Deja 1 de margen izquierdo y 12 para controlar el comienzo del espacio usado para los datos para controlar los saltos de línea.
		iiSiguiente=0
		for ((counter=0;counter<${ejecucion[$procFinalizado]};counter++)); do
			for ((ii=$iiSiguiente;ii<$reloj;ii++)); do
				if [[ ${ResuTiempoProceso[$ii]} -eq $procFinalizado ]]; then #Si el proceso que se ejecuta en un instante es el finalizado...
					if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $Terminal ]]; then # El texto no cabe en la terminal
						aux=$(($aux + 1)) # Se pasa a la siguiente línea
						filaAlgPagFrecUsoRecColor[$k,$aux]="            "
						filaAlgPagFrecUsoRecBN[$k,$aux]="            "
						numCaracteres2=$numCaracteres2Inicial #Espacio por la izquierda para cuadrar líneas
					fi
					dato1=${relacionMarcosUsados[$procFinalizado,$ii,$k]} #Índices: (proceso, tiempo, número ordinal de marco). Dato del marco real que corresponde al ordinal
					dato2=${ResuPaginaAcumulado[$procFinalizado,$k,$ii]} #Índices: (proceso, marco, tiempo). Dato de la página contenida en el marco
					if ([[ $seleccionAlgoritmoPaginacion -ge 0 && $seleccionAlgoritmoPaginacion -le 4 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 9 ]]); then
						dato3=${ResuFrecuenciaAcumulado[$procFinalizado,$k,$ii]} #Índices: (proceso, marco, tiempo). Dato de la frecuencia de uso de la página contenida en el marco
					elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
						dato3=${ResuTiempoOptimoAcumulado[$procFinalizado,$k,$ii]} #Índices: (proceso, marco, tiempo). Dato del Tiempo que hace que se usó la página contenida en el marco
					elif [[ $seleccionAlgoritmoPaginacion -ge 10 && $seleccionAlgoritmoPaginacion -le 11 ]]; then
						dato3=${ResuFrecuenciaAcumulado[$procFinalizado,$k,$ii]}
						if [[ $dato3 -ge $seleccionAlgoritmoPaginacion_clases_frecuencia_valor ]]; then
							dato3=$seleccionAlgoritmoPaginacion_clases_frecuencia_valor #Índices: (proceso, marco, tiempo). Dato del Tiempo que hace que se usó la página contenida en el marco
						fi
					elif [[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 15 ]]; then
						dato3=${ResuUsoRecienteAcumulado[$procFinalizado,$k,$ii]} #Índices: (proceso, marco, tiempo). Dato del Tiempo que hace que se usó la página contenida en el marco
					elif [[ $seleccionAlgoritmoPaginacion -ge 16 && $seleccionAlgoritmoPaginacion -le 17 ]]; then
						dato3=${ResuUsoRecienteAcumulado[$procFinalizado,$k,$ii]}
						if [[ $dato3 -ge $seleccionAlgoritmoPaginacion_clases_uso_rec_valor ]]; then
							dato3=$seleccionAlgoritmoPaginacion_clases_uso_rec_valor #Índices: (proceso, marco, tiempo). Dato del Tiempo que hace que se usó la página contenida en el marco
						fi
					fi
					dato4="" #Contendrá la clase de la página en NFU/NRU con clases.
					datoM="" #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad.
					if [[ $seleccionAlgoritmoPaginacion -eq 2 || $seleccionAlgoritmoPaginacion -eq 4 ]]; then
						if [[ $dato2 != "" ]]; then	#Si no hay página, tampoco habrá coeficiente M
							punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizado,${ResuPunteroMarcoUsado[$procFinalizado,$ii]},$ii]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
							datoM=${coeficienteSegOp[$procFinalizado,$k,$punteroPagMarco]}	#Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
							datostot="$dato1-$dato2-$dato3-$datoM"
						else #Si no hay página asociada sólo se muestra el número de marco real.
							datostot="$dato1"						
						fi
					elif [[ $seleccionAlgoritmoPaginacion -eq 5 ]]; then
						if [[ $dato2 != "" ]]; then	#Si no hay página, tampoco habrá tiempo hasta una nueva ejecución. 
							datostot="$dato1-$dato2-$dato3"
						else
							datostot="$dato1"						
						fi
					elif [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then
						if [[ $dato2 != "" ]]; then	#Si no hay página, tampoco habrá clase
							punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizado,$k,$ii]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso.
							dato4=${directions_AlgPagFrecUsoRec_pagina_modificada[$procFinalizado,$punteroPagMarco,0]} #Resumen - Índices: (proceso, ordinal del tiempo de ejecución). Dato: Página modificada (1) o no modificada (0).
							dato4=$dato4"-"${directions_AlgPagFrecUsoRec_marco_pagina_clase[$procFinalizado,$k,$punteroPagMarco]} #Índices: (proceso, marco, número ordinal de la dirección a ejecutar).
						fi
						datostot="$dato1-$dato2-$dato3-$dato4"
					elif [[ $seleccionAlgoritmoPaginacion -eq 0 ]] || [[ $seleccionAlgoritmoPaginacion -eq 1 ]] || [[ $seleccionAlgoritmoPaginacion -eq 3 ]] || ([[ $seleccionAlgoritmoPaginacion -ge 6 && $seleccionAlgoritmoPaginacion -le 9 ]]) || ([[ $seleccionAlgoritmoPaginacion -ge 12 && $seleccionAlgoritmoPaginacion -le 15 ]]); then
						datostot="$dato1-$dato2-$dato3"
					fi
					espaciosfinal=${varhuecos:1:$(($anchoColumna - ${#datostot}))}  
					#En lugar de generar diferentes opciones y comparativas, se generará una serie de variables con las modificaciones de formato. 
					varUsado=${ResuPunteroMarcoUsado[$procFinalizado,$ii]} #Fondo de color - Marco usado (Puntero) para cada Proceso en cada unidad de Tiempo.
					if [[ $seleccionAlgoritmoPaginacion -ne 0 ]]; then
						varSiguiente=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$procFinalizado,$ii]} #Subrayado - Marco (Puntero) sobre el que se produce el siguiente fallo para cada Proceso en cada unidad de Tiempo.
					fi
					varFallo=${ResuFallosMarcoProceso[$procFinalizado,$ii]} #Negrita - Marcos donde se produjeron Fallos de Página del Proceso en ejecución.
					varImprimirUsado=""
					varImprimirSiguiente=""
					varImprimirFallo=""
					varFallo=${ResuFallosMarcoProceso[$procFinalizado,$ii]} #Contendría el marco sobre el que se produce un fallo.
					if [[ ${varUsado} -eq $k ]]; then
						varImprimirUsado=${colorfondo[$procFinalizado % 6]}
					elif [[ ${varSiguiente} -eq $k && $seleccionAlgoritmoPaginacion -ne 0 ]]; then
						varImprimirSiguiente="\e[4m"
					elif ! [[ -z $varFallo && $seleccionAlgoritmoPaginacion -ne 0 ]]; then #Si contiene algún dato (marco) es porque hay un fallo.
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
				iiSiguiente=$((ii + 1)) #Para que no se repitan los datos en cada ciclo al no empezar desde 0.
			done
		done
	done

	# GENERACIÓN STRING DE FALLOS (Líneas de Fallos del Resumen de Fallos de Paginación)  
	aux=0 #Define el número de saltos a realizar.
	espaciosfinal=${varhuecos:1:$(($anchoColumna - 1))} #Es fijo porque sólo se va a escribir "F" o "-".
	filaFallosColor[$aux]="$NC Fallos (F) " #"$NC Marco-Pág-Frec/UsoRec "
	filaFallosBN[$aux]=" Fallos (F) " #" Marco-Pág-Frec/UsoRec "
	numCaracteres2=$numCaracteres2Inicial #Deja 1 de margen izquierdo y 12 para controlar el comienzo del espacio usado para los datos para controlar los saltos de línea.
	iiSiguiente=0
	for ((counter=0;counter<${ejecucion[$procFinalizado]};counter++)); do
		for ((ii=$iiSiguiente;ii<=$reloj;ii++)); do
			if [[ ${ResuTiempoProceso[$ii]} -eq $procFinalizado ]]; then #Si el proceso que se ejecuta en un instante es el finalizado...
				if [[ $(($numCaracteres2 + $anchoColumna + 1)) -gt $Terminal ]]; then # El texto no cabe en la terminal
					aux=$(($aux + 1)) # Se pasa a la siguiente línea
					filaFallosColor[$aux]="            "
					filaFallosBN[$aux]="            "
					numCaracteres2=$numCaracteres2Inicial #Espacio por la izquierda para cuadrar líneas
				fi
				varFallo=${ResuFallosMarcoProceso[$procFinalizado,$ii]} #Contendría el marco sobre el que se produce un fallo.
				if ! [[ -z $varFallo ]]; then #Si contiene algún dato (marco) es porque hay un fallo.
					filaFallosColor[$aux]+=`echo -e "${coloress[$procFinalizado % 6]}""F""$NC$espaciosfinal "`
					filaFallosBN[$aux]+=`echo -e "F""$espaciosfinal "`
				else
					filaFallosColor[$aux]+=`echo -e "-""$NC$espaciosfinal "`
					filaFallosBN[$aux]+=`echo -e "-""$espaciosfinal "`
				fi
				numCaracteres2=$(($numCaracteres2 + $anchoColumna + 1))
			fi
			iiSiguiente=$((ii + 1)) #Para que no se repitan los datos en cada ciclo al no empezar desde 0.
		done
	done

	# GENERACIÓN STRING DE FALLOS TOTALES POR PROCESO  
	fallosProceso=${contadorAlgPagFallosProcesoAcumulado[$procFinalizado]} #Total de Fallos de Página del Proceso 

	# IMPRIMIR LAS LÍNEAS DE LOS MARCOS DE MEMORIA POR PROCESO (COLOR y BN a pantalla y ficheros)
	echo -e "$filaAlgPagFrecUsoRecTituloColor" | tee -a $informeConColorTotal
	echo -e "$filaAlgPagFrecUsoRecNotas1Color" | tee -a $informeConColorTotal
	echo -ne "$filaAlgPagFrecUsoRecNotas2Color" | tee -a $informeConColorTotal
	echo -e "$filaAlgPagFrecUsoRecTituloBN" >> $informeSinColorTotal
	echo -e "$filaMF$filaAlgPagFrecUsoRecNotas1BN" >> $informeSinColorTotal
	echo -ne "$filaAlgPagFrecUsoRecNotas2BN" >> $informeSinColorTotal
	for (( jj = 0; jj <= $aux; jj++ )); do #Para cada salto de línea por no caber en la pantalla
		echo -e "${filatiempoColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${filapagColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${filatiempoBN[$jj]}" >> $informeSinColorTotal
		echo -e "${filapagBN[$jj]}" >> $informeSinColorTotal
		for (( k=0; k<${memoria[$procFinalizado]}; k++ )); do #Para cada marco asociado al proceso
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
} #Fin de dibujaResumenAlgPagFrecUsoRec()

####################################################################################
# Sinopsis: Muestra los fallos del algoritmo basado en el reloj con un formato de reloj - SIN HACER POR SUMAR MUCHAS PÁGINAS SIN APORTAR NADA
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

#	clear
	iiSiguiente=0
	for ((counter=0;counter<${ejecucion[$procFinalizadoOEjecutando]};counter++)); do
		for ((ii=$iiSiguiente;ii<=$reloj;ii++)); do
			if [[ ${ResuTiempoProceso[$ii]} -eq $procFinalizadoOEjecutando ]]; then #Si el proceso que se ejecuta en un instante es el finalizado...
				dibujaReloj
			fi
			iiSiguiente=$((ii + 1)) #Para que no se repitan los datos en cada ciclo al no empezar desde 0.
		done
	done
} #Fin de dibujaResumenReloj()

####################################################################################
# Sinopsis: Muestra los fallos de paginación por AlgPagFrecUsoRec al acabar un proceso. 
####################################################################################
function dibujaReloj {		
	#Las variables relacionadas con las posiciones empiezan en 1, y las relacionadas con las páginas de los marcos, en 0.
#	clear
	CReloj=${coloress[$procFinalizadoOEjecutando % 6]}
	AlgPagFrecUsoRecTitulo=(); #Se inicializan las variables.
	AlgPagFrecUsoRecNotas1=();
	filaAlgPagFrecUsoRecTituloColor=""
	filaAlgPagFrecUsoRecTituloBN=""
	filaAlgPagFrecUsoRecNotas1Color=""
	filaAlgPagFrecUsoRecNotas1BN=""
	echo "" | tee -a ./Informes/informeCOLOR.txt ./Informes/informeBN.txt
	
	if [[ $mem_libre -lt $mem_num_marcos ]]; then #Si hay algún proceso en memoria. ResuUsoRecienteAcumulado
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
	linea1Color=" " #Se inicializan las líneas del reloj a representar en Color.
	linea3Color=" "
	linea5Color=" "
	linea1BN=" " #Se inicializan las líneas del reloj a representar en BN.
	linea2BN=" "
	linea3BN=" "
	linea4BN=" "
	linea5BN=" "

	longCampoDatosReloj=6
	TamNum=$longCampoDatosReloj #Espacios laterales 
	guionesfinal=${varguiones:1:$TamNum} #Se inicializa a guiones para cuando no haya datos que escribir.
	TamespaciosLineasMitad=2 #Se inicializan los espacios a izquierda y derecha del -, /, \ para centrar los caracteres de las páginas.
	espaciosLineasMitad=${varhuecos:1:$TamespaciosLineasMitad}
	espaciosfinalIni=${varhuecos:1:$longCampoDatosReloj} #Se inicializa a espacios para cuando no haya datos que escribir.
						
	posActual=$(($((${numeroPaginasUsadasProceso[$procFinalizadoOEjecutando]} - 1)) % ${memoria[$procFinalizadoOEjecutando]} + 1)) #Se calcula sobre el número real de marcos existentes. Empieza en 1.
	posSobrante=$((${memoria[$procFinalizadoOEjecutando]} % 4)) #Número de marcos de una vuelta incompleta.
	if [ $posSobrante -eq 0 ]; then #Número de posiciones oblícuas en cada esquina del reloj.
		numMarcosOblicuos=$(($((${memoria[$procFinalizadoOEjecutando]}/4)) - 1)) #Se resta una porque, inicialmente calcula las vueltas completas, y da una de más.
	else
		numMarcosOblicuos=$(($((${memoria[$procFinalizadoOEjecutando]} - $posSobrante))/4)) #En cuanto sobra algo, ya se tiene que poner una posición más por cada esquina.
	fi
	vueltasTotales=$(($((${memoria[$procFinalizadoOEjecutando]} - $posSobrante))/4)) #Vueltas totales de los marcos (vueltas de 4 marcos). 
	posArrIz=$(($((numMarcosOblicuos * 3)) + 4 + 1)) #Númeral de la posición del reloj del primer marco por la izquierda en la primera línea.
	posArrIzCalculado=$(($posArrIz - 1)) #Se reajustan los índices de las posiciones (empiezan en 1) a los datos de páginas de los vectores (empiezan en 0).
	posArrCentro=1 #Se ajusta a 1 porque se empieza en 1 en la primera posición centro-superior.
	posArrCentroCalculado=$(($posArrCentro - 1))
	posArrDe=2 #Se ajusta a 2 porque se empieza en 1.
	posArrDeCalculado=$(($posArrDe - 1))
	posCentroIz=$(($((numMarcosOblicuos * 3)) + 4)) #Númeral de la posición del reloj del primer marco por la izquierda en la segunda línea.
	posCentroIzCalculado=$(($posCentroIz - 1)) #Se suma "-3+$posSobrante" por ser los posibles oblícuos anteriores de la última vuelta que haya sin usar.
	posCentroDe=$(($((numMarcosOblicuos)) + 2)) #Númeral de la posición del reloj del primer marco por la izquierda en la segunda línea.
	posCentroDeCalculado=$(($posCentroDe - 1))
	posAbIz=$(($((numMarcosOblicuos * 3)) + 3)) #Númeral de la posición del reloj del primer marco por la izquierda en la tercera línea.
	posAbIzCalculado=$(($posAbIz - 1))
	posAbCentro=$(($((numMarcosOblicuos * 2)) + 3)) #Númeral de la posición del reloj del marco central inferior en la tercera línea.
	posAbCentroCalculado=$(($posAbCentro - 1)) #Se suma "-2+$posSobrante" por ser los posibles oblícuos anteriores de la última vuelta que haya sin usar.
	posAbDe=$(($((numMarcosOblicuos * 2)) + 2)) #Númeral de la posición del reloj del primer marco por la izquierda en la tercera línea.
	posAbDeCalculado=$(($posAbDe - 1)) #Se suma "-2+$posSobrante" por ser los posibles oblícuos anteriores de la última vuelta que haya sin usar.
	if [ $posSobrante -ne 0 ]; then
		posCentroIzReal=$(($(($(($numMarcosOblicuos - 1)) * 3)) + 4  + $posSobrante - 1)) #Númeral de la posición real del reloj del primer marco por la izquierda en la segunda línea.
	else
		posCentroIzReal=$(($(($numMarcosOblicuos * 3)) + 4 - 1)) #Númeral de la posición real del reloj del primer marco por la izquierda en la segunda línea.
	fi

	varImprimirSiguiente="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
	varImprimirFallo="" #Negrita-Fallo de Página
	varImprimirPaginaUsada="" #Fondo-Marco usado
	#varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
	#varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
	#varImprimirPaginaUsada=${colorfondo[$procFinalizado % 6]} #Variable relacionada con el dato: Fondo-Marco usado
	varUsado=${ResuPunteroMarcoUsado[$procFinalizadoOEjecutando,$reloj]} # #Ordinal del marco usado (Puntero - De 0 a n) para el Proceso en ejecución en una unidad de Tiempo. Marco usado (Puntero) para cada Proceso en cada unidad de Tiempo.
	varFallo=${ResuFallosMarcoProceso[$procFinalizadoOEjecutando,$reloj]} #Contendría el marco sobre el que se produce un fallo.
	varSiguiente=${ResuPunteroMarcoSiguienteFalloPagAcumulado[$procFinalizadoOEjecutando,$reloj]} #Subrayado - Marco (Puntero) sobre el que se produce el siguiente fallo para cada Proceso en cada unidad de Tiempo.

	# GENERACIÓN STRING DEL RELOJ (Líneas 1 y 2)  
	cuadrante=4
	calcularSobrantes $cuadrante $posSobrante #Se calculan los sobrantes o número de páginas de la vuelta actual ya que dependen de cada cuadrante utilizado para ser restados de las posiciones reales calculadas. 
	if [[ ${memoria[$procFinalizadoOEjecutando]} -gt 3 ]]; then #Da igual poner un total de 4 porque, en cuanto hay más de 4, ya existe $posCentroIz.
		if [[ $numMarcosOblicuos -gt 0 ]]; then #No se calcula sobre el sobrante porque el resultado es 0.
			posArrIzFinal=$(($posArrIzCalculado + $numMarcosOblicuos - 1)) #-1 para que sólo se ejecute el número justo de oblícuos.
			if [[ $posArrIzCalculado -le $posArrIzFinal ]]; then 
				counter1=0
				for ((ii=$posArrIzCalculado; ii<=$posArrIzFinal; ii++)); do
					posArrIzReal=$(($posCentroIzReal + 1 + $counter1))
					varImprimirPaginaUsada="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
					varImprimirFallo="" #Negrita-Fallo de Página
					varImprimirSiguiente="" #Fondo-Marco usado
					if [[ $varUsado -eq $posArrIzReal ]]; then #Para determinar subrayado (siguiente fallo de página), fondo de color (uso)y negrita (fallo de página). 
						varImprimirPaginaUsada="${colorfondo[$procFinalizado % 6]}" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
					fi
					if [[ $varFallo -eq $posArrIzReal ]]; then 
						varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
					fi
					if [[ $varSiguiente -eq $posArrIzReal ]]; then 
						varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Fondo-Marco usado
					fi
					variacionesMarco=$CReloj$varImprimirPaginaUsada$varImprimirFallo$varImprimirSiguiente #Conjunto de las variaciones sobre el texto. 
					if [[ ${paginasEnMemoriaProceso[$posArrIzReal]} -ne -1 && ${memoria[$procFinalizadoOEjecutando]} -gt $posArrIzReal ]]; then
						if [[ $ii -ne $posArrIzFinal ]]; then
							datoM=""
							if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
								punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posArrIzReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
								datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posArrIzReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
							fi
							dato1="${paginasEnMemoriaProceso[$posArrIzReal]}$datoM"
							TamNum=$(($longCampoDatosReloj - ${#dato1})) 
							espaciosfinal="${varhuecos:1:$TamNum}"
							linea1BN="$linea1BN $espaciosfinal$dato1 " #Se añade un espacio porque no se representa ningún carácter (-/\).
							linea1Color="$linea1Color $espaciosfinal$variacionesMarco$dato1$NC$CReloj " #Se añade un espacio porque no se representa ningún carácter (-/\).
							linea2BN="$linea2BN $espaciosfinalIni\\"
						elif [[ $ii -eq $posArrIzFinal ]] && [[ $cuadrante -le $posSobrante || $posSobrante -eq 0 ]]; then
							datoM=""
							if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
								punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posArrIzReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
								datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posArrIzReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
							fi
							dato1="${paginasEnMemoriaProceso[$posArrIzReal]}$datoM"
							TamNum=$(($longCampoDatosReloj - ${#dato1})) 
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
	varImprimirPaginaUsada="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
	varImprimirFallo="" #Negrita-Fallo de Página
	varImprimirSiguiente="" #Fondo-Marco usado
	if [[ $varUsado -eq $posArrCentroCalculado ]]; then 
		varImprimirPaginaUsada="${colorfondo[$procFinalizado % 6]}" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
	fi
	if [[ $varFallo -eq $posArrCentroCalculado ]]; then 
		varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
	fi
	if [[ $varSiguiente -eq $posArrCentroCalculado ]]; then 
		varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Fondo-Marco usado
	fi
	variacionesMarco=$CReloj$varImprimirPaginaUsada$varImprimirFallo$varImprimirSiguiente #Conjunto de las variaciones sobre el texto.  
	if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
		punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posArrCentroCalculado,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
		datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posArrCentroCalculado,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
		dato1=" ${paginasEnMemoriaProceso[$posArrCentroCalculado]}$datoM"
		TamNum=$(($longCampoDatosReloj - ${#dato1}))  
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
	calcularSobrantes $cuadrante $posSobrante #Se calculan los sobrantes o número de páginas de la vuelta actual ya que dependen de cada cuadrante utilizado para ser restados de las posiciones reales calculadas. 
	if [[ $numMarcosOblicuos -gt 0 ]]; then #Con 2 porque tendría que tener de resto 1 para que tuviera dato.
		posArrDeFinal=$(($posArrDeCalculado + $numMarcosOblicuos - 1)) #Se corrigen los valores del número de páginas oblícuas. -1 para que sólo se ejecute el número justo de oblícuos.
		for ((ii=$posArrDeCalculado; ii<=$posArrDeFinal; ii++)); do
			varImprimirPaginaUsada="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
			varImprimirFallo="" #Negrita-Fallo de Página
			varImprimirSiguiente="" #Fondo-Marco usado
			if [[ $varUsado -eq $ii ]]; then 
				varImprimirPaginaUsada="${colorfondo[$procFinalizado % 6]}" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
			fi
			if [[ $varFallo -eq $ii ]]; then 
				varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
			fi
			if [[ $varSiguiente -eq $ii ]]; then 
				varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Fondo-Marco usado
			fi
			variacionesMarco=$CReloj$varImprimirPaginaUsada$varImprimirFallo$varImprimirSiguiente #Conjunto de las variaciones sobre el texto.  
			if [[ ${paginasEnMemoriaProceso[$ii]} -ge 0 ]]; then
				datoM=""
				if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
					punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$ii,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
					datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$ii,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
				fi
				dato1="${paginasEnMemoriaProceso[$ii]}$datoM"
				TamNum=$(($longCampoDatosReloj - ${#dato1})) 
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

	# GENERACIÓN STRING DEL RELOJ (Línea 3)  
	cuadrante=3
	calcularSobrantes $cuadrante $posSobrante #Se calculan los sobrantes o número de páginas de la vuelta actual ya que dependen de cada cuadrante utilizado para ser restados de las posiciones reales calculadas. 
	if [[ $posSobrante -ge $cuadrante || $posSobrante -eq 0 ]]; then
		posCentroIzReal=$(($(($numMarcosOblicuos * 3)) + 4 - $sobrantes + $cuadrante - 1)) #Númeral de la posición real del reloj del primer marco por la izquierda en la segunda línea.
	else
		posCentroIzReal=$(($(($numMarcosOblicuos * 3)) + 4 - $sobrantes + $posSobrante - 1)) #Númeral de la posición real del reloj del primer marco por la izquierda en la segunda línea.
	fi
	varImprimirPaginaUsada="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
	varImprimirFallo="" #Negrita-Fallo de Página
	varImprimirSiguiente="" #Fondo-Marco usado
	if [[ $varUsado -eq $posCentroIzReal ]]; then 
		varImprimirPaginaUsada="${colorfondo[$procFinalizado % 6]}" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
	fi
	if [[ $varFallo -eq $posCentroIzReal ]]; then 
		varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
	fi
	if [[ $varSiguiente -eq $posCentroIzReal ]]; then 
		varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Fondo-Marco usado
	fi
	variacionesMarco=$CReloj$varImprimirPaginaUsada$varImprimirFallo$varImprimirSiguiente #Conjunto de las variaciones sobre el texto.  
	if [[ ${memoria[$procFinalizadoOEjecutando]} -gt 3 ]]; then
		if [[ ${paginasEnMemoriaProceso[$posCentroIzReal]} -ge 0 ]]; then
			datoM=""
			if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
				punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posCentroIzReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
				datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posCentroIzReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
			fi
			dato1="${paginasEnMemoriaProceso[$posCentroIzReal]}$datoM"
			TamNum=$(($longCampoDatosReloj - ${#dato1})) 
			espaciosfinal="${varhuecos:1:$TamNum}"
			linea3BN="$linea3BN$espaciosfinal$dato1 ─"
			linea3Color="$linea3Color$espaciosfinal$variacionesMarco$dato1$NC$CReloj ─"
		else
			linea3BN="$linea3BN$guionesfinal ─"
			linea3Color="$linea3Color$variacionesMarco$guionesfinal$NC$CReloj ─"
		fi
	fi
	TamNum=$longCampoDatosReloj #Espacio equivalente a una unidad 
	if [[ ${memoria[$procFinalizadoOEjecutando]} -le 3 ]]; then
		espaciosIntermedios="${varhuecos:1:$TamNum}"
	else
		if [[ $numMarcosOblicuos -gt 0 ]]; then
			TamNum=$(($TamNum + $(($(($longCampoDatosReloj + 2)) * 2 * $(($numMarcosOblicuos - 1)) )) )) #Espacio equivalente a una unidad 
		fi
		espaciosIntermedios="${varhuecos:1:$TamNum}"
	fi
	linea3BN="$linea3BN$espaciosIntermedios" #Se considera el espacio definido para la posición superior central.
	linea3Color="$linea3Color$espaciosIntermedios" #Se considera el espacio definido para la posición superior central.
	cuadrante=1
	calcularSobrantes $cuadrante $posSobrante #Se calculan los sobrantes o número de páginas de la vuelta actual ya que dependen de cada cuadrante utilizado para ser restados de las posiciones reales calculadas. 
	if [[ $posSobrante -ge $cuadrante || $posSobrante -eq 0 ]]; then
		posCentroDeReal=$(($((numMarcosOblicuos)) + 2 - $sobrantes + $cuadrante - 1)) #Númeral de la posición real del reloj del primer marco por la izquierda en la segunda línea.
	else
		posCentroDeReal=$(($((numMarcosOblicuos)) + 2 - $sobrantes + $posSobrante - 1)) #Númeral de la posición real del reloj del primer marco por la izquierda en la segunda línea.
	fi
	if [[ ${memoria[$procFinalizadoOEjecutando]} -ge 2 ]]; then
		varImprimirPaginaUsada="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
		varImprimirFallo="" #Negrita-Fallo de Página
		varImprimirSiguiente="" #Fondo-Marco usado
		if [[ $varUsado -eq $posCentroDeReal ]]; then 
			varImprimirPaginaUsada="${colorfondo[$procFinalizado % 6]}" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
		fi
		if [[ $varFallo -eq $posCentroDeReal ]]; then 
			varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
		fi
		if [[ $varSiguiente -eq $posCentroDeReal ]]; then 
			varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Fondo-Marco usado
		fi
		variacionesMarco=$CReloj$varImprimirPaginaUsada$varImprimirFallo$varImprimirSiguiente #Conjunto de las variaciones sobre el texto.  
		if [[ ${paginasEnMemoriaProceso[$posCentroDeReal]} -ge 0 ]]; then
			datoM=""
			if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
				punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posCentroDeReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
				datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posCentroDeReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
			fi
			dato1="${paginasEnMemoriaProceso[$posCentroDeReal]}$datoM"
			TamNum=$(($longCampoDatosReloj - ${#dato1})) 
			espaciosfinal="${varhuecos:1:$TamNum}"
			linea3BN="$linea3BN─ $dato1$espaciosfinal"
			linea3Color="$linea3Color─ $variacionesMarco$dato1$NC$CReloj$espaciosfinal"
		else
			linea3BN="$linea3BN─ $guionesfinal"
			linea3Color="$linea3Color─ $variacionesMarco$guionesfinal$NC$CReloj"
		fi
	fi

	# GENERACIÓN STRING DEL RELOJ (Líneas 4 y 5)  
	cuadrante=3
	calcularSobrantes $cuadrante $posSobrante #Se calculan los sobrantes o número de páginas de la vuelta actual ya que dependen de cada cuadrante utilizado para ser restados de las posiciones reales calculadas. 
	if [[ ${memoria[$procFinalizadoOEjecutando]} -gt 3 ]]; then
		if [[ $numMarcosOblicuos -gt 0 ]]; then #Con 2 porque tendría que tener de resto 3 para que tuviera dato.
			posAbIzFinal=$(($posAbIzCalculado + $numMarcosOblicuos - 1)) #-1 para que sólo se ejecute el número justo de oblícuos.
			if [[ $posAbIzCalculado -le $posAbIzFinal ]]; then
				for ((ii=$posAbIzFinal; ii>=$posAbIzCalculado; ii--)); do
					counter1=$(($posAbIzFinal - $ii)) 
					posAbIzReal=$(($posCentroIzReal - 1 - $counter1))
					varImprimirPaginaUsada="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
					varImprimirFallo="" #Negrita-Fallo de Página
					varImprimirSiguiente="" #Fondo-Marco usado
					if [[ $varUsado -eq $posAbIzReal ]]; then 
						varImprimirPaginaUsada="${colorfondo[$procFinalizado % 6]}" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
					fi
					if [[ $varFallo -eq $posAbIzReal ]]; then 
						varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
					fi
					if [[ $varSiguiente -eq $posAbIzReal ]]; then 
						varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Fondo-Marco usado linea5Color
					fi
					variacionesMarco=$CReloj$varImprimirPaginaUsada$varImprimirFallo$varImprimirSiguiente #Conjunto de las variaciones sobre el texto. 
					if [[ ${paginasEnMemoriaProceso[$posAbIzReal]} -ne -1 && ${memoria[$procFinalizadoOEjecutando]} -gt $posAbIzReal ]]; then
						if [[ $ii -ne $posAbIzCalculado ]]; then
							datoM=""
							if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
								punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posAbIzReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
								datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posAbIzReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
							fi
							dato1="${paginasEnMemoriaProceso[$posAbIzReal]}$datoM"
							TamNum=$(($longCampoDatosReloj - ${#dato1})) 
							espaciosfinal="${varhuecos:1:$TamNum}"
							linea4BN="$linea4BN $espaciosfinalIni/"
							linea5BN="$linea5BN $espaciosfinal$dato1 "
							linea5Color="$linea5Color $espaciosfinal$variacionesMarco$dato1$NC$CReloj "
						elif [[ $ii -eq $posAbIzCalculado ]] && [[ $cuadrante -le $posSobrante || $posSobrante -eq 0 ]]; then
							datoM=""
							if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
								punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posAbIzReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
								datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posAbIzReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
							fi
							dato1="${paginasEnMemoriaProceso[$posAbIzReal]}$datoM$NC"
							TamNum=$(($longCampoDatosReloj - ${#dato1})) 
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
	calcularSobrantes $cuadrante $posSobrante #Se calculan los sobrantes o número de páginas de la vuelta actual ya que dependen de cada cuadrante utilizado para ser restados de las posiciones reales calculadas. 
	if [[ $posSobrante -ge $cuadrante || $posSobrante -eq 0 ]]; then
		posAbCentroReal=$(($((numMarcosOblicuos * 2)) + 3 - $sobrantes + $cuadrante - 1)) #Númeral de la posición real del reloj del marco central inferior en la tercera línea.
	else
		posAbCentroReal=$(($((numMarcosOblicuos * 2)) + 3 - $sobrantes + $posSobrante - 1)) #Númeral de la posición real del reloj del marco central inferior en la tercera línea.
	fi
	varImprimirPaginaUsada="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
	varImprimirFallo="" #Negrita-Fallo de Página
	varImprimirSiguiente="" #Fondo-Marco usado
	if [[ $varUsado -eq $posAbCentroReal ]]; then 
		varImprimirPaginaUsada="${colorfondo[$procFinalizado % 6]}" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
	fi
	if [[ $varFallo -eq $posAbCentroReal ]]; then 
		varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
	fi
	if [[ $varSiguiente -eq $posAbCentroReal ]]; then 
		varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Fondo-Marco usado
	fi
	variacionesMarco=$CReloj$varImprimirPaginaUsada$varImprimirFallo$varImprimirSiguiente #Conjunto de las variaciones sobre el texto. 
	if [[ ${memoria[$procFinalizadoOEjecutando]} -ge 3 ]]; then
		if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
			punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posAbCentroReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
			datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posAbCentroReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
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
	calcularSobrantes $cuadrante $posSobrante #Se calculan los sobrantes o número de páginas de la vuelta actual ya que dependen de cada cuadrante utilizado para ser restados de las posiciones reales calculadas. 
	if [[ ${memoria[$procFinalizadoOEjecutando]} -gt 4 ]]; then
		if [[ $numMarcosOblicuos -gt 0 ]]; then #Con 2 porque tendría que tener de resto 2 para que tuviera dato.
			posAbDeFinal=$(($posAbDeCalculado + $numMarcosOblicuos - 1)) #-1 para que sólo se ejecute el número justo de oblícuos.
			if [[ $posAbDeCalculado -le $posAbDeFinal ]]; then
				for ((ii=$posAbDeFinal; ii>=$posAbDeCalculado; ii--)); do #Se cambia el orden para que los huecosde los oblícuos queden más hacia el centroy y resulten simétricos respecto a la izquierda.
					counter1=$(($ii - $posAbDeCalculado)) #Se cambia el orden para que los huecosde los oblícuos queden más hacia el centroy y resulten simétricos respecto a la izquierda.
					posAbDeReal=$(($posCentroDeReal + 1 + $counter1))
					varImprimirPaginaUsada="" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página. Se definirán cuamdo el dato lo exija porque se haya producido un Fallo de Página sobre el marco elegido.
					varImprimirFallo="" #Negrita-Fallo de Página
					varImprimirSiguiente="" #Fondo-Marco usado
					if [[ $varUsado -eq $posAbDeReal ]]; then 
						varImprimirPaginaUsada="${colorfondo[$procFinalizado % 6]}" #Variable relacionada con el dato: Subrayado-Siguiente Fallo de Página
					fi
					if [[ $varFallo -eq $posAbDeReal ]]; then 
						varImprimirFallo="\e[1m" #Variable relacionada con el dato: Negrita-Fallo de Página
					fi
					if [[ $varSiguiente -eq $posAbDeReal ]]; then 
						varImprimirSiguiente="\e[4m" #Variable relacionada con el dato: Fondo-Marco usado
					fi
					variacionesMarco=$CReloj$varImprimirPaginaUsada$varImprimirFallo$varImprimirSiguiente #Conjunto de las variaciones sobre el texto. 
					if [[ ${memoria[$procFinalizadoOEjecutando]} -gt $posAbDeReal ]]; then
						if [[ ${paginasEnMemoriaProceso[$posAbDeReal]} -ne -1 && ${memoria[$procFinalizadoOEjecutando]} -gt $posAbDeReal ]]; then
							if [[ $ii -ne $posAbDeFinal ]]; then
								datoM=""
								if [[ $seleccionAlgoritmoPaginacion -eq 4 ]]; then
									punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posAbDeReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
									datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posAbDeReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
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
									punteroPagMarco=${ResuPaginaOrdinalAcumulado[$procFinalizadoOEjecutando,$posAbDeReal,$reloj]} #Resumen - Índices: (proceso, marco, reloj). Dato: Ordinal de la Página en la serie de páginas a ejecutar (ejecución) de un proceso, que ocupa cada Marco en cada unidad de Tiempo. Se acumulan los datos de todos los marcos del proceso. Se busca el ordinal usado en ese instante porque sería el utilizado para la búsqueda de los coeficientes M en todos los marcos al ser el mayor número.
									datoM="-"${coeficienteSegOp[$procFinalizadoOEjecutando,$posAbDeReal,$punteroPagMarco]} #Contendrá el coeficiente M en algoritmos de Segunda Oportunidad. Se usa el ordinal de la página desde ResuPaginaOrdinalAcumulado() que da el ordinal de la página en un marco en cada instante de reloj.				
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

	# IMPRIMIR LAS 5 LÍNEAS DEL DIAGRAMA DEL RELOJ (COLOR y BN a pantalla y ficheros)
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

} #Fin de dibujaReloj()

####################################################################################
# Sinopsis: Se calculan los sobrantes o número de páginas de la vuelta actual ya que dependen de cada cuadrante utilizado para ser restados de las posiciones reales calculadas. 
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
# Sinopsis: Permite introducir las opciones generales de la memoria por teclado
####################################################################################
function entradaMemoriaTeclado {
	#Pedir el número de marcos de memoria del sistema
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
	#Pedir el número de direcciones de cada marco de memoria del sistema
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

	#Pedir el mínimo y máximo del rango de prioridades de los procesos y el tipo de prioridad a ejecutar (Mayor o Menor)
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
	tratarRangoPrioridadesDirecta $PriomInicial $PrioMInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	prio_menor=$PriomFinal #Sobre este rango se calculan los datos de las prioridades de los procesos, prioridades que no deberían pedirse al usuario.
	prio_mayor=$PrioMFinal

	#Pedir el quantum de Round-Robin
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

	#Pedir el tamaño maximo de memoria fragmentada para que haya reubicacion
	reub=1 #Se inicializa para que no se considere la reubicabilidad si no está definida en la elección inicial.
	if [[ $reubicabilidadNo0Si1 -eq "1" ]]; then #R/NR
		#Pedir el tamaño de la variable de reubicación $reubicabilidadNo0Si1 -eq 0
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
	
	mem_total_direcciones=$(($mem_num_marcos * $mem_direcciones)) #Direcciones totales de memoria.
	mem_num_marcos=$mem_num_marcos #Número de marcos totales de memoria.
	variableReubicar=$reub

	# salida de datos introducidos sobre la memoria para que el usuario pueda ver lo que esta introducciendo y volcado de los mismos en ficheros auxiliares
	echo ""
	echo -e "MarcosMemoria" "\n$mem_num_marcos" "\nDireccionesMarco" "\n$mem_direcciones" > $nomFicheroDatos #Se meten los datos de las particiones en otro fichero escogido
	echo -e "PrioridadMenor" "\n$PriomInicial" "\nPrioridadMayor" "\n$PrioMInicial" "\nTipoPrioridad" "\n$PrioR" >> $nomFicheroDatos #Se meten los datos de las particiones en otro fichero escogido
	echo -e "VariableReubicar" "\n$reub" "\nQuantum" "\n$quantum" >> $nomFicheroDatos #Se meten los datos de las particiones en otro fichero escogido
#    clear
} #Fin de entradaMemoriaTeclado()                

####################################################################################
# Sinopsis: Permite introducir los procesos por teclado.
####################################################################################
function entradaProcesosTeclado {
	p=0 #Número ordinal de proceso
	masprocesos="s"
	echo -e "Tll nMar Prio Direcciones" >> $nomFicheroDatos #Se meten los textos correspondientes a los datos en el fichero escogido
	while [[ $masprocesos == "s" ]]; do 
#        clear
		nprocesos=$((p + 1)) #Para ser equivalente al nuevo programa. Se aconseja quitar la variable $p y estandarizar las variables a usar ??????????.
		#Bloque para introducción del resto de datos del proceso
		echo -ne $NORMAL"\n Tiempo de llegada del proceso $p: " | tee -a $informeConColorTotal #Se introduce el tiempo de llegada asociado a cada proceso.
		echo -ne $NORMAL"\n Tiempo de llegada del proceso $p: " >> $informeSinColorTotal
		read llegada[$p]
		until [[ ${llegada[$p]} -ge 0 ]]; do
			echo $NORMAL" No se pueden introducir tiempos de llegada negativos" | tee -a $informeConColorTotal
			echo $NORMAL" No se pueden introducir tiempos de llegada negativos" >>$informeSinColorTotal
			echo -ne $NORMAL" Introduce un nuevo tiempo de llegada\n" | tee -a $informeConColorTotal
			echo -ne $NORMAL" Introduce un nuevo tiempo de llegada\n" >> $informeSinColorTotal
			read llegada[$p]
		done
				
		echo -ne $NORMAL"\n Número de marcos de memoria asociados al proceso $p: " | tee -a $informeConColorTotal #Se introduce la memoria asociada a cada proceso.
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
			echo -ne $NORMAL"\n Prioridad asociada al proceso $p: " | tee -a $informeConColorTotal #Se introduce la prioridad asociada a cada proceso.
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
		numOrdinalPagTeclado=0 #Número ordinal de dirección/página definidas
		paginasTeclado=""
		varPaginasTeclado=""
		while [[ $paginasTeclado != "n" ]]; do #Se introducen las direcciones asociadas a cada proceso.
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
#				directions[$p,$numOrdinalPagTeclado]=$paginasTeclado
				transformapag directions[$p,$numOrdinalPagTeclado] $numOrdinalPagTeclado #let pagTransformadas[$2]=`expr $1/$mem_direcciones`
				varPaginasTeclado=$varPaginasTeclado"$paginasTeclado "
				paginasDefinidasTotal[$p,$numOrdinalPagTeclado]=${pagTransformadas[$numOrdinalPagTeclado]} 
				ejecucion[$p]=$(expr ${ejecucion[$p]} + 1)
				tiempoEjecucion[$p]=${ejecucion[$p]} #Para ser equivalente al nuevo programa
				numOrdinalPagTeclado=$(expr $numOrdinalPagTeclado + 1)
			fi
		done

		#Salida de datos introducidos sobre procesos para que el usuario pueda ver lo que esta introducciendo y volcado de los mismos en ficheros auxiliares
		echo ""
		echo -e "${llegada[$p]}" "${memoria[$p]}" "${prioProc[$p]}" "$varPaginasTeclado" >> $nomFicheroDatos #Se meten los datos de las particiones en otro fichero escogido
#        clear 
		ordenarDatosEntradaFicheros #Se ordenan los datos por tiempo de llegada a medida que se van itroduciendo. También crea los bit de Modificados para cuando se utilicen los algoritmos basados en clases.

		echo -e $NORMAL"\n\n Ref Tll Tej nMar Dir-Pag" | tee -a $informeConColorTotal
		echo -e "\n\n Ref Tll Tej nMar Dir-Pag" >> $informeSinColorTotal
		entradaProcesosTecladoDatosPantalla #Función para mostrar los datos   
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
		p=$(expr $p + 1) #incremento el contador
	done
	if [[ $preguntaDondeGuardarDatosManuales -eq 1 ]]; then #Se guardan los datos introducidos en el fichero de última ejecución
		cp $ficheroDatosDefault $ficheroDatosAnteriorEjecucion
	else
		cp $nomFicheroDatos $ficheroDatosAnteriorEjecucion
	fi
} #Fin de entradaProcesosTeclado()

####################################################################################
# Sinopsis: Impresión de los procesos una vez introducidos por teclado o fichero 
####################################################################################
function imprimeprocesos {
	ordenarDatosEntradaFicheros #Se ordenan los procesos por tiempo de llegada a medida que se van introduciendo.
	for (( counter = 0; counter <= numprocesos; counter++ )); do
		if [[ $counter -gt 8 ]]; then
			let colorjastag[counter]=counter-8;
		else
			let colorjastag[counter]=counter+1;
		fi
	done
	echo -e "\n Ref Tll Tej nMar Dirección-Página ------ imprimeprocesos\n" | tee -a $informeConColorTotal $informeSinColorTotal
	entradaProcesosTecladoDatosPantalla #Resumen inicial de la taba de procesos.
	echo "" | tee -a $informeConColorTotal $informeSinColorTotal > /dev/null
	echo "|—————————————————————————————————————————————————————————————————————————|" | tee -a $informeConColorTotal $informeSinColorTotal > /dev/null
	echo "" | tee -a $informeConColorTotal $informeSinColorTotal > /dev/null
	echo "" | tee -a $informeConColorTotal $informeSinColorTotal > /dev/null
} #Fin de imprimeprocesos()

####################################################################################
# Sinopsis: Permite visualizar los datos de la memoria/procesos introducidos por teclado.
####################################################################################
function entradaProcesosTecladoDatosPantalla { 
	multiplicador=0
	counter2=0
	counter3=0	
	for ((counter = 0; counter <= ${#llegada[@]}; counter++)); do #Define los colores de los procesos de forma cíclica. 
		if [[ $counter-$counter2 -gt 8 ]]; then #Faltaría ajustar los valores de las variables a los colores posibles (6, 8, 9). Pero no es una buena idea porque los colores del texto y fondos no coinciden como se ve en las variables $coloress y $colorfondos...
			multiplicador=$multiplicador+1
			counter3=$multiplicador*8; #Para calcular la diferencia ente contadores para determinar cuándo es superior al número de colores usados.
		fi
		counter2=$counter-$counter3;
		let colorjastag[counter]=$counter2+1;
	done
	for ((t = 0; t < ${#llegada[@]}; t++)); do
		echo -ne " ${coloress[$t % 6]}${proceso[$t]}" | tee -a $informeConColorTotal
		echo -n " ${proceso[$t]}" >>$informeSinColorTotal
		longitudLlegada=$(($longCampoTablaAncho - ${#llegada[$t]})) 
		echo -ne "${varhuecos:1:$longitudLlegada}""${coloress[$t % 6]}${llegada[$t]}" | tee -a $informeConColorTotal 
		echo -n "${varhuecos:1:$longitudLlegada}""${llegada[$t]}" >>$informeSinColorTotal
		longitudTiempo=$(($longCampoTablaAncho - ${#ejecucion[$t]})) 
		echo -ne "${varhuecos:1:$longitudTiempo}""${coloress[$t % 6]}${ejecucion[$t]}" | tee -a $informeConColorTotal 
		echo -n "${varhuecos:1:$longitudTiempo}""${ejecucion[$t]}" >>$informeSinColorTotal            
		longitudMemoria=$(($longCampoTablaMasAncho - ${#memoria[$t]})) 
		echo -ne "${varhuecos:1:$longitudMemoria}""${coloress[$t % 6]}${memoria[$t]}" | tee -a $informeConColorTotal 
		echo -ne "${varhuecos:1:$longitudMemoria}""${memoria[$t]}" >>$informeSinColorTotal
 		DireccionesPaginasPorProceso=""
 		for ((counter2=0;counter2<${ejecucion[$t]};counter2++)); do
			DireccionesPaginasPorProceso=$DireccionesPaginasPorProceso" ${varC[$t]}${directions[$t,$counter2]}-${paginasDefinidasTotal[$t,$counter2]}"
		done
		echo -e "$DireccionesPaginasPorProceso" | tee -a $informeConColorTotal
	done
} #Fin de entradaProcesosTecladoDatosPantalla()

#####################################################################################
# Sinopsis: Permite ordenar los datos sacados desde fichero y de entrada por teclado. 
####################################################################################
function ordenarDatosEntradaFicheros {
	for ((j = 0; j < ${#llegada[@]}; j++)); do
		numeroproceso[$j]=$j #Se guarda su número de orden de introducción o lectura en un vector para la función que lo ordena   
	done
	for ((j = 0; j < ${#llegada[@]}; j++)); do
		if [[ $j -ge 9 ]]; then
			proceso[$j]=$(echo P$(($j + 1)))
		else
			proceso[$j]=$(echo P0$(($j + 1)))
		fi
	done
	for (( j = $((${#llegada[@]} - 1)); j >= 0; j-- )); do 
		for (( i = 0; i < $j; i++ )); do
			if [[ $((llegada[$i])) -gt $((llegada[$(($i + 1))])) ]]; then
				aux=${proceso[$(($i + 1))]} #No hace falta borrar aux porque sólo hay un valor, y su valor se machaca en cada redefinición. 
				proceso[$(($i + 1))]=${proceso[$i]} 
				proceso[$i]=$aux
				aux=${llegada[$(($i + 1))]}
				llegada[$(($i + 1))]=${llegada[$i]}
				llegada[$i]=$aux
				aux2="" #Se permutan las páginas
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${paginasDefinidasTotal[$(($i + 1)),$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do #Se borran para que no pueda haber valores anteriores residuales.
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

				aux2="" #Se permutan las direcciones los valores de "Página Modificada", cuando se trabaja con algoritmos basados en Clases, porque se definió en leer_datos_desde_fichero().
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${directions[$(($i + 1)),$counter2]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do #Se borran para que no pueda haber valores anteriores residuales.
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

				aux2="" #Se permutan las direcciones los valores de "Página Modificada", cuando se trabaja con algoritmos basados en Clases, porque se definió en leer_datos_desde_fichero().
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do
					aux2[$counter2]=${directions_AlgPagFrecUsoRec_pagina_modificada[$(($i + 1)),$counter2,0]}
				done
				for ((counter2=0;counter2<${ejecucion[$(($i + 1))]};counter2++)); do #Se borran para que no pueda haber valores anteriores residuales.
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
				tiempoEjecucion[$(($i + 1))]=${tiempoEjecucion[$i]} #Se permutan los valores de esta variable auxiliar porque se definió en leer_datos_desde_fichero().
				tiempoEjecucion[$i]=$aux
				aux=${memoria[$(($i + 1))]}
				memoria[$(($i + 1))]=${memoria[$i]} 
				memoria[$i]=$aux
				aux=${prioProc[$(($i + 1))]}
				prioProc[$(($i + 1))]=${prioProc[$i]} #En caso de usar el algoritmo basado en Prioridades...
				prioProc[$i]=$aux
			fi
		done
	done
	for ((j = 0; j < ${#llegada[@]}; j++)); do
		numeroproceso[$j]=$j #Se guarda su número de orden de introducción o lectura en un vector para la función que lo ordena   
	done
} #Fin de ordenarDatosEntradaFicheros()

####################################################################################
# Sinopsis: Pregunta en qué fichero guardar los rangos para la opción 8.
####################################################################################
function entradaMemoriaRangosFichero_op_cuatro_Previo {
#    clear
	preguntaDondeGuardarRangosManuales #Resuelve los nombres de los ficheros de rangos
	preguntaDondeGuardarDatosManuales #Resuelve los nombres de los ficheros de datos
} #Fin de entradaMemoriaRangosFichero_op_cuatro_Previo()

####################################################################################
# Sinopsis: Se piden y tratan los mínimos y máximos de los rangos, calculando los valores aleatorios y los datos 
# con los que se trabajará para la opción 4. 
####################################################################################
function entradaMemoriaRangosFichero_op_cuatro { 
	#---Llamada a funciones para rangos-------------
	datos_numero_marcos_memoria #Se asigna la memoria aleatoriamente       
	calcDatoAleatorioGeneral $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS
	mem_num_marcos=$datoAleatorioGeneral #Entre 1 y este máximo de rango será desde donde se caculen los datos de la memoria asociada a cada proceso.
	datos_numero_direcciones_marco #Se asigna la memoria aleatoriamente       
	calcDatoAleatorioGeneral $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
	mem_direcciones=$datoAleatorioGeneral
	numDireccionesTotales_max=$(($mem_num_marcos * $mem_direcciones)) #Se comparará este valor con las direcciones definidas, ya que las direcciones deben ser menores en el caso de memoria No Virtual.

	datos_prio_menor #Se asigna el mínimo del rango de prioridad aleatoriamente       
	MIN_RANGE_prio_menorInicial=${prio_menor_min}
	MAX_RANGE_prio_menorInicial=${prio_menor_max}
	tratarRangoPrioridadesDirecta $MIN_RANGE_prio_menorInicial $MAX_RANGE_prio_menorInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_prio_menor=$PriomFinal
	MAX_RANGE_prio_menor=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_prio_menor $MAX_RANGE_prio_menor
	prio_menorInicial=$datoAleatorioGeneral
	datos_prio_mayor #Se asigna el máximo del rango de prioridad aleatoriamente       
	MIN_RANGE_prio_mayorInicial=${prio_mayor_min}
	MAX_RANGE_prio_mayorInicial=${prio_mayor_max}
	tratarRangoPrioridadesDirecta $MIN_RANGE_prio_mayorInicial $MAX_RANGE_prio_mayorInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_prio_mayor=$PriomFinal
	MAX_RANGE_prio_mayor=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_prio_mayor $MAX_RANGE_prio_mayor
	prio_mayorInicial=$datoAleatorioGeneral
	prio_menor_min=$prio_menor_minInicial
	prio_menor_max=$prio_menor_maxInicial
	tratarRangoPrioridadesDirecta $prio_menorInicial $prio_mayorInicial #Se invierten los valores si el mayor es menor que el mayor.
	prio_menor=$PriomFinal
	prio_mayor=$PrioMFinal
	datos_tamano_reubicacion #Se asigna la reubicaciónaleatoriamente     
	calcDatoAleatorioGeneral $MIN_RANGE_REUB $MAX_RANGE_REUB
	reub=$datoAleatorioGeneral
	datos_numero_programas #Se asigna el número de procesos aleatoriamente 
	calcDatoAleatorioGeneral $MIN_RANGE_NPROC $MAX_RANGE_NPROC
	n_prog=$datoAleatorioGeneral
	#--------------------------------------------- En algunos casos no hace falta calcularlo porque se calculará por cada proceso. 
	datos_tiempo_llegada    
	datos_tiempo_ejecucion 
	#---------------------------------------------
#    datos_tamano_marcos_procesos #Esta función no se usará como tampoco se usó datos_tamano_marcos_procesos_amplio(), dado que se usará como rango un subconjunto de [1,$mem_num_marcos] para que, si es posible, salgan valores significativamente menores al máximo.
	calcDatoAleatorioGeneral 1 $mem_num_marcos 
	MIN_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial 
	MAX_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
	tratarRangoPrioridadesDirecta $MIN_RANGE_tamano_marcos_procInicial $MAX_RANGE_tamano_marcos_procInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_tamano_marcos_proc=$PriomFinal
	MAX_RANGE_tamano_marcos_proc=$PrioMFinal 
	#---------------------------------------------
	datos_prio_proc
	#---------------------------------------------
	datos_quantum         
	calcDatoAleatorioGeneral $MIN_RANGE_quantum $MAX_RANGE_quantum
	quantum=$datoAleatorioGeneral
	#--------------------------------------------- El resto no hace falta calcularlo porque se calculará por cada proceso. 
	datos_tamano_direcciones_procesos          
	#---------------------------------------------
#    clear   
	for (( p=0; p<$n_prog; p++)); do     
		entradaMemoriaRangosFichero_op_cuatro_cinco_seis_Comun #Se calculan los valores aleatorios y los datos con los que se trabajará para las opciones 4, 5 y 6. 
		entradaMemoriaRangosFichero_op_cuatro_Post_1 #Guarda los datos en los ficheros que correspondan
	done #cierre del until
	entradaMemoriaRangosFichero_op_cuatro_Post_2 #Copia los ficheros Default/Último
} #Fin de entradaMemoriaRangosFichero_op_cuatro()

####################################################################################
# Sinopsis: Se guardarán los datos en los ficheros que corresponda para la opción 4
#################################################################################### 
function entradaMemoriaRangosFichero_op_cuatro_Post_1 {
	if [[ $p -eq 1 ]]; then #Para imprimir los rangos en el fichero dependiendo si es el fichero anterior o otro
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
	fi #Cierre if $p -eq 1
	#No se establece desde fichero sino que se decide en el momento de la ejecución mediante la variable de selección de tipo $seleccionTipoPrioridad.
	if [[ $seleccionTipoPrioridad -eq 1 ]]; then #M/m
		PrioR="Mayor"
	else    
		PrioR="Menor"                
	fi              
	if [[ $p -eq 1 ]]; then #Escribe los datos en el fichero selecionado
		echo -ne "Marcos totales\n"$mem_num_marcos"\nTamano de pagina\n"$mem_direcciones"\nPrioridad menor\n"$prio_menorInicial\
		"\nPrioridad mayor\n"$prio_mayorInicial"\nTipo de prioridad\n"$PrioR"\nMinimo para reubicabilidad\n"$reub"\nQuantum\n"$quantum\
		"\nTll nMar Prio Direcciones/Modificado:\n" > $nomFicheroDatos
	fi                  

	MIN_RANGE_PAGINA_MODIFICADA=0 #Se usarán para determinar de forma aleatoria si una página es o no modificada al ser ejecutada en los algoritmos NFU y NRU.
	MAX_RANGE_PAGINA_MODIFICADA=1
	direccionesAcumuladas="" #Hace que las direcciones sean diferentes en cada proceso.
	for (( numdir=0; numdir<${ejecucion[$p]}; numdir++)); do #Muestra las direcciones del proceso calculadas de forma aleatoria.
		directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]=$datoAleatorioGeneral  #Se almacena el cálculo aleatorio de si una página es o no modificada al ser ejecutada.
		calcDatoAleatorioGeneral $MIN_RANGE_PAGINA_MODIFICADA $MAX_RANGE_PAGINA_MODIFICADA  #Se calcula de forma aleatoria si una página es o no modificada al ser ejecutada.
		direccionesAcumuladas+=`echo -ne " ${directions[$p,$numdir]}-${directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]}"`
	done
	echo -e ${llegada[$p]} ${memoria[$p]} ${prioProc[$p]} $direccionesAcumuladas >> $nomFicheroDatos
#    clear
} #Fin de entradaMemoriaRangosFichero_op_cuatro_Post_1()

####################################################################################
# Sinopsis: Se copian los ficheros que correspondan para la opción 4
####################################################################################
function entradaMemoriaRangosFichero_op_cuatro_Post_2 {
	if [[ -f "$ficheroDatosAnteriorEjecucion" ]]; then #Borra el fichero de datos ultimo y escribe los datos en el fichero
		rm $ficheroDatosAnteriorEjecucion
	fi
	if [[ -f "$ficheroRangosAnteriorEjecucion" ]]; then #Borra el fichero de datos ultimo y escribe los rangos en el fichero
		rm $ficheroRangosAnteriorEjecucion
	fi
	cp $nomFicheroDatos $ficheroDatosAnteriorEjecucion  #Copia los ficheros Default/Último       
	cp $nomFicheroRangos $ficheroRangosAnteriorEjecucion  #Copia los ficheros Default/Último       
} #Fin de entradaMemoriaRangosFichero_op_cuatro_Post_2()

####################################################################################
# Sinopsis: Pregunta en qué fichero guardar los rangos amplios para la opción 5.
####################################################################################
function entradaMemoriaRangosFichero_op_cinco_Previo {
#    clear
	preguntaDondeGuardarDatosManuales #Resuelve los nombres de los ficheros de datos
} #Fin de entradaMemoriaRangosFichero_op_cinco_Previo()

####################################################################################
# Sinopsis: Pregunta en qué fichero guardar los rangos amplios para la opción 6.
####################################################################################
function entradaMemoriaRangosFichero_op_seis_Previo {
#    clear
	preguntaDondeGuardarDatosManuales #Resuelve los nombres de los ficheros de datos
	echo -e "\n\nFicheros existentes:\n$NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\nFicheros existentes:\n" >> $informeSinColorTotal 
	files=("./FRangos"/*)
	for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
		echo -e "$i) ${files[$i]}" | tee -a $informeConColorTotal
		echo -e "$i) ${files[$i]}" >> $informeSinColorTotal 
	done
	echo -ne "\n$AMARILLO\n\nIntroduce el número correspondiente al fichero elegido: $NORMAL" | tee -a $informeConColorTotal
	echo -ne "\n\n\nIntroduce el número correspondiente al fichero elegido: " >> $informeSinColorTotal 
	read -r numeroFichero
	until [[ "0" -le $numeroFichero && $numeroFichero -lt ${#files[@]} && $numeroFichero -ne "" ]]; do
		echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read -r numeroFichero
		echo -e "$numeroFichero\n\n" >> $informeConColorTotal
		echo -e "$numeroFichero\n\n" >> $informeSinColorTotal
	done
	echo "$numeroFichero" >> $informeConColorTotal
	echo "$numeroFichero" >> $informeSinColorTotal
	ficheroParaLectura="${files[$numeroFichero]}"
#    clear
} #Fin de entradaMemoriaRangosFichero_op_seis_Previo()

####################################################################################
# Sinopsis: Se tratan los mínimos y máximos de los rangos, calculando los valores aleatorios y los datos 
# con los que se trabajará para las opciones 5 y 6. 
####################################################################################
function entradaMemoriaRangosFichero_op_cinco_seis {
#    datos_memoria_tabla
	#-----------Llamada a funciones para calcular los datos aleatorios dentro de los rangos definidos-------------
	MIN_RANGE_MARCOS=${memoria_min}
	MAX_RANGE_MARCOS=${memoria_max}
	calcDatoAleatorioGeneral $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS
	mem_num_marcos=$datoAleatorioGeneral
	MIN_RANGE_DIRECCIONES=${direcciones_min}
	MAX_RANGE_DIRECCIONES=${direcciones_max}
	calcDatoAleatorioGeneral $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
	mem_direcciones=$datoAleatorioGeneral
	numDireccionesTotales_max=$(($memoria_max * $direcciones_max)) #Se comparará este valor con las direcciones definidas, ya que las direcciones deben ser menores en el caso de memoria No Virtual.

	MIN_RANGE_prio_menor=${prio_menor_min}
	MAX_RANGE_prio_menor=${prio_menor_max}
	calcDatoAleatorioGeneral $MIN_RANGE_prio_menor $MAX_RANGE_prio_menor
	prio_menorInicial=$datoAleatorioGeneral #*Inicial - Datos a representar
	MIN_RANGE_prio_mayor=${prio_mayor_min}
	MAX_RANGE_prio_mayor=${prio_mayor_max}
	calcDatoAleatorioGeneral $MIN_RANGE_prio_mayor $MAX_RANGE_prio_mayor
	prio_mayorInicial=$datoAleatorioGeneral #*Inicial - Datos a representar
	PriomInicial=$prio_menorInicial #Variables con los datos originales usadas en la cabecera de la representación de la tabla
	PrioMInicial=$prio_mayorInicial
	tratarRangoPrioridadesDirecta $prio_menorInicial $prio_mayorInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	prio_menor=$PriomFinal #Sobre este rango se calculan los datos de las prioridades de los procesos, prioridades que no deberían pedirse al usuario.
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
	#---------------------------------------------
	#No se usará el mismo mecanismo que con los datos anteriores, dado que se usará como rango un subconjunto de [1,$mem_num_marcos] para que, si es posible, salgan valores significativamente menores al máximo.
	#Tampoco es igual al sistema usado en los rangos amplios por usar dos sistemas diferentes.
	tamano_marcos_proc_min=1
	tamano_marcos_proc_max=$mem_num_marcos
	calcDatoAleatorioGeneral 1 $mem_num_marcos 
	MIN_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $tamano_marcos_proc_minInicial $tamano_marcos_proc_maxInicial 
	MAX_RANGE_tamano_marcos_procInicial=$datoAleatorioGeneral
	tratarRangoPrioridadesDirecta $MIN_RANGE_tamano_marcos_procInicial $MAX_RANGE_tamano_marcos_procInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_tamano_marcos_proc=$PriomFinal
	MAX_RANGE_tamano_marcos_proc=$PrioMFinal 
	#---------------------------------------------
	MIN_RANGE_prio_proc=${prio_proc_min}
	MAX_RANGE_prio_proc=${prio_proc_max}
	MIN_RANGE_tamano_direcciones_proc=${tamano_direcciones_proc_min}
	MAX_RANGE_tamano_direcciones_proc=${tamano_direcciones_proc_max}
 
	datos_memoria_tabla
	if [[ $seleccionMenuEnsayos -ne 1 && $seleccionMenuEnsayos -ne 2 && $seleccionMenuEnsayos -ne 3 && $seleccionMenuEnsayos -ne 4 ]]; then #No se ejecuta cuando la selección inicial es la ejecución automática repetitiva.
		echo -e "\n$NC Pulse enter para continuar..." | tee -a $informeConColorTotal
		echo -e "\nPulse enter para continuar..." >> $informeSinColorTotal
		read enter
		echo -e $enter "\n" >> $informeConColorTotal
		echo -e $enter "\n" >> $informeSinColorTotal
	fi
#    clear   
	for (( p=0; p<$n_prog; p++)); do     
		entradaMemoriaRangosFichero_op_cuatro_cinco_seis_Comun #Se calculan los valores aleatorios y los datos con los que se trabajará para las opciones 4, 5 y 6. 
		entradaMemoriaRangosFichero_op_cinco_seis_Post_1 #Guarda los datos en los ficheros que correspondan        
	done #cierre del for   
	entradaMemoriaRangosFichero_op_cinco_seis_Post_2 #Copia los ficheros Default/Último    
} #Fin de entradaMemoriaRangosFichero_op_cinco_seis()

####################################################################################
# Sinopsis: Se guardarán los datos en los ficheros que corresponda para las opciones 5 y 6 
####################################################################################
function entradaMemoriaRangosFichero_op_cinco_seis_Post_1 {
	#No se establece desde fichero sino que se decide en el momento de la ejecución mediante la variable de selección de tipo $seleccionTipoPrioridad.
	if [[ $seleccionTipoPrioridad -eq 1 ]]; then #M/m
		PrioR="Mayor"
	else    
		PrioR="Menor"                
	fi              
	if [[ $p -eq 0 ]]; then
		echo -ne "Marcos totales\n"$mem_num_marcos"\nTamano de pagina\n"$mem_direcciones"\nPrioridad menor\n"$prio_menorInicial\
		"\nPrioridad mayor\n"$prio_mayorInicial"\nTipo de prioridad\n"$PrioR "\nMinimo para reubicabilidad\n"$reub"\nQuantum\n"$quantum\
		"\nTll nMar Prio Direcciones:\n" > $nomFicheroDatos
	fi                  

	direccionesAcumuladas="" #Hace que las direcciones sean diferentes en cada proceso.
	MIN_RANGE_PAGINA_MODIFICADA=0 #Se usarán para determinar de forma aleatoria si una página es o no modificada al ser ejecutada en los algoritmos NFU y NRU.
	MAX_RANGE_PAGINA_MODIFICADA=1
	for (( numdir=0; numdir<${ejecucion[$p]}; numdir++)); do #Muestra las direcciones del proceso calculadas de forma aleatoria.
		calcDatoAleatorioGeneral $MIN_RANGE_PAGINA_MODIFICADA $MAX_RANGE_PAGINA_MODIFICADA  #Se calcula de forma aleatoria si una página es o no modificada al ser ejecutada.
		directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]=$datoAleatorioGeneral  #Se almacena el cálculo aleatorio de si una página es o no modificada al ser ejecutada.
		direccionesAcumuladas+=`echo -ne " ${directions[$p,$numdir]}-${directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]}"`
	done
	echo -e ${llegada[$p]} ${memoria[$p]} ${prioProc[$p]} $direccionesAcumuladas >> $nomFicheroDatos
} #Fin de entradaMemoriaRangosFichero_op_cinco_seis()

####################################################################################
# Sinopsis: Se copian los ficheros que correspondan para las opciones 5 y 6
####################################################################################
function entradaMemoriaRangosFichero_op_cinco_seis_Post_2 {
	#Se borran los últimos ficheros de datos usados, se vuelven a crear y se escriben los datos en los nuevos ficheros.
	if [[ -f "$ficheroDatosAnteriorEjecucion" ]]; then
		rm $ficheroDatosAnteriorEjecucion
	fi
	if [[ -f "$ficheroRangosAnteriorEjecucion" && $seleccionMenuEleccionEntradaDatos -ne 5 ]]; then
		rm $ficheroRangosAnteriorEjecucion
	fi
	cp $nomFicheroDatos $ficheroDatosAnteriorEjecucion  #Copia los ficheros Default/Último       
	if [[ $seleccionMenuEleccionEntradaDatos -ne 5 ]]; then
		cp $nomFicheroRangos $ficheroRangosAnteriorEjecucion  #Copia los ficheros Default/Último       
	fi
} #Fin de entradaMemoriaRangosFichero_op_cinco_seis_Post_2()

####################################################################################
# Sinopsis: Se calculan los valores aleatorios y los datos con los que se trabajará para las opciones 7, 8 y 9. 
####################################################################################
function entradaMemoriaRangosFichero_op_cuatro_cinco_seis_Comun {                          
#    clear   
	variableReubicar=$reub
	#----------------Empieza a introducir procesos------------         
	proc=$(($p-1))
	if [[ $((p + 1)) -ge 10 ]]; then
		nombre="P$((p + 1))"
	else
		nombre="P0$((p + 1))" 
	fi
	proceso[$p]=$nombre; #Se añade el nombre del proceso al vector
	numeroproceso[$p]=$p #Se guarda su número en un vector para la función que lo ordena
	calcDatoAleatorioGeneral $MIN_RANGE_llegada $MAX_RANGE_llegada
	llegada[$p]=$datoAleatorioGeneral #Se añade el tiempo de llegada al vector
	calcDatoAleatorioGeneral $MIN_RANGE_tiempo_ejec $MAX_RANGE_tiempo_ejec
	ejecucion[$p]=$datoAleatorioGeneral #Se añade el tiempo de ejecución al vector
	calcDatoAleatorioGeneral $MIN_RANGE_tamano_marcos_proc $MAX_RANGE_tamano_marcos_proc
	memoria[$p]=$datoAleatorioGeneral #Se añade el tamaño de ejecución al vector
	calcDatoAleatorioGeneral $prio_menor $prio_mayor
	prioProc[$p]=$datoAleatorioGeneral #Se añade la prioridad del proceso al vector
	prio_proc=$datoAleatorioGeneral #Se crea otra variable para hacer compatible este código con otro código anterior.
	
	#Se definen las Direcciones de cada Proceso
	tiempoEjecucion[$p]=${ejecucion[$p]} #Para ser equivalente al nuevo programa 
	calcDatoAleatorioGeneral $MIN_RANGE_tamano_direcciones_proc $MAX_RANGE_tamano_direcciones_proc #Primero se calcula el tamaño en direcciones del proceso.
	tamano_direcciones_proc=$datoAleatorioGeneral
	for (( numdir = 0; numdir <= ${ejecucion[$p]}; numdir++ )); do
		calcDatoAleatorioGeneral 1 $tamano_direcciones_proc #Luego se calculan las direcciones aplicando la búsqueda aleatoria hasta el tamaño en direcciones dle proceso precalculado.
		directions[$p,$numdir]=$datoAleatorioGeneral
		if [[ $seleccionAlgoritmoPaginacion -eq 0 && ${directions[$p,$numdir]} -gt $(($numDireccionesTotales_max - 1)) ]]; then #$numDireccionesTotales_max viene de leer_rangos_desde_fichero() y se comparará con las direcciones definidas, ya que las direcciones deben ser menores en el caso de memoria No Virtual.
			echo -e "\n***Error en la lectura de rangos. La dirección de memoria utilizada ("${directions[$p,$numdir]}") está fuera del rango máximo definido por el número de marcos de página ("$(($numDireccionesTotales_max - 1))")."
			exit 1 
		fi
		transformapag directions[$p,$numdir] $numdir #let pagTransformadas[$2]=`expr $1/$mem_direcciones`
		paginasDefinidasTotal[$p,$numdir]=${pagTransformadas[$numdir]} 
	done
} #Fin de entradaMemoriaRangosFichero_op_cuatro_cinco_seis_Comun()
			
#################################################################################### 
# Sinopsis: Pregunta en qué fichero guardar los rangos para la opción 8.
####################################################################################
function entradaMemoriaRangosFichero_op_siete_Previo {
#    clear 
	preguntaDondeGuardarRangosAleTManuales #Resuelve los nombres de los ficheros de rangos amplios
	preguntaDondeGuardarRangosManuales #Resuelve los nombres de los ficheros de rangos
	preguntaDondeGuardarDatosManuales #Resuelve los nombres de los ficheros de datos
} #Fin de entradaMemoriaRangosFichero_op_siete_Previo()

####################################################################################
# Sinopsis: Se piden y tratan los mínimos y máximos de los rangos para las opciones 7, 8 y 9. El cálculo de los datos 
# aleatorios con los que se trabajará se hace en entradaMemoriaRangosFichero_op_siete_ocho_nueve_Comun.  
####################################################################################
function entradaMemoriaRangosFichero_op_siete_ocho_nueve { 
	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_numero_marcos_memoria_amplio  #Llamada a funciones para definir las variables con los límites de los rangos amplios.
	fi                     
	calcDatoAleatorioGeneral $memoria_minInicial $memoria_maxInicial #Se definen nuevas variables para redefinir los límites de los subrangos sacados de los rangos amplios. 
	MIN_RANGE_MARCOSInicial=$datoAleatorioGeneral	
	calcDatoAleatorioGeneral $memoria_minInicial $memoria_maxInicial 
	MAX_RANGE_MARCOSInicial=$datoAleatorioGeneral
	tratarRangoPrioridadesDirecta $MIN_RANGE_MARCOSInicial $MAX_RANGE_MARCOSInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_MARCOS=$PriomFinal
	MAX_RANGE_MARCOS=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_MARCOS $MAX_RANGE_MARCOS #Se calculan los valores que no dependen de los procesos desde los subrangos ya calculados. 
	mem_num_marcos=$datoAleatorioGeneral

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_numero_direcciones_marco_amplio 
	fi                     
	calcDatoAleatorioGeneral $direcciones_minInicial $direcciones_maxInicial 
	MIN_RANGE_DIRECCIONESInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $direcciones_minInicial $direcciones_maxInicial 
	MAX_RANGE_DIRECCIONESInicial=$datoAleatorioGeneral
	tratarRangoPrioridadesDirecta $MIN_RANGE_DIRECCIONESInicial $MAX_RANGE_DIRECCIONESInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_DIRECCIONES=$PriomFinal
	MAX_RANGE_DIRECCIONES=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_DIRECCIONES $MAX_RANGE_DIRECCIONES
	mem_direcciones=$datoAleatorioGeneral
	numDireccionesTotales_max=$(($mem_num_marcos * $mem_direcciones)) #Dato usado para compararlo con la mayor dirección a ejecutar para saber si cabe en memoria No Virtual.

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_prio_menor_amplio 
	fi                     
	tratarRangoPrioridadesDirecta $prio_menor_minInicial $prio_menor_maxInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	prio_menor_min=$PriomFinal #Variables con los originales usadas para calcular subrangos y datos finales 
	prio_menor_max=$PrioMFinal
	calcDatoAleatorioGeneral $prio_menor_min $prio_menor_max #calcMinPrioPro #Mínimos #Prioridades asociadas a los procesos.
	MIN_RANGE_prio_menorInicial=$datoAleatorioGeneral  #Desde este rango amplio se calculan los subrangos desde los que calcular el rango desde el que calcular los datos.
	calcDatoAleatorioGeneral $prio_menor_min $prio_menor_max #calcMaxPrioPro 
	MAX_RANGE_prio_menorInicial=$datoAleatorioGeneral          
	tratarRangoPrioridadesDirecta $MIN_RANGE_prio_menorInicial $MAX_RANGE_prio_menorInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_prio_menor=$PriomFinal
	MAX_RANGE_prio_menor=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_prio_menor $MAX_RANGE_prio_menor #calcMem #Datos generales
	prio_menorInicial=$datoAleatorioGeneral #Desde este subrango se calcula el rango desde el que calcular los datos.

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_prio_mayor_amplio 
	fi                     
	tratarRangoPrioridadesDirecta $prio_mayor_minInicial $prio_mayor_maxInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	prio_mayor_min=$PriomFinal
	prio_mayor_max=$PrioMFinal
	calcDatoAleatorioGeneral $prio_mayor_min $prio_mayor_max #calcMinPrioPro #Mínimos #Prioridades asociadas a los procesos.
	MIN_RANGE_prio_mayorInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $prio_mayor_min $prio_mayor_max #calcMaxPrioPro 
	MAX_RANGE_prio_mayorInicial=$datoAleatorioGeneral          
	tratarRangoPrioridadesDirecta $MIN_RANGE_prio_mayorInicial $MAX_RANGE_prio_mayorInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_prio_mayor=$PriomFinal
	MAX_RANGE_prio_mayor=$PrioMFinal
	calcDatoAleatorioGeneral $MIN_RANGE_prio_mayor $MAX_RANGE_prio_mayor #calcMem #Datos generales
	prio_mayorInicial=$datoAleatorioGeneral

	tratarRangoPrioridadesDirecta $prio_menorInicial $prio_mayorInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	prio_menor=$PriomFinal #Desde este rango se calculan los datos.
	prio_mayor=$PrioMFinal

	PriomInicial=$prio_menorInicial #Variables con los datos originales usadas en la cabecera de la representación de la tabla
	PrioMInicial=$prio_mayorInicial

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_tamano_reubicacion_amplio 
	fi                     
	calcDatoAleatorioGeneral $reubicacion_minInicial $reubicacion_maxInicial 
	MIN_RANGE_REUBInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $reubicacion_minInicial $reubicacion_maxInicial 
	MAX_RANGE_REUBInicial=$datoAleatorioGeneral
	tratarRangoPrioridadesDirecta $MIN_RANGE_REUBInicial $MAX_RANGE_REUBInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
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
	tratarRangoPrioridadesDirecta $MIN_RANGE_NPROCInicial $MAX_RANGE_NPROCInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
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
	tratarRangoPrioridadesDirecta $MIN_RANGE_llegadaInicial $MAX_RANGE_llegadaInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_llegada=$PriomFinal
	MAX_RANGE_llegada=$PrioMFinal

	if [[ $seleccionMenuEleccionEntradaDatos -eq 7 ]]; then   
		datos_tiempo_ejecucion_amplio 
	fi                     
	calcDatoAleatorioGeneral $tiempo_ejec_minInicial $tiempo_ejec_maxInicial 
	MIN_RANGE_tiempo_ejecInicial=$datoAleatorioGeneral
	calcDatoAleatorioGeneral $tiempo_ejec_minInicial $tiempo_ejec_maxInicial 
	MAX_RANGE_tiempo_ejecInicial=$datoAleatorioGeneral
	tratarRangoPrioridadesDirecta $MIN_RANGE_tiempo_ejecInicial $MAX_RANGE_tiempo_ejecInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_tiempo_ejec=$PriomFinal
	MAX_RANGE_tiempo_ejec=$PrioMFinal
	
	#Los límites se establecen de forma diferente porque no pueden ser mayores que el tamaño de la memoria. 
	#Tampoco es igual al sistema usado en los rangos reducidos por usar dos sistemas diferentes. Aquí se usa el mínimo como 1 y se calcula el máximo por debajo de otro máximo para que no sean números grandes. 
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
	tratarRangoPrioridadesDirecta $MIN_RANGE_quantumInicial $MAX_RANGE_quantumInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
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
	tratarRangoPrioridadesDirecta $MIN_RANGE_tamano_direcciones_procInicial $MAX_RANGE_tamano_direcciones_procInicial #Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
	MIN_RANGE_tamano_direcciones_proc=$PriomFinal
	MAX_RANGE_tamano_direcciones_proc=$PrioMFinal    
	#------------------------------------------------------ 
	datos_amplio_memoria_tabla #Se imprime una tabla con los datos de los rangos introducidos, los subrangos y los valores calculables.

#    clear
	p=0
	until [[ $p -eq $n_prog ]]; do  
		entradaMemoriaRangosFichero_op_siete_ocho_nueve_Comun #Se calculan los valores aleatorios y los datos con los que se trabajará para las opciones 7, 8 y 9. 
		entradaMemoriaRangosFichero_op_siete_ocho_nueve_Post_1 #Guarda los datos en los ficheros que correspondan
#        clear
		p=`expr $p + 1` #Se incrementa el contador
	done #cierre del do del while $pro=="S"
	entradaMemoriaRangosFichero_op_siete_ocho_nueve_Post_2 #Copia los ficheros Default/Último
} #Fin de entradaMemoriaRangosFichero_op_siete_ocho_nueve()

####################################################################################
# Sinopsis: Se guardarán los datos en los ficheros que corresponda para la opción 4
####################################################################################
function entradaMemoriaRangosFichero_op_siete_ocho_nueve_Post_1 { 
	#No se establece desde fichero sino que se decide en el momento de la ejecución mediante la variable de selección de tipo $seleccionTipoPrioridad.
	if [[ $seleccionTipoPrioridad -eq 1 ]]; then #M/m
		PrioR="Mayor"
	else    
		PrioR="Menor"                
	fi              
	if [[ $p -eq 0 ]]; then
		echo -ne "Marcos totales\n"$mem_num_marcos"\nTamano de pagina\n"$mem_direcciones"\nPrioridad menor\n"$prio_menorInicial\
		"\nPrioridad mayor\n"$prio_mayorInicial"\nTipo de prioridad\n"$PrioR "\nMinimo para reubicabilidad\n"$reub"\nQuantum\n"$quantum\
		"\nTll nMar Prio Direcciones:\n" > $nomFicheroDatos
	fi                  

	direccionesAcumuladas="" #Hace que las direcciones sean diferentes en cada proceso.
	MIN_RANGE_PAGINA_MODIFICADA=0 #Se usarán para determinar de forma aleatoria si una página es o no modificada al ser ejecutada en los algoritmos NFU y NRU.
	MAX_RANGE_PAGINA_MODIFICADA=1
	for (( numdir=0; numdir<${ejecucion[$p]}; numdir++)); do #Muestra las direcciones del proceso calculadas de forma aleatoria.
		calcDatoAleatorioGeneral $MIN_RANGE_PAGINA_MODIFICADA $MAX_RANGE_PAGINA_MODIFICADA  #Se calcula de forma aleatoria si una página es o no modificada al ser ejecutada.
		directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]=$datoAleatorioGeneral  #Se almacena el cálculo aleatorio de si una página es o no modificada al ser ejecutada.
		direccionesAcumuladas+=`echo -ne " ${directions[$p,$numdir]}-${directions_AlgPagFrecUsoRec_pagina_modificada[$p,$numdir,0]}"`
	done
	echo -e ${llegada[$p]} ${memoria[$p]} ${prioProc[$p]} $direccionesAcumuladas >> $nomFicheroDatos

	if [[ $p -eq 1 ]]; then #Escribe los rangos en el fichero de rangos selecionado (RangosAleTotalDefault.txt, o el elegido por el usuario). 
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
	fi #Cierre if $p -eq 1 
	if [[ $p -eq 1 ]]; then #Escribe los rangos en el fichero de rangos amplios selecionado 
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
	fi #Cierre if $p -eq 1
} #Fin de entradaMemoriaRangosFichero_op_siete_Post_1()

####################################################################################
# Sinopsis: Se copian los ficheros que correspondan para la opción 4
####################################################################################
function entradaMemoriaRangosFichero_op_siete_ocho_nueve_Post_2 { 
	if [[ -f "$ficheroDatosAnteriorEjecucion" ]]; then #Borra el fichero de datos ultimo y escribe los datos en el fichero
		rm $ficheroDatosAnteriorEjecucion
	fi
	if [[ -f "$ficheroRangosAnteriorEjecucion" ]]; then #Borra el fichero de datos ultimo y escribe los rangos en el fichero
		rm $ficheroRangosAnteriorEjecucion
	fi
	cp $nomFicheroDatos $ficheroDatosAnteriorEjecucion
	cp $nomFicheroRangos $ficheroRangosAnteriorEjecucion
	if [[ $seleccionMenuEleccionEntradaDatos -ne 8 ]]; then #Actualiza el fichero de rangos amplios de última ejecución (RangosAleTotalLast.txt) como copia del fichero utilizado para los rangos amplios (RangosAleTotalDefault.txt, o el elegido por el usuario).
		if [[ -f "$ficheroRangosAleTotalAnteriorEjecucion" ]]; then #Borra el fichero de datos ultimo y escribe los rangos amplios en el fichero
			rm $ficheroRangosAleTotalAnteriorEjecucion
		fi
		cp $nomFicheroRangosAleT $ficheroRangosAleTotalAnteriorEjecucion        
	fi
} #Fin de entradaMemoriaRangosFichero_op_siete_Post_2()
		   
####################################################################################
# Sinopsis: Pregunta en qué fichero guardar los rangos para la opción 8.
####################################################################################
function entradaMemoriaRangosFichero_op_ocho_Previo {
#    clear
	preguntaDondeGuardarRangosManuales #Resuelve los nombres de los ficheros de rangos
	preguntaDondeGuardarDatosManuales #Resuelve los nombres de los ficheros de datos
} #Fin de entradaMemoriaRangosFichero_op_ocho_Previo()

####################################################################################
# Sinopsis: Pregunta en qué fichero guardar los rangos amplios para la opción 9.
####################################################################################
function entradaMemoriaRangosFichero_op_nueve_Previo {
#    clear
	preguntaDondeGuardarRangosManuales #Resuelve los nombres de los ficheros de rangos
	preguntaDondeGuardarDatosManuales #Resuelve los nombres de los ficheros de datos
	echo -e "\n\nFicheros existentes:\n$NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\nFicheros existentes:\n" >> $informeSinColorTotal  
	files=("./FRangosAleT"/*)
	for i in "${!files[@]}"; do #Localiza en qué posición encuentra el dato (da la posición, pero no la variable en el array)
#    for i in "${files[@]}"; do #Define el dato, pero no en qué posción se encuentra.
		echo -e "$i) ${files[$i]}" | tee -a $informeConColorTotal
		echo -e "$i) ${files[$i]}" >> $informeSinColorTotal  
	done
	echo -e "\n$AMARILLO\n\nIntroduce el número correspondiente al fichero elegido: $NORMAL" | tee -a $informeConColorTotal
	echo -e "\n\n\nIntroduce el número correspondiente al fichero elegido: " >> $informeSinColorTotal 
	read -r numeroFichero
	until [[ "0" -le $numeroFichero && $numeroFichero -lt ${#files[@]} && $numeroFichero -ne "" ]]; do
		echo -ne "Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
		echo -ne "Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
		read -r numeroFichero
		echo -e "$numeroFichero\n\n" >> $informeConColorTotal
		echo -e "$numeroFichero\n\n" >> $informeSinColorTotal
	done
	echo "$numeroFichero" >> $informeConColorTotal
	echo "$numeroFichero" >> $informeSinColorTotal
	ficheroParaLectura="${files[$numeroFichero]}"
#    clear
} #Fin de entradaMemoriaRangosFichero_op_nueve_Previo()

####################################################################################
# Sinopsis: Se calculan los valores aleatorios y los datos con los que se trabajará para las opciones 7, 8 y 9. 
####################################################################################
function entradaMemoriaRangosFichero_op_siete_ocho_nueve_Comun {                          
#    clear   
	variableReubicar=$reub
	#------------------------------Empieza a introducir procesos--------------------            
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
	proceso[$p]=$nombre; #Se añade a el vector ese nombre
	numeroproceso[$p]=$p #Se guarda su número en un vector para la función que lo ordena
	llegada[$p]=$((RANDOM % (MAX_RANGE_llegada - MIN_RANGE_llegada + 1) + MIN_RANGE_llegada)) # Generar un número aleatorio dentro del rango
	ejecucion[$p]=$((RANDOM % (MAX_RANGE_tiempo_ejec - MIN_RANGE_tiempo_ejec + 1) + MIN_RANGE_tiempo_ejec)) # Generar un número aleatorio dentro del rango
	memoria[$p]=$((RANDOM % (MAX_RANGE_tamano_marcos_proc - MIN_RANGE_tamano_marcos_proc + 1) + MIN_RANGE_tamano_marcos_proc)) # Generar un número aleatorio dentro del rango

	calcDatoAleatorioGeneral $prio_menor $prio_mayor
	prioProc[$p]=$datoAleatorioGeneral #Se añade el tamaño de ejecución al vector #Sobra uno
	prio_proc=$datoAleatorioGeneral #Se añade el tamaño de ejecución al vector

	#Se definen las Direcciones de cada Proceso
	tiempoEjecucion[$p]=${ejecucion[$p]} #Para ser equivalente al nuevo programa
	calcDatoAleatorioGeneral $MIN_RANGE_tamano_direcciones_proc $MAX_RANGE_tamano_direcciones_proc #Primero se calcula el tamaño en direcciones del proceso.
	tamano_direcciones_proc=$datoAleatorioGeneral
	for (( numdir = 0; numdir <= ${ejecucion[$p]}; numdir++ )); do
		calcDatoAleatorioGeneral 1 $tamano_direcciones_proc #Luego se calculan las direcciones aplicando la búsqueda aleatoria hasta el tamaño en direcciones dle proceso precalculado.
		directions[$p,$numdir]=$datoAleatorioGeneral
		if [[ $seleccionAlgoritmoPaginacion -eq 0 && ${directions[$p,$numdir]} -gt $(($numDireccionesTotales_max - 1)) ]]; then #$numDireccionesTotales_max viene de leer_rangos_desde_fichero() y se comparará con las direcciones definidas, ya que las direcciones deben ser menores en el caso de memoria No Virtual.
			echo -e "\n***Error en la lectura de rangos amplios. La dirección de memoria utilizada ("${directions[$p,$numdir]}") está fuera del rango máximo definido por el número de marcos de página ("$(($numDireccionesTotales_max - 1))")."
			exit 1
		fi
		transformapag directions[$p,$numdir] $numdir #let pagTransformadas[$2]=`expr $1/$mem_direcciones`
		paginasDefinidasTotal[$p,$numdir]=${pagTransformadas[$numdir]} 
	done
} #Fin de entradaMemoriaRangosFichero_op_siete_ocho_nueve_Comun()

####################################################################################
# Sinopsis: Calcula los datos de la tabla resumen de procesos en cada volcado
####################################################################################
function ajusteFinalTiemposEsperaEjecucionRestante { #ESTADO DE CADA PROCESO EN EL TIEMPO ACTUAL Y HALLAR LAS VARIABLES.
	for (( i=0; i<$nprocesos; i++ )); do #Modificamos los valores de los arrays, restando de lo que quede
		if [[ ${enejecucion[$i]} -eq 1 ]]; then  
			temp_rej[$i]=`expr ${temp_rej[$i]} - 1`
			temp_ret[$i]=`expr ${temp_ret[$i]} + 1` #Se suman para evitar que en el último segundo de ejecución no se sume el segundo de retorno
		fi
		if [[ ${encola[$i]} -eq 1 && ${bloqueados[$i]} -eq 1 ]] ; then #estado[$i]="Bloqueado" - En espera
			temp_wait[$i]=`expr ${temp_wait[$i]} + 1`
			temp_ret[$i]=`expr ${temp_ret[$i]} + 1`
		fi
		if [[ ${enmemoria[$i]} -eq 1 && ${enejecucion[$i]} -eq 1 ]] ; then #estado[$i]="En ejecucion"
			temp_wait[$i]=`expr ${temp_wait[$i]} + 0`
		elif [[ ${enmemoria[$i]} -eq 1 && ${enpausa[$i]} -eq 1 ]] ; then #estado[$i]="En pausa" - En pausa
			temp_wait[$i]=`expr ${temp_wait[$i]} + 1`
			temp_ret[$i]=`expr ${temp_ret[$i]} + 1`
		elif [[ ${enmemoria[$i]} -eq 1 ]] ; then #estado[$i]="En memoria"
			temp_wait[$i]=`expr ${temp_wait[$i]} + 1`
			temp_ret[$i]=`expr ${temp_ret[$i]} + 1`
		fi
	done #Si ha terminado, no se hace nada. Y si no ha llegado, su tiempo de espera es "-"
	for (( i=0; i<$nprocesos; i++ )); do #Se ponen todas las posiciones del vector enejecucion a 0, se establecerá qué proceso está a 1 en cada ciclo del programa.
		bloqueados[$i]=0 #Se desbloquean todos y se establecerán los procesos bloqueados en cada ciclo.
	done
	reloj=`expr $reloj + 1` # Se incrementa el reloj
} #Final de los cálculos para dibujar la banda de tiempos - ajusteFinalTiemposEsperaEjecucionRestante

####################################################################################
# Sinopsis: Se muestran los eventos sucedidos, sobre la tabla resumen.
####################################################################################
function mostrarEventos {
#    clear
	evento=0 #Inicializo evento
	#Se muestran los datos sobre las indicaciones del evento que ha sucedido
	Dato1=""
	Dato2=""
	Dato3=""
	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 0 ]]; then #Paginado pero No Virtual
		algoritmoSeleccionado="FCFS-PaginaciónNoVirtual-"
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 1 ]]; then #FCFS/SJF/SRPT
		algoritmoSeleccionado="FCFS-Paginación-"
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 2 ]]; then    
		algoritmoSeleccionado="SJF-Paginación-"
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 3 ]]; then    
		algoritmoSeleccionado="SRPT-Paginación-" 
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 4 ]]; then    
		algoritmoSeleccionado="Prioridades-"    
		if [[ $seleccionTipoPrioridad -eq 1 ]]; then #M/m
			algoritmoSeleccionado+="Mayor-"
		else    
			algoritmoSeleccionado+="Menor-"                
		fi              
		if [[ $seleccionMenuApropiatividad -eq 1 ]]; then #M/m
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
	if [[ $continuidadNo0Si1 -eq 0 ]]; then #C/NC
		continuidadSeleccionado="NC-"
	else    
		continuidadSeleccionado="C-"                
	fi
	if [[ $reubicabilidadNo0Si1 -eq 0 ]]; then #R/NR
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
	#Se muestra el evento que ha sucedido       
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisosalida[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha salido de memoria." | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha salido de memoria." >> $informeSinColorTotal
			avisosalida[$l]=0 #Se borra el uno para que no se vuelva a imprimir 
		fi
	done
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisollegada[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha llegado al sistema." | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha llegado al sitema." >> $informeSinColorTotal
			avisollegada[$l]=0 #Se borra el uno para que no se vuelva a imprimir 
		fi
	done
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisoentrada[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha entrado de memoria. " | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha entrado en memoria." >> $informeSinColorTotal
			avisoentrada[$l]=0 #Se borra el uno para que no se vuelva a imprimir 
		fi
	done
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisoEntradaCPU[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha entrado en CPU. " | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha entrado en CPU." >> $informeSinColorTotal
			avisoEntradaCPU[$l]=0 #Se borra el uno para que no se vuelva a imprimir 
		fi
	done
	for ((l=0 ;l<nprocesos; l++)); do
		if [[ ${avisoPausa[$l]} -eq 1 ]]; then
			echo -e " El proceso$NC ${varC[$l]}${proceso[$l]}$NC ha quedado en pausa. " | tee -a $informeConColorTotal
			echo -e " El proceso ${proceso[$l]} ha quedado en pausa." >> $informeSinColorTotal
			avisoPausa[$l]=0 #Se borra el uno para que no se vuelva a imprimir 
		fi
	done
} #Fin de mostrarEventos() - Final de mostrar los eventos sucedidos - mostrarEventos

####################################################################################
# Sinopsis: Prepara e imprime la tabla resumen de procesos en cada volcado - SIN CUADRO
####################################################################################
function dibujarTablaDatos {
	mem_aux=$[ $mem_num_marcos -1 ]
	j=0
	k=0
	for (( i=0; i<$nprocesos; i++ )); do
		if [[ ${enmemoria[$i]} -eq 1 ]]; then
			guardados[$j]=$i #Se guardan en cada posición el número del proceso correspondiente 
			coloresAux[$k]=${coloress[$i % 6]} 
			j=`expr $j + 1`
		fi
		k=`expr $k + 1`
	done
	j=0
	k=0
	#CALCULAR LOS DATOS A REPRESENTAR.
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
		if [[ ${estad[$i]} -eq 0 ]]; then #Fuera del Sistema
			inicio2[$i]="-"
			final2[$i]="-" 
			temp_wait[$i]="-"
			temp_ret[$i]="-"
			temp_rej[$i]="-"
			estado[$i]="Fuera del Sistema"
		elif [[ ${estad[$i]} -eq 1 ]]; then #En Espera
			inicio2[$i]="-"
			final2[$i]="-"
			estado[$i]="En espera"
		elif [[ ${estad[$i]} -eq 2 ]]; then #En Memoria
			estado[$i]="En memoria"
		elif [[ ${estad[$i]} -eq 3 ]]; then #En Ejecucion
			estado[$i]="En ejecución"
		elif [[ ${estad[$i]} -eq 4 ]]; then #En Pausa
			estado[$i]="En pausa"
		elif [[ ${estad[$i]} -eq 5 ]]; then #Finalizado
			inicio2[$i]="-"
			final2[$i]="-" 
			temp_rej[$i]="-"
			estado[$i]="Finalizado"
		fi
			varC[$i]=${coloress[$i % 6]}
	done

	#REPRESENTAR LOS DATOS
	#Se ajusta a parte el vector de memoria inicial y final NO CONTINUA para CUADRAR (he comentado lo que cuadraba lo de antes)(modificación 2020)
	#Ajuste para la memoria no continua en un auxiliar (se imprime el auxiliar)
	#Se copia los normales al auxiliar
	inicialNCaux=("${inicialNC[@]}")
	finalNCaux=("${finalNC[@]}")
 	datos4=""
	if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then #Si han sido usadas, se subrayan
		datos4="-Modificación"
	fi

	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 4 ]]; then #Para Prioridades
		echo -e " Ref Tll Tej Mem Pri TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " | tee -a $informeConColorTotal   
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────────" | tee -a $informeConColorTotal
		echo -e " Ref Tll Tej Mem Pri TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " >> $informeSinColorTotal
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────────" >> $informeSinColorTotal
		m=0 #Se aplica el $m a memoria inicial y memoria final (los auxiliares que son los que se imprimen en el volcado)
		for (( i=0; i<$nprocesos; i++ )) ; do  #Se usa m porque i recorre los procesos y m controla las unidades usadas por cada proceso, normalmente 0 o 1, y también las unidades de los n trozos de memoria asociados a cada proceso. 
			echo -ne " ${varC[$i]}${proceso[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#llegada[$i]})${varC[$i]}${llegada[$i]}$NC" "$(imprimirEspaciosEstrechos ${#ejecucion[$i]})${varC[$i]}${ejecucion[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#memoria[$i]})${varC[$i]}${memoria[$i]}$NC" "$(imprimirEspaciosEstrechos ${#prioProc[$i]})${varC[$i]}${prioProc[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#temp_wait[$i]})${varC[$i]}${temp_wait[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_ret[$i]})${varC[$i]}${temp_ret[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#temp_rej[$i]})${varC[$i]}${temp_rej[$i]}$NC" "$(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC"\
			"$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC" "${varC[$i]}${estado[$i]}""$(imprimirEspaciosMuyAnchos ${#estado[$i]})$NC " | tee -a $informeConColorTotal
			DireccionesPaginasPorProceso=""
			varImprimirPaginaUsada="\e[4m" #Subrayado
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
				if [[ ${numeroPaginasUsadasProceso[$i]} -gt $counter2 ]]; then #Si han sido usadas, se subrayan
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
			for (( b=1; b<${bloques[$i]}; b++ )) ; do  #Recorre el número de bloques en los que se fragmenta un proceso
				echo -ne "                                $(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC " | tee -a $informeConColorTotal
				echo -e "$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC                  " | tee -a $informeConColorTotal
				echo -ne "                                $(imprimirEspaciosAnchosBN ${#inicialNCaux[$m]})${inicialNCaux[$m]} " >> $informeSinColorTotal
				echo -e "$(imprimirEspaciosAnchosBN ${#finalNCaux[$m]})${finalNCaux[$m]}                   " >> $informeSinColorTotal
				m=$((m+1))
			done
		done
	elif [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then #Para Round-Robin 
		echo -e " Ref Tll Tej Mem TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " | tee -a $informeConColorTotal   
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────" | tee -a $informeConColorTotal
		echo -e " Ref Tll Tej Mem TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " >> $informeSinColorTotal
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────" >> $informeSinColorTotal
		m=0 #Se aplica el $m a memoria inicial y memoria final (los auxiliares que son los que se imprimen en el volcado)
		for (( i=0; i<$nprocesos; i++ )) ; do  #Se usa m porque i recorre los procesos y m controla las unidades usadas por cada proceso, normalmente 0 o 1, y también las unidades de los n trozos de memoria asociados a cada proceso. 
			echo -ne " ${varC[$i]}${proceso[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#llegada[$i]})${varC[$i]}${llegada[$i]}$NC" "$(imprimirEspaciosEstrechos ${#ejecucion[$i]})${varC[$i]}${ejecucion[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#memoria[$i]})${varC[$i]}${memoria[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_wait[$i]})${varC[$i]}${temp_wait[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#temp_ret[$i]})${varC[$i]}${temp_ret[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_rej[$i]})${varC[$i]}${temp_rej[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC" "$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC"\
			"${varC[$i]}${estado[$i]}""$(imprimirEspaciosMuyAnchos ${#estado[$i]})$NC " | tee -a $informeConColorTotal
			DireccionesPaginasPorProceso=""
			varImprimirPaginaUsada="\e[4m" #Subrayado
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
				if [[ ${numeroPaginasUsadasProceso[$i]} -gt $counter2 ]]; then #Si han sido usadas, se subrayan
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
			"${estado[$i]}""$(imprimirEspaciosMuyAnchosBN ${#estado[$i]}) " >> $informeSinColorTotal
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
			for (( b=1; b<${bloques[$i]}; b++ )) ; do #Recorre el número de bloques en los que se fragmenta un proceso
				echo -ne "                                $(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC " | tee -a $informeConColorTotal
				echo -e "$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC                  " | tee -a $informeConColorTotal
				echo -ne "                                $(imprimirEspaciosAnchosBN ${#inicialNCaux[$m]})${inicialNCaux[$m]} " >> $informeSinColorTotal
				echo -e "$(imprimirEspaciosAnchosBN ${#finalNCaux[$m]})${finalNCaux[$m]}                   " >> $informeSinColorTotal
				m=$((m+1))
			done
		done
	else #Para FCFS/SJF/SRPT 
		echo -e " Ref Tll Tej Mem TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " | tee -a $informeConColorTotal   
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────" | tee -a $informeConColorTotal
		echo -e " Ref Tll Tej Mem TEsp Tret Trej Mini Mfin Estado            Direcciones-Página$datos4   " >> $informeSinColorTotal
		echo -e " ────────────────────────────────────────────────────────────────────────────────────────" >> $informeSinColorTotal
		m=0 #Se aplica el $m a memoria inicial y memoria final (los auxiliares que son los que se imprimen en el volcado)
		for (( i=0; i<$nprocesos; i++ )) ; do  #Se usa m porque i recorre los procesos y m controla las unidades usadas por cada proceso, normalmente 0 o 1, y también las unidades de los n trozos de memoria asociados a cada proceso. 
			echo -ne " ${varC[$i]}${proceso[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#llegada[$i]})${varC[$i]}${llegada[$i]}$NC" "$(imprimirEspaciosEstrechos ${#ejecucion[$i]})${varC[$i]}${ejecucion[$i]}$NC"\
			"$(imprimirEspaciosEstrechos ${#memoria[$i]})${varC[$i]}${memoria[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_wait[$i]})${varC[$i]}${temp_wait[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#temp_ret[$i]})${varC[$i]}${temp_ret[$i]}$NC" "$(imprimirEspaciosAnchos ${#temp_rej[$i]})${varC[$i]}${temp_rej[$i]}$NC"\
			"$(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC" "$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC"\
			"${varC[$i]}${estado[$i]}""$(imprimirEspaciosMuyAnchos ${#estado[$i]})$NC " | tee -a $informeConColorTotal
			DireccionesPaginasPorProceso=""
			varImprimirPaginaUsada="\e[4m" #Subrayado
			datos4=""
			for ((counter2=0;counter2<${ejecucion[$i]};counter2++)); do
				if [[ $seleccionAlgoritmoPaginacion -eq 10 || $seleccionAlgoritmoPaginacion -eq 11 || $seleccionAlgoritmoPaginacion -eq 16 || $seleccionAlgoritmoPaginacion -eq 17 ]]; then 
					datos4="-"${directions_AlgPagFrecUsoRec_pagina_modificada[$i,$counter2,0]}
				fi
				if [[ ${numeroPaginasUsadasProceso[$i]} -gt $counter2 ]]; then #Si han sido usadas, se subrayan
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
			"${estado[$i]}""$(imprimirEspaciosMuyAnchosBN ${#estado[$i]}) " >> $informeSinColorTotal
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
			for (( b=1; b<${bloques[$i]}; b++ )) ; do #Recorre el número de bloques en los que se fragmenta un proceso
				echo -ne "                                $(imprimirEspaciosAnchos ${#inicialNCaux[$m]})${varC[$i]}${inicialNCaux[$m]}$NC " | tee -a $informeConColorTotal
				echo -e "$(imprimirEspaciosAnchos ${#finalNCaux[$m]})${varC[$i]}${finalNCaux[$m]}$NC                  " | tee -a $informeConColorTotal
				echo -ne "                                $(imprimirEspaciosAnchosBN ${#inicialNCaux[$m]})${inicialNCaux[$m]} " >> $informeSinColorTotal
				echo -e "$(imprimirEspaciosAnchosBN ${#finalNCaux[$m]})${finalNCaux[$m]}                   " >> $informeSinColorTotal
				m=$((m+1))
			done
		done
	fi

	#CALCULAR Y REPRESENTAR LOS PROMEDIOS
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
		if [[ ${estad[$i]} -ne 0 && $tam -le $mem_num_marcos ]]; then #Si el tamaño del proceso es menor o igual que el de memoria
			suma_espera=$(($suma_espera + ${temp_wait[$i]})) #suma para sacar su promedio
			promedio_espera=$(echo "scale=2; $suma_espera/$dividir" | bc)  #promedio
			suma_retorno=$(($suma_retorno + ${temp_ret[$i]})) #suma para sacar su promedio
			promedio_retorno=$(echo "scale=2; $suma_retorno/$dividir" | bc) #promedio
		fi
	done
	var_uno=1
	echo -e "$NC T. espera medio: $promedio_espera\t      T. retorno medio: $promedio_retorno$NC" | tee -a $informeConColorTotal 
	echo -e " T. espera medio: $promedio_espera\t       T. retorno medio: $promedio_retorno" >> ./$informeSinColorTotal
} #Fin de dibujarTablaDatos() - Final de dibujar la banda de tiempos - dibujarTablaDatos

####################################################################################
# Sinopsis: Sacar procesos terminados de memoria y actualizar variables de la Banda de Memoria.
####################################################################################
function calculosActualizarVariablesBandaMemoria {
	#Sucesión: sacar procesos, actualizar variables de memoria guardadoMemoria y tamanoGuardadoMemoria
	for (( po=0; po<$nprocesos; po++ )); do #Se libera espacio en memoria de los procesos recien terminados. 
		if [[ ${enmemoria[$po]} == 0 && ${escrito[$po]} == 1 ]]; then 
			for (( ra=0; ra<$mem_num_marcos; ra++ )); do
				if [[ ${unidMemOcupadas[$ra]} == $po ]]; then
					unidMemOcupadas[$ra]="_" 
				fi
			done
			escrito[$po]=0
		fi
	done
	for (( po=0; po<$nprocesos; po++ )); do #Si los procesos ya no están en memoria se eliminan de la variable guardadoMemoria.
		if [[ ${enmemoria[$po]} -ne 1 ]]; then 
			for (( i=0; i<${#guardadoMemoria[@]} ; i++ )); do 
				if [[ ${guardadoMemoria[$i]} -eq $po ]]; then
					unset guardadoMemoria[$i]
					unset tamanoGuardadoMemoria[$i]
				fi
			done
		fi
	done
	guardadoMemoria=( "${guardadoMemoria[@]}" ) #Se eliminan los huecos vacíos que genera el unset
	tamanoGuardadoMemoria=( "${tamanoGuardadoMemoria[@]}" ) #Se eliminan los huecos vacíos que genera el unset
} #Fin de calculosActualizarVariablesBandaMemoria()

####################################################################################
# Sinopsis: Se realizan los cálculos necesarios para la impresión de la banda de memoria en los volcados.
####################################################################################
function calculosReubicarYMeterProcesosBandaMemoria {
	#Sucesión: Se genera una lista secuencial de procesos en guardadoMemoria y tamanoGuardadoMemoria, se comprueba si hay espacio suficiente en la memoria dependiendo de la continuidad y reubicabilidad definidas, y si lo hay, se mete el proceso.
	if [[ $mem_libre -gt 0 ]]; then 
		if [[ $reubicarReubicabilidad -eq 1 || $reubicarContinuidad -eq 1 ]]; then #Si hay que reubicar, se hace.
			for (( gm=0 ; gm<${#tamanoGuardadoMemoria[@]} ; gm++ )); do #Se reubican los procesos existentes en la memoria en el mismo orden.
				ud=0 #ud contador que guarda las unidades que se van guardando (ud < total)
				ra=0
				while [[ $ud -lt ${tamanoGuardadoMemoria[$gm]} ]]; do  #Se reescriben todos los números de proceso en unidMemOcupadasAux (menor y no menor o igual, ya que se empieza en 0) 
					if [[ ${unidMemOcupadasAux[$ra]} == "_" ]]; then #Se introduce el proceso que ocupa la posición de memoria.
						unidMemOcupadasAux[$ra]=${guardadoMemoria[$gm]}  
						ud=$((ud+1))
					fi
					escrito[${guardadoMemoria[$gm]}]=1 #Se marca que ya se ha escrito en memoria.
					ra=$((ra+1))
				 done
			done
			unidMemOcupadas=("${unidMemOcupadasAux[@]}") #Se copia la memoria auxiliar a la original para que se después se escriba en memoria.
			#Notificamos que se ha reubicado.
			echo -e " La memoria ha sido reubicada." $NC | tee -a $informeConColorTotal
			echo -e " La memoria ha sido reubicada." >> $informeSinColorTotal
		fi
	fi
} #Fin de calculosReubicarYMeterProcesosBandaMemoria()

####################################################################################
# Sinopsis: Determina si el rango es de menor a mayor y si no lo es, lo modifica para convertir el problema con las prioridades invertidas, porque el código sólo resuelve ese caso.
####################################################################################
function tratarRangoPrioridadesDirecta {
	invertirDatoPrioridadesInversa=0 #Será 1 cuando se determine un rango de prioridades cuyo mínimo sea mayor que su máximo.
	if [[ $1 -gt $2 ]]; then 
		aux=$1
		PriomFinal=$2
		PrioMFinal=$aux
		invertirDatoPrioridadesInversa=1 #Será 1 cuando se determine un rango de prioridades cuyo mínimo sea mayor que su máximo.
	else
		PriomFinal=$1
		PrioMFinal=$2
	fi
} #Fin de calculosReubicarYMeterProcesosBandaMemoria()

######################################################################
# Sinopsis: Guardar los procesos que van entrando en memoria de forma secuencial en la variable guardadoMemoria 
# y sus tamaños en tamanoGuardadoMemoria   
#######################################################################
function crearListaSecuencialProcesosAlEntrarMemoria {
	unset guardadoMemoria #Vaciamos el array anterior
	unset tamanoGuardadoMemoria #Vaciamos el array anterior
	for (( ra=0; ra<$mem_num_marcos; ra++ )); do #Determinará qué procesos están en memoria.
		if [[ ${unidMemOcupadas[$ra]} != "_" ]]; then
			numeroProbar=${unidMemOcupadas[$ra]}
			permiso=1
			for (( i=0; i<${#guardadoMemoria[@]} ; i++ )); do #Si el proceso ya está en memoria, no hace falta meterlo.
				if [[ ${guardadoMemoria[$i]} -eq $numeroProbar ]]; then
					permiso=0
				fi
			done
			if [[ $permiso -eq 1 ]]; then #Permiso es la variable que permite meter un proceso en memoria porque haya espacio suficiente.
				guardadoMemoria=("${guardadoMemoria[@]}" "$numeroProbar") #Guarda el número de proceso que va a meter en memoria.
				tamanoGuardadoMemoria=("${tamanoGuardadoMemoria[@]}" "${memoria[$numeroProbar]}") #Guarda el tamaño del proceso que va a meter en memoria.
				permiso=0
			fi
		fi
	done
} #Fin de crearListaSecuencialProcesosAlEntrarMemoria()

#######################################################################
# Sinopsis: Comprueba que cada hueco en memoria no es mayor que la variable definida, para decidir si se reubica. 
#######################################################################
function comprobacionSiguienteProcesoParaReubicar {
	#Sucesión: Se determina qué proceso es el siguiente en entrar en memoria, y dependiendo de la continuidad y reubicabilidad definidas, se establece si hay espacio en memoria. 
	noCabe0Cabe1=1 #Variable para no permitir meter procesos en memoria bajo ciertas condiciones relacionadas con la continuidad. 
	encontradoHuecoMuyReducido=0
	primeraUnidadFuturoProcesoSinreubicar=-1
	raInicioProceso=-1
	reubicarReubicabilidad=0 #En caso de ser memoria no continua, si hay un hueco demasiado pequeño, y se va a usar como parte de la memoria a usar.
	reubicarContinuidad=0 #En caso de ser memoria continua, si no hay un hueco suficientemente grande en el que quepa pero sí en la suma de todos ellos.
	contadorReubicar=-1
	contadorReubicarTotal=0
	siguienteProcesoAMeter=-1
	for (( po=0; po<$nprocesos; po++ )) ; do #Metemos un proceso y comprobamos si hay que reubicar 
		if [[ ${enmemoria[$po]} -eq 1 && ${escrito[$po]} -eq 0 ]]; then #Si está para entrar en memoria y no está dentro se mete, y si ya está dentro se ignora.
			siguienteProcesoAMeter=$po
			break
		fi 
	done
	if [[ $siguienteProcesoAMeter -eq -1 ]]; then
		for (( po=0; po<$nprocesos; po++ )) ; do #Metemos un proceso y comprobamos si hay que reubicar 
			if [[ ${encola[$po]} -eq 1 && ${enmemoria[$po]} -eq 0 && ${escrito[$po]} -eq 0 ]]; then #Si está para entrar en memoria y no está dentro se mete, y si ya está dentro se ignora.
				siguienteProcesoAMeter=$po
				break
			fi 
		done
	fi 
	if [[ $mem_libre -gt 0 ]]; then
		for (( ra=0; ra<$mem_num_marcos; ra++ )); do
			if [[ ${unidMemOcupadas[$ra]} == "_" && siguienteProcesoAMeter -gt -1 ]]; then
				if [[ $contadorReubicar -eq -1 ]]; then #Se designa la primera unidad sobre la que meter el proceso si entrara en memoria continua.
					contadorReubicar=0
					raInicioProceso=$ra
				fi
				contadorReubicar=$((contadorReubicar + 1))
				contadorReubicarTotal=$((contadorReubicarTotal + 1))
				if [[ $contadorReubicar -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $primeraUnidadFuturoProcesoSinreubicar -eq -1 ]]; then 
					#8 - Si cabe en un único hueco en memoria continua.
					primeraUnidadFuturoProcesoSinreubicar=$raInicioProceso               
					break
				fi
			elif [[ ${unidMemOcupadas[$ra]} != "_" && siguienteProcesoAMeter -ne -1 ]]; then
				if [[ $contadorReubicar -ne -1 && $contadorReubicar -le $variableReubicar && $reubicabilidadNo0Si1 -eq 1 ]]; then 
					#Si encuentra un hueco demasiado pequeño mientras busca hueco suficiente y puede caber en la totalidad de los huecos, en memoria no continua.
					encontradoHuecoMuyReducido=1
				fi
				contadorReubicar=-1
			fi
		done
#        if [[ $contadorReubicarTotal -lt ${memoria[$siguienteProcesoAMeter]} ]]; then #No necesario 
#            #1 - 3 - 6 - 9 - No cabe - Ya se considera cuando se resta el tamaño de memoria del proceso a introducir (memoria[$siguienteProcesoAMeter]) de la memoria libre (mem_libre) y comprueba >=0 en comprobacionSiguienteProcesoParaMeterMemoria()
#            noCabe0Cabe1=0 
#            reubicarContinuidad=0
#            reubicarReubicabilidad=0
#        fi
#        if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $encontradoHuecoMuyReducido -eq 0 && $contadorReubicarTotal -gt ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 0 ]]; then #No necesario
#            #2 - Lo meterá en memoria a trozos.
#            noCabe0Cabe1=1
#            reubicarContinuidad=0
#            reubicarReubicabilidad=0
#        fi
#        if [[ $contadorReubicarTotal -lt ${memoria[$siguienteProcesoAMeter]} && $encontradoHuecoMuyReducido -eq 0 && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 1 ]]; then #No necesario
#            #4 - 
#            noCabe0Cabe1=1
#            reubicarContinuidad=0
#            reubicarReubicabilidad=0
#        fi
#        if [[ $contadorReubicarTotal -lt ${memoria[$siguienteProcesoAMeter]} && $primeraUnidadFuturoProcesoSinreubicar -ne -1 && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0 ]]; then #No necesario
#            #7 - 
#            noCabe0Cabe1=0 - No cabe - Ya se considera cuando se resta el tamaño de memoria del proceso a introducir (memoria[$siguienteProcesoAMeter]) de la memoria libre (mem_libre) y comprueba >=0 en comprobacionSiguienteProcesoParaMeterMemoria()
#            reubicarContinuidad=0
#            reubicarReubicabilidad=0
#        fi
#        if [[ $primeraUnidadFuturoProcesoSinreubicar -ne -1  && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0]]; then #No necesario
#            #8 - 
#            noCabe0Cabe1=1
#            reubicarContinuidad=0
#            reubicarReubicabilidad=0
#        fi
#        if [[ $primeraUnidadFuturoProcesoSinreubicar -ne -1 && $encontradoHuecoMuyReducido -eq 0 && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 1 ]]; then #No necesario
#            #10 - 
#            noCabe0Cabe1=1
#            reubicarContinuidad=0
#            reubicarReubicabilidad=0
#        fi
		if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorReubicarTotal -ge ${memoria[$siguienteProcesoAMeter]} && $encontradoHuecoMuyReducido -eq 1 && $continuidadNo0Si1 -eq 0 && $reubicabilidadNo0Si1 -eq 1 ]]; then 
			reubicarReubicabilidad=1 #5 - Si encuentra un hueco demasiado pequeño mientras busca hueco suficiente y puede caber en un hueco, en memoria no continua.
		fi
		if [[ $primeraUnidadFuturoProcesoSinreubicar -gt -1 && $encontradoHuecoMuyReducido -eq 1 && $reubicabilidadNo0Si1 -eq 1 ]]; then 
			reubicarReubicabilidad=0 #11 - Si encuentra un hueco demasiado pequeño mientras busca hueco suficiente y puede caber en un hueco, en memoria no continua.
		fi #No haría falta, porque se metería, pero se considera. Y en caso de encontradoHuecoMuyReducido=0 ta,bién lo metería.
		if [[ $siguienteProcesoAMeter != -1 ]]; then #
			if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorReubicarTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 1 ]] ; then
				reubicarContinuidad=1 #12 - Si no cabe en un único hueco, pero sí en la suma de ellos, en memoria continua.
			fi
		fi
		if [[ $siguienteProcesoAMeter != -1 ]]; then #
			if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorReubicarTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0 ]] ; then
				noCabe0Cabe1=0 #8 - Si no cabe en un único hueco, pero sí en la suma de ellos, en memoria continua.
			fi
		fi
	else
		noCabe0Cabe1=0
	fi
	#Memoria No Continua
		#Memoria No Reubicable
			#1 - Si no cabe entre todos los huecos, no lo meterá en memoria.
			#2 - OK - Si cabe entre todos los huecos, lo meterá en memoria a trozos.
		#Memoria Reubicable
			#3 - Si no cabe entre todos los huecos, no reubica, ni lo meterá en memoria.
			#4 - OK - Si cabe entre todos los huecos, y mientras busca no encuentra un hueco demasiado pequeño, no reubica y lo meterá en memoria a trozos.
			#5 - Hecho - Si cabe entre todos los huecos, y mientras busca encuentra un hueco demasiado pequeño, reubica y lo meterá en memoria.
	#Memoria Continua
		#Memoria No Reubicable
			#6 - Si no cabe entre todos los huecos, no lo meterá en memoria.
			#7 - OK - Si cabe entre todos los huecos, pero no cabe en un único hueco, no lo meterá en memoria.
			#8 - Hecho - Si cabe en un único hueco, lo meterá en memoria.
		#Memoria Reubicable
			#9 - Si no cabe entre todos los huecos, no reubica, ni lo meterá en memoria.
			#10 - OK - Si cabe en un único hueco, y mientras busca no encuentra un hueco demasiado pequeño, no reubica y lo meterá en memoria.
			#11 - Hecho - Si cabe en un único hueco, y mientras busca encuentra un hueco demasiado pequeño, reubica y lo meterá en memoria.
			#12 - Hecho - Si cabe entre todos los huecos, pero no en un único hueco, reubica y lo meterá en memoria.
} #Fin de comprobacionSiguienteProcesoParaReubicar()

#######################################################################
# Sinopsis: Comprueba que cada hueco en memoria es suficiente para meter un proceso en memoria. 
#######################################################################
function comprobacionSiguienteProcesoParaMeterMemoria {
	if [[ $mem_libre -gt 0 && reubicarReubicabilidad -ne 1 && reubicarContinuidad -ne 1 ]]; then
		mem_libreTemp=$mem_libre
		primeraUnidadFuturoProcesoSinreubicar=-1 #No se debería definir porque es un valor arrastrado desde la comprobación en comprobacionSiguienteProcesoParaReubicar()
		#El for se resuelve con i=$po de la línea anterior a la llamada de la función. 
		if [[ ${encola[$i]} -eq 1 && ${enmemoria[$i]} -eq 0 ]]; then #Si están en cola pero no en memoria (en espera)
			noCabe0Cabe1=1 #Variable para no permitir meter procesos en memoria bajo ciertas condiciones relacionadas con la continuidad. 
			encontradoHuecoMuyReducido=0
			raInicioProceso=-1
			contadorMeterMemoria=-1
			contadorMeterMemoriaTotal=0
			siguienteProcesoAMeter=$i
			if [[ $((mem_libreTemp - ${memoria[$i]})) -ge 0 ]]; then
				noCabe0Cabe1=1
				for (( ra=0; ra<$mem_num_marcos; ra++ )); do
					if [[ ${unidMemOcupadas[$ra]} == "_" && siguienteProcesoAMeter -gt -1 ]]; then
						if [[ $contadorMeterMemoria -eq -1 ]]; then #Se designa la primera unidad sobre la que meter el proceso si entrara en memoria continua.
							contadorMeterMemoria=0
							raInicioProceso=$ra
						fi
						contadorMeterMemoria=$((contadorMeterMemoria + 1))
						contadorMeterMemoriaTotal=$((contadorMeterMemoriaTotal + 1))
						if [[ $contadorMeterMemoria -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $primeraUnidadFuturoProcesoSinreubicar -eq -1 ]]; then 
							#8 - Si cabe en un único hueco en memoria continua.
							primeraUnidadFuturoProcesoSinreubicar=$raInicioProceso               
						fi
					elif [[ ${unidMemOcupadas[$ra]} != "_" && siguienteProcesoAMeter -ne -1 ]]; then
						if [[ $contadorMeterMemoria -ne -1 && $contadorMeterMemoria -le $variableReubicar && $reubicabilidadNo0Si1 -eq 1 ]]; then 
							#Si encuentra un hueco demasiado pequeño mientras busca hueco suficiente y puede caber en la totalidad de los huecos, en memoria no continua.
							encontradoHuecoMuyReducido=1
						fi
						contadorMeterMemoria=-1
					fi
				done
				if [[ $siguienteProcesoAMeter != -1 ]]; then #
					if [[ $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorMeterMemoriaTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0 ]] ; then
						noCabe0Cabe1=0 #8 - Si no cabe en un único hueco, pero sí en la suma de ellos, en memoria continua.
					fi
					if [[ $siguienteProcesoAMeter != -1 && $primeraUnidadFuturoProcesoSinreubicar -eq -1 && $contadorMeterMemoriaTotal -ge ${memoria[$siguienteProcesoAMeter]} && $continuidadNo0Si1 -eq 1 && $reubicabilidadNo0Si1 -eq 0 ]] ; then
						noCabe0Cabe1=0 #8 - Si no cabe en un único hueco, pero sí en la suma de ellos, en memoria continua.
					fi
				fi
				#Este if es fundamental para generar las excepciones sobres si se reubica o no, y sobre la unidad de memoria donde empezar a meter el proceso.
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
	for (( j=$i; j<$nprocesos; j++ )); do #Bucle para bloquear los procesos
		bloqueados[$j]=1
	done
	#Memoria No Continua
		#Memoria No Reubicable
			#1 - Si no cabe entre todos los huecos, no lo meterá en memoria.
			#2 - OK - Si cabe entre todos los huecos, lo meterá en memoria a trozos.
		#Memoria Reubicable
			#3 - Si no cabe entre todos los huecos, no reubica, ni lo meterá en memoria.
			#4 - OK - Si cabe entre todos los huecos, y mientras busca no encuentra un hueco demasiado pequeño, no reubica y lo meterá en memoria a trozos.
			#5 - Hecho - Si cabe entre todos los huecos, y mientras busca encuentra un hueco demasiado pequeño, reubica y lo meterá en memoria.
	#Memoria Continua
		#Memoria No Reubicable
			#6 - Si no cabe entre todos los huecos, no lo meterá en memoria.
			#7 - OK - Si cabe entre todos los huecos, pero no cabe en un único hueco, no lo meterá en memoria.
			#8 - Hecho - Si cabe en un único hueco, lo meterá en memoria.
		#Memoria Reubicable
			#9 - Si no cabe entre todos los huecos, no reubica, ni lo meterá en memoria.
			#10 - OK - Si cabe en un único hueco, y mientras busca no encuentra un hueco demasiado pequeño, no reubica y lo meterá en memoria.
			#11 - Hecho - Si cabe en un único hueco, y mientras busca encuentra un hueco demasiado pequeño, reubica y lo meterá en memoria.
			#12 - Hecho - Si cabe entre todos los huecos, pero no en un único hueco, reubica y lo meterá en memoria.
} #Fin de comprobacionSiguienteProcesoParaMeterMemoria()

####################################################################################
# Sinopsis: Se realizan los cálculos necesarios para la impresión de la banda de memoria en los volcados.
####################################################################################
function meterProcesosBandaMemoria {
	if [[ $noCabe0Cabe1 -eq 1 && ${enmemoria[$po]} == 1 && ${escrito[$po]} == 0 ]]; then #Si está para entrar en memoria, y no está dentro se mete, y si ya está dentro se ignora.
		ud=0
		ra=0
		if [[ $primeraUnidadFuturoProcesoSinreubicar -ne -1 ]]; then #Esto permite la continuidad en memoria al necesitar un tramo continuo de memoria y haberlo conseguido.
			ra=$primeraUnidadFuturoProcesoSinreubicar
		fi
		while [[ $ud -lt ${memoria[($po)]} ]]; do  #Esto permite la no continuidad en memoria al no necesitar un tramo continuo de memoria.
			if [[ ${unidMemOcupadas[$ra]} == "_" ]]; then
				unidMemOcupadas[$ra]=$po
				ud=$((ud+1))
				mem_libre=$((mem_libre - 1))
			fi
			encola[$po]=0 #Este proceso ya sólo estará en memoria, ejecutandose o habrá acabado
			escrito[$po]=1 #Se marca que ya está en memoria.
			ResuPunteroMarcoSiguienteFalloPagAcumulado[$po,$reloj]=0 #El ordinal del marco sobre el que se hará el primer fallo de página cuando se introduce un proceso en memoria, siempre será 0 por ser su primer marco libre.
			indiceResuPaginaAcumulado[$po]=$reloj #Se define el primer instante a contemplar en cada proceso como el $reloj ya que será el instante en el que entra en memoria, y por tanto, el primer instante a referenciar para cada proceso.
			ra=$((ra+1))
		done
	fi
} #Fin de meterProcesosBandaMemoria()

####################################################################################
# Sinopsis: Se preparan las líneas para la impresión de la banda de memoria en los volcados - NO Continua y Reubicabilidad.
####################################################################################
function calculosPrepararLineasImpresionBandaMemoria {
	#Sucesión: Crear las tres líneas de la banda de memoria y se generan los bloques que componen la memoria usada por cada proceso en memoria.
	#Se calcula la línea de nombres - Línea 1
	arribaMemoriaNC="   |"
	arribaMemoriaNCb="   |"
	#Si el proceso está en la barra y no está nombrado se escribe. Si está nombrado se llena de _ para que el siguiente coincida con la línea de memoria.
	for (( ra=0; ra<$mem_num_marcos; ra++ )); do
		#Si la posición de memoria no está escrita, añades dígitos para completar los caracteres de la unidad, y la escribes.
		for (( po=0; po<$nprocesos; po++ )); do
			if [[ $ra -eq 0 && ${unidMemOcupadas[$ra]} == $po ]]; then 
				arribaMemoriaNC=$arribaMemoriaNC${coloress[$po % 6]}"${proceso[$po]}""${varhuecos:1:$(($digitosUnidad - ${#proceso[$po]}))}"$NC
				arribaMemoriaNCb=$arribaMemoriaNCb"${proceso[$po]}""${varhuecos:1:$(($digitosUnidad - ${#proceso[$po]}))}"
			fi
			if [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} != $po && ${unidMemOcupadas[$ra]} == $po ]]; then #Si en una posición hay un proceso y antes algo distinto lo nombras
				arribaMemoriaNC=$arribaMemoriaNC${coloress[$po % 6]}"${proceso[$po]}""${varhuecos:1:$(($digitosUnidad - ${#proceso[$po]}))}"$NC
				arribaMemoriaNCb=$arribaMemoriaNCb"${proceso[$po]}""${varhuecos:1:$(($digitosUnidad - ${#proceso[$po]}))}"
			elif [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} == $po && ${unidMemOcupadas[$ra]} == $po ]]; then #Si es un proceso pero no es inicio pones barras bajas
				arribaMemoriaNC=$arribaMemoriaNC${coloress[$po % 6]}"${varhuecos:1:$digitosUnidad}"$NC
				arribaMemoriaNCb=$arribaMemoriaNCb"${varhuecos:1:$digitosUnidad}"
			fi
		done
		#Si es una barra baja (blanco) se llena de _ para seguir alineando.
		if [[ ${unidMemOcupadas[$ra]} == '_' ]]; then 
			arribaMemoriaNC=$arribaMemoriaNC"${varhuecos:1:$digitosUnidad}"$NC
			arribaMemoriaNCb=$arribaMemoriaNCb"${varhuecos:1:$digitosUnidad}"
		fi
	done

	#Se calcula la línea de banda - Línea 2
	unset coloresPartesMemoria #Lo vaciamos ya que cada volcado es diferente. Añadimos valores cada vez que se imprima un bloque
	barraMemoriaNC="BM |"
	barraMemoriaNCbPantalla="BM |" #Para el color se usa esta variable ya que se cuentan los caracteres por línea y no se puede hacer con las secuencias de escape. Además se hace con "█" negros cuando no están siendo usados.
	barraMemoriaNCbFichero="BM |" #Para el fichero de blanco y negro se usa esta variable ya que se cuentan los caracteres por línea y no se puede hacer con las secuencias de escape. Además se hace con "-" cuando no están siendo usados. 
	coloresPartesMemoria=(" ${coloresPartesMemoria[@]}" "${coloress[97]}" "${coloress[97]}" "${coloress[97]}")
	for (( ra=0; ra<$mem_num_marcos; ra++ )); do #En $ra (recorre array) siempre va a haber o un proceso o una barra baja
		if [[ ${unidMemOcupadas[$ra]} != '_' ]] ; then #Se guarda el número de un proceso
			barraMemoriaNC=$barraMemoriaNC${coloress[${unidMemOcupadas[$ra]} % 6]}"${varfondos:1:$digitosUnidad}"$NC
			barraMemoriaNCbPantalla=$barraMemoriaNCbPantalla"${varfondos:1:$digitosUnidad}"
		fi
		if [[ ${unidMemOcupadas[$ra]} == '_' ]]; then #Imprimir 3 blancos si hay una _
			barraMemoriaNC=$barraMemoriaNC" "${coloress[97]}"${varfondos:1:$digitosUnidad}"$NC
			barraMemoriaNCbPantalla=$barraMemoriaNCbPantalla"${varfondos:1:$digitosUnidad}"
		fi
	done

	#Se calcula la línea que escriba la posición de memoria - Línea 3
	abajoMemoriaNC="   |"
	abajoMemoriaNCb="   |"
	for (( ra=0; ra<$mem_num_marcos; ra++ )); do
		#Al final se escriben las unidades de comienzo de los procesos:
		#Si la posición de memoria está o no escrita, se escribe el 0 y se añaden dígitos para completar los caracteres de la unidad.
		if [[ $ra -eq 0 ]] ; then 
			abajoMemoriaNC=$abajoMemoriaNC"${varhuecos:1:$(($digitosUnidad - ${#ra}))}"${coloress[$po % 6]}"$ra"$NC
			abajoMemoriaNCb=$abajoMemoriaNCb"${varhuecos:1:$(($digitosUnidad - ${#ra}))}""$ra"
		fi
		for (( po=0; po<$nprocesos; po++ )); do
			#Si la posición de memoria no está escrita, añades dígitos para completar los caracteres de la unidad, y la escribes.
			if [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} != $po  && ${unidMemOcupadas[$ra]} == $po ]] ; then 
				abajoMemoriaNC=$abajoMemoriaNC"${varhuecos:1:$(($digitosUnidad - ${#ra}))}"${coloress[$po % 6]}"$ra"$NC
				abajoMemoriaNCb=$abajoMemoriaNCb"${varhuecos:1:$(($digitosUnidad - ${#ra}))}""$ra"
			#Si la posición ya está escrita se añaden huecos para las siguientes unidades
			elif [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} == $po  && ${unidMemOcupadas[$ra]} == $po ]] ; then 
				abajoMemoriaNC=$abajoMemoriaNC"${varhuecos:1:$digitosUnidad}"$NC
				abajoMemoriaNCb=$abajoMemoriaNCb"${varhuecos:1:$digitosUnidad}"
			fi
		done
		#Se escribe la posición de los primeros blancos de la misma manera salvo el 0 que ya está escrito.
		#Si la posición de memoria no está escrita se escribe y se añaden dos dígitos en blanco (completar 3 caract).
		if [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} != "_" && ${unidMemOcupadas[$ra]} == "_" ]] ; then 
			abajoMemoriaNC=$abajoMemoriaNC"${varhuecos:1:$(($digitosUnidad - ${#ra}))}"${coloress[97]}"$ra"$NC
			abajoMemoriaNCb=$abajoMemoriaNCb"${varhuecos:1:$(($digitosUnidad - ${#ra}))}""$ra"
		#Posición ya escrita huecos SALVO en caso de que sea la posición 0 (que se escribe siempre si está vacía aunque el último hueco tenga algo).
		elif [[ $ra -ne 0 && ${unidMemOcupadas[$((ra-1))]} == "_" && ${unidMemOcupadas[$ra]} == "_" ]] ; then #Si es un proceso pero no es inicio pones barras bajas
			abajoMemoriaNC=$abajoMemoriaNC"${varhuecos:1:$digitosUnidad}"$NC
			abajoMemoriaNCb=$abajoMemoriaNCb"${varhuecos:1:$digitosUnidad}"
		fi
	done
	
	#Se calcula el número de bloques en los que se fragmentan los procesos.
	if [[ ${unidMemOcupadas[0]} != "_" ]] ; then #Se determina is hay un proceso en la primera unidad de memoria y qué proceso es, y se define como primer bloque.
		bloques[$((unidMemOcupadas[0]))]=1 #Determina el número de bloques en los que se fragmenta un proceso
	fi
	for (( ra=1; ra<$mem_num_marcos; ra++ )); do
		if [[ ${unidMemOcupadas[$ra]} != "_" && ${unidMemOcupadas[$ra]} != ${unidMemOcupadas[$((ra - 1))]} ]] ; then #menor
			bloques[$((unidMemOcupadas[$ra]))]=$((bloques[$((unidMemOcupadas[$ra]))] + 1))  #Determina el número de bloques en los que se fragmenta un proceso
		fi
	done
	#Se cuenta el número de datos que tienen que tener los arrays posición inicial/final. Si bloques de algo equivale a 0 o 1, se suma 1. Si no, se suma el número de bloques.
	for (( i=0; i<$nprocesos; i++ )) ; do #El array de bloques tiene el mismo número de posiciones que el de procesos.
		if [[ ${bloques[$i]} -le 1 ]]; then #Una por proceso, esté o no en memoria, y una más por cada bloque añadido más allá del primero.  #Recorre el número de bloques en los que se fragmenta un proceso
			nposiciones=$((nposiciones+1)) #Número de procesos
		else 
			nposiciones=$((nposiciones+${bloques[$i]})) #Número de bloques por proceso cuando tenga bloques
		fi
	done
	for (( i=0; i<$nposiciones; i++ )); do #Se inicializan a 0 (Sin bloques)
		inicialNC[$i]=0
		finalNC[$i]=0
	done
	#Se rellena
	main=0
	mafi=0
	for (( po=0 ; po<$nprocesos; po++ )); do
		if [[ ${bloques[$po]} -eq 0 ]]; then #Si sólo está en un bloque
			inicialNC[$main]="-"
			main=$((main+1))
			finalNC[$mafi]="-"
			mafi=$((mafi+1))
		elif [[ ${bloques[$po]} -ne 0 ]]; then #Si hay más bloques del proceso
			contadori=0
			contadorf=0
			while [[ $contadori -lt ${bloques[($po)]} &&  $contadorf -lt ${bloques[($po)]} ]]; do #recorre el número de bloques en los que se fragmenta un proceso
				for (( ra=0; ra<$mem_num_marcos ; ra++ )) ; do
					if [[ $ra -eq 0  && ${unidMemOcupadas[$ra]} == $po ]] ; then #El primero es un caso especial
						inicialNC[$main]=$ra #Si el proceso entra en memoria, guarda la unidad de inicio    
						main=$((main+1))
						contadori=$((contadori+1))
					fi
					if [[ $ra -ne 0  &&  ${unidMemOcupadas[$((ra - 1))]} != $po && ${unidMemOcupadas[$ra]} == $po ]] ; then
						inicialNC[$main]=$ra #Si el proceso entra en memoria, guarda la unidad de inicio    
						main=$((main+1))
						contadori=$((contadori+1))
					fi
					if [[ $ra -ne 0  &&  $ra -ne $((mem_num_marcos-1)) && ${unidMemOcupadas[$ra]} == $po && ${unidMemOcupadas[$((ra + 1))]} != $po ]] ; then
						finalNC[$mafi]=$ra #Si el proceso entra en memoria, guarda la unidad de final
						mafi=$((mafi+1))
						contadorf=$((contadorf+1))
					fi
					if [[ $ra -eq $((mem_num_marcos-1)) && ${unidMemOcupadas[$ra]} == $po ]]; then #El último es un caso especial
						finalNC[$mafi]=$ra #Si el proceso entra en memoria, guarda la unidad de final aunque no haya terminado el proceso. No debería ya que hubiera tenido que empezar en el primer hueco y le habría cabido.
						mafi=$((mafi+1))
						contadorf=$((contadorf+1))
					fi
				done
			done
		fi
	done
} #Final de preparar líneas para Banda de Memoria - calculosPrepararLineasImpresionBandaMemoria()

####################################################################################
# Sinopsis: Genera la Banda de Memoria y la muestra en pantalla/informe 
####################################################################################
function dibujarBandaMemoria { #Nueva versión y más simplificada, pero tiene 100 líneas más que la versión original (dibujarBandaMemoriaORI)
	terminal2=`tput cols` #Ancho del terminal para adecuar el ancho de líneas a cada volcado

	# GENERACIÓN STRING DE PROCESOS (Línea 1 de la Banda de Memoria) 
	nn=0 #Número de línea de la banda
	bandaProcesos=("    |")
	bandaProcesosColor=("$NORMAL    |")
	numCaracteres2=5
	xx=0 # Variable que indica si se ha añadido un proceso a la banda (1).
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do
		if [[ ${unidMemOcupadas[$ii]} != "_" ]]; then #El proceso está en memoria y se imprimirá
			if [[ $(($numCaracteres2 + $digitosUnidad + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
				nn=$(($nn + 1)) # Se pasa a la siguiente línea
				bandaProcesos[$nn]="     "
				bandaProcesosColor[$nn]="     "
				numCaracteres2=5
			fi
			if [[ $ii -ne 0 && $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$ii]}))]} != ${proceso[$((${unidMemOcupadas[$((ii - 1))]}))]} ]]; then # El texto no cabe en la terminal
				xx=0
			fi
			if [[ $xx -eq 0 ]]; then #Se añade el proceso a la banda
				espaciosfinal=${varhuecos:1:$(($digitosUnidad - ${#proceso[$((${unidMemOcupadas[$ii]}))]}))}
				bandaProcesos[$nn]+=`echo -e "${proceso[$((${unidMemOcupadas[$ii]}))]}""$espaciosfinal"`
				bandaProcesosColor[$nn]+=`echo -e "${coloress[${unidMemOcupadas[$ii]} % 6]}${proceso[$((${unidMemOcupadas[$ii]}))]}""$NORMAL$espaciosfinal"`
				numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
				xx=1
			else
				if [[ $(($numCaracteres2 + $digitosUnidad + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
					nn=$(($nn + 1)) #Se pasa a la siguiente línea
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
			if [[ $(($numCaracteres2 + $digitosUnidad + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
				nn=$(($nn + 1)) #Se pasa a la siguiente línea
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
	#Añadir final de banda
	if [[ $(($numCaracteres2 + 5 + ${#mem_num_marcos} + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
		nn=$(($nn + 1)) #Se pasa a la siguiente línea
		bandaProcesos[$nn]="     "
		bandaProcesosColor[$nn]="     "
		numCaracteres2=5
	fi
	bandaProcesos[$nn]+=`echo -e "|"`
	bandaProcesosColor[$nn]+=`echo -e "$NORMAL|"`

	# GENERACIÓN STRING DE MEMORIA (Línea 2 de la Banda de Memoria)
	nn=0 #Línea de la banda
	bandaMemoria=(" BM |")
	bandaMemoriaColor=("$NORMAL BM |")
	numCaracteres2=5
	espaciosAMeter=${varfondos:1:$digitosUnidad}
	guionesAMeter=${varguiones:1:$digitosUnidad}
	asteriscosAMeter=${varasteriscos:1:$digitosUnidad}
	fondosAMeter=${varfondos:1:$digitosUnidad}
	sumaTotalMemoria=0
	xx=0 #Variable que indica si se ha añadido un proceso a la banda
	for (( i=0; i<$nprocesos; i++)); do 
		numMarcosDibujadosPorProceso[$i]=0 #Número de Marcos en Memoria con Páginas ya dibujadas de cada Proceso para el resumen de Banda.
	done
			
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do
		if [[ ${unidMemOcupadas[$ii]} != "_" ]]; then #El proceso está en memoria y se imprimirá
			if [[ $(($numCaracteres2 + $digitosUnidad + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
				nn=$(($nn + 1)) #Se pasa a la siguiente línea
				bandaMemoria[$nn]="     "
				bandaMemoriaColor[$nn]="     "
				numCaracteres2=5
			fi
			espaciosfinal=${varhuecos:1:$(($digitosUnidad - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]}))}
			if [[ ${#paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]} -eq 0 ]]; then #Si no hay página se mete asterisco en BN.
				espaciosasteriscofinal=${varhuecos:1:$(($digitosUnidad - 1 - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]}))}"*"
			else  #Y si hay página se mete espacios y el número.
				espaciosasteriscofinal=${varhuecos:1:$(($digitosUnidad - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]}))}
			fi
			bandaMemoria[$nn]+=`echo -e "$espaciosasteriscofinal${paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]}"`
			bandaMemoriaColor[$nn]+=`echo -e "$NC${colorfondo[${unidMemOcupadas[$ii]} % 6]}$espaciosfinal${paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]}$NC"`
			((numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]++)) #Número de Marcos con Páginas ya dibujadas de cada Proceso.
			numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
			if [[ $ii -ne 0 ]]; then
				if [[ ${unidMemOcupadas[$((ii - 1))]} !=  "_" ]]; then 
					if [[ $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$ii]}))]} != ${proceso[$((${unidMemOcupadas[$((ii - 1))]}))]} ]]; then
						xx=0
					fi
				fi
			fi
		else #El proceso no está en memoria y no puede representarse en la Banda de Memoria.
			xx=0
			if [[ $(($numCaracteres2 + $digitosUnidad + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
				nn=$(($nn + 1)) #Se pasa a la siguiente línea
				bandaMemoria[$nn]="     "
				bandaMemoriaColor[$nn]="     "
				numCaracteres2=5
			fi
			espaciosguionfinal=${varhuecos:1:$(($digitosUnidad - 1 - ${#paginasEnMemoriaTotal[${unidMemOcupadas[$ii]},${numMarcosDibujadosPorProceso[${unidMemOcupadas[$ii]}]}]}))}"-"
			bandaMemoria[$nn]+=`echo -e "$espaciosguionfinal"`
			bandaMemoriaColor[$nn]+=`echo -e "$NC$fondosAMeter$NC"`
			numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
		fi
	done

	#Añadir final de banda 
	if [[ $(($numCaracteres2 + 5 + ${#mem_num_marcos} + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
		nn=$(($nn + 1)) #Se pasa a la siguiente línea
		bandaMemoria[$nn]="     "
		bandaMemoriaColor[$nn]=$NORMAL"     "
		numCaracteres2=5
	fi
	bandaMemoria[$nn]+=`echo -e "|M: $mem_num_marcos"` # TODO: CAMBIAR NÚMERO DE MEMORIA
	bandaMemoriaColor[$nn]+=`echo -e "$NORMAL|M: $mem_num_marcos"` # TODO: CAMBIAR NÚMERO DE MEMORIA

	# GENERACIÓN STRING DE POSICIÓN DE MEMORIA (Línea 3 de la Banda de Memoria)  
	nn=0 # Línea de la banda
	bandaPosicion=("    |")
	bandaPosicionColor=("$NORMAL    |")
	numCaracteres2=5
	xx=0 #Variable que indica si se ha añadido un proceso a la banda
	for ((ii=0;ii<${#unidMemOcupadas[@]};ii++)); do
		if [[ ${unidMemOcupadas[$ii]} != "_" ]]; then #El proceso está en memoria y se imprimirá
			if [[ $(($numCaracteres2 + $digitosUnidad + 1)) -gt $terminal2 ]]; then # El texto no cabe en la terminal
				nn=$(($nn + 1)) # Se pasa a la siguiente línea
				bandaPosicion[$nn]="     "
				bandaPosicionColor[$nn]="     "
				numCaracteres2=5
			fi
			if [[ $ii -ne 0 && $xx -eq 1 && ${proceso[$((${unidMemOcupadas[$ii]}))]} != ${proceso[$((${unidMemOcupadas[$((ii - 1))]}))]} ]]; then # El texto no cabe en la terminal
				xx=0
			fi
			if [[ $xx -eq 0 ]]; then #Se añade el proceso a la banda
				espaciosfinal=${varhuecos:1:$(($digitosUnidad - ${#ii}))}
				bandaPosicion[$nn]+=`echo -e "$espaciosfinal""$ii"`
				bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal""$ii"`
				numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
				xx=1
			else
				if [[ $(($numCaracteres2 + $digitosUnidad + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
					nn=$(($nn + 1)) #Se pasa a la siguiente línea
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
			if [[ $(($numCaracteres2 + $digitosUnidad + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
				nn=$(($nn + 1)) #Se pasa a la siguiente línea
				bandaPosicion[$nn]="     "
				bandaPosicionColor[$nn]="     "
				numCaracteres2=5
			fi
			if [[ $ii -ne 0 ]]; then
				if [[ ${unidMemOcupadas[$((ii - 1))]} != "_" ]]; then
					espaciosfinal=${varhuecos:1:$(($digitosUnidad - ${#ii}))}
					bandaPosicion[$nn]+=`echo -e "$espaciosfinal""$ii"`
					bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal""$ii"`
				else
					espaciosfinal=${varhuecos:1:$(($digitosUnidad))}
					bandaPosicion[$nn]+=`echo -e "$espaciosfinal"`
					bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal"`
				fi
			else
				espaciosfinal=${varhuecos:1:$(($digitosUnidad - ${#ii}))}
				bandaPosicion[$nn]+=`echo -e "$espaciosfinal""$ii"`
				bandaPosicionColor[$nn]+=`echo -e "$NORMAL$espaciosfinal""$ii"`
			fi
			numCaracteres2=$(($numCaracteres2 + $digitosUnidad))
		fi
	done
	#Añadir final de banda
	if [[ $(($numCaracteres2 + 5 + ${#mem_num_marcos} + 1)) -gt $terminal2 ]]; then #El texto no cabe en la terminal
		nn=$(($nn + 1)) # Se pasa a la siguiente línea
		bandaPosicion[$nn]="     "
		bandaPosicionColor[$nn]="$NORMAL     "
		numCaracteres2=5
	fi
	bandaPosicion[$nn]+=`echo -e "|"`
	bandaPosicionColor[$nn]+=`echo -e "$NORMAL|"`

	# IMPRIMIR LAS 3 LÍNEAS DE LA BANDA DE MEMORIA (COLOR y BN a pantalla y ficheros)
	for (( jj = 0; jj < ${#bandaProcesos[@]}; jj++ )); do
		echo -e "${bandaProcesosColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${bandaMemoriaColor[$jj]}" | tee -a $informeConColorTotal
		echo -e "${bandaPosicionColor[$jj]}\n" | tee -a $informeConColorTotal
		echo -e "${bandaProcesos[$jj]}" >> $informeSinColorTotal
		echo -e "${bandaMemoria[$jj]}" >> $informeSinColorTotal
		echo -e "${bandaPosicion[$jj]}\n" >> $informeSinColorTotal
	done
 
	#Tras mostrar el resumen de la Banda de Memoria, se inicializan las variables usadas.
	#Se inicializa la auxiliar usada para la reubicación de la memoria.
	for (( ca=0; ca<(mem_num_marcos); ca++)); do #Se borran los datos del auxiliar.
		unidMemOcupadasAux[$ca]="_"
	done
	#Se inicializan los bloques donde se introducirán los datos de los procesos.
	for (( ca=0; ca<($nprocesos) ; ca++)); do #Se borran los datos del auxiliar. Determina el número de bloques en los que se fragmenta un proceso
		 bloques[$ca]=0
	done
	#Se inicializa la variable que contendrá el número de bloques de cada proceso.
	nposiciones=0
	#Se inicializan las posiciones iniciales y finales de los bloques asociados a cada proceso, para borrar elementos innecesarios
	for (( i=0; i<$nposiciones; i++ )) ; do
		 inicialNCmodelo[$i]=0
	done
	for (( i=0; i<$nposiciones; i++ )) ; do 
		 finalNCmodelo[$i]=0
	done
} #Fin de la nueva versión de dibujarBandaMemoria()

####################################################################################
# Sinopsis: Prepara la banda de tiempos de procesos en cada volcado - PRUEBA DE COPIAR LÍNEA A lÍNEA
####################################################################################
function calculosImpresionBandaTiempos { 
	#Sucesión: Crear las tres líneas de la banda de tiempo y se generan los bloques que componen la memoria usada por cada proceso en memoria.
	#Nota: Todas las que acaben en "b" (o "baux) significa que es la versión en blanco y negro (también en la memoria).
	#Se trabaja simultaneamente con la línea en b/n, en color, y con el array coloresPartesTiempo (o memoria) que guarda el color de cada caracter del terminal.
	#dibujasNC es el array que guarda cúantas unidades quedan por dibujar de un proceso
		
	#A... Primero. Se trata la entrada por separado hasta que entre el primer proceso
	#En T=0 se pone el "rótulo".
	colsTerminal=$((`tput cols`-5)) #Determina el número de caracteres a inmprimir en cada línea.
	arribatiempoNC_0="    |"
	arribatiempoNCb_0="    |"
	tiempoNC_0=" BT |"
	tiempoNCb_0=" BT |"
	abajotiempoNC_0="    |"
	abajotiempoNCb_0="    |"
	tiempodibujado=0 #Unidades ya incluidas en las variables tiempoNC_0,...
	#Primero se meten blancos en tiempoNC_0,... hasta la legada del primer proceso, si lo hay.
	if [[ $reloj -eq 0 && $reloj -lt ${llegada[0]} ]]; then #En el caso en que el primer proceso entre más tarde que 0, se introducen blancos iniciales en tiempoNC_0,....
		arribatiempoNC=$arribatiempoNC_0"${varhuecos:1:$(($digitosUnidad))}"$NC 
		arribatiempoNCb=$arribatiempoNCb_0"${varhuecos:1:$(($digitosUnidad))}"
		tiempoNC=$tiempoNC_0"${varhuecos:1:$(($digitosUnidad))}"$NC 
		tiempoNCb=$tiempoNCb_0"${varhuecos:1:$(($digitosUnidad))}"
		abajotiempoNC=$abajotiempoNC_0"${varhuecos:1:$(($digitosUnidad - 1))}0"$NC
		abajotiempoNCb=$abajotiempoNCb_0"${varhuecos:1:$(($digitosUnidad - 1))}0"
	fi
	if [[ $reloj -ne 0 && $(($reloj - $tiempodibujado)) -gt 0  ]]; then #Hasta que se alcance reloj dibujar blancos en tiempoNC_0,....
		for (( i=0 ; i<$(($reloj)) ; i++ )) ; do
			if [[ $tiempodibujado -eq 0 ]]; then
				arribatiempoNC=$arribatiempoNC_0"${varhuecos:1:$(($digitosUnidad))}""${coloress[$i % 6]}"
				arribatiempoNCb=$arribatiempoNCb_0"${varhuecos:1:$(($digitosUnidad))}"
				tiempoNC=$tiempoNC_0"$NORMAL${varfondos:1:$(($digitosUnidad))}" #Representa los fondos con su color correspondiente
				tiempoNCb=$tiempoNCb_0"${varguiones:1:$(($digitosUnidad))}"
				abajotiempoNC=$abajotiempoNC_0"${varhuecos:1:$(($digitosUnidad - 1))}0"
				abajotiempoNCb=$abajotiempoNCb_0"${varhuecos:1:$(($digitosUnidad - 1))}0"
				tiempodibujado=$(($tiempodibujado + 1))
			else #En el caso en que el primer proceso entre más tarde que 0 (dibujar blancos iniciales de la barra todos de golpe).
				arribatiempoNC=$arribatiempoNC"${varhuecos:1:$(($digitosUnidad))}""${coloress[$i % 6]}"
				arribatiempoNCb=$arribatiempoNCb"${varhuecos:1:$(($digitosUnidad))}"
				tiempoNC=$tiempoNC"$NC${varfondos:1:$(($digitosUnidad))}" #Representa los fondos con su color correspondiente
				tiempoNCb=$tiempoNCb"${varguiones:1:$(($digitosUnidad))}"
				abajotiempoNC=$abajotiempoNC"${varhuecos:1:$(($digitosUnidad))}"
				abajotiempoNCb=$abajotiempoNCb"${varhuecos:1:$(($digitosUnidad))}"
				tiempodibujado=$(($tiempodibujado + 1))
			fi
		done
	fi
	
	#B... Segundo: A partir de la representación del primer proceso, si lo hay, se dibuja el resto de procesos de forma normal, añadiendo sus nombres y unidades.
		#1.Dibujar los procesos finalizados - Si está nombrado y no se ha empezado a dibujar
		#2.Añadir el rótulo del último proceso si hace falta y se marca como nombrado (entra en ejecución pero no hay que dibujar nada).        
	#1. Proceso finalizado que NO se ha acabado de dibujar. Hay que dibujar meter nombres (línea 1) y unidades (línea 3). 
	if [[ $hayproanterior -eq 1 && ${estad[$proanterior]} -eq 5 && ${dibujasNC[$proanterior]} -gt 0 ]]; then #Que haya, que esté acabado (no él mismo) y que quede por dibujar:
		#Si se ha nombrado (nomtiempo()=1) y no se ha empezado a dibujar (valor en dibujasNC() como en tejecucion()) 
		if [[ ${nomtiempo[$proanterior]} == 1 && ${dibujasNC[$proanterior]} -eq ${tejecucion[$proanterior]} ]]; then 
		#Si se ha marcado como terminado y no se ha empezado a dibujar 
			contad=$((${dibujasNC[$proanterior]}-1)) #Ponemos espacios para cuadrar, tantos como unidades de la barra se dibujen, menos 1 (ese 1 es poe empezar a contar desde 0)
			for (( i=0 ; i<$contad; i++ )); do
				arribatiempoNC=$arribatiempoNC"${varhuecos:1:$(($digitosUnidad))}"$NC
				arribatiempoNCb=$arribatiempoNCb"${varhuecos:1:$(($digitosUnidad))}""222"
				tiempoNC=$tiempoNC${coloress[$proanterior % 6]}"${varfondos:1:$(($digitosUnidad))}"$NC #Cambiados a varfondos
				tiempoNCb=$tiempoNCb"${varguiones:1:$(($digitosUnidad))}"
				abajotiempoNC=$abajotiempoNC"${varhuecos:1:$(($digitosUnidad))}"$NC
				abajotiempoNCb=$abajotiempoNCb"${varhuecos:1:$(($digitosUnidad))}"
				colorAnterior
				tiempodibujado=$(($tiempodibujado + 1))
			done
			dibujasNC[$proanterior]=0
		fi 
	fi #Fin de los procesos terminados pendientes de imprimir en la banda de tiempo
	#2.Se añade el nombre del último proceso que entra en ejecución y se marca como nombrado (entra en ejecución pero no hay que dibujar nada).
	for (( po=0; po<$nprocesos; po++)) ; do
		if ( [[ $tiempodibujado -eq $reloj && ${dibujasNC[$po]} -eq ${tejecucion[$po]} && ${estad[$po]} -eq 3 ]] ) ; then 
			arribatiempoNC=$arribatiempoNC"${coloress[$po % 6]}${proceso[$po]}""${varhuecos:1:$(($digitosUnidad - ${proceso[$po]}))}"$NC
			arribatiempoNCb=$arribatiempoNCb"${proceso[$po]}""${varhuecos:1:$(($digitosUnidad - ${proceso[$po]}))}"
			tiempoNC=$tiempoNC"${varhuecos:1:$(($digitosUnidad))}"$NC #Propuesto meter varfondos
			tiempoNCb=$tiempoNCb"${varhuecos:1:$(($digitosUnidad))}"
			abajotiempoNC=$abajotiempoNC"${varhuecos:1:$(($digitosUnidad - ${#reloj}))}""$reloj"$NC
			abajotiempoNCb=$abajotiempoNCb"${varhuecos:1:$(($digitosUnidad - ${#reloj}))}""$reloj"
			tiempodibujado=$(($tiempodibujado + 1))
		fi
		nomtiempo[$po]=1 #Se marca como nombrado
	done
} #Final de los cálculos para la impresión de la banda de memoria de los volcados - calculosImpresionBandaTiempos()

####################################################################################
# Sinopsis: Imprime las tres líneas de la banda de tiempo. Permite mostrar el orden de ejecución de los 
# procesos y su evolución en el tiempo.
####################################################################################
function dibujarBandaTiempos {     
	sumaParaEspacios=0 # Variable para almacenar la suma total de tiempos de llegada y ejecución
	sumaParaEspacios=$sumatorio # Número más alto entre la suma los tiempos de llegada y ejecución totales, y la página de mayor número
	local maxCaracteres=0
	maxCaracteres=$((${#sumaParaEspacios} + 1)) # Longitud en número de dígitos de cada unidad 
	if [[ $maxCaracteres -eq 2 ]]; then
		maxCaracteres=3 # El mínimo de caracteres tiene que ser 3 para que entren los nombres de 
	fi
	local terminal=`tput cols` #Ancho del terminal para adecuar el ancho de líneas a cada volcado
	for ((s = 0; s < ${#proceso[@]}; s++)); do
		if [[ ${estado[$s]} == "En ejecución" ]]; then
			procPorUnidadTiempoBT[$reloj]=$s #En cada casilla contiene el número de orden del proceso que se ejecuta en cada instante. Sólo puede haber un proceso en cada instante.
		fi
	done

	# GENERACIÓN STRING DE LA BANDA DE TIEMPOS (Línea 1 de la Banda de Tiempos)
	local bandaProcesos=("    |")
	local bandaProcesosColor=($NORMAL"    |")
	local n=0 # Línea de la banda
	local numCaracteres=5
	espaciosAMeter=${varhuecos:1:$maxCaracteres}
	guionesAMeter=${varguiones:1:$maxCaracteres}
	fondosAMeter=${varfondos:1:$maxCaracteres}
	for ((k = 0; k <= $reloj; k++)); do
		if [[ $k -eq 0 ]]; then #Si T=0
			if [[ ${procPorUnidadTiempoBT[$k]} -ge 0 ]]; then #Si hay proceso en ejecución para T=0
				local p=${proceso[${procPorUnidadTiempoBT[$k]}]} #Se imprime el nombre del proceso en ejecución en ese instante definido por la posición almacenada en procPorUnidadTiempoBT
				bandaProcesos[n]+=`printf "%-$(($maxCaracteres))s" $p`
				bandaProcesosColor[n]+=`printf "${coloress[${procPorUnidadTiempoBT[$k]} % 6]}%-$(($maxCaracteres))s$NORMAL" $p`
			else #Si no hay proceso en ejecución para T=0
				bandaInstantes[n]+=`echo -e $espaciosAMeter`
				bandaInstantesColor[n]+=`echo -e $espaciosAMeter`
			fi
			numCaracteres=$(($numCaracteres + $maxCaracteres))
		else #Si NO T=0
			if [[ $(($numCaracteres + $maxCaracteres + 1)) -gt $terminal ]]; then # El texto no cabe en la terminal
				n=$(($n + 1)) # Se pasa a la siguiente línea
				bandaProcesos[n]="     "
				bandaProcesosColor[n]="     "
				numCaracteres=5
			fi
			if [[ ${procPorUnidadTiempoBT[$k]} = ${procPorUnidadTiempoBT[$(($k - 1))]} ]]; then #Si se mantiene el mismo proceso en ejecución se imprimen espacios
				bandaProcesos[n]+=`printf "%$(($maxCaracteres))s" ""`
				bandaProcesosColor[n]+=`printf "%$(($maxCaracteres))s" ""`
			else #Si no se mantiene el mismo proceso en ejecución se imprime el nombre del nuevo proceso
				local p=${proceso[${procPorUnidadTiempoBT[$k]}]} #Se imprime el nombre del proceso en ejecución en ese instante definido por la posición almacenada en procPorUnidadTiempoBT
				bandaProcesos[n]+=`printf "%-$(($maxCaracteres))s" $p`
				bandaProcesosColor[n]+=`printf "${coloress[${procPorUnidadTiempoBT[$k]} % 6]}%-$(($maxCaracteres))s$NORMAL" $p`
			fi
			numCaracteres=$(($numCaracteres + $maxCaracteres))
		fi
	done
	# Añadir final de banda
	if [[ $(($numCaracteres + 5 + $maxCaracteres + 1)) -gt $terminal ]]; then # El texto no cabe en la terminal
		n=$(($n + 1)) # Se pasa a la siguiente línea
		bandaProcesos[n]="     "
		bandaProcesosColor[n]="     "
		numCaracteres=5
	fi
	bandaProcesos[n]+=`printf "|    %$(($maxCaracteres))s" ""`
	bandaProcesosColor[n]+=`printf "|    %$(($maxCaracteres))s" ""`

	# GENERACIÓN STRING DE LA BANDA DE TIEMPOS (Línea 2 de la Banda de Tiempos)
	local bandaTiempo=(" BT |")
	local bandaTiempoColor=(" BT |")
	local n=0 # Línea de la banda
	local numCaracteres=5
	for (( i=0; i<$nprocesos; i++)); do 
		numMarcosDibujadosPorProceso[$i]=0 #Número de Marcos en Memoria con Páginas ya dibujadas de cada Proceso para el resumen de Banda.
	done
	for ((k = 0; k <= $reloj; k++)); do
		if [[ $(($numCaracteres + $maxCaracteres + 1)) -gt $terminal ]]; then # El texto no cabe en la terminal
			n=$(($n + 1)) # Se pasa a la siguiente línea
			bandaTiempo[n]="     "
			bandaTiempoColor[n]="     "
			numCaracteres=5
		fi
		if [[ $k -eq $reloj ]]; then #Si el instante considerado es igual al tiempo actual
			if [[ procPorUnidadTiempoBT[$k] -eq $topeProcPorUnidadTiempoBT ]]; then #Si no hay proceso en ejecución asociado a ese instante. Vale 0 si no está definido porque la inicialización empieza en posición=1.
				if [[ $k -eq 0 ]]; then
					espaciosguionfinal=${varhuecos:1:$(($digitosUnidad - 1))}"-"
					bandaTiempo[n]+=$espaciosguionfinal
					bandaTiempoColor[n]+=$espaciosguionfinal
				else
					bandaTiempo[n]+=$espaciosAMeter
					bandaTiempoColor[n]+=$espaciosAMeter
				fi
			else #Si hay proceso en ejecución asociado a ese instante.
				espaciosfinal=${varhuecos:1:$(($digitosUnidad - ${#paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}))}
				bandaTiempo[n]+=$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}
				bandaTiempoColor[n]+=$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}
			fi
		elif [[ $k -ne $reloj ]]; then #Si el instante considerado NO es igual al tiempo actual
			if [[ ${procPorUnidadTiempoBT[$k]} -eq $topeProcPorUnidadTiempoBT ]]; then # || ${procPorUnidadTiempoBT[$k]} = 0 ]]# Si NO hay proceso en ejecución asociado a ese instante. Vale 0 si no está definido porque la inicialización empieza en posición=1.
				espaciosguionfinal=${varhuecos:1:$(($digitosUnidad - 1))}"-"
				bandaTiempo[n]+=$espaciosguionfinal
				bandaTiempoColor[n]+=$fondosAMeter
			else # Si hay proceso en ejecución asociado a ese instante  
				espaciosfinal=${varhuecos:1:$(($digitosUnidad - ${#paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}))}
				bandaTiempo[n]+=$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}
				if [[ $k -ne 0 ]]; then #Si NO es T=0
					bandaTiempoColor[n]+=$NC${colorfondo[${procPorUnidadTiempoBT[$k]} % 6]}$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}$NC
				else #Si es T=0
					if [[ $reloj -eq 0 ]]; then #Si T=0 no se colorea el fondo 
						bandaTiempoColor[n]+=$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}$NC
					else #Si T>0 se pintará el fondo del color del proceso en ejecución.
						bandaTiempoColor[n]+=$NC${colorfondo[${procPorUnidadTiempoBT[$k]} % 6]}$espaciosfinal${paginasDefinidasTotal[${procPorUnidadTiempoBT[$k]},${numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]}]}$NC                    
					fi
				fi
				((numMarcosDibujadosPorProceso[${procPorUnidadTiempoBT[$k]}]++)) #Número de Marcos en Memoria con Páginas ya dibujadas de cada Proceso para el resumen de Banda.
			fi
		fi
		numCaracteres=$(($numCaracteres + $maxCaracteres))
	done

	# Añadir final de banda
	if [[ $(($numCaracteres + 5 + $maxCaracteres + 1)) -gt $terminal ]]; then # El texto no cabe en la terminal
		n=$(($n + 1)) # Se pasa a la siguiente línea
		bandaTiempo[n]="     "
		bandaTiempoColor[n]="     "
		numCaracteres=5
	fi
	bandaTiempo[n]+=`printf "|T= %-${maxCaracteres}d" $reloj`
	bandaTiempoColor[n]+=$NC`printf "|T= %-${maxCaracteres}d" $reloj`

	# GENERACIÓN STRING DE LAS UNIDADES DE LOS INSTANES DE TIEMPO (Línea 3 de la Banda de Tiempos)
	local bandaInstantes=("    |")
	local bandaInstantesColor=($NC"    |")
	local n=0 # Línea de la banda
	local numCaracteres=5
	for ((k = 0; k <= $reloj; k++)); do
		if [[ ${procPorUnidadTiempoBT[$k]} -eq ${procPorUnidadTiempoBT[$(($k - 1))]} ]]; then #Cuando se mantiene el mismo proceso en ejecución
			if [[ $k -eq 0 || $k -eq $reloj ]]; then #En T=0 o T=momento actual, aumenta el contenido de las bandas
				if [[ $(($numCaracteres + $maxCaracteres + 1)) -gt $terminal ]]; then # El texto no cabe en la terminal
					n=$(($n + 1)) # Se pasa a la siguiente línea
					bandaInstantes[n]="     "
					bandaInstantesColor[n]=$NC"     "
					numCaracteres=5
				fi
				bandaInstantes[n]+=`printf "%${maxCaracteres}d" $k`
				bandaInstantesColor[n]+=`printf "%${maxCaracteres}d" $k`
				numCaracteres=$(($numCaracteres + $maxCaracteres))
			else #En T distinto de 0 o momento actual, también aumenta el contenido de las bandas
				if [[ $(($numCaracteres + $maxCaracteres + 1)) -gt $terminal ]]; then # El texto no cabe en la terminal
					n=$(($n + 1)) # Se pasa a la siguiente línea
					bandaInstantes[n]="     "
					bandaInstantesColor[n]=$NC"     "
					numCaracteres=5
				fi
				bandaInstantes[n]+=`printf "%${maxCaracteres}s" ""`
				bandaInstantesColor[n]+=`printf "%${maxCaracteres}s" ""`
				numCaracteres=$(($numCaracteres + $maxCaracteres))
			fi
		else #Cuando no se mantiene el mismo proceso en ejecución
			if [[ $(($numCaracteres + $maxCaracteres + 1)) -gt $terminal ]]; then # El texto no cabe en la terminal
				n=$(($n + 1)) # Se pasa a la siguiente línea
				bandaInstantes[n]="     "
				bandaInstantesColor[n]=$NC"     "
				numCaracteres=5
			fi
			bandaInstantes[n]+=`printf "%${maxCaracteres}d" $k`
			bandaInstantesColor[n]+=`printf "%${maxCaracteres}d" $k`
			numCaracteres=$(($numCaracteres + $maxCaracteres))
		fi
	done
	# Añadir final de banda
	if [[ $(($numCaracteres + 5 + $maxCaracteres + 1)) -gt $terminal ]]; then # El texto no cabe en la terminal
		n=$(($n + 1)) # Se pasa a la siguiente línea
		bandaInstantes[n]="     "
		bandaInstantesColor[n]=$NC"     "
		numCaracteres=5
	fi
	bandaInstantes[n]+=`printf "|    %$(($maxCaracteres))s" ""`
	bandaInstantesColor[n]+=`printf "|    %$(($maxCaracteres))s" ""`

	# IMPRIMIR LAS 3 LÍNEAS DE LA BANDA DE TIEMPOS (COLOR y BN a pantalla y ficheros temporales) - Se meten ahora en los temporales para que la banda de tiempo vaya tras la banda de memoria
	for (( i = 0; i < ${#bandaProcesos[@]}; i++ )); do
		echo -e "${bandaProcesos[$i]}" >> $informeSinColorTotal
		echo -e "${bandaTiempo[$i]}" >> $informeSinColorTotal
		echo -e "${bandaInstantes[$i]}\n" >> $informeSinColorTotal
		echo -e "${bandaProcesosColor[$i]}" | tee -a $informeConColorTotal
		echo -e "${bandaTiempoColor[$i]}" | tee -a $informeConColorTotal
		echo -e "${bandaInstantesColor[$i]}\n" | tee -a $informeConColorTotal
	done    

	#########################################################
	#Se determina el modo de ejecución (Enter, sin paradas, con paradas con tiempo predefinido)
	if [[ $optejecucion = "1" ]]; then #Impresión de forma manual (pulsando enter para pasar)
		echo -e " Pulse ENTER para continuar.$NC" | tee -a $informeConColorTotal
		echo -e " Pulse ENTER para continuar." >> $informeSinColorTotal
		read continuar
		echo -e $continuar "\n" >> $informeConColorTotal
		echo -e $continuar "\n" >> $informeSinColorTotal
	fi  #Cierre de fi - optejecucion=1 (seleccionMenuModoTiempoEjecucionAlgormitmo=1)
	if [[ $optejecucion = "2" ]]; then #Impresión de forma sin parar (pasa sin esperar, de golpe)
		echo -e "───────────────────────────────────────────────────────────────────────$NC" | tee -a $informeConColorTotal
		echo -e "───────────────────────────────────────────────────────────────────────" >> $informeSinColorTotal
	fi  #Cierre de fi - optejecucion=2 (seleccionMenuModoTiempoEjecucionAlgormitmo=2)
	if [[ $optejecucion = "3" ]]; then #Impresión de forma automatica (esperando x segundo para pasar)
		echo -e " Espere para continuar...$NC\n" | tee -a $informeConColorTotal
		echo -e " Espere para continuar...\n" >> $informeSinColorTotal
		sleep $tiempoejecucion 
	fi  #Cierre de fi - optejecucion=3 (seleccionMenuModoTiempoEjecucionAlgormitmo=3)
} #Fin de dibujarBandaTiempos()

####################################################################################
# Sinopsis: Muestra en pantalla/informe una tabla con el resultado final tras la ejecución
# de todos los procesos
####################################################################################
function resultadoFinalDeLaEjecucion {
	echo "$NORMAL Procesos introducidos (ordenados por tiempo de llegada):" | tee -a $informeConColorTotal
	echo -e " ┌─────┬─────┬─────┬─────┬──────┬──────┐" | tee -a $informeConColorTotal
	echo -e " │ Ref │ Tll │ Tej │ Mem │ TEsp │ Tret │" | tee -a $informeConColorTotal   
	echo -e " ├─────┼─────┼─────┼─────┼──────┼──────┤" | tee -a $informeConColorTotal
	echo -e " ┌─────┬─────┬─────┬─────┬──────┬──────┐" >> $informeSinColorTotal
	echo -e " │ Ref │ Tll │ Tej │ Mem │ TEsp │ Tret │" >> $informeSinColorTotal
	echo -e " ├─────┼─────┼─────┼─────┼──────┼──────┤" >> $informeSinColorTotal
	
	for (( i=0; i<$nprocesos; i++ )) ; do  #Se usa m porque i recorre los procesos y m controla las unidades usadas por cada proceso, normalmente 0 o 1, y también las unidades de los n trozos de memoria asociados a cada proceso. 
		echo -e " │ ${varC[$i]}${proceso[$i]}$NC │"\
		"$(imprimirEspaciosEstrechos ${#llegada[$i]})${varC[$i]}${llegada[$i]}$NC │"\
		"$(imprimirEspaciosEstrechos ${#ejecucion[$i]})${varC[$i]}${ejecucion[$i]}$NC │"\
		"$(imprimirEspaciosEstrechos ${#memoria[$i]})${varC[$i]}${memoria[$i]}$NC │"\
		"$(imprimirEspaciosAnchos ${#temp_wait[$i]})${varC[$i]}${temp_wait[$i]}$NC │"\
		"$(imprimirEspaciosAnchos ${#temp_ret[$i]})${varC[$i]}${temp_ret[$i]}$NC │" | tee -a $informeConColorTotal
		echo -e " │ ${proceso[$i]} │ $(imprimirEspaciosEstrechosBN ${#llegada[$i]})${llegada[$i]} │"\
		"$(imprimirEspaciosEstrechosBN ${#ejecucion[$i]})${ejecucion[$i]} │"\
		"$(imprimirEspaciosEstrechosBN ${#memoria[$i]})${memoria[$i]} │"\
		"$(imprimirEspaciosAnchosBN ${#temp_wait[$i]})${temp_wait[$i]} │"\
		"$(imprimirEspaciosAnchosBN ${#temp_ret[$i]})${temp_ret[$i]} │" >> $informeSinColorTotal
	done
	echo " └─────┴─────┴─────┴─────┴──────┴──────┘" | tee -a $informeConColorTotal
	echo " └─────┴─────┴─────┴─────┴──────┴──────┘">> $informeSinColorTotal

	#Promedios
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
		if [[ ${estad[$i]} -ne 0 && $tam -le $mem_num_marcos ]]; then #Si el tamaño del proceso es menor o igual que el de memoria
			suma_espera=$(($suma_espera + ${temp_wait[$i]}))           #suma para sacar su promedio
			promedio_espera=$(echo "scale=2; $suma_espera/$dividir" | bc)  #promedio

			suma_retorno=$(($suma_retorno + ${temp_ret[$i]}))   #suma para sacar su promedio
			promedio_retorno=$(echo "scale=2; $suma_retorno/$dividir" | bc)  #promedio
		fi
		suma_contadorAlgPagFallosProcesoAcumulado=$(($suma_contadorAlgPagFallosProcesoAcumulado + ${contadorAlgPagFallosProcesoAcumulado[$i]}))
		suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado=$(($suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado + ${contadorAlgPagExpulsionesForzadasProcesoAcumulado[$i]}))
	done
	echo -e "\n ┌─────────────────────────────┬─────────────────────────────┐" | tee -a $informeConColorTotal 
	echo -e " │ T. espera medio: $promedio_espera$(imprimirEspaciosRangosLargos ${#promedio_espera})$NC " \
	"│ T. retorno medio: $promedio_retorno$(imprimirEspaciosRangosLargos ${#promedio_retorno})$NC │" | tee -a $informeConColorTotal 
	echo -e " └─────────────────────────────┴─────────────────────────────┘" | tee -a $informeConColorTotal 
	echo -e "\n ┌─────────────────────────────┬─────────────────────────────┐" >> $informeSinColorTotal
	echo -e " │ T. espera medio: $promedio_espera$(imprimirEspaciosRangosLargosBN ${#promedio_espera}) " \
	"│ T. retorno medio: $promedio_retorno$(imprimirEspaciosRangosLargosBN ${#promedio_retorno}) │" >> $informeSinColorTotal
	echo -e " └─────────────────────────────┴─────────────────────────────┘" >> $informeSinColorTotal
	echo -e "\n ┌───────────────────────────────────────────────────────────┐" | tee -a $informeConColorTotal 
	echo -e " │ Total de Fallos de Página: $suma_contadorAlgPagFallosProcesoAcumulado$(imprimirEspaciosMasAnchos ${#suma_contadorAlgPagFallosProcesoAcumulado})$NC                          │" | tee -a $informeConColorTotal 
	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then
		echo -e " │ Total de Expulsiones Forzadas en Round-Robin (RR): $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado$(imprimirEspaciosMasAnchosBN ${#suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado})$NC  │" | tee -a $informeConColorTotal 
	fi
	echo -e " └───────────────────────────────────────────────────────────┘" | tee -a $informeConColorTotal 
	echo -e "\n ┌───────────────────────────────────────────────────────────┐" >> $informeSinColorTotal
	echo -e " │ Total de Fallos de Página: $suma_contadorAlgPagFallosProcesoAcumulado$(imprimirEspaciosMasAnchosBN ${#suma_contadorAlgPagFallosProcesoAcumulado})                          │" >> $informeSinColorTotal
	if [[ $seleccionMenuAlgoritmoGestionProcesos -eq 5 ]]; then
		echo -e " │ Total de Expulsiones Forzadas en Round-Robin (RR): $suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado$(imprimirEspaciosMasAnchosBN ${#suma_contadorAlgPagExpulsionesForzadasProcesoAcumulado})  │" >> $informeSinColorTotal
	fi
	echo -e " └───────────────────────────────────────────────────────────┘" >> $informeSinColorTotal
	if [[ $seleccionMenuEnsayos -ne 1 && $seleccionMenuEnsayos -ne 2 && $seleccionMenuEnsayos -ne 3 && $seleccionMenuEnsayos -ne 4 ]]; then #No se ejecuta cuando la selección inicial es la ejecución automática repetitiva.
		echo -ne $ROJO"\n\n Pulsa ENTER para continuar "$NORMAL
		read enter
	fi
} #Fin de resultadoFinalDeLaEjecucion()

####################################################################################
# Sinopsis: Permite introducir las particiones y datos desde otro fichero (predefinido).
####################################################################################
function mostrarInforme {
	if [[ $seleccionMenuEnsayos -ne 1 && $seleccionMenuEnsayos -ne 2 && $seleccionMenuEnsayos -ne 3 && $seleccionMenuEnsayos -ne 4 ]]; then #No se ejecuta cuando la selección inicial es la ejecución automática repetitiva.
		echo -e "\n Final del proceso, puede consultar la salida en el fichero informeBN.txt" 
		echo -e "\n Pulse enter para las opciones de visualización del fichero informeBN.txt..."
		read enter
	fi
#    clear
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
		#Se comprueba que el número introducido por el usuario es de 1 a 10
		until [[ 0 -lt $num && $num -lt 5 ]];  do
			echo -ne "\n Error en la elección de una opción válida\n\n  --> " | tee -a $informeConColorTotal
			echo -ne "\n Error en la elección de una opción válida\n\n  --> " >> $informeSinColorTotal
			read num
			echo -ne "$num\n\n" >> $informeConColorTotal
			echo -ne "$num\n\n" >> $informeSinColorTotal
		done
		case $num in
			'1' )  
#                clear               
				cat $informeSinColorTotal
				exit 0
				;;
			'2' ) 
#                clear
				gedit $informeSinColorTotal
				exit 0
				;;
			'3' )
#                clear
				cat $informeConColorTotal
				exit 0
				;;
			'4' )
#                clear
				exit 0
				;;
			*) 
				num=0
				cecho "Opción errónea, vuelva a introducir:" $FRED
		esac
	done
} #Fin de mostrarInforme()

####################################################################################
####################################################################################
# COMIENZO DEL PROGRAMA
####################################################################################
####################################################################################
function inicioNuevo {
	#Empieza el script
	nprocesos=${#proceso[@]}
	inicializaVectoresVariables #Inicilizamos diferentes tablas y variables  

	# Se inicilizan las variables necesarias para la nueva línea del tiempo
	dibujasNC=("${tejecucion[@]}") #Se dibuja tanto como tiempo de ejecución tengan
	if [[ seleccionMenuAlgoritmoGestionProcesos -ne 4 ]]; then 
		dibujaDatosPantallaFCFS_SJF_SRPT_RR #Volcado de datos en pantalla tras pedir datos/introducción desde fichero.
	elif [[ seleccionMenuAlgoritmoGestionProcesos -eq 4 ]]; then 
		dibujaDatosPantallaPrioridad #Volcado de datos en pantalla tras pedir datos/introducción desde fichero.
	fi
	
	#B U C L E   P R I N C I P A L 
	reloj=0 #Tiempo transcurrido desde el inicio del programa.
	contador=1
	parar_proceso="NO" #Controla la salida del bucle cuando finalicen todos los procesos.
	cpu_ocupada="NO" #Controla si hay procesos en ejecución.
	finalprocesos=$nprocesos #Número de procesos definidos en el problema
	realizadoAntes=0

	while [[ "$parar_proceso" == "NO" ]]; do
		procPorUnidadTiempoBT[$reloj]=$topeProcPorUnidadTiempoBT #Se inicializa al máximo antes calculado para declarar que no hay proceso en ejecución en ese instante de reloj
		timepoAux=`expr $reloj + 1`

		#E N T R A R   E N   C O L A - Si el momento de entrada del proceso coincide con el reloj marcamos el proceso como en espera, en encola()
		for (( i=0; i<$nprocesos; i++ )); do #Bucle que pone en cola los procesos.
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

		#G U A R D A R   E N    M E M O R I A - Si un proceso está encola(), intento guardarlo en memoria, si cabe. Si lo consigo, lo marco como listo enmemoria().
		for (( i=0; i<$nprocesos; i++ )); do #Comprueba si el proceso en ejecución ha finalizado, y lo saca de memoria. 
			if [[ ${enejecucion[$i]} -eq 1 && ${temp_rej[$i]} -eq 0 ]]; then 
				enejecucion[$i]=0 #Para que deje de estar en ejecución.
				enmemoria[$i]=0 #Para que deje de estar en memoria y deje espacio libre.  
				mem_libre=`expr $mem_libre + ${memoria[$i]}` #Se libera la memoria que ocupaba el proceso cuando termina.
				avisosalida[$i]=1
				evento=1
				cpu_ocupada="NO" #Pasa a estar no ocupada hasta que se vuelva a buscar si hay procesos en memoria que vayan a ser ejecutados.
				terminados[$i]=1 #Se guarda qué procesos han terminado (1) o no (0)
				estad[$i]="5" #Finalizado
				estado[$i]="Finalizado"
				finalprocesos=`expr $finalprocesos - 1` #Número de procesos que quedan por ejecutar.                    
				pos_inicio[$i]=""
				procFinalizado=$i
			fi
		done
		
		calculosActualizarVariablesBandaMemoria #Se actualiza la variable memoria al terminar los procesos.
		
		#Con esta parte se revisa la reubicabilidad, y si hay procesos se intentan cargar antes de usar los gestores de procesos, mientras que con la que hay en la reubicación, tras reubicar y producir un hueco al final de la memoria, se reintenta cargar procesos.
		#Se comprueba que haya espacio suficiente en memoria y se meten los procesos que se puedan de la cola para empezar a ejecutar los algoritmos de gestión de procesos.
		if [[ $mem_libre -gt 0 ]]; then  
			reubicarReubicabilidad=0 # #Determinará si se debe o no hacer la reubicación de los procesos por condiciones de reubicabilidad. En caso de ser memoria no continua, si hay un hueco demasiado pequeño, y se va a usar como parte de la memoria a usar.
			reubicarContinuidad=0 # #Determinará si se debe o no hacer la reubicación de los procesos por condiciones de continuidad. En caso de ser memoria continua, si no hay un hueco suficientemente grande en el que quepa pero sí en la suma de todos ellos.
			crearListaSecuencialProcesosAlEntrarMemoria #Contiene los procesos que están en memoria de forma secuencial en la variable guardadoMemoria, y sus tamaños en tamanoGuardadoMemoria.
			comprobacionSiguienteProcesoParaReubicar #Se determina qué proceso es el siguiente en entrar en memoria, y dependiendo de la continuidad y reubicabilidad definidas, se establece si hay espacio en memoria. 
			if [[ $reubicarReubicabilidad -eq 0 && $reubicarContinuidad -eq 0 ]]; then #Si hay que reubicar antes de meter más procesos, se hace.
				for (( po=0; po<$nprocesos; po++ )) ; do #Se meten todos los nuevos proceso que quepan y se comprueba si hay que reubicar tras cada uno de ellos. 
					i=$po #Ajusta el bucle actual a la variable interna de la función.
					comprobacionSiguienteProcesoParaMeterMemoria
					meterProcesosBandaMemoria
					if [[ $noCabe0Cabe1 -eq 0 ]]; then #Sin este if+break fallaba porque podía meter otro proceso en memoria si tenía el espacio suficiente, incluso colándose a otro proceso anterior.
						break
					fi
				done
			else
				calculosReubicarYMeterProcesosBandaMemoria #Se reubica la memoria.
				evento=0 #Se impide un nuevo volcado en pantalla en el que no se vea avance de la aplicación.
				timepoAux=$reloj #Se modifica restando una unidad para ajustar el reloj y variables temporales al anular un ciclo del bucle, ya que la variable timepoAux se modifica al principio del bucle principal mediante: timepoAux=`expr $reloj + 1` 
			fi
		fi

		#Se inicializan las variables con diferentes acumulados en cada instante de reloj. Algunos acumulados sólo serían necesarios cuando se produzcan eventos, pero se podrían generalizar haciendo acumulados en cada instante.
		inicializarAcumulados 
		
		# P L A N I F I C A R   P R O C E S O S  
		# Si hay procesos listos en memoria(), se ejecuta el que corresponde en función del criterio de planificación que, 
		# en este caso, es el que tenga una ejecución más corta de todos los procesos. Se puede expulsar a un proceso de la CPU
		# Si acaba un proceso, su tiempo de ejecución se ponemos a 0 en la lista de enejecución y se libera la memoria que estaba ocupando
		if [[ $reubicarReubicabilidad -eq 0 && $reubicarContinuidad -eq 0 ]]; then #Si hay que reubicar antes de meter más procesos, se hace.
			ResuTiempoProceso[$reloj]=-1 #Mientras no haya un proceso en ejecución, se pone a -1. El gestor del algoritmo lo cambiará si procede.
			if [[ $seleccionMenuAlgoritmoGestionProcesos == 1 ]]; then
				gestionProcesosFCFS #Algoritmo de gestión de procesos: FCFS
			elif [[ $seleccionMenuAlgoritmoGestionProcesos == 2 ]]; then
				gestionProcesosSJF #Algoritmo de gestión de procesos: SJF
			elif [[ $seleccionMenuAlgoritmoGestionProcesos == 3 ]]; then
				gestionProcesosSRPT #Algoritmo de gestión de procesos: SRPT
			elif [[ $seleccionMenuAlgoritmoGestionProcesos == 4 ]]; then
				gestionProcesosPrioridades #Algoritmo de gestión de procesos: Prioridades
			elif [[ $seleccionMenuAlgoritmoGestionProcesos == 5 ]]; then
				gestionProcesosRoundRobin #Algoritmo de gestión de procesos: Round Robin
			fi
		fi
		#I M P R I M I R   E V E N T O S 
		if [[ $evento -eq 1 ]]; then #Los eventos los determinan en las funciones gestionProcesosFCFS, gestionProcesosSJF y gestionProcesosSRPT
			calculosImpresionBandaTiempos #Prepara la banda de tiempos de procesos en cada volcado
			mostrarEventos #Se muestran los eventos sucedidos, sobre la tabla resumen.
			# C Á L C U L O   D E   L A   B A N D A   D E   M E M O R I A  
			# Habrá un array inicialmente relleno de "_" que se va llenando de las referencias de los procesos (memoria()). Después será usado para formar la banda de memoria.
			# $po es el índice usado para los procesos y $ra para las posiciones de la memoria al recorrer el array.
			# Hay otros arrays como el que se usa para generar los diferentes bloques que conforman cada proceso, relacionados con la reubicación (bloques()).
			calculosPrepararLineasImpresionBandaMemoria
			# D I B U J O   D E   L A   T A B L A   D E   D A T O S   Y   D E   L A S   B A N D A S (Normalmente, por eventos) 
			# Los eventos suceden cuando se realiza un cambio en los estados de cualquiera de los procesos.
			# Los tiempos T. ESPERA, T. RETORNO y T. RESTANTE sólo se mostrarán en la tabla cuando el estado del proceso sea distinto de "No ha llegado".
			# Para ello hacemos un bucle que pase por todos los procesos que compruebe si el estado fueraDelSistema() es 0 y para cada uno de los tiempos, si se debe mostrar se guarda el tiempo, si no se mostrará un guión
			# Hay una lista de los procesos en memoria en la variable $guardados() 
			dibujarTablaDatos #Prepara e imprime la tabla resumen de procesos en cada volcado
			if [[ $procFinalizado -ne -1 ]]; then #Imprime diferentes resúmenes de paginación.
				if [[ $seleccionMenuAlgoritmoPaginacion -eq 3 || $seleccionMenuAlgoritmoPaginacion -eq 4 ]]; then
					procFinalizadoOEjecutando=$procFinalizado
#					dibujaResumenReloj #Se dibuja la evolución del reloj para cada proceso con todos los usos de cada página.
				fi
				dibujaResumenAlgPagFrecUsoRec #Muestra el resumen de todos los fallos de paginación del proceso finnalizado
				terminadosAux[$procFinalizado]=1 #Para no volver a hacer la impresión del mismo proceso a lescoger procFinalizado en gestionProcesosFCFS, gestionProcesosSJF y gestionProcesosSRPT.
				procFinalizado=-1
			fi          
			if ([[ $seleccionMenuAlgoritmoPaginacion -eq 3 || $seleccionMenuAlgoritmoPaginacion -eq 4 ]]) && [[ $ejecutandoinst -ne -1 ]]; then
				procFinalizadoOEjecutando=$ejecutandoinst
				dibujaReloj #Se dibuja el reloj para cada proceso cuando haya un volcado
			fi
			dibujaResumenBandaMemoriaMarcosPagina #Verifica qué proceso está en cada marco y determina si se produce un nuevo fallo de página, y lo muestra.
			dibujarBandaMemoria #Se imprime la banda de memoria. Nueva versión, más fácil de interpretar y adaptar, larga y con iguales resultados.
			dibujarBandaTiempos #Se imprime la banda de tiempo
		fi #Cierre de Impresión Eventos
		# Se incrementa el contador de tiempos de ejecución y de espera de los procesos y se decrementa 
		# el tiempo de ejecución que tiene el proceso que se encuentra en ejecución.
		if [[ $reubicarReubicabilidad -eq 0 && $reubicarContinuidad -eq 0 ]]; then #Si hay que reubicar antes de meter más procesos, se hace.
			ajusteFinalTiemposEsperaEjecucionRestante #Prepara e imprime la tabla resumen de procesos en cada volcado - AL FINAL AUMENTA $reloj.
		fi
	done #Fin del while con "$parar_proceso" = "NO"
#    clear
	tiempofinal=`expr $reloj - 1` #Para ajustar el tiempo final
	echo -e "$NORMAL\n Tiempo: $tiempofinal  " | tee -a $informeConColorTotal
	echo -e " Ejecución terminada." | tee -a $informeConColorTotal
	echo -e "$NORMAL -----------------------------------------------------------\n" | tee -a $informeConColorTotal
	echo -e "\n Tiempo: $tiempofinal  " >> $informeSinColorTotal
	echo -e " Ejecución terminada." >> $informeSinColorTotal
	echo -e " -----------------------------------------------------------\n" >> $informeSinColorTotal
	resultadoFinalDeLaEjecucion #Impresión de datos finales
	if [[ $seleccionMenuEnsayos -ne 1 && $seleccionMenuEnsayos -ne 2 && $seleccionMenuEnsayos -ne 3 && $seleccionMenuEnsayos -ne 4 ]]; then #No se ejecuta cuando la selección inicial es la ejecución automática repetitiva.
		mostrarInforme #Elección de visualización de informes
	fi
} #Final del programa principal - inicioNuevo()

####################################################################################
####################################################################################
##############                   PROGRAMA PRINCIPAL                #################
####################################################################################
#Llamada a todas las funciones de forma secuencial
revisarArbolDirectorios #Regenera el árbol de directorios si no se encuentra. 
presentacionPantallaInforme #Carátula inicial con autores, versiones y licencias
menuInicio #Elección de ejecución o ayuda
inicioNuevo #Inicio de la ejecución del programa
