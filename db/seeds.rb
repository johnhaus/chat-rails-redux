# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Message.destroy_all
User.destroy_all
Channel.destroy_all

puts 'Creating channels...'
south_park = Channel.create!(name: 'South Park')
chuck_norris = Channel.create!(name: 'Chuck Norris')
rick_and_morty = Channel.create!(name: 'Rick and Morty')

puts 'Creating users...'
users = []
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password(6, 10)
  )
  user.save!
  users << user
end

puts 'Creating messages...'
8.times do
  Message.create! user: users.sample, channel: south_park, content: Faker::TvShows::SouthPark.unique.quote
end

14.times do
  Message.create! user: users.sample, channel: chuck_norris, content: Faker::ChuckNorris.unique.fact
end

11.times do
  Message.create! user: users.sample, channel: rick_and_morty, content: Faker::TvShows::RickAndMorty.unique.quote
end
