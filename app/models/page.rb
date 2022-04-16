class Page < ApplicationRecord

	validates :slug, uniqueness: true
	
	def create_slug
    	name.downcase.gsub(" ", "-")
 	end

	def to_param
    	#return the string of the slug stored in our database
    	self.slug
  	end
end
