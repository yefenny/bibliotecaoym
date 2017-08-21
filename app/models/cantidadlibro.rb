class Cantidadlibro < ApplicationRecord
belongs_to :libro

 	def porcentaje_disponible
   		porcentaje_disponible = (self.cantidad.to_i * 100) / self.cantidad_total
   	end	

 	def porcentaje_prestado
   		porcentaje_prestado = ((self.cantidad_total.to_i - self.cantidad) * 100) / self.cantidad_total
   	end	

   	def nombre_libro
   		libro = Libro.find(self.libro_id)
   		nombre_libro = libro.title 
   	end	
end
