class AddFeaturedPostIdToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :featured_post, :integer
  end
end
