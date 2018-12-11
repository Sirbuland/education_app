class Chat < ApplicationRecord
	
	validates :description, presence: true, length: {minimum: 5, maximum: 500}
	

end