#guardar fecha y hora
fecha=$(date | awk '{print $2" "$3" "$6}'| tr ' ' '_')
hora=$(date | awk '{print $4}' | awk -F":" '{print $1}')

#guardar datos de las acciones en un fichero local mes_dia_anyo.txt
datos=$(python scraper.py)
echo "$datos" >> "$fecha.txt"

#a las 18:30 guardar el fichero local en hdfs i luego lo borro
if [ $hora == "18" ]; then
echo $(hdfs dfs -put "$fecha.txt" ibex)
echo $(rm "$fecha.txt")
fi