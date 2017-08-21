class Prestamo < ApplicationRecord
	belongs_to :libro
	belongs_to :estudiante
	 def nombre_estudiante
    	estudiante = Estudiante.find(self.estudiante_id)
    	nombre_estudiante = estudiante.name
   	end 

   	 def matricula_estudiante
    	estudiante = Estudiante.find(self.estudiante_id)
    	matricula_estudiante =  estudiante.matricula
   	end	
   	 def title_libro
    	libro = Libro.find(self.libro_id)
    	title_libro = libro.title

   	end 
end
