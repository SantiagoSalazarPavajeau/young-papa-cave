# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

santi = User.create(username: 'SantiSalazar', email: "santisalazar@yph.com", password: "1234567", bio: "Father at 19 years old.")

music = Hobby.create(title: "music", description: "I like to mix technology and music.")

studio = Project.create(title: "studio", description: "With gear that is either analog or classic.", user: santi, hobby_title: music.title)

motorcycles = Hobby.create(title: "motorcycles", description: "Repair easy to fix motorcycle.")

enduro_bike = Project.create(title: "enduro bike", description: "Got a bike needing a motor rebuild.", user: santi, hobby_title: motorcycles.title)

maya = User.create(username: 'MayaPapaya', email: 'mayapapaya@yph.com', password: 'password', bio: 'Planting is my hobby')

plants = Hobby.create(title: 'plants', description: 'Everything having to do with plants')

new_plants = Project.create(title: 'new plants', description: 'have new plants in garden, and today we are gonna plant onion, papaya, potato and new flower seeds.', user: maya, hobby: plants)

new_songs = Project.create(title: 'new song', description: 'learn a new song every week', user: maya, hobby: music)