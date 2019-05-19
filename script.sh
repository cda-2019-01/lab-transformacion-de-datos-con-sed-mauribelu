# Escriba su código aquí
# Escriba su código aquí
#!/bin/bash
# Transformacion de "/" a "-"
sed 's/\//-/g' data.csv > data1.csv
# Transformacion de YY a YYYY
sed 's/-\([0-9][0-9]\);/-20\1;/g' data1.csv > data2.csv
# Cambio orden DD-MM-YYYY a YYYY-MM-DD
sed 's/\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\);/\3-\2-\1;/g' data2.csv > data3.csv
# Cambio de decimales
sed 's/,/./g' data3.csv > data4.csv
# Cambio de a por A
sed 's/a/A/g' data4.csv > data5.csv
# Cambio de c por C
sed 's/c/C/g' data5.csv > data6.csv
# Cambio de ";" por ","
sed 's/;/,/g' data6.csv > data7.csv
# Cambio de ,0 por.0
sed 's/,0/.0/g' data7.csv > data8.csv
# Cambio de N por \N
sed 's/,N/,\\N/g' data8.csv > data9.csv
# Cambio de espacios vacios entre comas
sed 's/,,/,\\N,/g' data9.csv > data10.csv
# Cambio de espacio vacio despues de coma
sed 's/,$/,\\N/g' data10.csv > labfinal.csv
# Extraer registros no nulos
#sed '/\N/d' data10.csv > labfinal.csv
# Borrar archivos resultantes
rm data*
# Resultado final
cat labfinal.csv
