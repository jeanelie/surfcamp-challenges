require_relative '../config/application'
require_relative '../models/post'
require_relative '../models/user'

require 'faker'
require 'nokogiri'
require 'open-uri'

puts 'Seeding database...'

# TODO: Your code goes here
# 1. create fake users
for i in 1..10 do
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

users = User.all

# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users
doc = Nokogiri::HTML(open("https://news.ycombinator.com/"))

# name, source url, rating and creation date
titles = doc.css("td.title a").map { |title| title.text }
# titles.each do |title|
#   puts title.text
# end

urls = doc.css("td.title a").map{ |url| url['href'] }
# urls.each do |url|
#   puts url['href']
# end

points = doc.css("td.subtext span").map { |point| point.text.tr('^0-9', '') }
# points.each do |point|
#   puts point.text
# end

titles.each_with_index do |title, index|
  params = {
    name: title,
    date: Time.now,
    source_url: urls[index],
    rating: points[index] == nil ? 0 : points[index],
    user: users[index % users.size]
  }

  puts params
  Post.create(params)
end
