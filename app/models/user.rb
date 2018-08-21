class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_pic, ProfilePictureUploader

  enum roles: [:Student, :Tutor]
  enum genders: [:Male, :Female]
end
