# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

santi = User.create(username: 'SantiSalazar', email: "santisalazar@ypc.com", password: "1234567", bio: "Father at 19 years old")

hobby = Hobby.create(title: "music", description: "i like to mix technology and music")

project = Project.create(title: "studio", description: "with gear that is either analog or classic", user: santi, hobby: music)
