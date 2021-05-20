from mrjob.job import MRJob

class MRWordFreqCount(MRJob):

    def mapper(self, key, line):
        data = line.split(",")
        nombre = "BBVA"
        fecha1 = "14:57"
        fecha2 = "15:01"
        if fecha1 <= data[4] and fecha2>=data[4] and data[0]==nombre:
            yield("Info sobre RANGO FECHAS --> ", line)


            
if __name__ == '__main__':
    MRWordFreqCount.run()
