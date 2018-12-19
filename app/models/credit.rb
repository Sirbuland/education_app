class Credit < ApplicationRecord
  belongs_to :post, foreign_key: 'post_id'
  belongs_to :student, foreign_key: 'student_id', class_name:'User', optional: true
  belongs_to :tutor, foreign_key: 'tutor_id', class_name:'User', optional: true
  belongs_to :admin, foreign_key: 'admin_id', class_name:'User', optional: true 
end