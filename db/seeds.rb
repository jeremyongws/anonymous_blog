100.times do
  Post.create(
    author: Faker::Name.name,
    title: Faker::Company.catch_phrase,
    content: Faker::Lorem.paragraph)
end

10.times do
  Tag.create(
    name: Faker::Lorem.word)
end

100.times do
  PostTag.create(
    tag_id: Tag.all.sample.id,
    post_id: Post.all.sample.id
    )
end