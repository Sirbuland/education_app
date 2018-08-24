class Package < ApplicationRecord
	has_many :purchased_packages
	has_many :users, through: :purchased_packages
end
