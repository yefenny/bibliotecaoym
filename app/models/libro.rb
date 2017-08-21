class Libro < ApplicationRecord
	has_one :cantidadlibro
	has_many :prestamos
	has_many :librodescargas
	has_many :descargas
	belongs_to :asignatura
	validates :title, presence: true
	accepts_nested_attributes_for :cantidadlibro
	has_attached_file :image
	validates_attachment :image, content_type: { content_type: "application/pdf" }
  	before_validation :capitalize_fields

	def capitalize_fields
		if self.title != nil && self.title != ''
			self.title = self.title.mb_chars.upcase
		end
		if self.author != nil && self.author != ''
			self.author = self.author.mb_chars.upcase
		end
		if self.casaeditora != nil && self.casaeditora != ''
			self.casaeditora = self.casaeditora.mb_chars.upcase
		end
    end 

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
