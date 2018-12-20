class PostTutor < ApplicationRecord 
  belongs_to :post, foreign_key: 'post_id'
  belongs_to :tutor, foreign_key: 'tutor_id', class_name:'User', optional: true
end