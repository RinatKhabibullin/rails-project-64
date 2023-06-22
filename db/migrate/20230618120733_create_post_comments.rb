class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.string :content, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :post, null: true, foreign_key: true

      t.timestamps
    end
  end
end
