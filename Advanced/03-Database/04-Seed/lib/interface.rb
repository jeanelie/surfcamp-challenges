require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'

# TODO: build your interface with login and CRUD tasks on the posts
def ask(prompt)
  print "#{prompt} "
  gets.to_s.chomp
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

logged_in = false
while true

  until logged_in
    puts 'Please login with your <id>'
    # TODO: instantiate a user with his <id>
    user_id = ask(">")
    user = User.where(email: user_id).take
    logged_in = true if user != nil
  end

  puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
  puts "1. Read your posts"
  puts "2. Exit"

  case ask('>').to_i
  when 1 then list_posts(user)
  when 2 then break
  end
end
