#guardar fecha y hora
fecha=$(date +"%F")
num_semana=$(date +"%W")
mes=$(date +"%m")
dia=$(date +"%d")
any=$(date +"%Y")
hora=$(date | awk '{print $4}' | awk -F":" '{print $1}')

#guardar datos de las acciones en un fichero local anyo_mes_dia.txt
datos=$(python scraper.py | awk -F"," '{print $1","$2","$6","$7","$10}')

echo "$datos" >> "$fecha.csv"

#a las 18:30 guardar el fichero local en hdfs i luego lo borro
if [ $hora == "18" ]; then
echo $(hdfs dfs -mkdir -p ibex/$any/$mes/$num_semana/$dia)
echo $(hdfs dfs -put "$fecha.csv" /ibex/$any/$mes/$num_semana/$dia)
echo $(rm "$fecha.csv")
fi