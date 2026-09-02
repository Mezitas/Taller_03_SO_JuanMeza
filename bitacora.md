# Primeros pasos
Se empieza con los primeros pasos del taller, digitados en un archivo .odt (libreoffice), para documentar que se está realizando mientras se toma capturas, no se han publicado, porque está en windows, ya que la toma de capturas se me facilita ahí por la mauina virtual.
# Problema con el cambio de sesion
Al cambiar la sesion me toco volver a iniciar sesion en todos los lugares dentro de la VM.
# Punto 6
Despues de realizar
```bash
sleep 300 &
ps -ef | grep sleep
``` 
del punto 5, se realiza lo correspondiente al punto 6
```bash
stat -c %s /proc/self/status
wc -c < /proc/self/status
``` 
Dando resultados diferentes, mostrados en el archivo SO_Taller2_MezaJuan.odt, dentro del repositorio, se recibe una pregunta
## ¿Por qué las dos respuestas no coinciden?
Dado que la forma de pedir es diferente, segun la lectura del *Shell* entonces se puede suponer, por lo que ahi dice con respecto al simbolo *<* que sirve para entregar un resultado de un archivo, no el archivo en si. Ademas el *-c* en ambos archivos hace que se muestre nada mas que un contador de bytes (segun man wc). Por esta razon, al uno recibir un valor entregado de un archivo y el otro recibir un archivo, se puede suponer que esto afectó en el valor de retorno del *contador de bytes*.
# Aclaracion respecto al punto 7
Cuando iba a realizar el punto 7, tuve que apagar y encender la mauina virtual, por lo tanto, el pid del proceso puede ser diferente en las capturas del archivo .odt
