class Estudiante < ApplicationRecord
	belongs_to :user, optional: true
	has_many :prestamos
	validates :name, :presence  => { :message => " (Nombre) debe ser ingresado" }
	validates :lastname, :presence  => { :message => " (Apellido) debe ser ingresado" }
	validates :matricula, :presence => { :message => " debe ser ingresada" }, :uniqueness => { :message => " ya existe en otro estudiante" }
	validates :clave, :presence => { :message => " debe ser ingresada" }
	before_validation :capitalize_fields

	def capitalize_fields
		if self.name != nil && self.name != ''
			self.name = self.name.mb_chars.upcase
		end	
		if self.lastname != nil && self.lastname != ''
			self.lastname = self.lastname.mb_chars.upcase
		end	
		if self.matricula != nil && self.matricula != ''
			self.matricula = self.matricula.mb_chars.upcase
		end	
    end 
end
