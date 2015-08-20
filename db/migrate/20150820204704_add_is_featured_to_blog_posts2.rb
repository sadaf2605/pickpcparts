class AddIsFeaturedToBlogPosts2 < ActiveRecord::Migration
  def change
    add_column :blog_posts, :is_featured, :boolean
  end
end
