roles = [
  {
    name: 'community manager',
    description: 'accepts the posts created by the content creator and designer'
  },
  {
    name: 'content creator',
    description: 'adds the content of the post'
  },
  {
    name: 'designer',
    description: 'uploads the image'
  }
]

roles.each { |role_attrs| Role.create!(role_attrs) }

users = [
  {
    email: 'community_manager@gmail.com',
    password: ENV['PASSWORD'],
    password_confirmation: ENV['PASSWORD'],
    role_id: 1
  },
  {
    email: 'content_creator@gmail.com',
    password: ENV['PASSWORD'],
    password_confirmation: ENV['PASSWORD'],
    role_id: 2
  },
  {
    email: 'designer@gmail.com',
    password: ENV['PASSWORD'],
    password_confirmation: ENV['PASSWORD'],
    role_id: 3
  }
]

users.each { |user_attrs| User.create!(user_attrs) }

posts = [
  {
    content: Faker::Lorem.sentences(number: 4),
    image_name: 'community_manager.png',
    user_id: 1
  },
  {
    content: Faker::Lorem.sentences(number: 4),
    image_name: 'content_creator.png',
    user_id: 1
  },
  {
    content: Faker::Lorem.sentences(number: 4),
    image_name: 'designer.jpg',
    user_id: 1
  }
]

binding.pry

posts.each do |post_attrs|
  post = Post.new()
  post.assign_attributes post_attrs.except(:image_name)
  post.image.attach(io: File.open("lib/assets/images/seeds/#{post_attrs[:image_name]}"), filename: post_attrs[:image_name])
  post.save!
end
