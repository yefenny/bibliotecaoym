class Vbuscalibro < ApplicationRecord
	self.table_name = "v_busca_libros_con_nombres"
	def nombre_asignatura
    	asignatura = Asignatura.find(self.asignatura_id)
    	nombre_asignatura = asignatura.name

   	end 	
   	 def nombre_area
    	asignatura = Asignatura.find(self.asignatura_id)
    	area = Areasconocimiento.find(asignatura.areasconocimiento_id)
    	nombre_area = area.name

   	end 

end
