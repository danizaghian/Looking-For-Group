# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(username: "Wilbo", first_name: "Will", last_name: "Cauthen", email: "wtf@bbq.com", city: "91041", age: 25, description: "Dead sexy", password: "password", avatar_file_name: "marathon.png", avatar_content_type: "image/png", avatar_file_size: 73913)
user2 = User.create(username: "Jamester", first_name: "Jamey", last_name: "Hollis", email: "jh@bbq.com", city: "91041", age: 20, description: "slightly less sexy", password: "password")
user3 = User.create(username: "Asteryl", first_name: "Dani", last_name: "Zaghian", email: "dz@bbq.com", city: "91041", age: 24, description: "The most sexiest", password: "password")
user4 = User.create(username: "Ryan", first_name: "Brian", last_name: "Gabot", email: "bg@bbq.com", city: "91041", age: 26, description: "The most sexist", password: "password")

genre1 = Genre.create(name: "Science Fiction")
genre2 = Genre.create(name: "MMO")
genre3 = Genre.create(name: "Table Top")
genre4 = Genre.create(name: "Fantasy")

game1 = Game.create(name: "Halo: CE", min_players: 1, max_players: 16, description: "Space marines, shoot up the aliens")
game2 = Game.create(name: "Settlers of Catan", min_players: 2, max_players: 4, description: "Does anyone want a sheep??")
game3 = Game.create(name: "Dungeons & Dragons", min_players: 3, max_players: 6, description: "Table top nerd-core goofiness")
game4 = Game.create(name: "League of Legends", min_players: 1, max_players: 10, description: "Up your daily sodium intake")

group1 = Group.create(name: "D&D WDI", city: 91041, description: "Web developers by day, adventurers by late afternoon!", meet_date: "2015-11-18 10:00:00", gm: 1)
group2 = Group.create(name: "Halo LAN Party", city: 91041, description: "We all know people who play Halo are the WORST, let's put them all in a room together.", meet_date: "2015-10-10 05:00:00", gm: 2)
group3 = Group.create(name: "Catan Night", city: 91041, description: "Divide and conquer.", meet_date: "2015-08-08 06:00:00", gm: 3)
group4 = Group.create(name: "LoLganza", city: 91041, description: "Bronzies not welcome.", meet_date: "2015-11-11 10:00:00", gm: 4)

game1.genres.push(genre1)
game2.genres.push(genre3)
game2.genres.push(genre4)
game3.genres.push(genre3)
game3.genres.push(genre4)
game4.genres.push(genre2)

group1.users.push(user1, user2, user3, user4)
group2.users.push(user2, user3, user4)
group3.users.push(user1, user2, user4)
group4.users.push(user1, user2, user3)

game1.groups.push(group2)
game2.groups.push(group3)
game3.groups.push(group1)
game4.groups.push(group4)


