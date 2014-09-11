class CreatePosts < ActiveRecord::Migration
    # TODO: your code here to create the posts table
  def change
    create_table :posts do |t|
      t.string    :name
      t.string    :source_url
      t.datetime  :created_at
    end
  end
end
