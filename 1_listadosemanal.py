from mrjob.job import MRJob
#from mrjob.step import MRStep


class Semanal(MRJob):
    

    def mapper(self, _, line):
        
        data = line.split(",")
        nombre = data[0]
        ultimo = data[1]
        maximo = data[2]
        minimo = data[3]
        yield(nombre, (maximo, minimo, ultimo))
                

    def reducer(self, nombre, values):
        primero = None
        maximo = 0
        primer_minimo = False
        minimo = 0
        final = 0
        for maximos, minimos, ultimos in values:

            if primero == None:
                primero = maximos
            
            if float(maximos) > float(maximo):
                maximo = maximos

            if primer_minimo == False:
                minimo = minimos
                primer_minimo == True
            if float(minimos) < float(minimo):
                minimo = minimos
            
            final = ultimos
                
        yield(nombre, (primero, final, minimo, maximo))
    
if __name__ == '__main__':
  Semanal.run()
