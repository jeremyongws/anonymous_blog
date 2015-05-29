# Shows all the blog posts
get '/' do
  @posts = Post.all
  @post_tags = PostTag.all
  erb :index
end


