# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
User.destroy_all
10.times do |i|
  u = User.create(
    name: "User #{i+1}",
    email: "email#{i+1}@gmail.com",
    password: "123456"

  )
  p = Post.create(
    title: "Post #{i+1}",
    content: "Contenido del post",
    user: u
  )
  3.times do |j|
    c = p.comments.build(content: "Comentario #{j+1} del post #{i+1}", user: u, post: p)
    c.save!
  end
end