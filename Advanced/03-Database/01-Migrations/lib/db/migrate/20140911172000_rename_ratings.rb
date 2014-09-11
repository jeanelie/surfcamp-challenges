class RenameRatings < ActiveRecord::Migration
    # TODO: your code here to create the posts table
  def change
    rename_column :posts, :ratings, :rating
  end
end
