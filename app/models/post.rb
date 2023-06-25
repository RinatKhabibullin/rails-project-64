# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :category, inverse_of: :posts
  has_many :comments, class_name: 'PostComment', dependent: :destroy

  validates :title, :body, presence: true
end
