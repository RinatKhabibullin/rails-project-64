class PostComment < ApplicationRecord
  has_ancestry

  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  belongs_to :post, optional: true

  validates :content, presence: :true
end
