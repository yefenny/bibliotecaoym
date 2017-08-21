class Librodescarga < ApplicationRecord
	belongs_to :libro

	def nombre_libro
   		libro = Libro.find(self.libro_id)
   		nombre_libro = libro.title 
   	end	
   	 
   	 def valor_libro
   	 	valor_libro = Librodescarga.where("fecha_descarga >= '#{fecha}' and created_at < '#{fecha_semestre}' ").all
   	 	valor_libro = valor_libro.group(self.libro_id).count
   	 end	
end
