class AddFeaturedPostIdToBlogPosts2 < ActiveRecord::Migration
  def change
    add_column :blog_posts, :featured_post_id, :integer
  end
end
