class Rol < ApplicationRecord
	has_many :users
	validates :name, presence: true, :uniqueness => true
	before_validation :capitalize_fields
	def capitalize_fields
		if self.name != nil && self.name != ''
			self.name = self.name.mb_chars.capitalize
		end	
    end 
end
