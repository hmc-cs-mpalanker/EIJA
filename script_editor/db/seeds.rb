# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

play = Play.create(title: "Play Name")
act = play.acts.create(number: 1)
scene = act.scenes.create(number: 1)
scene.lines.create(number: 1, words: "This is a line")
