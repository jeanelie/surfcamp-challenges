require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'

User.where(name: 'toto', email: 'toto@toto.com').first_or_create
User.where(name: 'tata', email: 'tata@toto.com').first_or_create

def ask(prompt)
  print "#{prompt} "
  gets.to_s.chomp
end

def create_post(user)
  name = ask('Name:')
  source_url = ask('Source URL:')
  rating = ask('Rating:')
  post_params = { name: name, source_url: source_url, date: Time.now, rating: rating }

  # TODO: use ActiveRecord to add a new post for the user logged in!
  user.post.create(post_params)
end

def list_posts(user)
  # TODO: use ActiveRecord to get all posts of the current user
  posts = user.post.all

  puts '-' * 50
  puts '%-3s %-15s %-20s %-30s %s' % ['#', 'Name', 'Source URL', 'Created At', 'Rating']

  posts.each do |post|
    puts '%-3d %-15s %-20s %-30s %d' % [post.id, post.name, post.source_url, post.date, post.rating]
  end

  puts '-' * 50
end

def delete_posts(user)
  # TODO: use ActiveRecord to delete all posts of current user
  user.post.delete_all
end

logged_in = false
while true

  until logged_in
    puts 'Please login with your <id>'
    # TODO: instantiate a user with his <id>
    user_id = ask(">")
    user = User.where(name: user_id).take
    logged_in = true if user != nil
  end

  puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Exit"

  case ask('>').to_i
  when 1 then create_post(user)
  when 2 then list_posts(user)
  when 3 then delete_posts(user)
  when 4 then break
  end
end
