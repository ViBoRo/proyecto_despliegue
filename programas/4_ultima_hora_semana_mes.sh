

echo Escriba el nombre de la accion
read nombre
fecha=$(date +"%F")
hora=$(date +"%H")
ultima_hora=$(expr $hora - 1)
semana=$(date +"%W")
ultima_semana=$(expr $semana - 1)
mes_actual=$(date +"%m")

#echo $mes_actual
#echo "$(cd .. )"

echo "$(cd .. && grep $nombre "$fecha.csv" | grep "$ultima_hora:")"

echo "$(cd .. && cd mapreduce && python listado.py -r hadoop hdfs:///user/alumno/ibex/2021/*/$ultima_semana/*/*.csv | grep $nombre)"

echo "$(cd .. && cd mapreduce && python listado.py -r hadoop hdfs:///user/alumno/ibex/2021/$mes_actual/*/*/*.csv | grep $nombre)"


