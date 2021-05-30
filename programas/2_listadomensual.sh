echo Escriba el numero del mes ej: 01, 05, 11 
read mes


echo "$(cd .. && cd mapreduce && python listado.py -r hadoop hdfs:///user/alumno/ibex/2021/$mes/*/*/*.csv --output-dir resultado_ibex)"
