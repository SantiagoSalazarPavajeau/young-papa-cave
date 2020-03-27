# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

santi = User.create(username: 'SantiSalazar', email: "santisalazar@ypc.com", password_digest: "1234567", bio: "Father at 19 years old.")

music = Hobby.create(title: "music", description: "I like to mix technology and music.")

studio = Project.create(title: "studio", description: "With gear that is either analog or classic.", user: santi, hobby_title: music.title)

motorcycles = Hobby.create(title: "motorcycles", description: "Repair easy to fix motorcycle.")

enduro_bike = Project.create(title: "enduro bike", description: "Got a bike needing a motor rebuild.", user: santi, hobby_title: motorcycles.title)
