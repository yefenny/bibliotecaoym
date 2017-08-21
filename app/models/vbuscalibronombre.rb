class Vbuscalibronombre < ApplicationRecord
	self.table_name = "v_busca_libros_nombre"

	def cantidad_busca
		cantidad_busca = self.libro_id.count
	end	
end
