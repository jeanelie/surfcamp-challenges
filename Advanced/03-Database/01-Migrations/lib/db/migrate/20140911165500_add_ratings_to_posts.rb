class AddRatingsToPosts < ActiveRecord::Migration
    # TODO: your code here to create the posts table
  def change
    add_column :posts, :ratings, :integer
  end
end
