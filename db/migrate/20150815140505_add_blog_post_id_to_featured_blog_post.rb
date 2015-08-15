class AddBlogPostIdToFeaturedBlogPost < ActiveRecord::Migration
  def change
    add_column :featured_blog_posts, :blog_post_id, :integer
  end
end
