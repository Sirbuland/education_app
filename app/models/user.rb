class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :category, foreign_key: 'category_id', optional: true
  
  has_and_belongs_to_many :languages
  accepts_nested_attributes_for :languages

  has_many :purchased_packages
  has_many :packages, through: :purchased_packages

  has_many :created_posts, class_name: 'Post', foreign_key: 'student_id'
  has_many :used_credits, class_name:'Credit', foreign_key: 'student_id'

  has_many :availed_credits, class_name:'Credit', foreign_key: 'tutor_id'
  has_many :admin_credits, class_name:'Credit', foreign_key: 'admin_id'

  has_many :post_tutors
  has_many :edited_posts, class_name: 'Post', through: :post_tutors

  mount_uploader :profile_pic, ProfilePictureUploader

  enum roles: [:Student, :Tutor]
  enum genders: [:Male, :Female]
end
