class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |post|
      post.string :title, null: false
      post.string :author, null: false
      post.text :content, null: false
      # post.integer :tag_id
      post.timestamps
    end
  end
end
