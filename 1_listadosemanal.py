from mrjob.job import MRJob
from mrjob.step import MRStep


class Listado(MRJob):
    

    def mapper(self, _, line):
        
        data = line.split(",")
        if data[8] == "Gold" and int(data[0]) >= 1950:
            yield(data[5], 1)
                

    def reducer(self, country, values):
        yield("", (country, sum(values)))

    def reducer2(self, clavecomun, tupla_country_medals):
        max_country = ""
        max_medals = 0
        
        for country, medals in tupla_country_medals:
            if(int(medals)>max_medals):
                max_medals = medals
                max_country = country

        yield(max_country, max_medals)

    def steps(self):
        return [
            MRStep(mapper = self.mapper,
                   reducer = self.reducer),
            MRStep(reducer = self.reducer2)
        ]
        
    
      
if __name__ == '__main__':
  Listado.run()
