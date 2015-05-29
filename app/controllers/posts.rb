# Load form that allows new post creation
get "/posts/new" do
  @post = Post.new
  @tag = Tag.new
  erb :new
end

# Form action that creates the new post
post "/posts" do
  @post = Post.new(params[:post])
  if @post.save
    tags_array = params[:tag][:name].split(", ")
    tags_array.each do |tag|
      if Tag.find_by_name(tag).nil?
        new_tag = Tag.create(params[:tag])
        tag_id = new_tag.id
      else
        tag_id = Tag.find_by_name(tag).id
      end
      PostTag.create(tag_id: tag_id, post_id: @post.id)
    end
    redirect to("/posts/#{@post.id}")
  else
    erb :new
  end
end

# Show one particular post
get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :display
end

# Get the page to edit one particular post
get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  @post_tags = PostTag.where(post_id: @post.id)
  @tags = []
  @post_tags.each do |post_tag|
    @tags << post_tag.tag.name
  end
  @tag_string = @tags.join(", ")
  erb :edit
end

# Update the blog post and tags
put "/posts/:id" do
  @post = Post.find(params[:id])
  @post.update(params[:post])
  #new_tags is a string
  new_tags = params[:tag][:name].split(", ")
  new_tags_array = []
  new_tags.each do |tag|
    if Tag.find_by_name(tag).nil?
      # Create a new TAG object
      new_tag = Tag.create(name: tag)
      new_tags_array << new_tag
    else
      new_tags_array << Tag.find_by_name(tag)
    end
  end
  # new_tags_array is an array of Tag objects
  @post.tags = new_tags_array
  if @post.save
    redirect to("/posts/#{@post.id}")
  else
    erb :edit
  end
end

# Delete one particular post
delete "/posts/:id" do
  Post.find(params[:id]).destroy
  redirect to("/")
end

