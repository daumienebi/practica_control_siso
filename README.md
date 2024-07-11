# Práctica de Control
Segunda parte de la práctica de control de la asignatura `Sistemas Operativos` (1º año del grado en Ingeniería Informática,Universidad de Burgos).
Se trata de un script escrito en el lenguaje bash para gestionar la internacionalización/documentación de otros scripts.

![image](https://github.com/user-attachments/assets/8576395d-984e-406e-a2d7-1d9f3c9fbd0c)

## Como ejecutarlo
Coloca el script en <b>un directorio que contenga otros directorios con los scripts</b> a internacionalizar y ejecuta :

`bash ScriptTratamientoDeScripts_Derick_Daumienebi_Sakpa.sh`

## Funcionalidades
- [x] Crear referencias nuevas
- [x] Regenerar referencias
- [x] Borrar referencias de los scripts
- [x] Agregar nuevo fichero de almacenamiento
- [x] Cambiar idioma de los scripts
- [x] Visualizar ficheros de log
- [x] Mostrar ayuda

  ### Las referencias
  ¿Qué son las <b>referencias</b>?, las referencias no son nada más que identificadores para cada línea con el que interactuará el programa. Las referencias son las claves de este programa porque a través de ellos, puede realizar las operaciones necesarias desde la     
  referenciación de los ficheros hasta el cambio de idioma y mucho más.
  Las referencias tienen el siguiente formato : <b>`#XX-YY-`</b>
  
  `#` Una parte de las referencias que tiene que estar siempre en cualquier referencia.

  `XX` Identifica el código del idioma en el que esta la referencia. Cada idioma tiene un código y hay algunos idiomas disponibles por defecto en el programa, algunos ejemplos son :

  • Español: SP

  • Inglés: EN

  • Francés FR

  `-` Guion de separación entre el código de idioma y el número de referencia.

  `YY` Representa un número entero que identifica el número de referencia, puede ser un número con más de 2 cifras.

  `-` El guion final después de cada referencia también tiene que estar en todas las referencias.

  En resumen, las referencias empiezan con una “#” y terminan con un “-“ y entre el código del idioma y el número de la referencia, tiene que haber otro guion que los separa. Todo lo que haya después de una referencia es lo que se considera un comentario. Un Ejemplo de    una referencia puede ser : <b>“#SP-10-Hola mundo.”</b> o <b>“#EN-10- Hello world.”</b>. Se puede encontrar la documentación completa
del script [aqui](https://github.com/user-attachments/files/16184536/InformeTratamientoDeScripts_Derick.Daumienebi.Sakpa.pdf) para obtener más información.


## Advertencia
Si por lo que sea, este código resulta útil para alguien, estaría bien optimizar algúnas operaciones para que vayan todavia más rápido sobre todo a la hora de procesar scripts pesados o varios scripts.
Algunas partes del código fueron agregados/modificados a última hora debido a la necesidad de realizar algúnas modificaciones y por ende deben quedar algúnos trozos de código redundante bailando por ahi.

Tambien pasa una cosita rara que se describe [aqui](https://github.com/users/daumienebi/projects/6?pane=issue&itemId=65696950).

## Todo
* README in english too
* Maybe fix some of the redundant code i have and use arrays to make some operation faster (probably not going to do it :)).
