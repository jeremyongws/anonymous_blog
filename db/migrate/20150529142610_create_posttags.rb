class CreatePosttags < ActiveRecord::Migration
  def change
    create_table :post_tags do |post_tag|
      post_tag.integer :post_id
      post_tag.integer :tag_id
      post_tag.timestamps
    end
  end
end
