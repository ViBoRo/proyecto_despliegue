echo Escriba el numero de la semana del año ej: 21 
read semana_anyo



#echo $semana_anyo
#cat ibex/2021/arg/arg/*/*
echo "$(hdfs dfs )"
echo "$(cd .. && cd mapreduce && python listado.py -r hadoop hdfs:///user/alumno/ibex/2021/*/$semana_anyo/*/*.csv --output-dir resultado_ibex)"
