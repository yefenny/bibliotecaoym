class Areasconocimiento < ApplicationRecord
	has_many :asignaturas
	before_validation :capitalize_fields
	validates :name, presence: true, :uniqueness => true
	def capitalize_fields
		if self.name != nil && self.name != ''
			self.name = self.name.mb_chars.capitalize
		end	
    end 
end
