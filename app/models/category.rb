class Category < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true, length: {minimum: 5, maximum: 500}
	
  has_many :posts
	has_many :tutors, class_name: :User
end