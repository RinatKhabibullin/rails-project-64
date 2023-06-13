class Post < ApplicationRecord
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  belongs_to :category

  validates :title, :body, presence: :true
end
