class Post < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  belongs_to :category
  has_many :comments, class_name: 'PostComment'

  validates :title, :body, presence: :true
end
