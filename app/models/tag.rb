class Tag < ApplicationRecord
    validates :name, presence: true
	validates :description, presence: true, length: {minimum: 5, maximum: 500}

	has_many :tag_posts
	has_many :posts, through: :tag_posts
end