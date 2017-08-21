class Asignatura < ApplicationRecord
	belongs_to :areasconocimiento
	has_many :libros
	validates :name, presence: true, :uniqueness => true
	validates :areasconocimiento_id, presence: true
	before_validation :capitalize_fields
	def capitalize_fields
		if self.name != nil && self.name != ''
			self.name = self.name.mb_chars.capitalize
		end	
    end 
end
