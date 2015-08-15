class AddIsFeaturedToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :is_featured, :boolean
  end
end