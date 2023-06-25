# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.string :content, null: false
      t.belongs_to :creator, null: false
      t.belongs_to :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
