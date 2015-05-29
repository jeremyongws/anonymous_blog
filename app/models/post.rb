class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, through: :post_tags
  # Remember to create a migration!
  validates :title, :content, :author, :presence => true
end
