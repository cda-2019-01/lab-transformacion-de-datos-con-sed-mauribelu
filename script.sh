# Escriba su código aquí
#!/bin/bash

#Transformacion de fecha
sed 's/\//-/g' data.csv > data1.csv
sed 's/-\([0-9][0-9]\);/-20\1;/' data1.csv > data2.csv
sed 's|\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9][0-9][0-9]\);|\3-\2-\1;|g' data2.csv > data3.csv
#Reemplazo de las , decimales por punto
sed 's/\,/./g' data3.csv > data4.csv
#Reemplazo de los separadores ; por ,
sed 's/\;/,/g' data4.csv > data5.csv
#Reemplazo las a minuscula por A mayuscula
sed 's/a/A/g' data5.csv > data6.csv
#Reemplazo las c minuscula por C mayúscula
sed 's/c/C/g' data6.csv > data7.csv
#Reemplazar campos nulos por \N
sed -e 's:^,:\\N,:g' -e 's:,,:,\\N,:g' -e 's:,,:,\\N,:g' -e 's:,$:,\\N:g' data7.csv > data8.csv
#Reemplazar N por \N
sed 's|\,N|,\\N|g' data8.csv > data9.csv
#Reemplazar ,0 por .0
sed 's|,0|.0|g' data9.csv > LabFinal.csv
#Borrar archivos de salida
rm data*
#Mostrar el lab final
cat LabFinal.csv