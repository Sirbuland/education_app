class Post < ApplicationRecord

	belongs_to :student, foreign_key: 'student_id', class_name:'User', optional: true
    belongs_to :tutor, foreign_key: 'tutor_id', class_name:'User', optional: true
    belongs_to :category, foreign_key: 'category_id'
    belongs_to :language, foreign_key: 'language_id'

    validates :original_text, presence: true, length: {maximum: 2100,minimum: 5}
    validates :category_id, presence: true
    validates :language_id, presence: true
    
    has_many :credits
    has_many :tag_posts
    has_many :tags, through: :tag_posts
    default_scope -> {order(updated_at: :desc)}

    enum status: [:Pending, :Edited ,:Closed,:SubmittedToAdmin]
end