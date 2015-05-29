class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |post|
      post.string :name
      post.timestamps
    end
  end
end
